Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail.openembedded.org (Postfix) with ESMTP id 13B467E686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:51:10 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id i7so3458731vsp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SpX+C6O9N+u/liea5Vg/VySRDFLtT9qKxuDh29UiDDo=;
	b=BSJW1ekEXFm9bEikDJn3MXaUZFTd7VL4H6Cf5B5OXO/xrP/fNnIUL/IN9zTx7wESB9
	sZ85Y/skjhbGD00oCmghGRspfPc48M1tultQiQrtS3r0Jj4cKgPdNQQeckeSGNivQmqU
	Cv9h4UWROl9x/dM8mUhoQ/mFBZ/WGs30YG/68ogKltJvgyg7G/HoLjpz7Da/PZoT2hg1
	5dC1jhLKxDLA9zjawwnQgvHz4Omh4BndTwHQFqhHzK17GcjB1k4OmZ3UdFK+l4FdRYJf
	jSN1kBLmUfgDUZKyUuhCtt4NMzGj00v4xi9cARh46IK0P5macr3qyJA44FqWA07mvNLE
	ukAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SpX+C6O9N+u/liea5Vg/VySRDFLtT9qKxuDh29UiDDo=;
	b=WZD9zI2cjXGKiZXcefygKp60R8ckPisWJkRsDDdrR8U6EH+5WAhAoYkw5MHs5tnTZ3
	f8ZqevA894PvQY/uYE4A6ZoB8w4rU0IVWAuCMK+vKHBV6nCET7XEG5W5LhOQTl6o3Kcl
	7z3TD5BzKkD/zPc+aATSDn9xKqpbCfxtsi611pw8/cnnUBwNtYI5y7FvPlXaM8aAkZj8
	DpQFQ8F0EaQdVybyiqE9CzNOr7SbavFUVYASG67r+2gE6Lr+9TWg8Pxk4XI0Q7p9KLth
	WHaqwzZABSYxlAazgsSTebwLYwqix5iV5MSIhs7045SQ/mTWTnYz5g+KqkXUv3nU5gHM
	YODQ==
X-Gm-Message-State: APjAAAXw2GcCrykOjjkUB2TLb0GIg1jAh28OztahGa7EWF5KWsKgy1bO
	wpEWRllQflQxozf+F+df4YTAFLmApl4mX21FQ/M=
X-Google-Smtp-Source: APXvYqyf+xwIaKwNaTJWEq0EEfB8B9IhWvn0zL9/s+eS0KS7yEQksMoBGYBvHnmN6qJRGVQyMITMSIx95KOFz+1IsSk=
X-Received: by 2002:a67:8709:: with SMTP id j9mr20578701vsd.35.1565617872021; 
	Mon, 12 Aug 2019 06:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
	<20190808161150.44877-5-alex.kanavin@gmail.com>
	<CAMKF1sqbwJiBay7SaQroUspx3RgehPPvRpNdGP=6j5YPDdaBbg@mail.gmail.com>
	<CAMKF1spNo-rg12f3cTw6ET7QiKGZeVHEQuxpiGbPJ=zggo86Kg@mail.gmail.com>
In-Reply-To: <CAMKF1spNo-rg12f3cTw6ET7QiKGZeVHEQuxpiGbPJ=zggo86Kg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2019 15:51:00 +0200
Message-ID: <CANNYZj8gCxCQmUpFK0niM6YFsdS8EBN9AM7YM2QUGDBMbkvh_g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 12 Aug 2019 13:51:11 -0000
Content-Type: multipart/alternative; boundary="0000000000001dacef058febd19c"

--0000000000001dacef058febd19c
Content-Type: text/plain; charset="UTF-8"

Thanks, I have resent the patchset with the fix included.

Alex

On Mon, 12 Aug 2019 at 04:59, Khem Raj <raj.khem@gmail.com> wrote:

