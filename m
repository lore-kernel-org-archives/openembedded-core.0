Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.22603.1627643677844923910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LC+Zn4D7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso6163726wmp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GA12gc5H/n7lujpjplnxXuz8sZJPikTD+cUYlisjMnU=;
        b=LC+Zn4D7747FpGJvxT/TsASeg4WXdPQNNblMdJ/zij/HTuKXf0TPT+t5v6/OinMsmH
         9h/2cNHH4z6Qn3yFkyUIScC2RhvTRhBNSFGtDQrNVyrAxZs4ce5qu0e1TTg0rZ2EJMc3
         sGVFs8YY+bbHCzhk/THJWsCmUL2eITxHPEbw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GA12gc5H/n7lujpjplnxXuz8sZJPikTD+cUYlisjMnU=;
        b=VLqcd84JrDVR4WiM00U/OjcoCQloJK6PDADH2rO32HocPmuVPquneE4FEoEgfz4pXJ
         MOCTimI8P8XLd02CIFyX8a2rqSarNtv5B3R+JNsC9jLw0T6ogPq9Pcree52I2r/hnrzR
         TlReCqENJNB2fQXFx8QFYNuO4wzqUhN0of2J69ofdF1xitvVES29RJL9yFBBWz6aDH1e
         FT5A66TUyXIScBTGsUA4nNhL2XLOgpFIsvRkClBdXGZLuBLZaQHNMcJblKb5Z+z6cAYN
         Fur6irpeLcWw1fbV0TOvewyCwdfxhqqEHr3p1CX6gqqzMFt0AQkI8Mdcihkzi3FWZkRc
         KQCw==
X-Gm-Message-State: AOAM531nMh9O/PJwtXllDrRg1/lNzhWDuFLq47VPQBF8/2bU05bO1Wm5
	4NUUFg2+b6ejXm5r0Rf7SCz2ZQ==
X-Google-Smtp-Source: ABdhPJx31ZrzJ6bAQjeG4a5bgJepJb+QURi2s7B6AQ1s6sQnxiF6BNkR3KWCFrqJ+l/5LKJxO1reqg==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr2443568wma.33.1627643676182;
        Fri, 30 Jul 2021 04:14:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id w18sm1409566wrg.68.2021.07.30.04.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:14:35 -0700 (PDT)
Message-ID: <45cb627bf3384a05b77ccf21889e04fcf6c00ad8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-pytest: fix display version info
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Cc: yuanc.fnst@cn.fujitsu.com
Date: Fri, 30 Jul 2021 12:14:32 +0100
In-Reply-To: <d8f91065-ff81-03bf-13b0-71116b3116c4@windriver.com>
References: <20210730033855.23941-1-kai.kang@windriver.com>
	 <4befba5f96824bce16d6d67c4e525b5d5ecd84d3.camel@linuxfoundation.org>
	 <d8f91065-ff81-03bf-13b0-71116b3116c4@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-30 at 19:03 +0800, kai wrote:
> On 7/30/21 6:11 PM, Richard Purdie wrote:
> > On Fri, 2021-07-30 at 11:38 +0800, kai wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > It does not show correct version info of python3-pytest by:
> > > 
> > > $ pip3 list | grep pytest
> > > pytest             0.0.0
> > > 
> > > Remove 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> > > and depends on python3-setuptools-scm-native to make it right.
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   ...he-setup_requires-for-setuptools-scm.patch | 36 -------------------
> > >   .../python/python3-pytest_6.2.4.bb            |  4 +--
> > >   2 files changed, 2 insertions(+), 38 deletions(-)
> > >   delete mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> > > 
> > > diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> > > deleted file mode 100644
> > > index 1abd531c62..0000000000
> > > --- a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> > > +++ /dev/null
> > > @@ -1,36 +0,0 @@
> > > -From ead04f2da75efeca3369feff6161ea4a8baecbc9 Mon Sep 17 00:00:00 2001
> > > -From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> > > -Date: Wed, 28 Aug 2019 16:12:27 +0900
> > > -Subject: [PATCH] setup.py: remove the setup_requires for setuptools-scm
> > > -
> > > -The setup_requires argument forces the download of the egg file for setuptools-scm
> > > -during the do_compile phase.  This download is incompatible with the typical fetch
> > > -and mirror structure.  The only usage of scm is the generation of the _version.py
> > > -file and in the release tarball it is already correctly created
> > > -
> > Recipes should not be downloading during do_compile. We need to fix this in some
> > other way, we can't just remove the patch.
> > 
> > Cheers,
> > 
> > Richard
> > 
> Hi Richard,
> 
> It calls pip to download the egg file for setuptools-scm. But pip is not 
> a dependency and does not exist in sysroot, so it fails when remove the 
> patch and
> "python3-setuptools-scm-native" is not a dependency:
> 
> > DEBUG: Executing shell function do_compile
> > WARNING: The wheel package is not available.
> > 
> /buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/python3-pytest/6.2.4-r0/recipe-sysroot-native/usr/bin/python3-native/pytho
> n3: No module named pip
> > Traceback (most recent call last):
> >    File 
> "/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/python3-pytest/6.2.4-r0/recipe-sysroot-native/usr/lib/python3.9/si
> te-packages/setuptools/installer.py", line 75, in fetch_build_egg
> > subprocess.check_call(cmd)
> >    File 
> "/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/python3-pytest/6.2.4-r0/recipe-sysroot-native/usr/lib/python3.9/su
> bprocess.py", line 373, in check_call
> >      raise CalledProcessError(retcode, cmd)
> > subprocess.CalledProcessError: Command 
> '['/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/python3-pytest/6.2.4-r0/recipe-s
> ysroot-native/usr/bin/python3-native/python3', '-m', 'pip', 
> '--disable-pip-version-check', 'wheel', '--no-deps', '-w', 
> '/tmp/tmpovfcfgaq', '--q
> uiet', 'setuptools-scm>=3.4']' returned non-zero exit status 1.
> 
> After add  "python3-setuptools-scm-native" to dependency, it meets the 
> requirement in setup.cfg:
> 
> setuptools-scm>=3.4
> 
> then it does not call pip anymore to download any file.

That makes more sense, thanks for clarifying. Could you update the commit message 
to make that clearer please?

Thanks,

Richard

