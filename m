Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 76CA17D3AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 18:59:30 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so17651821eds.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XzI+fdeJ6q9Fv9D+nPs8RgFDXV9x5dYbzqdp1n/LuUg=;
	b=SW/N+1YvS9Jg8DA+Y2w88lPCUKkIqvXU3b3Rlt33+P1LGtbEik3iEGbYAdmmqobgwn
	X/I7xTpAMDnEZAiUNO8G00RFtETqahh+JzdcTM9JqGYT6rU5DlRYY9x9p+1+cXfX4+Yn
	e1WkrDKlKJVtjyNFDFCndWBeS9jsQj266EwYVrdqdW71CY7QxPKwRxaP6ixL9Cs3mbjd
	qS5VXXXewr9CYRcKe6Wd2RbPEVv/O+LakeUfgrx6wlRhh5AGc04XVuVoM3nb9GX1u9SN
	ISY+STm4x3XWmsAA+KqZpLPHC3fqhFL9pUThyIhn/7ymTeQr9LJmTBwLGS7Dt9SOUl2c
	tqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XzI+fdeJ6q9Fv9D+nPs8RgFDXV9x5dYbzqdp1n/LuUg=;
	b=ggxloeLXjRRevFb0znj6LCZE+yEc3DGEmkWamUEsPI7tuZeAGc0fcdztwUfG6XbbEg
	p6l3sC/zTuR3mtOaZRnbBwVJUwsSfx8TFbImU1LQDgVoRsrIuPaq/xcavw3Q3vFsnaYb
	DcXorRUNNy+Z9mkkEPJ87JG7rLu2loyoiWfSefBUDRt/ovj4EnXd6uwrYty7oPKFevps
	DOYxXEkcdAvA+ZIdMJLwKliZlCAroBntHk2oYuaTcfpMgknVLMaA3LsA5hdG96L9roGa
	fU6w7Z93lBE0QC6zcuqBVU01E6q72xf32kQPzNBu0Q899QqqPPGrRXcjxYJscfrZLwJX
	Gx+A==
X-Gm-Message-State: APjAAAUhMpjNtrwaNL3afWT+IsOIq0DbINNkwWDsQ28bshdMU2wV8SOZ
	EpthoQ+BAfXo56rs+SnXcDaRMD0Ysk5DwGDoMb0=
X-Google-Smtp-Source: APXvYqy9sYTcKTivu+VUOx9Rq29eHf3J8hdglEJlFrxT+obv+vwT8sqGt9w/rVwTCfWwH+brbbBSzdEk9Ju6mDun8CE=
X-Received: by 2002:aa7:c554:: with SMTP id s20mr45379393edr.209.1560797971096;
	Mon, 17 Jun 2019 11:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190613000111.11925-1-anuj.mittal@intel.com>
In-Reply-To: <20190613000111.11925-1-anuj.mittal@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Jun 2019 20:59:25 +0200
Message-ID: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serf: cleanup recipe
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
X-List-Received-Date: Mon, 17 Jun 2019 18:59:30 -0000
Content-Type: multipart/alternative; boundary="000000000000a22778058b899899"

--000000000000a22778058b899899
Content-Type: text/plain; charset="UTF-8"

Hello, now serf is failing to build here:


DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are
['TOPDIR/oe-core/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-core/util-linux/util-linux_2.33.2.bb:do_populate_sysroot',
'virtual:native:TOPDIR/oe-core/meta/recipes-devtools/python/python3_3.7.3.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-core/expat/expat_2.2.6.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-support/apr/apr_1.7.0.bb:do_populate_sysroot',
'virtual:native:TOPDIR/oe-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-devtools/gcc/gcc-cross_9.1.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-support/apr/apr-util_1.6.1.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-devtools/python/python3-scons-native_3.0.5.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb:do_populate_sysroot',
'TOPDIR/oe-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
'virtual:native:TOPDIR/oe-core/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb:
do_populate_sysroot']
NOTE: Installed into sysroot: ['pseudo-native']
NOTE: Skipping as already exists in sysroot: ['gcc-runtime', 'util-linux',
'python3-native', 'expat', 'glibc', 'apr', 'gcc-cross-x86_64', 'apr-util',
'python3-scons-native', 'openssl', 'quilt-native',
'icecc-create-env-native', 'linux-libc-headers', 'libgcc',
'bash-completion', 'zlib', 'opkg-utils', 'libxcrypt', 'ncurses',
'gmp-native', 'libmpc-native', 'autoconf-native', 'zlib-native',
'mpfr-native', 'gnu-config-native', 'automake-native', 'libtool-native',
'xz-native', 'binutils-cross-x86_64', 'texinfo-dummy-native',
'flex-native', 'gdbm', 'libtirpc-native', 'sqlite3-native',
'util-linux-native', 'libffi-native', 'gdbm-native', 'bzip2-native',
'pkgconfig-native', 'readline-native', 'openssl-native', 'libnsl2-native',
'm4-native', 'gettext-minimal-native', 'ncurses-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_install
scons: Reading SConscript files ...
PermissionError: [Errno 13] Permission denied: '/usr/lib64':
  File
"TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct",
line 158:
    ENV = os.environ,
  File
"/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Environment.py",
line 965:
    variables.Update(self)
  File
"/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/__init__.py",
line 227:
    option.validator(option.key, env.subst('${%s}'%option.key), env)
  File
"TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct",
line 60:
    return PathVariable.PathIsDirCreate(key, val, env)
  File
"/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/PathVariable.py",
line 101:
    os.makedirs(val)
  File
"TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py",
line 221:
    mkdir(name, mode)
ERROR: scons install execution failed.
WARNING: exit code 1 from a shell command.

Maybe it fails only with multilib enabled, but it wasn't failing before the
cleanup.

Anyone else seeing this?

On Thu, Jun 13, 2019 at 2:01 AM Anuj Mittal <anuj.mittal@intel.com> wrote:

> * Inherit scons bbclass and use the task definitions from there.
> * Remove the DEPENDS on python3-scons-native that is already present in
> scons class.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-support/serf/serf_1.3.9.bb | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-support/serf/serf_1.3.9.bb
> b/meta/recipes-support/serf/serf_1.3.9.bb
> index 706c86be47..92cd5ca061 100644
> --- a/meta/recipes-support/serf/serf_1.3.9.bb
> +++ b/meta/recipes-support/serf/serf_1.3.9.bb
> @@ -14,18 +14,19 @@ SRC_URI[sha256sum] =
> "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>
> -DEPENDS = "python3-scons-native openssl apr apr-util util-linux expat"
> +inherit scons
>
> -do_compile() {
> -       ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} \
> -               CC="${CC}" \
> -               APR=`which apr-1-config` APU=`which apu-1-config` \
> -               CFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" \
> -               OPENSSL="${STAGING_EXECPREFIXDIR}"
> -}
> +DEPENDS += " openssl apr apr-util util-linux expat"
>
> -do_install() {
> -       ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix}
> LIBDIR=${D}${libdir} install
> -}
> +EXTRA_OESCONS = " \
> +                  LIBDIR=${libdir} \
> +                  --install-sandbox=${D} \
> +                  CC="${CC}" \
> +                  CFLAGS="${CFLAGS}" \
> +                  LINKFLAGS="${LDFLAGS}" \
> +                  APR=`which apr-1-config` \
> +                  APU=`which apu-1-config` \
> +                  OPENSSL="${STAGING_EXECPREFIXDIR}" \
> +                  "
>
>  BBCLASSEXTEND = "native"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a22778058b899899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, now serf is failing to build here:<div><br></div><d=
iv><br>DEBUG: Executing python function extend_recipe_sysroot<br>NOTE: Dire=
ct dependencies are [&#39;TOPDIR/oe-core/meta/recipes-devtools/gcc/gcc-runt=
ime_9.1.bb:do_populate_sysroot&#39;, &#39;TOPDIR/oe-core/meta/recipes-core/=
util-linux/util-linux_2.33.2.bb:do_populate_sysroot&#39;, &#39;virtual:nati=
ve:TOPDIR/oe-core/meta/recipes-devtools/python/python3_3.7.3.bb:do_populate=
_sysroot&#39;, &#39;TOPDIR/oe-core/meta/recipes-core/expat/expat_2.2.6.bb:d=
o_populate_sysroot&#39;, &#39;TOPDIR/oe-core/meta/recipes-core/glibc/glibc_=
2.29.bb:do_populate_sysroot&#39;, &#39;TOPDIR/oe-core/meta/recipes-support/=
apr/apr_1.7.0.bb:do_populate_sysroot&#39;, &#39;virtual:native:TOPDIR/oe-co=
re/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot&#39;, &#3=
9;TOPDIR/oe-core/meta/recipes-devtools/gcc/gcc-cross_9.1.bb:do_populate_sys=
root&#39;, &#39;TOPDIR/oe-core/meta/recipes-support/apr/apr-util_1.6.1.bb:d=
o_populate_sysroot&#39;, &#39;TOPDIR/oe-core/meta/recipes-devtools/python/p=
ython3-scons-native_3.0.5.bb:do_populate_sysroot&#39;, &#39;TOPDIR/oe-core/=
meta/recipes-connectivity/openssl/openssl_1.1.1c.bb:do_populate_sysroot&#39=
;, &#39;TOPDIR/oe-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_=
populate_sysroot&#39;, &#39;virtual:native:TOPDIR/oe-core/meta/recipes-devt=
ools/icecc-create-env/icecc-create-env_0.1.bb:do_populate_sysroot&#39;]<br>=
NOTE: Installed into sysroot: [&#39;pseudo-native&#39;]<br>NOTE: Skipping a=
s already exists in sysroot: [&#39;gcc-runtime&#39;, &#39;util-linux&#39;, =
&#39;python3-native&#39;, &#39;expat&#39;, &#39;glibc&#39;, &#39;apr&#39;, =
&#39;gcc-cross-x86_64&#39;, &#39;apr-util&#39;, &#39;python3-scons-native&#=
39;, &#39;openssl&#39;, &#39;quilt-native&#39;, &#39;icecc-create-env-nativ=
e&#39;, &#39;linux-libc-headers&#39;, &#39;libgcc&#39;, &#39;bash-completio=
n&#39;, &#39;zlib&#39;, &#39;opkg-utils&#39;, &#39;libxcrypt&#39;, &#39;ncu=
rses&#39;, &#39;gmp-native&#39;, &#39;libmpc-native&#39;, &#39;autoconf-nat=
ive&#39;, &#39;zlib-native&#39;, &#39;mpfr-native&#39;, &#39;gnu-config-nat=
ive&#39;, &#39;automake-native&#39;, &#39;libtool-native&#39;, &#39;xz-nati=
ve&#39;, &#39;binutils-cross-x86_64&#39;, &#39;texinfo-dummy-native&#39;, &=
#39;flex-native&#39;, &#39;gdbm&#39;, &#39;libtirpc-native&#39;, &#39;sqlit=
e3-native&#39;, &#39;util-linux-native&#39;, &#39;libffi-native&#39;, &#39;=
gdbm-native&#39;, &#39;bzip2-native&#39;, &#39;pkgconfig-native&#39;, &#39;=
readline-native&#39;, &#39;openssl-native&#39;, &#39;libnsl2-native&#39;, &=
#39;m4-native&#39;, &#39;gettext-minimal-native&#39;, &#39;ncurses-native&#=
39;]<br>DEBUG: Python function extend_recipe_sysroot finished<br>DEBUG: Exe=
cuting shell function do_install<br>scons: Reading SConscript files ...<br>=
PermissionError: [Errno 13] Permission denied: &#39;/usr/lib64&#39;:<br>=C2=
=A0 File &quot;TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1=
.3.9/SConstruct&quot;, line 158:<br>=C2=A0 =C2=A0 ENV =3D os.environ,<br>=
=C2=A0 File &quot;/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/re=
cipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Env=
ironment.py&quot;, line 965:<br>=C2=A0 =C2=A0 variables.Update(self)<br>=C2=
=A0 File &quot;/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recip=
e-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variab=
les/__init__.py&quot;, line 227:<br>=C2=A0 =C2=A0 option.validator(option.k=
ey, env.subst(&#39;${%s}&#39;%option.key), env)<br>=C2=A0 File &quot;TOPDIR=
/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct&quot;=
, line 60:<br>=C2=A0 =C2=A0 return PathVariable.PathIsDirCreate(key, val, e=
nv)<br>=C2=A0 File &quot;/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.=
9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SC=
ons/Variables/PathVariable.py&quot;, line 101:<br>=C2=A0 =C2=A0 os.makedirs=
(val)<br>=C2=A0 File &quot;TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3=
.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py&quot;, line 221:<br>=C2=
=A0 =C2=A0 mkdir(name, mode)<br>ERROR: scons install execution failed.<br>W=
ARNING: exit code 1 from a shell command.<br></div><div><br></div><div>Mayb=
e it fails only with multilib enabled, but it wasn&#39;t failing before the=
 cleanup.</div><div><br></div><div>Anyone else seeing this?</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
n 13, 2019 at 2:01 AM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.c=
om">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">* Inherit scons bbclass and use the task definitio=
ns from there.<br>
* Remove the DEPENDS on python3-scons-native that is already present in<br>
scons class.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">serf_1.3.9.bb</a> | 23 ++++++++++++-----------<b=
r>
=C2=A01 file changed, 12 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a> b/meta/recipes-support/=
serf/<a href=3D"http://serf_1.3.9.bb" rel=3D"noreferrer" target=3D"_blank">=
serf_1.3.9.bb</a><br>
index 706c86be47..92cd5ca061 100644<br>
--- a/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">serf_1.3.9.bb</a><br>
+++ b/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">serf_1.3.9.bb</a><br>
@@ -14,18 +14,19 @@ SRC_URI[sha256sum] =3D &quot;549c2d21c577a8a9c0450facb5=
cca809f26591f048e466552240947bdf<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D86d3f3a95c324c9479bd8=
986968f4327&quot;<br>
<br>
-DEPENDS =3D &quot;python3-scons-native openssl apr apr-util util-linux exp=
at&quot;<br>
+inherit scons<br>
<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE}=
 PREFIX=3D${prefix} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;${CC}&qu=
ot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APR=3D`which apr-1-=
config` APU=3D`which apu-1-config` \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CF=
LAGS}&quot; LINKFLAGS=3D&quot;${LDFLAGS}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL=3D&quot;${S=
TAGING_EXECPREFIXDIR}&quot;<br>
-}<br>
+DEPENDS +=3D &quot; openssl apr apr-util util-linux expat&quot;<br>
<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons PREFIX=3D${D}${p=
refix} LIBDIR=3D${D}${libdir} install<br>
-}<br>
+EXTRA_OESCONS =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBDIR=3D${=
libdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --install-s=
andbox=3D${D} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;=
${CC}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&q=
uot;${CFLAGS}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LINKFLAGS=
=3D&quot;${LDFLAGS}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR=3D`whic=
h apr-1-config` \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APU=3D`whic=
h apu-1-config` \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL=3D&=
quot;${STAGING_EXECPREFIXDIR}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a22778058b899899--
