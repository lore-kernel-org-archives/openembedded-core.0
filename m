Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 806027EA86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:15:24 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id e3so11946605ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1s5B/GB14wU2VT+x9tOiK4QAAQIPeMksmU9ThoXmeZ8=;
	b=ovx/2L35PfCJTd1VQ9A/8G/ZQtPp7DlQnaCZDX13O8WMbRg2gPHmF+EOT3kvFQB+Ar
	wur8FQ4EvJwDnv9dxbvnh83fhGDQ4Y4CzrXUNYRgaUa/ln55Va8GD5nw4W/Gax7VKEFY
	tF2b/gR8aDb6m3k2a1hUgbRvUVIAkPHMzUXcO504G4fkIjzskj9I1mgAnwk1A4LuzMK5
	93e/bsSIfRcrHIRZrMYSD5Y/yycmlcdSkLT/VyfIREi3pcxjvLtGoUS2KPjjRakdkV45
	CGIVOqoP0lSebDY05XqXFf+IeSUPFgPy8+zzfTWNmQYfBbvauZWRR8bT/+dY9IUGemI0
	//4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1s5B/GB14wU2VT+x9tOiK4QAAQIPeMksmU9ThoXmeZ8=;
	b=GykUMN8eBxt7Rs3eg31zHth68Lm/42MedbA/9lHiNBeJ64yulZwOlSZxNdq8yF1VLC
	q51evWPalJNG7adfxk4u99C/yIfkQ60boUiaG4iC8Uw/ZvqSJwfvyV72xOql3aPKGoGm
	UlsecFigEp3OGti5xlNPHMYpeBCrjXN4/JjwESw2kOEduUHsN9HnzrA6qL7fmgzVOcBK
	8criFssbxSWm1zI8DK6fOxQ4GR3MKRZKlWzn69fXC2sRb53fQ9bhakqOQfZi/KcM6MCg
	zxOoLjyVAvYa/21g/lg50Y1Pte3h6EcN1IhuHimtkprZ+9TQbP2+BnWlz3c9JPlUMHq2
	G7nA==
X-Gm-Message-State: APjAAAUj/HQ7THmKaXGUDPoqSpiD7huuSr61RBhW12Wv7xeX01ZgDJtj
	XlJdefdknvl0+yfUC6NCry18P0I64CatggczPswxRQ==
X-Google-Smtp-Source: APXvYqzzIg72OoOBVRehyRXVnISk3mpyb4FBsMYfqmunejXLrzOXw1ZnstLbq3pePzDm8DtflijTBup8++reYzVmFAU=
X-Received: by 2002:a6b:8bce:: with SMTP id n197mr5876802iod.299.1561724125606;
	Fri, 28 Jun 2019 05:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
In-Reply-To: <37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Jun 2019 13:15:12 +0100
Message-ID: <CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] waf: python2 -> python3
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
X-List-Received-Date: Fri, 28 Jun 2019 12:15:24 -0000
Content-Type: text/plain; charset="UTF-8"

Did you just do the minimum required, or take a new copy of waf from upstream?

(https://gitlab.com/ita1024/waf/)

Ross

On Fri, 28 Jun 2019 at 13:01, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-graphics/eglinfo/files/waf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/eglinfo/files/waf b/meta/recipes-graphics/eglinfo/files/waf
> index 04ddd9f..2c83ed4 100755
> --- a/meta/recipes-graphics/eglinfo/files/waf
> +++ b/meta/recipes-graphics/eglinfo/files/waf
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # encoding: latin-1
>  # Thomas Nagy, 2005-2018
>  #
> @@ -113,7 +113,7 @@ def unpack_wafdir(dir, src):
>         os.remove(tmp)
>         os.chdir(cwd)
>
> -       try: dir = unicode(dir, 'mbcs')
> +       try: dir = str(dir, 'mbcs')
>         except: pass
>         try:
>                 from ctypes import windll
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

