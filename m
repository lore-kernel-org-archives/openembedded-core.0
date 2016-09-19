Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 706C865CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:10:25 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id r145so85229862ior.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XVJ3uUnfVi3tHUZa9zDDfdTHap/4bdjROeIgBFJlick=;
	b=DMq2Rhfpk62QshIp88+5I/56lOzotQpz66NtaxMRj3DOkbMZvPP8+o8OVA1Noh0Yfn
	j+QI4FdeQ2QsvTiSGPSVzv5TlZkHEWKHTm9Yl9IR2/f4qm0AaNO+YbOAnFa5nVeXH/Y0
	O8Kb31Tn+I6R0Osaa9f+O2CD1LZbLRGHiL6buWwoPzK5mxq7swwunyezqSaYfvV1JI96
	9KueR3iccAtEmRlzoGkSMKXTvUj0nSEoHMMvRfm48bHPmQTGXi/+MHCi5VLkGzD1/0zC
	Cac6x8Qis/FpF+ZDGl5mCWD79w48Z6pnq3lEd39vbBWddLAS4nA6S38tb3RwOshanUh0
	hxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XVJ3uUnfVi3tHUZa9zDDfdTHap/4bdjROeIgBFJlick=;
	b=Fzvn+dNiJN3dFYzP5sN/PS92Jhs8UqPhPdWV/t8x8za3SfeYIgzsBThKnlaZEH5O86
	eikVZeje1GMvlDzWHla3hKZ+r59V3rhD7VsLrBhkC3/E8n4S+81G9+ZKOnl8bvWNn8x0
	yvOV7lS5nQazuClL6ckgtX35apP6d+iqzKMHxFxnxgcS5ypo3fdyfuloStwxlfCxFpGC
	xuYXtxQ12mcDhm1nKkVWDumUntuh2bSbrG3Q+kjF78AO6EWWef+kEuPUJVff5JjZsWXR
	R6xOhCwmPwbv+s4d4JvmTMxOSeTK5UsDOvp7VYSLuV/RXL0dhiZqrkI7leeZ5sbHVs1S
	MMeA==
X-Gm-Message-State: AE9vXwO4NwecLGy460ozmDlRQkyTCGzHhLOiJHX/BSl1Rlfp7mzVSg+zAQ2MG5S0uwbYDagwPhfW1s8s7OYVxy4c
X-Received: by 10.107.199.195 with SMTP id x186mr36806670iof.88.1474276226460; 
	Mon, 19 Sep 2016 02:10:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 19 Sep 2016 02:10:06 -0700 (PDT)
In-Reply-To: <CADNFeU78hx7jdvgqjaDVK+RkfMw3P1yeruk5urUSkmbxWCS5Xg@mail.gmail.com>
References: <CADNFeU78hx7jdvgqjaDVK+RkfMw3P1yeruk5urUSkmbxWCS5Xg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Sep 2016 10:10:06 +0100
Message-ID: <CAJTo0LaxkABY=F=P+naPyrzoBwAR8_OE4iJsqd98DiiNyqPd8w@mail.gmail.com>
To: Reinhard Tartler <rtartler.desres@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager.py: Restore FEED_DEPLOYDIR_BASE_URI functionality
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
X-List-Received-Date: Mon, 19 Sep 2016 09:10:26 -0000
Content-Type: multipart/alternative; boundary=94eb2c11be4ec785dc053cd8ae7b

--94eb2c11be4ec785dc053cd8ae7b
Content-Type: text/plain; charset=UTF-8

On 2 September 2016 at 22:59, Reinhard Tartler <rtartler.desres@gmail.com>
wrote:

> According to the documentation, setting FEED_DEPLOYDIR_BASE_URI should
> be sufficient for setting up local feeds. This commit fixes the
> implementation to actually do that, even if BUILD_IMAGES_FROM_FEEDS is
> not set.
>
> Also fix some bugs in the old implementation:
>  - Fetch uncompressed Packages files, because
>    'bitbake package-index' does not appear to create Packages.gz files.
>  - Add missing newline after the URI so that the options don't end up on
>    the same line.
>  - Fix the check when local options are necessary.
>
> Signed-off-by: Reinhard Tartler <tartler@deshaw.com>
>

Is this is case of duplicated functionality?  I've previously used
PACKAGE_FEED_URIS to get a working feed added to the target image, that
works for opkg and rpm too.

Ross

--94eb2c11be4ec785dc053cd8ae7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 September 2016 at 22:59, Reinhard Tartler <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rtartler.desres@gmail.com" target=3D"_blank">rtartler.desres@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=
=3D"font-size:12.8px">According to the documentation, setting FEED_DEPLOYDI=
R_BASE_URI should</div><div style=3D"font-size:12.8px">be sufficient for se=
tting up local feeds. This commit fixes the</div><div style=3D"font-size:12=
.8px">implementation to actually do that, even if BUILD_IMAGES_FROM_FEEDS i=
s</div><div style=3D"font-size:12.8px">not set.</div><div style=3D"font-siz=
e:12.8px"><br></div><div style=3D"font-size:12.8px">Also fix some bugs in t=
he old implementation:</div><div style=3D"font-size:12.8px">=C2=A0- Fetch u=
ncompressed Packages files, because</div><div style=3D"font-size:12.8px">=
=C2=A0 =C2=A0&#39;bitbake package-index&#39; does not appear to create Pack=
ages.gz files.</div><div style=3D"font-size:12.8px">=C2=A0- Add missing new=
line after the URI so that the options don&#39;t end up on</div><div style=
=3D"font-size:12.8px">=C2=A0 =C2=A0the same line.</div><div style=3D"font-s=
ize:12.8px">=C2=A0- Fix the check when local options are necessary.</div><d=
iv style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">Sig=
ned-off-by: Reinhard Tartler &lt;<a href=3D"mailto:tartler@deshaw.com" targ=
et=3D"_blank">tartler@deshaw.com</a>&gt;</div></blockquote></div><br>Is thi=
s is case of duplicated functionality?=C2=A0 I&#39;ve previously used PACKA=
GE_FEED_URIS to get a working feed added to the target image, that works fo=
r opkg and rpm too.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--94eb2c11be4ec785dc053cd8ae7b--