> Fails same way on qemuarm/glibc
>
> https://errors.yoctoproject.org/Errors/Details/260792/
>
> On Fri, Aug 9, 2019 at 11:11 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > https://errors.yoctoproject.org/Errors/Details/260208/
> >
> > On Thu, Aug 8, 2019 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> > >
> > > Rebase
> files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > >
> > > License-Update: clarified license for
> numpy/core/src/multiarray/dragon4.c (it is MIT)
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++-----------
> > >  .../python-numpy/python-numpy.inc             |  8 ++--
> > >  ...umpy_1.16.3.bb => python3-numpy_1.17.0.bb} |  0
> > >  3 files changed, 24 insertions(+), 31 deletions(-)
> > >  rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.3.bb
> => python3-numpy_1.17.0.bb} (100%)
> > >
> > > diff --git
> a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > > index 8fe0d1a27ee..98a97058312 100644
> > > ---
> a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > > +++
> b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> > > @@ -1,4 +1,4 @@
> > > -From c14554c7e2fff8dd559dfb41e7dd11392c6f85e3 Mon Sep 17 00:00:00 2001
> > > +From 672a75c8417ce08db9e31fc415ec445479231d5a Mon Sep 17 00:00:00 2001
> > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > >  Date: Thu, 10 Dec 2015 13:20:30 +0200
> > >  Subject: [PATCH] Don't search /usr and so on for libraries by default
> to
> > > @@ -10,14 +10,14 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
> > >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > >
> > >  ---
> > > - numpy/distutils/system_info.py | 50
> ++++------------------------------
> > > - 1 file changed, 6 insertions(+), 44 deletions(-)
> > > + numpy/distutils/system_info.py | 42
> ++++------------------------------
> > > + 1 file changed, 5 insertions(+), 37 deletions(-)
> > >
> > >  diff --git a/numpy/distutils/system_info.py
> b/numpy/distutils/system_info.py
> > > -index 2424943..bf56a6d 100644
> > > +index ba2b1f4..f94dce1 100644
> > >  --- a/numpy/distutils/system_info.py
> > >  +++ b/numpy/distutils/system_info.py
> > > -@@ -274,51 +274,13 @@ if sys.platform == 'win32':
> > > +@@ -278,45 +278,13 @@ if sys.platform == 'win32':
> > >               add_system_root(os.path.join(conda_dir, 'Library'))
> > >
> > >   else:
> > > @@ -45,31 +45,24 @@ index 2424943..bf56a6d 100644
> > >  -            default_x11_include_dirs.extend(['/usr/lib/X11/include',
> > >  -                                             '/usr/include/X11'])
> > >  -
> > > --    import subprocess as sp
> > > --    tmp = None
> > > --    try:
> > > --        # Explicitly open/close file to avoid ResourceWarning when
> > > --        # tests are run in debug mode Python 3.
> > > --        tmp = open(os.devnull, 'w')
> > > --        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
> > > --                     stderr=tmp)
> > > --    except (OSError, DistutilsError):
> > > --        # OSError if gcc is not installed, or SandboxViolation
> (DistutilsError
> > > --        # subclass) if an old setuptools bug is triggered (see
> gh-3160).
> > > --        pass
> > > --    else:
> > > --        triplet = str(p.communicate()[0].decode().strip())
> > > --        if p.returncode == 0:
> > > --            # gcc supports the "-print-multiarch" option
> > > --            default_x11_lib_dirs += [os.path.join("/usr/lib/",
> triplet)]
> > > --            default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
> > > --    finally:
> > > --        if tmp is not None:
> > > --            tmp.close()
> > > +-    with open(os.devnull, 'w') as tmp:
> > > +-        try:
> > > +-            p = subprocess.Popen(["gcc", "-print-multiarch"],
> stdout=subprocess.PIPE,
> > > +-                         stderr=tmp)
> > > +-        except (OSError, DistutilsError):
> > > +-            # OSError if gcc is not installed, or SandboxViolation
> (DistutilsError
> > > +-            # subclass) if an old setuptools bug is triggered (see
> gh-3160).
> > > +-            pass
> > > +-        else:
> > > +-            triplet = str(p.communicate()[0].decode().strip())
> > > +-            if p.returncode == 0:
> > > +-                # gcc supports the "-print-multiarch" option
> > > +-                default_x11_lib_dirs += [os.path.join("/usr/lib/",
> triplet)]
> > > +-                default_lib_dirs += [os.path.join("/usr/lib/",
> triplet)]
> > >  +    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
> > >  +    default_include_dirs = ['/deaddir/include']
> > >  +    default_src_dirs = ['.', '/deaddir/src']
> > > -+
> > > +
> > >  +    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
> > >  +    default_x11_include_dirs = ['/deaddir/include']
> > >
> > > diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc
> b/meta/recipes-devtools/python-numpy/python-numpy.inc
> > > index 43c3053cd88..c5d2a15ff21 100644
> > > --- a/meta/recipes-devtools/python-numpy/python-numpy.inc
> > > +++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
> > > @@ -1,7 +1,7 @@
> > >  SUMMARY = "A sophisticated Numeric Processing Package for Python"
> > >  SECTION = "devel/python"
> > > -LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
> > > -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=d26bde5432613cce2334b93985576231"
> > > +LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=1a32aba007a415aa8a1c708a0e2b86a1"
> > >
> > >  SRCNAME = "numpy"
> > >
> > > @@ -10,8 +10,8 @@ SRC_URI = "
> https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
> > >             file://0001-npy_cpu-Add-riscv-support.patch \
> > >             ${CONFIGFILESURI} \
> > >             "
> > > -SRC_URI[md5sum] = "0886e5b5017f08f2b7a624c0b5931e61"
> > > -SRC_URI[sha256sum] =
> "adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f"
> > > +SRC_URI[md5sum] = "c48b2ad785f82cdfe28c907ce35e2a71"
> > > +SRC_URI[sha256sum] =
> "47b7b6145e7ba5918ce26be25999b6d4b35cf9fbfdf46b7da50090ffdb020445"
> > >
> > >  UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
> > >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> > > diff --git a/meta/recipes-devtools/python-numpy/
> python3-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/
> python3-numpy_1.17.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
> > > rename to meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001dacef058febd19c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I have resent the patchset with the fix inclu=
ded.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 Aug 2019 at 04:59, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fails s=
ame way on qemuarm/glibc<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/260792/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/260792/</a><br>
<br>
On Fri, Aug 9, 2019 at 11:11 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/260208/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/260208/</a><br>
&gt;<br>
&gt; On Thu, Aug 8, 2019 at 9:12 AM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; Rebase files/0001-Don-t-search-usr-and-so-on-for-libraries-by-def=
ault-.patch<br>
&gt; &gt;<br>
&gt; &gt; License-Update: clarified license for numpy/core/src/multiarray/d=
ragon4.c (it is MIT)<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++=
-----------<br>
&gt; &gt;=C2=A0 .../python-numpy/python-numpy.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++--<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://umpy_1.16.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">umpy_1.16.3.bb</a> =3D&gt; <a href=3D"http://python3-numpy_1=
.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.17.0.bb</a>}=
 |=C2=A0 0<br>
