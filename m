Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1769.1616234262728021070
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 02:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mUEcSAnA;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u9so13488395ejj.7
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lrw63tVX4NaLMNG9/ZuivMuBbRf/AmzHBcWVsRSwamg=;
        b=mUEcSAnA/iugv3WrcdBlrHpi9LVJYOUWBHcv+BLjWdkdOKmkv78cIATkCnb7Sy4nGB
         AlSov9iPTqx7uahE3j4ao7QBviFDLJSYArk1JWPijlhxebCTGnOAqo6ZBL7uiQkoaHcp
         CiBA9574+mbiRKeRcl2VfjA6wS56HdOAsOzDVy9l/nnhJ9xxzrei3CjAI5xPAEYdmJME
         x3FMOOuTF5almYPuckY1FuRVZAcel6QkFYaLhzaGeK/Z6m4j59VYmjCAi11vvyC2PWQU
         W6YD+tOHAnvHHTVdZDr8yrHwzKqx94iFCpae6a6d7GXLiBGKFmea4WN4PKoPWWOY4073
         i8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lrw63tVX4NaLMNG9/ZuivMuBbRf/AmzHBcWVsRSwamg=;
        b=H6Vs5gpUZ7zSFmVQ/JI/gPzmgiCKn0ZEgiSI7Gzp89vL79nB5rIssMVB9et2Mk82DD
         F+l3ZTlm3IJ5f4IehlVj4pTG98gi0XjrlRz6R0Rnt9HEHzpsKDDiihrQKZfQw8lbqvfF
         onqora3LuQLUvdC+vj4Md6DJyAbIBIdUr5bURhlThyeYjxIY664g/wIgAMugQ7bjy2iI
         /ttD1L2oDnjOlIXCUrZT0Mu1dSIt2PJC7rAciwZzM9jdx/m3xkVKIKV6Ac149m1477yr
         IDMSZI2vEpx/NMjo/t2BVfyUUXKu4qzXikxUrtlvvzRvAqx3udQen2I69o9Ji+sWDFcG
         vD3Q==
X-Gm-Message-State: AOAM5320uQgj+cDTZJs5pcyVeMvS/jfv+P3m/YDMKn9NKFUBs8Cg9HXO
	wg5iW6Djt27NYp+TT6vpc7Y=
X-Google-Smtp-Source: ABdhPJytA47RBZ1Xe0H+qAEZN8LEANZmA9FtWHkL272h0Cw0Ouu/aNzZ94HW9XBWuYsMFQUpwsgl5A==
X-Received: by 2002:a17:906:4e91:: with SMTP id v17mr8931697eju.331.1616234260933;
        Sat, 20 Mar 2021 02:57:40 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n16sm4946337ejy.35.2021.03.20.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 02:57:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 20 Mar 2021 10:57:38 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
Subject: Re: [OE-core] [PATCH 2/2] python3: upgrade to python 3.9.0
Message-ID: <20210320095738.muf6ilk7l554k2ah@jama>
References: <20201024212025.1107408-1-alejandro.hernandez@linux.microsoft.com>
 <20201024212025.1107408-2-alejandro.hernandez@linux.microsoft.com>
 <CANNYZj8g9g_gOkjgW+xD6=FixRL1kpZLgKGwY32LAthJkzOwCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8g9g_gOkjgW+xD6=FixRL1kpZLgKGwY32LAthJkzOwCA@mail.gmail.com>
X-Groupsio-MsgNum: 149708
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b434p32gyiuv5wpt"
Content-Disposition: inline

--b434p32gyiuv5wpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2020 at 11:35:05PM +0200, Alexander Kanavin wrote:
> Haha, you beat me to it by a few minutes :)
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanav=
in/package-version-updates&id=3D98049b60602b4bd3854e870e46705716e469277c
>=20
> I have some additional fixes included though, coming from autobuilder run=
s.

He also beated you a bit on functionality of PACKAGECONFIGs :).

