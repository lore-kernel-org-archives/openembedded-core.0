Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE1207D59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:20:51 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a25so4022145otq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d6GrCNQ4pSgkpvntFR0lR/MD6bSx3ablZwXkpOYwTjg=;
	b=nvUhsY4hBBjPEOEbBqoheiryGVJGKSqSBWi1C2ZwGHudqkXtV/2VnXBp2KInMZeLGY
	fqKUqtLdiVY/pZiZ4o0ZlRCU5F+tWHDLr/veFHRSgiemwDHx/3NqEczdw/3XHxfZjA+5
	hk/HgdV/nNVTqu59uBfQowQy2hWWLRA/K5xfgF3JL3e57sCSclN86zE+uIhvo8ULpT6G
	Z8zJmXTd6xGH1fkuHnnr2bojGxQjtDeADvF0XTqz057i8UZDzSPH1rc7w7yCKKSK8znk
	NuPDCzNA6hD7eX7DmNg4GNcHUwTQm90zhtmulT4mzH3u7Aqs8idhhNekVvXNTVOoMvtm
	Rd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d6GrCNQ4pSgkpvntFR0lR/MD6bSx3ablZwXkpOYwTjg=;
	b=SOwB0Eh0IzwRJ8kjf1ShHVJ94ZgELRg8kcMREGwOblaE0xzaobuBFIQjOQLwZCDiw4
	MJGAZc/zZ8hsC6ZpDOcFX9gs/+FORWFMwNlsLAJFc8hbxya3wy93n61ZPTE+j62v/iVF
	pUmOHHqIdLJCF5WY4jQ88PX6YnevnJgQVIVDaCURy0z8KKdVTaqdYYe11NFI8kTS5/YK
	gZcWwUfV4ALRk5Ki3sJ6ibbN/+uy1SV5PZOWjkh7uHDktI6k5zPcmsyl9xzgJRuyRVEG
	/6FN5ZjUsNDjoV6QCiRatBb7Uz8kS3FCF9P9ig1ZEjT6EwumItIZKpcf3jP8R4+yGui/
	GkUw==
X-Gm-Message-State: APjAAAV9cFcoQ1H4nmB3T6CnnEini1HFkaZk/fK7FMaE3kS8EXfae0EG
	TjPmDkqZtWesy4Yfb3zIWaoFgmX9IXRY1EEu+GG6f2GM
X-Google-Smtp-Source: APXvYqw0+qK73tKETNsyD7f8OJRB8NszoSsEA8UcCGz02PENXAkF51fxuz97WuSd2k18JDzYKBpMXgSfJzYz3wU8WNQ=
X-Received: by 2002:a05:6830:109:: with SMTP id
	i9mr20521696otp.96.1556122852277; 
	Wed, 24 Apr 2019 09:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-5-alex.kanavin@gmail.com>
	<8d33f7f60b0fb8394b459ed4c43e9f21d844b269.camel@linuxfoundation.org>
