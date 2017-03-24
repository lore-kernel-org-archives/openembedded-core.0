Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id E495860079
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 13:55:15 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id i34so2774845qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 06:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WrNFq38VLWaLljwFMmdN8lxx3HefIRjuwZEhggavJ/0=;
	b=tYlB14brTR0PTtkoRu/gkufsMw5Hlfu5UyarKD/uVmzE9hlr9J/yu7nz5qiIb10eZy
	NGto7L4vnzb7B/vsnGsSllFBb/oSat8Xhq842vVOwu9Oxzs4nTfxtj9wtZWEIctEf4W0
	tPQ0eKAR7EkAXnqkKHXYy370cENDyq0INR0gQFXx0YpM793woPQpAhxmnGhl1Z/BjJEX
	WhMGw3qwJ+c7birvH3C8ahYptpC5EXZQ964mTzV+pdM9V/88dZrr4M6m5qA2AzqSGkG8
	xmMvcRLbaKECdSX7F4fvP2yqpfsGSaIwReIdmMkB/aMcCKHbnUqwyTLccTIJE5tKXDYx
	3Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WrNFq38VLWaLljwFMmdN8lxx3HefIRjuwZEhggavJ/0=;
	b=jsecUOd4pnuXaWT0a9b78Qk2VfFAH4CkSSTLv3LWG4dlR/Bygyye9z8b+2Ok5+MpXs
	jBaqhykhwmt5IWxtdWwCVh/vryZoN+hagUs1zAUNd15GGVRPCiugMSTDUYnigiLXTfEG
	H1FhiepS82nN2B40SoLsR1G3porhplIGDBlMqUqoYmb4LsS8YFQNu+C0o3j/GES/EisW
	2Cp5GeKisF8bmBthp+UTchFPg4TRqSMJmRuaGCeSWwn079VbYKjIPqt1ge0qFeERO4lW
	KMopKEjFr2WNSCVdHsefovbVQ2XMIdN5g+kjkxZVQ67gP27eazH7vwL0nSTxvq65vgZS
	t/ww==
X-Gm-Message-State: AFeK/H38iMb9Wq2ltBBs2UEspkkcRS5QVdO3ecBmlcsuNYiBQ1GUHs206wqc5wSfhPwmM+RAzikuQqU9e+VPnfMc
X-Received: by 10.200.2.150 with SMTP id p22mr8566879qtg.197.1490363716590;
	Fri, 24 Mar 2017 06:55:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 06:54:56 -0700 (PDT)
In-Reply-To: <1490200321.13980.177.camel@linuxfoundation.org>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
	<CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
	<alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
	<CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
	<1490194798.13980.172.camel@linuxfoundation.org>
	<CAJTo0LZV4kh3=r=cxYpBydGO74R6cvootczedwMW3s_k1xxSWQ@mail.gmail.com>
	<1490200321.13980.177.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 13:54:56 +0000
Message-ID: <CAJTo0LY=z0x9Zoc8upRjJy5jLqhJSG7AotV9EAqQ+YtXzQN+FA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Mar 2017 13:55:16 -0000
Content-Type: multipart/alternative; boundary=f4030435c234e9fb8f054b7a5777

--f4030435c234e9fb8f054b7a5777
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 16:32, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Someone needs to file a bug...
>

Found https://bugzilla.yoctoproject.org/show_bug.cgi?id=8745.

Currently a future enhancement, I think we should reschedule this to 2.4.
Simply bailing shouldn't be that much effort and would be useful.

Ross

--f4030435c234e9fb8f054b7a5777
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 16:32, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"g=
mail-:os" class=3D"gmail-a3s gmail-aXjCH gmail-m15af6dd0df26f381">Someone n=
eeds to file a bug...<br></div></blockquote></div><br>Found=C2=A0<a href=3D=
"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8745">https://bugzilla=
.yoctoproject.org/show_bug.cgi?id=3D8745</a>.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Currently a future enhancement, I t=
hink we should reschedule this to 2.4.=C2=A0 Simply bailing shouldn&#39;t b=
e that much effort and would be useful.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--f4030435c234e9fb8f054b7a5777--
