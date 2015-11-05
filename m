Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3F25875A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:33:04 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so34273899qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 07:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9jm2ZDL9RY1o7nkk+Sm+LqFz4xRED31lqtkmgBqY7/c=;
	b=J/4/lntNH9+4PxLI6erE0NI+nSKMsvBOq9PNPjTFynpKM4McVvVVpPwGCI52uwa3Mx
	bmjgwM9daX479MjxvwaB9Ac6NuXT3TtUiQ+1lctaQYX7ahVtTdhJC9+B5tRTf4AEdaBN
	A20xlsX/zkvD9n1f1M3QFeb4GGh5YZV3ijiWjpaz9qSF4WW2cSmEJjEo4wL0NwYD5TvH
	+nirQY8uRYgcqJwKpHMnDjmZqapecmoRtcckuat6pEX2leICV+eTaDsnamqLnStJsy1j
	ZnBDP2ZrXFA5pOZJzooTGtuqbK1AomMv179eEYKswX2kPud57LpZPj2FeeW6vIAoxvQo
	hO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9jm2ZDL9RY1o7nkk+Sm+LqFz4xRED31lqtkmgBqY7/c=;
	b=lUk7k7wnkow42Vp4HfQ2RIyUV5l/FflZ13mo4pmwTmW2JpAZg/14VpJQjLoOOiTzpZ
	WieFzdOAl6F57SVQWFViKbalIjErV8Z4i7acB/IsdcewWaAs2DUz+UKSF3KeeJKMO80M
	6KDoGfPS5PUi0iCECercpDmBi4XfYk84ry7lxJsBFeuNHX4YvACaYbnnOUTtCBEJw5Di
	HFAiHMOWsOd7mhk0uIvb0XV3Wzkh83rHb4uLVVKWHPzyfARhccGlHCY+fZiZYR6oHYji
	seAFgzqX+M/kL8yqqyveCo3CFnfNs5OiJhXwDFIx/DmIfpw9s6ZC8FFbZiVM4j7BPoyb
	rzvg==
X-Gm-Message-State: ALoCoQnm3ST5tvqsFePmYyRjB+ocZ3TGXXqzIObaEwYzdVyUudsH6hF63jIyH6I957QVW/ILIoyZ
X-Received: by 10.55.73.144 with SMTP id w138mr8066264qka.104.1446737585017;
	Thu, 05 Nov 2015 07:33:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 07:32:45 -0800 (PST)
In-Reply-To: <563B7395.1010104@streamunlimited.com>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B7395.1010104@streamunlimited.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 15:32:45 +0000
Message-ID: <CAJTo0LZu-14EFxTckSmzuoEyY1BwuOhp_KTSrrXPn8zY9MoNnw@mail.gmail.com>
To: =?UTF-8?Q?Radek_Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 15:33:05 -0000
Content-Type: multipart/alternative; boundary=001a114a9f44d6ac8c0523ccd7c8

--001a114a9f44d6ac8c0523ccd7c8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 November 2015 at 15:19, Radek Dost=C3=A1l <radek.dostal@streamunlimite=
d.com>
wrote:

> Thanks a lot for your valuable input. I was not aware of the fact that it
> was fixed in the upstream already. If you know the commit out of your hea=
d,
> it would be great if you could share it.
>

For what it's worth 2015.10 is queued for master already.

Ross

--001a114a9f44d6ac8c0523ccd7c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 15:19, Radek Dost=C3=A1l <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:radek.dostal@streamunlimited.com" target=3D"_blank">radek.dosta=
l@streamunlimited.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":1fy" class=3D"a3s" style=3D"overflow:hidden">Thanks a lot fo=
r your valuable input. I was not aware of the fact that it was fixed in the=
 upstream already. If you know the commit out of your head, it would be gre=
at if you could share it.<br></div></blockquote></div><br>For what it&#39;s=
 worth 2015.10 is queued for master already.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a9f44d6ac8c0523ccd7c8--
