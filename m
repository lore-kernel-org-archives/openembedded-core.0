Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id C5954605C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 02:59:01 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u190so12353464qkh.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P5Q+o3GOywd7/Bu6Q1ywqCd1NUIxkqbEJW1s46p4nMQ=;
	b=d61rfdNFl6xbO2ryc8AwgCb/Ff6w7pqPWGDzEqIf436Mxmtd/UVamCo9t+/3lpkt3w
	BVlXF1xiMA0XKzXVGt3rrs7eRP+0nJ6Ib7/49Kyb9ph92Qpl6P3+smQ9r4nb8qVBGh4d
	MTi4zFtdUHfea0PQ9YTKnECK/blFaPkl9NmlcxcLiCBeEr1NOy8FNWfznYSd0TrUytwH
	xbPSsZNjMmjCbgmIMFjDg18wYII+E4Umyw/AIJb3EKQaerTYq28RVBPS2aBvaAPnatSf
	mU6iDAIAyZpgoUrQE8DJCe2ARe94qnHNEmg3MvWkeHrn2DTXskbimbDJzJkDZzp+OFHR
	RXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P5Q+o3GOywd7/Bu6Q1ywqCd1NUIxkqbEJW1s46p4nMQ=;
	b=pn1u55FM8wCRL40qNaOj+LS1KEwdu+rFYcjl2jMJeiJuFVrK99C9ywCUhHrWNvLLEU
	9QE8jxgHY2FdZQBhRSBdPvScYGd/t6YoORfzU8HlqQxaXseVQIy0P05/kxke/dLWA/BY
	9nFqtVWgblS8J3nLdZ5H1+48pAYccWEqq1ZUhc0R31pHfyBWi6M6pWHrTwVH8wB+r8mf
	6Mrb2CZRN1nupKKfzKvqiiy82GJtY1u4VsY+mwZ8yG5AkvdD4UVeP9BF70YG7Idm2GDH
	dT6ovB+ITYQxCkCmsi36XmvyKfYggjR0BlY/NJ9wpX7t7W/XxNdNYGdziFMNG4fAA31B
	PmCA==
X-Gm-Message-State: APjAAAWAZgmL+muOBYlrPmYQUmoJ5f7VpHynkWQWF84hLy3kTNRyAIWx
	QE9XVkA4xnPxGGqmVYD87RKcNOzSWzfj8jvlz8Y=
X-Google-Smtp-Source: APXvYqwaiaEI6iG5f+jgpJYTkRR7NKT0lQo6J4swvlfx/VF+35HZ8qKtWietQTsNXPACqCicVGJhipo8jdkPGb/cZsQ=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr28791417qke.212.1565578742075;
	Sun, 11 Aug 2019 19:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
	<20190808161150.44877-5-alex.kanavin@gmail.com>
	<CAMKF1sqbwJiBay7SaQroUspx3RgehPPvRpNdGP=6j5YPDdaBbg@mail.gmail.com>
In-Reply-To: <CAMKF1sqbwJiBay7SaQroUspx3RgehPPvRpNdGP=6j5YPDdaBbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 19:58:36 -0700
Message-ID: <CAMKF1spNo-rg12f3cTw6ET7QiKGZeVHEQuxpiGbPJ=zggo86Kg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Mon, 12 Aug 2019 02:59:02 -0000
Content-Type: text/plain; charset="UTF-8"

Fails same way on qemuarm/glibc

https://errors.yoctoproject.org/Errors/Details/260792/

