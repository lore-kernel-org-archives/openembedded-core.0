Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 774967C7A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:02:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q16so5322062wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=w9clzE2VP/mxULPD23RdwSJYEgclc1euyN4qg1WMgp8=;
	b=dRjjNQJKn5I3G+0s1CVnAILrHus+g0RF1H7tJneYlwoEZFhrOpUo25yf5CHwVBC9gY
	9FWlpCXGb3zhqogdcj1m5niJz2WwyATSEOzyvXf37JDfn8/vCVztRKa7JATl0uG70Yk/
	caHth2MiQMWHxW0GIZrYcoRhqBlzmPmaVhwAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=w9clzE2VP/mxULPD23RdwSJYEgclc1euyN4qg1WMgp8=;
	b=XwsEY0W+x4N2uJih61rEvYhRii8gPpaKNQOW+GxxE9EcjIko0g78mOqsLYFy6YjHdg
	IbiVawAmirniiixbtIB0kdvgGueqtDAeRkEEPVocDn5UP00A4pfrEynrD4LKFWWHMV2+
	LrAqNIiHMGv6u8K9mPH18lkE3XUxObYKxO99fBtk3RxGRs8ZngvGINhB7p2XSZ9xy0ss
	0CGX6jSjJmgpP4HFFJWZ5v6DU5hX1MidLkoLD0OMEN4E9g/42AOQvuGe4zzNy9oLGzQo
	8XlHZwzrdUtAjvdReD7KsQV608kdDCsHV+pvv2bfkC5Aqb9bfH8fNvxHLrKVKv0Ii62p
	BNBQ==
X-Gm-Message-State: APjAAAVbx0E1eksvGTCIv7kHS9hJeUMU+k6BsJwg3ZdZWni351InZQVg
	l8W05t/V6QeJcca7GumXHiC1Hw==
X-Google-Smtp-Source: APXvYqzVpeCvMtJqYLfPBcJOxIat5E38eo6kltuVcYAoOb7243aOcIjJwstc7jqgpv0MoOugBG97Mg==
X-Received: by 2002:a1c:6c19:: with SMTP id h25mr6950153wmc.119.1556121768956; 
	Wed, 24 Apr 2019 09:02:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z6sm61939wrw.87.2019.04.24.09.02.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 09:02:48 -0700 (PDT)
