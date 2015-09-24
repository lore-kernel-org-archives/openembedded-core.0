Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 63DB573BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 16:31:59 +0000 (UTC)
Received: by qgev79 with SMTP id v79so48611768qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rZlK/J2/upvKbfW5bKqhKa115hxl3D4Qdu0KX6/VYqU=;
	b=kSgkzX+63RogTS3v9S7QAWApXjUQOc1Bws+GzWo0J4FqzYH0UUR+O1o7GHO23kptY8
	YmpXvKJTYxUx6snlc20f4hwqdXkdjkhc13j8JN/TiX99cZjMCDF4aB81xDs9OExxQ8Jf
	oICcPf3iXipo+1ptLuMBI2zVNfjBrf+rCXaXX4v+hVbfsu8rox+TNxiAOu3BDbtUk8u1
	483MTYC7bDVDB9QHuf77l89slIY0nrZu6ChVvg7l2XVNmc77dpIf7pRD5p3yrIlFDzqG
	zoOop545FU/tA0Y13fTMwGDTnzP8ztYAjxh8bv8+itoRtJ+wMfmgSPtAbIqM9IbwdmnF
	QGfA==
X-Gm-Message-State: ALoCoQlhQERWfrFURhTymwnAo/l+YeNdapbtlA5yzhoI/WA0t/hj2wuapMjBqjrn1qNqXQ7QjAq4
X-Received: by 10.140.44.11 with SMTP id f11mr871623qga.80.1443112319409; Thu,
	24 Sep 2015 09:31:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 24 Sep 2015 09:31:40 -0700 (PDT)
In-Reply-To: <5603DEAB.4010005@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
	<5600C0E4.4030606@windriver.com>
	<1443045619.19044.40.camel@linuxfoundation.org>
	<56039856.3050902@windriver.com>
	<1443086310.19044.56.camel@linuxfoundation.org>
	<5603DEAB.4010005@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Sep 2015 17:31:40 +0100
Message-ID: <CAJTo0LZbg=7aZ5e9UWAoEyWhd-qhaf_x8myj+AoyE-S0-_quog@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Fixes for mutilib SDK
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
X-List-Received-Date: Thu, 24 Sep 2015 16:32:00 -0000
Content-Type: multipart/alternative; boundary=001a113b41bc2b7c91052080c586

--001a113b41bc2b7c91052080c586
Content-Type: text/plain; charset=UTF-8

On 24 September 2015 at 12:29, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Now these patches have fixed the problem, so both connman-gnome
> and lib32-connman-gnome have installed, if we want to make sure
> /usr/bin/connman-applet is 32bit, we need set:
>
> RPM_PREFER_ELF_ARCH = "1"
>
> If we'd like 64bit wins, we need set:
>
> RPM_PREFER_ELF_ARCH = "2"
>
> Maybe we need update our test cases or autobuilder's multilib
> settings, please ?
>

I've just sent a patch for the autobuilder to do this.

Ross

--001a113b41bc2b7c91052080c586
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 September 2015 at 12:29, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":13a=
" class=3D"a3s" style=3D"overflow:hidden">Now these patches have fixed the =
problem, so both connman-gnome<br>
and lib32-connman-gnome have installed, if we want to make sure<br>
/usr/bin/connman-applet is 32bit, we need set:<br>
<br>
RPM_PREFER_ELF_ARCH =3D &quot;1&quot;<br>
<br>
If we&#39;d like 64bit wins, we need set:<br>
<br>
RPM_PREFER_ELF_ARCH =3D &quot;2&quot;<br>
<br>
Maybe we need update our test cases or autobuilder&#39;s multilib<br>
settings, please ?</div></blockquote></div><br>I&#39;ve just sent a patch f=
or the autobuilder to do this.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a113b41bc2b7c91052080c586--