&gt; &gt;=C2=A0 3 files changed, 24 insertions(+), 31 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/python-numpy/{<a href=3D"http:=
//python3-numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-num=
py_1.16.3.bb</a> =3D&gt; <a href=3D"http://python3-numpy_1.17.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-numpy_1.17.0.bb</a>} (100%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-=
search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtool=
s/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-defau=
lt-.patch<br>
&gt; &gt; index 8fe0d1a27ee..98a97058312 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-=
usr-and-so-on-for-libraries-by-default-.patch<br>
&gt; &gt; +++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-=
usr-and-so-on-for-libraries-by-default-.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From c14554c7e2fff8dd559dfb41e7dd11392c6f85e3 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From 672a75c8417ce08db9e31fc415ec445479231d5a Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Thu, 10 Dec 2015 13:20:30 +0200<br>
&gt; &gt;=C2=A0 Subject: [PATCH] Don&#39;t search /usr and so on for librar=
ies by default to<br>
&gt; &gt; @@ -10,14 +10,14 @@ Signed-off-by: Ross Burton &lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
br>
&gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - numpy/distutils/system_info.py | 50 ++++-----------------------=
-------<br>
&gt; &gt; - 1 file changed, 6 insertions(+), 44 deletions(-)<br>
&gt; &gt; + numpy/distutils/system_info.py | 42 ++++-----------------------=
-------<br>
&gt; &gt; + 1 file changed, 5 insertions(+), 37 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/numpy/distutils/system_info.py b/numpy/distuti=
ls/system_info.py<br>
&gt; &gt; -index 2424943..bf56a6d 100644<br>
&gt; &gt; +index ba2b1f4..f94dce1 100644<br>
&gt; &gt;=C2=A0 --- a/numpy/distutils/system_info.py<br>
&gt; &gt;=C2=A0 +++ b/numpy/distutils/system_info.py<br>
&gt; &gt; -@@ -274,51 +274,13 @@ if sys.platform =3D=3D &#39;win32&#39;:<br=
>
&gt; &gt; +@@ -278,45 +278,13 @@ if sys.platform =3D=3D &#39;win32&#39;:<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_system_=
root(os.path.join(conda_dir, &#39;Library&#39;))<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0else:<br>
&gt; &gt; @@ -45,31 +45,24 @@ index 2424943..bf56a6d 100644<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_x11_incl=
ude_dirs.extend([&#39;/usr/lib/X11/include&#39;,<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/usr/include/X11&#39;])<br>
&gt; &gt;=C2=A0 -<br>
&gt; &gt; --=C2=A0 =C2=A0 import subprocess as sp<br>
&gt; &gt; --=C2=A0 =C2=A0 tmp =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Explicitly open/close file to avo=
id ResourceWarning when<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # tests are run in debug mode Pytho=
n 3.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D open(os.devnull, &#39;w&#39=
;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D sp.Popen([&quot;gcc&quot;, &q=
uot;-print-multiarch&quot;], stdout=3Dsp.PIPE,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0stderr=3Dtmp)<br>
&gt; &gt; --=C2=A0 =C2=A0 except (OSError, DistutilsError):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # OSError if gcc is not installed, =
or SandboxViolation (DistutilsError<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # subclass) if an old setuptools bu=
g is triggered (see gh-3160).<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 triplet =3D str(p.communicate()[0].=
decode().strip())<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returncode =3D=3D 0:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # gcc supports the &q=
uot;-print-multiarch&quot; option<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_x11_lib_dirs =
+=3D [os.path.join(&quot;/usr/lib/&quot;, triplet)]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_lib_dirs +=3D=
 [os.path.join(&quot;/usr/lib/&quot;, triplet)]<br>
&gt; &gt; --=C2=A0 =C2=A0 finally:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if tmp is not None:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp.close()<br>
&gt; &gt; +-=C2=A0 =C2=A0 with open(os.devnull, &#39;w&#39;) as tmp:<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Pope=
n([&quot;gcc&quot;, &quot;-print-multiarch&quot;], stdout=3Dsubprocess.PIPE=
,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dtmp)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (OSError, DistutilsError):<b=
r>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # OSError if gcc is n=
ot installed, or SandboxViolation (DistutilsError<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # subclass) if an old=
 setuptools bug is triggered (see gh-3160).<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 triplet =3D str(p.com=
municate()[0].decode().strip())<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returncode =3D=
=3D 0:<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # gcc s=
upports the &quot;-print-multiarch&quot; option<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default=
_x11_lib_dirs +=3D [os.path.join(&quot;/usr/lib/&quot;, triplet)]<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default=
_lib_dirs +=3D [os.path.join(&quot;/usr/lib/&quot;, triplet)]<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 default_lib_dirs =3D libpaths([&#39;/deadir/=
lib&#39;], platform_bits)<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 default_include_dirs =3D [&#39;/deaddir/incl=
ude&#39;]<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 default_src_dirs =3D [&#39;.&#39;, &#39;/dea=
ddir/src&#39;]<br>
&gt; &gt; -+<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 default_x11_lib_dirs =3D libpaths([&#39;/dea=
ddir/lib&#39;], platform_bits)<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 default_x11_include_dirs =3D [&#39;/deaddir/=
include&#39;]<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc =
b/meta/recipes-devtools/python-numpy/python-numpy.inc<br>
&gt; &gt; index 43c3053cd88..c5d2a15ff21 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/python-numpy/python-numpy.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/python-numpy/python-numpy.inc<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;A sophisticated Numeric Processing Packag=
e for Python&quot;<br>
&gt; &gt;=C2=A0 SECTION =3D &quot;devel/python&quot;<br>
&gt; &gt; -LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause &amp; PSF &amp=
; Apache-2.0 &amp; BSD&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Dd26bde543261=
3cce2334b93985576231&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause &amp; PSF &amp=
; Apache-2.0 &amp; BSD &amp; MIT&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D1a32aba007a4=
15aa8a1c708a0e2b86a1&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRCNAME =3D &quot;numpy&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -10,8 +10,8 @@ SRC_URI =3D &quot;<a href=3D"https://github.com=
/$%7BSRCNAME%7D/$%7BSRCNAME%7D/releases/download/v$%7BPV%7D/$%7BS" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/${SRCNAME}/${SRCNAME}/relea=
ses/download/v${PV}/${S</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-npy_cp=
u-Add-riscv-support.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CONFIGFILESURI} =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;0886e5b5017f08f2b7a624c0b5931e61&quot;=
<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;adf063a3f87ab89393f5eea0eb903293b11=
2fa0a308e8c594a75ffa585d81d4f&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;c48b2ad785f82cdfe28c907ce35e2a71&quot;=
<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;47b7b6145e7ba5918ce26be25999b6d4b35=
cf9fbfdf46b7da50090ffdb020445&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/=
numpy/numpy/releases" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/numpy/numpy/releases</a>&quot;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)\=
.tar&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python-numpy/<a href=3D"http:/=
/python3-numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-nump=
y_1.16.3.bb</a> b/meta/recipes-devtools/python-numpy/<a href=3D"http://pyth=
on3-numpy_1.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.1=
7.0.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/python-numpy/<a href=3D"http://=
python3-numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy=
_1.16.3.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/python-numpy/<a href=3D"http://py=
thon3-numpy_1.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1=
.17.0.bb</a><br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001dacef058febd19c--