> > a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch
> > b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch
> > index 4bd98f62fd..d0ff3219a6 100644
> > ---
> > a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch
> > +++
> > b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch
> > @@ -1,4 +1,4 @@
> > -From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001
> > +From 5d85a94fd0965aa26adf593b5f84948e9c502121 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 7 Oct 2019 13:22:14 +0200
> >  Subject: [PATCH] setup.py: do not report missing dependencies for disa=
bled
> > @@ -11,20 +11,24 @@ build completeness checker which relies on the repo=
rt.
> >  Upstream-Status: Inappropriate [oe-core specific]
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > +Rebased for 3.9 [10/2020]
> > +Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> > alejandro.hernandez@linux.microsoft.com>
> > +
> >  ---
> > - setup.py | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > + setup.py | 5 +++++
> > + 1 file changed, 5 insertions(+)
> >
> >  diff --git a/setup.py b/setup.py
> > -index 7691258..ec3f2a4 100644
> > +index ab9fb8e..8cf058c 100644
> >  --- a/setup.py
> >  +++ b/setup.py
> > -@@ -408,6 +408,10 @@ class PyBuildExt(build_ext):
> > +@@ -495,6 +495,11 @@ class PyBuildExt(build_ext):
> >                   print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
> >                                                 longest, g))
> >
> >  +        # There is no need to report missing module dependencies,
> >  +        # if the modules have been disabled in the first place.
> > ++        sysconf_dis =3D
> > sysconfig.get_config_var('MODDISABLED_NAMES').split()
> >  +        self.missing =3D list(set(self.missing) - set(sysconf_dis))
> >  +
> >           if self.missing:

This works better than Alex's version from
https://git.openembedded.org/openembedded-core/diff/meta/recipes-devtools/p=
ython/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.pat=
ch?id=3D7347556b18b45c5f9afc2cade565a75c95876914

diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-repo=
rt-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/pytho=
n3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 4bd98f62fd..5c620361da 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch
@@ -25,7 +25,7 @@ index 7691258..ec3f2a4 100644
 =20
 +        # There is no need to report missing module dependencies,
 +        # if the modules have been disabled in the first place.
-+        self.missing =3D list(set(self.missing) - set(sysconf_dis))
++        self.missing =3D list(set(self.missing) - set(mods_disabled))
 +
          if self.missing:
              print()

because mods_disabled can contain only extensions which were disabled, as t=
his list:
self.extensions: ['_struct', 'array', '_contextvars', 'math', 'cmath', 'tim=
e', '_datetime', '_zoneinfo', '_random', '_bisect', '_heapq', '_pickle', 'a=
texit', '_json', '_lsprof', 'unicodedata', '_opcode', '_asyncio', '_abc', '=
_queue', '_statistics', 'fcntl', 'pwd', 'grp', 'spwd', 'select', 'parser', =
'mmap', 'syslog', '_xxsubinterpreters', 'audioop', '_csv', '_posixsubproces=
s', '_testcapi', '_testinternalcapi', '_testbuffer', '_testimportmultiple',=
 '_testmultiphase', '_xxtestfuzz', '_curses', '_curses_panel', '_crypt', '_=
socket', '_ssl', '_hashlib', '_sha256', '_sha512', '_md5', '_sha1', '_blake=
2', '_sha3', '_sqlite3', 'termios', 'resource', 'ossaudiodev', 'nis', 'zlib=
', 'binascii', '_bz2', '_lzma', 'pyexpat', '_elementtree', '_multibytecodec=
', '_codecs_kr', '_codecs_jp', '_codecs_cn', '_codecs_tw', '_codecs_hk', '_=
codecs_iso2022', '_decimal', '_ctypes_test', '_posixshmem', '_multiprocessi=
ng', '_uuid', 'xxlimited', '_ctypes']

but PACKAGECONFIG in python3 recipe is using it to disable gdbm, dbm, readl=
ine and disabling them now causes do_install to fail with:

| ERROR: Execution of '/OE/build/oe-core/tmp-glibc/work/x86_64-linux/python=
3-native/3.9.0-r0/temp/run.do_install.69743' failed with exit code 1:
| The necessary bits to build these optional modules were not found:
| _dbm                  _gdbm                 readline

passing sysconf_dis into summary or reading it again from sysconfig like Al=
ejandro fixes that. Will send patch shortly.

--b434p32gyiuv5wpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYFXHEAAKCRA3VSO3ZXaA
HFaPAKCC3B8fdl0V4Z1TIv5F2aUOi9SfgACdGmFJVkRgvORyUdyBQLVQ5A7bds8=
=E/Q7
-----END PGP SIGNATURE-----

--b434p32gyiuv5wpt--