On Fri, Aug 9, 2019 at 11:11 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/260208/
>
> On Thu, Aug 8, 2019 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Rebase files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> >
> > License-Update: clarified license for numpy/core/src/multiarray/dragon4.c (it is MIT)
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++-----------
> >  .../python-numpy/python-numpy.inc             |  8 ++--
> >  ...umpy_1.16.3.bb => python3-numpy_1.17.0.bb} |  0
> >  3 files changed, 24 insertions(+), 31 deletions(-)
> >  rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.3.bb => python3-numpy_1.17.0.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > index 8fe0d1a27ee..98a97058312 100644
> > --- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > +++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > @@ -1,4 +1,4 @@
> > -From c14554c7e2fff8dd559dfb41e7dd11392c6f85e3 Mon Sep 17 00:00:00 2001
> > +From 672a75c8417ce08db9e31fc415ec445479231d5a Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Thu, 10 Dec 2015 13:20:30 +0200
> >  Subject: [PATCH] Don't search /usr and so on for libraries by default to
> > @@ -10,14 +10,14 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> >  ---
> > - numpy/distutils/system_info.py | 50 ++++------------------------------
> > - 1 file changed, 6 insertions(+), 44 deletions(-)
> > + numpy/distutils/system_info.py | 42 ++++------------------------------
> > + 1 file changed, 5 insertions(+), 37 deletions(-)
> >
> >  diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
> > -index 2424943..bf56a6d 100644
> > +index ba2b1f4..f94dce1 100644
> >  --- a/numpy/distutils/system_info.py
> >  +++ b/numpy/distutils/system_info.py
> > -@@ -274,51 +274,13 @@ if sys.platform == 'win32':
> > +@@ -278,45 +278,13 @@ if sys.platform == 'win32':
> >               add_system_root(os.path.join(conda_dir, 'Library'))
> >
> >   else:
> > @@ -45,31 +45,24 @@ index 2424943..bf56a6d 100644
> >  -            default_x11_include_dirs.extend(['/usr/lib/X11/include',
> >  -                                             '/usr/include/X11'])
> >  -
> > --    import subprocess as sp
> > --    tmp = None
> > --    try:
> > --        # Explicitly open/close file to avoid ResourceWarning when
> > --        # tests are run in debug mode Python 3.
> > --        tmp = open(os.devnull, 'w')
> > --        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
> > --                     stderr=tmp)
> > --    except (OSError, DistutilsError):
> > --        # OSError if gcc is not installed, or SandboxViolation (DistutilsError
> > --        # subclass) if an old setuptools bug is triggered (see gh-3160).
> > --        pass
> > --    else:
> > --        triplet = str(p.communicate()[0].decode().strip())
> > --        if p.returncode == 0:
> > --            # gcc supports the "-print-multiarch" option
> > --            default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
> > --            default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
> > --    finally:
> > --        if tmp is not None:
> > --            tmp.close()
> > +-    with open(os.devnull, 'w') as tmp:
> > +-        try:
> > +-            p = subprocess.Popen(["gcc", "-print-multiarch"], stdout=subprocess.PIPE,
> > +-                         stderr=tmp)
> > +-        except (OSError, DistutilsError):
> > +-            # OSError if gcc is not installed, or SandboxViolation (DistutilsError
> > +-            # subclass) if an old setuptools bug is triggered (see gh-3160).
> > +-            pass
> > +-        else:
> > +-            triplet = str(p.communicate()[0].decode().strip())
> > +-            if p.returncode == 0:
> > +-                # gcc supports the "-print-multiarch" option
> > +-                default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
> > +-                default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
> >  +    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
> >  +    default_include_dirs = ['/deaddir/include']
> >  +    default_src_dirs = ['.', '/deaddir/src']
> > -+
> > +
> >  +    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
> >  +    default_x11_include_dirs = ['/deaddir/include']
> >
> > diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
> > index 43c3053cd88..c5d2a15ff21 100644
> > --- a/meta/recipes-devtools/python-numpy/python-numpy.inc
> > +++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "A sophisticated Numeric Processing Package for Python"
> >  SECTION = "devel/python"
> > -LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
> > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d26bde5432613cce2334b93985576231"
> > +LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a32aba007a415aa8a1c708a0e2b86a1"
> >
> >  SRCNAME = "numpy"
> >
> > @@ -10,8 +10,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
> >             file://0001-npy_cpu-Add-riscv-support.patch \
> >             ${CONFIGFILESURI} \
> >             "
> > -SRC_URI[md5sum] = "0886e5b5017f08f2b7a624c0b5931e61"
> > -SRC_URI[sha256sum] = "adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f"
> > +SRC_URI[md5sum] = "c48b2ad785f82cdfe28c907ce35e2a71"
> > +SRC_URI[sha256sum] = "47b7b6145e7ba5918ce26be25999b6d4b35cf9fbfdf46b7da50090ffdb020445"
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
> >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> > diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
> > rename to meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