Message-ID: <8d33f7f60b0fb8394b459ed4c43e9f21d844b269.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 17:02:45 +0100
In-Reply-To: <20190423161916.25572-5-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-5-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 24 Apr 2019 16:02:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-23 at 18:19 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc            | 4
> ++--
>  ...ython-setuptools_40.8.0.bb =3D> python-setuptools_41.0.1.bb} | 0
>  ...hon3-setuptools_40.8.0.bb =3D> python3-setuptools_41.0.1.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_40.8.0.bb =3D>
> python-setuptools_41.0.1.bb} (100%)
>  rename meta/recipes-devtools/python/{python3-setuptools_40.8.0.bb =3D>
> python3-setuptools_41.0.1.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 9092d7ad03a..357aa07086a 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,8 +10,8 @@ inherit pypi
> =20
>  SRC_URI_append_class-native =3D " file://0001-conditionally-do-not-
> fetch-code-by-easy_install.patch"
> =20
> -SRC_URI[md5sum] =3D "712697a5bc975cf479d487cd68206c20"
> -SRC_URI[sha256sum] =3D
> "6e4eec90337e849ade7103723b9a99631c1f0d19990d6e8412dc42f5ae8b304d"
> +SRC_URI[md5sum] =3D "6404ca798bb9a9073aff3b91b2df35c8"
> +SRC_URI[sha256sum] =3D
> "a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613"
> =20
>  DEPENDS +=3D "${PYTHON_PN}"
> =20
> diff --git a/meta/recipes-devtools/python/python-setuptools_40.8.0.bb=20
> b/meta/recipes-devtools/python/python-setuptools_41.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_40.8.0.bb
> rename to meta/recipes-devtools/python/python-setuptools_41.0.1.bb
> diff --git a/meta/recipes-devtools/python/python3-
> setuptools_40.8.0.bb b/meta/recipes-devtools/python/python3-
> setuptools_41.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-setuptools_40.8.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_41.0.1.bb

I think this breaks buildhistory.

The autobuilder runs:

'/home/pokybuild/yocto-worker/qemuppc/yocto-autobuilder-helper/scripts/coll=
ect-results', '/home/pokybuild/yocto-worker/qemuppc/build/build', '/srv/aut=
obuilder/autobuilder.yoctoproject.org/pub/non-release/20190424-4/testresult=
s', 'qemuppc'

which results in a call like:

/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhistory-di=
ff -p /home/pokybuild/yocto-worker/qemuppc/build/build/buildhistory ab-fetc=
hrev

which results in a comparision between:

/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy3_install /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy_install-3.7 /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/easy_install.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/pkg_resources/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/pkg_resources/__pycache__/__init__.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/pkg_resources/__pycache__/py31compat.cpython-37.pyc /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__pyc=
ache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/ap=
pdirs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/pyparsing.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-37.pyc /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/pkg_resources/_vendor/appdirs.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/packa=
ging/__about__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/pkg_resources/_vendor/packaging/__init__.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/pkg_resources/_vendor/packaging/__pycache__/__about__.cpython-37.pyc /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-37.pyc /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/packaging/__pycache__/_compat.cpython-37.pyc /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-37.py=
c /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site=
-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-37.py=
c /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site=
-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/pkg_resources/_vendor/packaging/_compat.py /opt/poky/2.7+sn=
apshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_reso=
urces/_vendor/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/packag=
ing/markers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/pkg_resources/_vendor/packaging/requirements.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/pkg_resources/_vendor/packaging/specifiers.py /opt/poky/2.7+snapshot/sy=
sroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_ve=
ndor/packaging/utils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/=
usr/lib/python3.7/site-packages/pkg_resources/_vendor/packaging/version.py =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/pyparsing.py /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/si=
x.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/pkg_resources/extern/__init__.py /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/extern/=
__pycache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/py31compat.py /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/setuptools-40.8.0-py3.7.egg-info/PKG-INFO /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-40.8.0-py=
3.7.egg-info/SOURCES.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools-40.8.0-py3.7.egg-info/dependenc=
y_links.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools-40.8.0-py3.7.egg-info/entry_points.txt /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools-40.8.0-py3.7.egg-info/requires.txt /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-40.8.0-=
py3.7.egg-info/top_level.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools-40.8.0-py3.7.egg-info/zip-s=
afe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/setuptools/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pok=
ysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/__init__.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/__pycache__/_deprecation_warning.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/__pycache__/archive_util.cpython-37.pyc /opt/poky=
/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/s=
etuptools/__pycache__/build_meta.cpython-37.pyc /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycach=
e__/config.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/__pycache__/dep_util.cpython-3=
7.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/__pycache__/depends.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/dist.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/extensio=
n.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/__pycache__/glibc.cpython-37.pyc /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/__pycache__/glob.cpython-37.pyc /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__=
/launch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/__pycache__/lib2to3_ex.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/__pycache__/monkey.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/__pycache__/msvc.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-poky=
sdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/namespaces=
.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/__pycache__/package_index.cpython-37.pyc=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/__pycache__/pep425tags.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/__pycache__/py27compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/py31=
compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/us=
r/lib/python3.7/site-packages/setuptools/__pycache__/py33compat.cpython-37.=
pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/setuptools/__pycache__/sandbox.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/__pycache__/site-patch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/ssl_=
support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/__pycache__/unicode_utils.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/__pycache__/version.cpython-37.pyc /opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/__pycache__/wheel.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/windo=
ws_support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/_deprecation_warning.py /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/__i=
nit__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/pyparsing.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/_vendor/__pycache__/six.cpython-37.pyc /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/_vendor/packaging/__about__.py /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packa=
ging/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__about__=
.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__init__.c=
python-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_compat.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_structures.cpy=
thon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/_vendor/packaging/__pycache__/markers.cpytho=
n-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/_vendor/packaging/__pycache__/requirements.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/specifiers.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/utils.cpython-3=
7.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/_vendor/packaging/__pycache__/version.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/_vendor/packaging/_compat.py /opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vend=
or/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/markers.py=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/_vendor/packaging/requirements.py /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_v=
endor/packaging/specifiers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/utils.py=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/_vendor/packaging/version.py /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor=
/pyparsing.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/_vendor/six.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/archive_=
util.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/build_meta.py /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/cli-32.exe /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/cli-64.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/cli.exe /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/com=
mand/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/__init__.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/__pycache__/alias.cpython-37.pyc /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/__pycache__/bdist_egg.cpython-37.pyc /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/co=
mmand/__pycache__/bdist_rpm.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pyc=
ache__/bdist_wininst.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/=
build_clib.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/build_ext.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/command/__pycache__/build_py.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/__pycache__/develop.cpython-37.pyc /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/__pycache__/dist_info.cpython-37.pyc /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/co=
mmand/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__=
pycache__/egg_info.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-poky=
sdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/in=
stall.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib/python3.7/site-packages/setuptools/command/__pycache__/install_egg_inf=
o.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/install_lib.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/command/__pycache__/install_scripts.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/__pycache__/py36compat.cpython-37.pyc /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/command/__pycache__/register.cpython-37.pyc /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
command/__pycache__/rotate.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pyca=
che__/saveopts.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/sdist.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/command/__pycache__/setopt.cpython-37.pyc=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/command/__pycache__/test.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/command/__pycache__/upload.cpython-37.pyc /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__=
pycache__/upload_docs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/alias.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/command/bdist_egg.py /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/bdist_rpm.=
py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/bdist_wininst.py /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/b=
uild_clib.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/command/build_ext.py /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/com=
mand/build_py.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/develop.py /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/c=
ommand/dist_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/=
lib/python3.7/site-packages/setuptools/command/easy_install.py /opt/poky/2.=
7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setu=
ptools/command/egg_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-lin=
ux/usr/lib/python3.7/site-packages/setuptools/command/install.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/install_egg_info.py /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/install_lib=
.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/setuptools/command/install_scripts.py '/opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/comma=
nd/launcher manifest.xml' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/command/py36compat.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/register.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools/command/rotate.py /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/command/saveopts.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/command/sdist.py /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/command/setopt.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/command/test.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/upload.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-lin=
ux/usr/lib/python3.7/site-packages/setuptools/command/upload_docs.py /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/config.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/dep_util.py /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/de=
pends.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/dist.py /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/extension.py /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/extern/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools/extern/__pycache__/__init=
__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/setuptools/glibc.py /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/glob.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/gui-32.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/gui-64.exe /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/gui.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/launch.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/lib2to3_ex.py /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/setuptools/monkey.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/msvc.py /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/nam=
espaces.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/package_index.py /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/pep425tag=
s.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/py27compat.py /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/py31compat.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/py33compat.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools/sandbox.py '/opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/script (dev).tmpl' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/script.tmpl /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/si=
te-patch.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/ssl_support.py /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/unicode_ut=
ils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/version.py /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/wheel.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/windows_support.py

and

/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy3_install /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/bin/easy_install-3.7 /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/easy_install.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/pkg_resources/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/pkg_resources/__pycache__/__init__.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/pkg_resources/__pycache__/py31compat.cpython-37.pyc /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__pyc=
ache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/ap=
pdirs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib/python3.7/site-packages/pkg_resources/_vendor/__pycache__/pyparsing.cp=
ython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-37.pyc /=
opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pa=
ckages/pkg_resources/_vendor/appdirs.py /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/packa=
ging/__about__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/pkg_resources/_vendor/packaging/__init__.py /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/pkg_resources/_vendor/packaging/__pycache__/__about__.cpython-37.pyc /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-37.pyc /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/packaging/__pycache__/_compat.cpython-37.pyc /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-37.py=
c /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site=
-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-37.py=
c /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site=
-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/pkg_resources/_vendor/packaging/_compat.py /opt/poky/2.7+sn=
apshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_reso=
urces/_vendor/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/packag=
ing/markers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/pkg_resources/_vendor/packaging/requirements.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/pkg_resources/_vendor/packaging/specifiers.py /opt/poky/2.7+snapshot/sy=
sroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_ve=
ndor/packaging/utils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/=
usr/lib/python3.7/site-packages/pkg_resources/_vendor/packaging/version.py =
/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-p=
ackages/pkg_resources/_vendor/pyparsing.py /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/_vendor/si=
x.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/pkg_resources/extern/__init__.py /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/extern/=
__pycache__/__init__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/pkg_resources/py31compat.py /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/setuptools-41.0.1-py3.7.egg-info/PKG-INFO /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-41.0.1-py=
3.7.egg-info/SOURCES.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux=
/usr/lib/python3.7/site-packages/setuptools-41.0.1-py3.7.egg-info/dependenc=
y_links.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools-41.0.1-py3.7.egg-info/entry_points.txt /opt/=
poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packag=
es/setuptools-41.0.1-py3.7.egg-info/requires.txt /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools-41.0.1-=
py3.7.egg-info/top_level.txt /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools-41.0.1-py3.7.egg-info/zip-s=
afe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/setuptools/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pok=
ysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/__init__.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/__pycache__/_deprecation_warning.cpython-=
37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/__pycache__/archive_util.cpython-37.pyc /opt/poky=
/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/s=
etuptools/__pycache__/build_meta.cpython-37.pyc /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycach=
e__/config.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/__pycache__/dep_util.cpython-3=
7.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/__pycache__/depends.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/__pycache__/dist.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/extensio=
n.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/__pycache__/glibc.cpython-37.pyc /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/__pycache__/glob.cpython-37.pyc /opt/poky/2.7+snapshot/sysroot=
s/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__=
/launch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/__pycache__/lib2to3_ex.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/__pycache__/monkey.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/__pycache__/msvc.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-poky=
sdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/namespaces=
.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/__pycache__/package_index.cpython-37.pyc=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/__pycache__/pep425tags.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/__pycache__/py27compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/py31=
compat.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/us=
r/lib/python3.7/site-packages/setuptools/__pycache__/py33compat.cpython-37.=
pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/setuptools/__pycache__/sandbox.cpython-37.pyc /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/__pycache__/site-patch.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/ssl_=
support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/__pycache__/unicode_utils.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/__pycache__/version.cpython-37.pyc /opt/poky/2.7=
+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setup=
tools/__pycache__/wheel.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/__pycache__/windo=
ws_support.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/_deprecation_warning.py /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/_vendor/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokys=
dk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/__i=
nit__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib/python3.7/site-packages/setuptools/_vendor/__pycache__/pyparsing.cpyth=
on-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/_vendor/__pycache__/six.cpython-37.pyc /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/_vendor/packaging/__about__.py /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packa=
ging/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__about__=
.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/=
python3.7/site-packages/setuptools/_vendor/packaging/__pycache__/__init__.c=
python-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_compat.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/_structures.cpy=
thon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/_vendor/packaging/__pycache__/markers.cpytho=
n-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/_vendor/packaging/__pycache__/requirements.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/specifiers.cpyt=
hon-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/_vendor/packaging/__pycache__/utils.cpython-3=
7.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/=
site-packages/setuptools/_vendor/packaging/__pycache__/version.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/_vendor/packaging/_compat.py /opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vend=
or/packaging/_structures.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/markers.py=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/_vendor/packaging/requirements.py /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_v=
endor/packaging/specifiers.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/_vendor/packaging/utils.py=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/_vendor/packaging/version.py /opt/poky/2.7+snapshot/sys=
roots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/_vendor=
/pyparsing.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/py=
thon3.7/site-packages/setuptools/_vendor/six.py /opt/poky/2.7+snapshot/sysr=
oots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/archive_=
util.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/build_meta.py /opt/poky/2.7+snapshot/sysroots/i6=
86-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/cli-32.exe /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/cli-64.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/cli.exe /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/com=
mand/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/__init__.cpython-37=
.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/command/__pycache__/alias.cpython-37.pyc /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/__pycache__/bdist_egg.cpython-37.pyc /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/co=
mmand/__pycache__/bdist_rpm.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/=
i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pyc=
ache__/bdist_wininst.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/=
build_clib.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/build_ext.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/command/__pycache__/build_py.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/__pycache__/develop.cpython-37.pyc /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/__pycache__/dist_info.cpython-37.pyc /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/co=
mmand/__pycache__/easy_install.cpython-37.pyc /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__=
pycache__/egg_info.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-poky=
sdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/in=
stall.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib/python3.7/site-packages/setuptools/command/__pycache__/install_egg_inf=
o.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/__pycache__/install_lib.cpython=
-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.=
7/site-packages/setuptools/command/__pycache__/install_scripts.cpython-37.p=
yc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/__pycache__/py36compat.cpython-37.pyc /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/command/__pycache__/register.cpython-37.pyc /opt/poky/2.7+snaps=
hot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/=
command/__pycache__/rotate.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i=
686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__pyca=
che__/saveopts.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/command/__pycache__/sdist.=
cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/p=
ython3.7/site-packages/setuptools/command/__pycache__/setopt.cpython-37.pyc=
 /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/command/__pycache__/test.cpython-37.pyc /opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/command/__pycache__/upload.cpython-37.pyc /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/__=
pycache__/upload_docs.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/alias.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/command/bdist_egg.py /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/bdist_rpm.=
py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/sit=
e-packages/setuptools/command/bdist_wininst.py /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/b=
uild_clib.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyt=
hon3.7/site-packages/setuptools/command/build_ext.py /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/com=
mand/build_py.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib=
/python3.7/site-packages/setuptools/command/develop.py /opt/poky/2.7+snapsh=
ot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/c=
ommand/dist_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/=
lib/python3.7/site-packages/setuptools/command/easy_install.py /opt/poky/2.=
7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setu=
ptools/command/egg_info.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-lin=
ux/usr/lib/python3.7/site-packages/setuptools/command/install.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/install_egg_info.py /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/command/install_lib=
.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/si=
te-packages/setuptools/command/install_scripts.py '/opt/poky/2.7+snapshot/s=
ysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/comma=
nd/launcher manifest.xml' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/command/py36compat.py /opt/pok=
y/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/=
setuptools/command/register.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools/command/rotate.py /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/command/saveopts.py /opt/poky/2.7+snapshot/sysroots/i686-pokysd=
k-linux/usr/lib/python3.7/site-packages/setuptools/command/sdist.py /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/command/setopt.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-=
linux/usr/lib/python3.7/site-packages/setuptools/command/test.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/command/upload.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-lin=
ux/usr/lib/python3.7/site-packages/setuptools/command/upload_docs.py /opt/p=
oky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-package=
s/setuptools/config.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/dep_util.py /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/de=
pends.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3=
.7/site-packages/setuptools/dist.py /opt/poky/2.7+snapshot/sysroots/i686-po=
kysdk-linux/usr/lib/python3.7/site-packages/setuptools/extension.py /opt/po=
ky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages=
/setuptools/extern/__init__.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk=
-linux/usr/lib/python3.7/site-packages/setuptools/extern/__pycache__/__init=
__.cpython-37.pyc /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/li=
b/python3.7/site-packages/setuptools/glibc.py /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/glob.py /o=
pt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pac=
kages/setuptools/gui-32.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-li=
nux/usr/lib/python3.7/site-packages/setuptools/gui-64.exe /opt/poky/2.7+sna=
pshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptool=
s/gui.exe /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python=
3.7/site-packages/setuptools/launch.py /opt/poky/2.7+snapshot/sysroots/i686=
-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/lib2to3_ex.py /op=
t/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-pack=
ages/setuptools/monkey.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linu=
x/usr/lib/python3.7/site-packages/setuptools/msvc.py /opt/poky/2.7+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/nam=
espaces.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pytho=
n3.7/site-packages/setuptools/package_index.py /opt/poky/2.7+snapshot/sysro=
ots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/pep425tag=
s.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/s=
ite-packages/setuptools/py27compat.py /opt/poky/2.7+snapshot/sysroots/i686-=
pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/py31compat.py /opt=
/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packa=
ges/setuptools/py33compat.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-l=
inux/usr/lib/python3.7/site-packages/setuptools/sandbox.py '/opt/poky/2.7+s=
napshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setupto=
ols/script (dev).tmpl' /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/u=
sr/lib/python3.7/site-packages/setuptools/script.tmpl /opt/poky/2.7+snapsho=
t/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/si=
te-patch.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/pyth=
on3.7/site-packages/setuptools/ssl_support.py /opt/poky/2.7+snapshot/sysroo=
ts/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/unicode_ut=
ils.py /opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7=
/site-packages/setuptools/version.py /opt/poky/2.7+snapshot/sysroots/i686-p=
okysdk-linux/usr/lib/python3.7/site-packages/setuptools/wheel.py /opt/poky/=
2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/se=
tuptools/windows_support.py

which trips over:

'/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-=
packages/setuptools/script (dev).tmpl'

and results in:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhi=
story-diff", line 139, in <module>
    main()
  File "/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhi=
story-diff", line 132, in main
    out =3D str(chg)
  File "/home/pokybuild/yocto-worker/qemuppc/build/meta/lib/oe/buildhistory=
_analysis.py", line 67, in __str__
    return self._str_internal(True)
  File "/home/pokybuild/yocto-worker/qemuppc/build/meta/lib/oe/buildhistory=
_analysis.py", line 133, in _str_internal
    depvera =3D bb.utils.explode_dep_versions2(self.oldvalue, sort=3DFalse)
  File "/home/pokybuild/yocto-worker/qemuppc/build/bitbake/lib/bb/utils.py"=
, line 231, in explode_dep_versions2
    raise VersionStringException('Invalid version specification in "(%s" - =
invalid or missing operator' % i)

This doesn't block the upgrade but it does need a bug and for us to
figure out some way of improving bb.utils.explode_dep_versions2 to
handle this better.

Cheers,

Richard