In-Reply-To: <8d33f7f60b0fb8394b459ed4c43e9f21d844b269.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 18:20:40 +0200
Message-ID: <CANNYZj83RCwo3mtTkRxnyN45pi4qCg5ifrihWcyhQuk+0arZxA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] python-setuptools: update to 41.0.1
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
X-List-Received-Date: Wed, 24 Apr 2019 16:20:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2019 at 18:02, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-04-23 at 18:19 +0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python-setuptools.inc            | 4
> > ++--
> >  ...ython-setuptools_40.8.0.bb =3D> python-setuptools_41.0.1.bb} | 0
> >  ...hon3-setuptools_40.8.0.bb =3D> python3-setuptools_41.0.1.bb} | 0
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python-setuptools_40.8.0.bb =3D>
> > python-setuptools_41.0.1.bb} (100%)
> >  rename meta/recipes-devtools/python/{python3-setuptools_40.8.0.bb =3D>
> > python3-setuptools_41.0.1.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > b/meta/recipes-devtools/python/python-setuptools.inc
> > index 9092d7ad03a..357aa07086a 100644
> > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > @@ -10,8 +10,8 @@ inherit pypi
> >
> >  SRC_URI_append_class-native =3D " file://0001-conditionally-do-not-
> > fetch-code-by-easy_install.patch"
> >
> > -SRC_URI[md5sum] =3D "712697a5bc975cf479d487cd68206c20"
> > -SRC_URI[sha256sum] =3D
> > "6e4eec90337e849ade7103723b9a99631c1f0d19990d6e8412dc42f5ae8b304d"
> > +SRC_URI[md5sum] =3D "6404ca798bb9a9073aff3b91b2df35c8"
> > +SRC_URI[sha256sum] =3D
> > "a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613"
> >
> >  DEPENDS +=3D "${PYTHON_PN}"
> >
> > diff --git a/meta/recipes-devtools/python/python-setuptools_40.8.0.bb
> > b/meta/recipes-devtools/python/python-setuptools_41.0.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python/python-setuptools_40.8.0.bb
> > rename to meta/recipes-devtools/python/python-setuptools_41.0.1.bb
> > diff --git a/meta/recipes-devtools/python/python3-
> > setuptools_40.8.0.bb b/meta/recipes-devtools/python/python3-
> > setuptools_41.0.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python/python3-setuptools_40.8.0.bb
> > rename to meta/recipes-devtools/python/python3-setuptools_41.0.1.bb
>
> I think this breaks buildhistory.
>
> The autobuilder runs:
>
> '/home/pokybuild/yocto-worker/qemuppc/yocto-autobuilder-helper/scripts/co=
llect-results', '/home/pokybuild/yocto-worker/qemuppc/build/build', '/srv/a=
utobuilder/autobuilder.yoctoproject.org/pub/non-release/20190424-4/testresu=
lts', 'qemuppc'
>
> which results in a call like:
>
> /home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhistory-=
diff -p /home/pokybuild/yocto-worker/qemuppc/build/build/buildhistory ab-fe=
tchrev
>
> which results in a comparision between:
>
> /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy3_install =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy_install-3.7=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/easy_install.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/pkg_resources/__pycache__/__init__.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/pkg_resources/__pycache__/py31compat.cpython-37.pyc =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__p=
ycache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/=
appdirs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/pyparsing.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-37.pyc=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/pkg_resources/_vendor/appdirs.py /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/pac=
kaging/__about__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/=
lib/python3.7/site-packages/pkg_resources/_vendor/packaging/__init__.py /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/pkg_resources/_vendor/packaging/__pycache__/__about__.cpython-37.pyc /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-37.pyc =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/packaging/__pycache__/_compat.cpython-37.pyc =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-37.=
pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-37.=
pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpytho=
n-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpy=
thon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/pkg_resources/_vendor/packaging/_compat.py /opt/poky/2.7+=
snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_re=
sources/_vendor/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/pack=
aging/markers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/pkg_resources/_vendor/packaging/requirements.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/packaging/specifiers.py /opt/poky/2.7+snapshot/=
sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_=
vendor/packaging/utils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/pkg_resources/_vendor/packaging/version.p=
y /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site=
-packages/pkg_resources/_vendor/pyparsing.py /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/=
six.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/pkg_resources/extern/__init__.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/exter=
n/__pycache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/py31compat.py /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/setuptools-40.8.0-py3.7.egg-info/PKG-INFO /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-40.8.0-=
py3.7.egg-info/SOURCES.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-lin=
ux/usr/lib/python3.7/site-packages/setuptools-40.8.0-py3.7.egg-info/depende=
ncy_links.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools-40.8.0-py3.7.egg-info/entry_points.txt /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/setuptools-40.8.0-py3.7.egg-info/requires.txt /opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-40.8.=
0-py3.7.egg-info/top_level.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools-40.8.0-py3.7.egg-info/zip=
-safe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/__init_=
_.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/__pycache__/_deprecation_warning.cpytho=
n-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/__pycache__/archive_util.cpython-37.pyc /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/__pycache__/build_meta.cpython-37.pyc /opt/poky/2.7+snapshot/sy=
sroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pyca=
che__/config.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/__pycache__/dep_util.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/__pycache__/depends.cpython-37.pyc /opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/__pycache__/dist.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/extens=
ion.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/__pycache__/glibc.cpython-37.pyc /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/__pycache__/glob.cpython-37.pyc /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache=
__/launch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/__pycache__/lib2to3_ex.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/__pycache__/monkey.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/msvc.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/namespac=
es.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/setuptools/__pycache__/package_index.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/__pycache__/pep425tags.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/py27compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/py=
31compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/=
usr/lib/python3.7/site-packages/setuptools/__pycache__/py33compat.cpython-3=
7.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/__pycache__/sandbox.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/site-patch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/ss=
l_support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/__pycache__/unicode_utils.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/__pycache__/version.cpython-37.pyc /opt/poky/2=
.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/set=
uptools/__pycache__/wheel.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/win=
dows_support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/_deprecation_warning.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pok=
ysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/_=
_init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/pyparsing.cpy=
thon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/_vendor/__pycache__/six.cpython-37.pyc /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/_vendor/packaging/__about__.py /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/pac=
kaging/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__about=
__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__init__=
.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_compat.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_structures.c=
python-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/markers.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/requirements.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/specifiers.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/utils.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/_vendor/packaging/__pycache__/version.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/_vendor/packaging/_compat.py /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_ve=
ndor/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/markers.=
py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/_vendor/packaging/requirements.py /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
_vendor/packaging/specifiers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/utils.=
py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/_vendor/packaging/version.py /opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vend=
or/pyparsing.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/_vendor/six.py /opt/poky/2.7+snapshot/sy=
sroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/archiv=
e_util.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/build_meta.py /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/cli-32.exe /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/cli-64.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/cli.exe /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/c=
ommand/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/command/__pycache__/__init__.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/command/__pycache__/alias.cpython-37.pyc /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/__pycache__/bdist_egg.cpython-37.pyc /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
command/__pycache__/bdist_rpm.cpython-37.pyc /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__p=
ycache__/bdist_wininst.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache_=
_/build_clib.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/build_ex=
t.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/build_py.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/__pycache__/develop.cpython-37.pyc /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/__pycache__/dist_info.cpython-37.pyc /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
command/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/=
__pycache__/egg_info.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/=
install.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/command/__pycache__/install_egg_i=
nfo.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/command/__pycache__/install_lib.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/command/__pycache__/install_scripts.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/__pycache__/py36compat.cpython-37.pyc /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/command/__pycache__/register.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/command/__pycache__/rotate.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots=
/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__py=
cache__/saveopts.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/sdis=
t.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/setopt.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/__pycache__/test.cpython-37.pyc /opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/command/__pycache__/upload.cpython-37.pyc /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/=
__pycache__/upload_docs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/alias.py =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/setuptools/command/bdist_egg.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/bdist_rp=
m.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/bdist_wininst.py /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command=
/build_clib.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/command/build_ext.py /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/c=
ommand/build_py.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/command/develop.py /opt/poky/2.7+snap=
shot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools=
/command/dist_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/us=
r/lib/python3.7/site-packages/setuptools/command/easy_install.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/egg_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools/command/install.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/install_egg_info.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/install_l=
ib.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/command/install_scripts.py '/opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/com=
mand/launcher manifest.xml' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/command/py36compat.py /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/command/register.py /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/setuptools/command/rotate.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/command/saveopts.py /opt/poky/2.7+snapshot/sysroots/i686-poky=
sdk-linux/usr/lib/python3.7/site-packages/setuptools/command/sdist.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/command/setopt.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/command/test.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/upload.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools/command/upload_docs.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/config.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/dep_util.py /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
depends.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/dist.py /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/extension.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/extern/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/setuptools/extern/__pycache__/__in=
it__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/=
lib/python3.7/site-packages/setuptools/glibc.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/glob.py =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/setuptools/gui-32.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/gui-64.exe /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/gui.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/launch.py /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/lib2to3_ex.py /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/setuptools/monkey.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/msvc.py /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/n=
amespaces.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/package_index.py /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/pep425t=
ags.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/py27compat.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/py31compat.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/py33compat.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools/sandbox.py '/opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/script (dev).tmpl' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/script.tmpl /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
site-patch.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/ssl_support.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/unicode_=
utils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/version.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/wheel.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/windows_support.py
>
> and
>
> /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy3_install =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy_install-3.7=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/easy_install.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/pkg_resources/__pycache__/__init__.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/pkg_resources/__pycache__/py31compat.cpython-37.pyc =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__p=
ycache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/=
appdirs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/pyparsing.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-37.pyc=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/pkg_resources/_vendor/appdirs.py /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/pac=
kaging/__about__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/=
lib/python3.7/site-packages/pkg_resources/_vendor/packaging/__init__.py /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/pkg_resources/_vendor/packaging/__pycache__/__about__.cpython-37.pyc /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-37.pyc =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/packaging/__pycache__/_compat.cpython-37.pyc =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-37.=
pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-37.=
pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpytho=
n-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpy=
thon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/pkg_resources/_vendor/packaging/_compat.py /opt/poky/2.7+=
snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_re=
sources/_vendor/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/pack=
aging/markers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/pkg_resources/_vendor/packaging/requirements.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/packaging/specifiers.py /opt/poky/2.7+snapshot/=
sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_=
vendor/packaging/utils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/pkg_resources/_vendor/packaging/version.p=
y /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site=
-packages/pkg_resources/_vendor/pyparsing.py /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/=
six.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/pkg_resources/extern/__init__.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/exter=
n/__pycache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/py31compat.py /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/setuptools-41.0.1-py3.7.egg-info/PKG-INFO /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-41.0.1-=
py3.7.egg-info/SOURCES.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-lin=
ux/usr/lib/python3.7/site-packages/setuptools-41.0.1-py3.7.egg-info/depende=
ncy_links.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools-41.0.1-py3.7.egg-info/entry_points.txt /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/setuptools-41.0.1-py3.7.egg-info/requires.txt /opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-41.0.=
1-py3.7.egg-info/top_level.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools-41.0.1-py3.7.egg-info/zip=
-safe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/__init_=
_.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/__pycache__/_deprecation_warning.cpytho=
n-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/__pycache__/archive_util.cpython-37.pyc /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/__pycache__/build_meta.cpython-37.pyc /opt/poky/2.7+snapshot/sy=
sroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pyca=
che__/config.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/__pycache__/dep_util.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/__pycache__/depends.cpython-37.pyc /opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/__pycache__/dist.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/extens=
ion.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/__pycache__/glibc.cpython-37.pyc /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/__pycache__/glob.cpython-37.pyc /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache=
__/launch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/__pycache__/lib2to3_ex.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/__pycache__/monkey.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/msvc.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/namespac=
es.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/setuptools/__pycache__/package_index.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/__pycache__/pep425tags.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/py27compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/py=
31compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/=
usr/lib/python3.7/site-packages/setuptools/__pycache__/py33compat.cpython-3=
7.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/__pycache__/sandbox.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/site-patch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/ss=
l_support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/__pycache__/unicode_utils.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/__pycache__/version.cpython-37.pyc /opt/poky/2=
.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/set=
uptools/__pycache__/wheel.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/win=
dows_support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/_deprecation_warning.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pok=
ysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/_=
_init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/pyparsing.cpy=
thon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/_vendor/__pycache__/six.cpython-37.pyc /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/_vendor/packaging/__about__.py /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/pac=
kaging/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__about=
__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__init__=
.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_compat.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_structures.c=
python-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/markers.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/requirements.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/specifiers.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/utils.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/_vendor/packaging/__pycache__/version.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/_vendor/packaging/_compat.py /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_ve=
ndor/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/markers.=
py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/_vendor/packaging/requirements.py /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
_vendor/packaging/specifiers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/utils.=
py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/_vendor/packaging/version.py /opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vend=
or/pyparsing.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/_vendor/six.py /opt/poky/2.7+snapshot/sy=
sroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/archiv=
e_util.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/build_meta.py /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/cli-32.exe /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/cli-64.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/cli.exe /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/c=
ommand/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/command/__pycache__/__init__.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/command/__pycache__/alias.cpython-37.pyc /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/__pycache__/bdist_egg.cpython-37.pyc /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
command/__pycache__/bdist_rpm.cpython-37.pyc /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__p=
ycache__/bdist_wininst.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache_=
_/build_clib.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/build_ex=
t.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/build_py.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/__pycache__/develop.cpython-37.pyc /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/__pycache__/dist_info.cpython-37.pyc /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
command/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/=
__pycache__/egg_info.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/=
install.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/command/__pycache__/install_egg_i=
nfo.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/command/__pycache__/install_lib.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/command/__pycache__/install_scripts.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/__pycache__/py36compat.cpython-37.pyc /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/command/__pycache__/register.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/command/__pycache__/rotate.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots=
/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__py=
cache__/saveopts.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/sdis=
t.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/setopt.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/__pycache__/test.cpython-37.pyc /opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/command/__pycache__/upload.cpython-37.pyc /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/=
__pycache__/upload_docs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/alias.py =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/setuptools/command/bdist_egg.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/bdist_rp=
m.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/bdist_wininst.py /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command=
/build_clib.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/command/build_ext.py /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/c=
ommand/build_py.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/l=
ib/python3.7/site-packages/setuptools/command/develop.py /opt/poky/2.7+snap=
shot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools=
/command/dist_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/us=
r/lib/python3.7/site-packages/setuptools/command/easy_install.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/egg_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools/command/install.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/install_egg_info.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/install_l=
ib.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/command/install_scripts.py '/opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/com=
mand/launcher manifest.xml' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/command/py36compat.py /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/command/register.py /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/setuptools/command/rotate.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/command/saveopts.py /opt/poky/2.7+snapshot/sysroots/i686-poky=
sdk-linux/usr/lib/python3.7/site-packages/setuptools/command/sdist.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/command/setopt.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/command/test.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/upload.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools/command/upload_docs.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/config.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/dep_util.py /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
depends.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/dist.py /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/extension.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools/extern/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/setuptools/extern/__pycache__/__in=
it__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/=
lib/python3.7/site-packages/setuptools/glibc.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/glob.py =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/setuptools/gui-32.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/gui-64.exe /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/gui.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/launch.py /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/lib2to3_ex.py /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/setuptools/monkey.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/msvc.py /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/n=
amespaces.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/package_index.py /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/pep425t=
ags.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/py27compat.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/py31compat.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/py33compat.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools/sandbox.py '/opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/script (dev).tmpl' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools/script.tmpl /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
site-patch.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/ssl_support.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/unicode_=
utils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/version.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/wheel.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/windows_support.py
>
> which trips over:
>
> '/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/script (dev).tmpl'
>
> and results in:
>
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/build=
history-diff", line 139, in <module>
>     main()
>   File "/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/build=
history-diff", line 132, in main
>     out =3D str(chg)
>   File "/home/pokybuild/yocto-worker/qemuppc/build/meta/lib/oe/buildhisto=
ry_analysis.py", line 67, in __str__
>     return self._str_internal(True)
>   File "/home/pokybuild/yocto-worker/qemuppc/build/meta/lib/oe/buildhisto=
ry_analysis.py", line 133, in _str_internal
>     depvera =3D bb.utils.explode_dep_versions2(self.oldvalue, sort=3DFals=
e)
>   File "/home/pokybuild/yocto-worker/qemuppc/build/bitbake/lib/bb/utils.p=
y", line 231, in explode_dep_versions2
>     raise VersionStringException('Invalid version specification in "(%s" =
- invalid or missing operator' % i)
>
> This doesn't block the upgrade but it does need a bug and for us to
> figure out some way of improving bb.utils.explode_dep_versions2 to
> handle this better.

It seems as though the parser for package dependency lists is called
on a plain file list, which should not be happening at all (as
obviously files are allowed to have just about anything in their
names). I'll look into it closer.

Alex

