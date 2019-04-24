Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA3E7D03B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:38:35 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id p23so15619308iol.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I1F0dbZgCUjrMG+ealmo8TnUHttU4q90N2KOAmI8PVA=;
	b=AKbaKPNm8vZhTbURrIIe6e9owSK8Q973RnFE+lMOzEESHjWRWVGLONmb3XQIOrpkmz
	EFFzGE9WSrb8wEljx313+cd/4SN59LUC1U1aTbC6LeGQywrNALZ77AlwMZlpvD88JHVi
	w7Dy8/w/ZAuGvXA0qlyNnW7y+XcdryrmzWVIuk4zDn4oieO5dRTLrY38GVBFFEc6pi5/
	HfUL8HE8bb/7xj5xdNv33QNw0AXaGItCSLlv8njj+hwOW0BH9rZnB/xWdTGk12memGDP
	UwFfpSlNExRHV40j5kIRD0PfLRhIvolIOlFHTDwfqyJ46WxRBpcdjYrLREwkXzZZypo/
	tCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I1F0dbZgCUjrMG+ealmo8TnUHttU4q90N2KOAmI8PVA=;
	b=pDFetNvJENY2tRFvhFMU2gmdwuY63/AEj705XUsInoL58Q4Fa9crng1yT6Dux820yj
	kkQvHd6s2K2FcrNRy956idZSHaPhTVTk73xpwHzO+7+ZwUswk2J2Vb+haiYoxXdoP8z7
	WDbGO8Av11mvBpe4OIS6gSSNldWAZLhfuvH0XuGag0cgwdgNnHcgOt5JIUzMuAtuK+AS
	Cq4wfA+sEO1Y67VoiIXjm5N0oiDV4cTafC7FOkeFdyZhLKQ+xugG6p1MfGitjFaz57cp
	wOfVs4yYDLiBLaFzfqL7hQzQsl1a6IjFFLZjt10vQ2f8fRCW3hEQA24gUQENI0CUseAD
	3OEw==
X-Gm-Message-State: APjAAAW6c/fvZV2yHOf8FfC3X0uMNPwdhv/rnd8bPCiSmRbbigNSCsob
	9LPg1AUNtkNjVk/COipRMkxPxdncplCTDclK/ajeUg==
X-Google-Smtp-Source: APXvYqyEkaR/ozW8zNw/WOTGx4twY4JSePOMtNbB27KP6B/tNe6W2yz8hpdKV8yVV3Oft44ETNKMdWGMAMc5NwtK7pQ=
X-Received: by 2002:a6b:8e05:: with SMTP id q5mr11798080iod.270.1556109516676; 
	Wed, 24 Apr 2019 05:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190415034231.105641-1-kai.kang@windriver.com>
	<c5cfa394-44e4-bdae-d334-82b9fe109f86@windriver.com>
In-Reply-To: <c5cfa394-44e4-bdae-d334-82b9fe109f86@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2019 13:38:25 +0100
Message-ID: <CAJTo0LYvVT5g0LG+XGf5Nz-XJj-Nw32tubmNGw1_dNPyWs9R4w@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev: update SRCREV
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
X-List-Received-Date: Wed, 24 Apr 2019 12:38:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd prefer this to be applying the patch, which also makes the fix
easier to backport.

Ross

On Wed, 24 Apr 2019 at 03:26, Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/4/15 =E4=B8=8A=E5=8D=8811:42, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > Update SRCREV of cryptodev which only contains one fix for linux 5.0:
> >
> > $ git log fd8b15ef1c8398a69a37932ee48c74ab40329a29..f971e0cd4a0ebe59fb2=
e8e17240399bf6901b09b
> > commit f971e0cd4a0ebe59fb2e8e17240399bf6901b09b
> > Author: Derald D. Woods <woods.technical@gmail.com>
> > Date:   Sun Feb 10 13:22:19 2019 -0600
> >
> >      Fix module loading with Linux v5.0-rc5
> >
> >      This commit fixes this module load error:
> >      [...]
> >      [   29.112091] cryptodev: loading out-of-tree module taints kernel=
.
> >      [   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (er=
r -2)
> >      [   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (er=
r -2)
> >      modprobe: can't load module cryptodev (extra/cryptodev.ko): unknow=
n symbol in module, or unknown parameter
> >      [...]
>
>
> Without this patch it fails to modprobe module cryptodev. Ping.
>
> Kai
>
>
> >
> >      Upstream Linux support for unused GIVCIPHER, and others, was dropp=
ed here:
> >
> >      c79b411eaa72 (crypto: skcipher - remove remnants of internal IV ge=
nerators)
> >
> >      Signed-off-by: Derald D. Woods <woods.technical@gmail.com>
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes=
-kernel/cryptodev/cryptodev.inc
> > index 252d39d23a..79ddefd435 100644
> > --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> > +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> >
> >   SRC_URI =3D "git://github.com/cryptodev-linux/cryptodev-linux"
> > -SRCREV =3D "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
> > +SRCREV =3D "f971e0cd4a0ebe59fb2e8e17240399bf6901b09b"
> >
> >   S =3D "${WORKDIR}/git"
> >
>
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

