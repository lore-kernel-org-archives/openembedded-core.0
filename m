Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B41AC72F7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:51:20 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id d131so21876100qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4scfnCLyKrpKMwel5PqMiQysReuKhliAIhTGRVk+cSs=;
	b=dggzN5mnFTLJL1wW2dAQ/LUCeHu6uD3nl3kp8Uh1y+a040Y433H5tHz5o17rr30JXF
	pfzEscyQF0emSLI/m4BqQxKqGcJ/9ON2HPuvDIyaLBfq7/kULFYHeuz3kCZ//j55Lbiy
	LTcxfQkZjSK2stLrYqzPsvbP1agjZ0MM5h/CDpHLNfzxIPifxl+fKXJuzLwkWNYeFdhe
	oav2lAd0RFU+ME8guHxEgfDxyc/JcBIVI9JV/KHshfZNV5dR/Y0PoKmhR6TmOZ1WIQLr
	+4K1SrOfZZt3wGUEpJTtAdk544dgQ5+eH07HmhwxWwQyVrJck+CRFEEXVisGMtoyfr6I
	SisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4scfnCLyKrpKMwel5PqMiQysReuKhliAIhTGRVk+cSs=;
	b=Jv2gc8J40t/88IE4gfmn5tR4I+LDYpaseRtjpYyNAW0b5tHVUrDRxGqavChU30vfId
	O7D/Wb8lVuDu+fBzvJjGTdJiqlnUuAVs6IauM9tp+g0XceL5DlckavjT20GDlXRRoCyo
	eaY0WUhiENauh/BGvMVxehgNYQ0aQhjKlhi7xawQ2/nLdevcBgDOEHQzVyiihkauZMF9
	eOwoenWmSkEMPknmQt34uLjoCKxdAF2dxon2Pg0Yuj2OWrBPTT6AFSaxNIkrA/Cjv0ve
	KaKiRusg+uUkfrrn4njhymgPeJEMr2t8tYTTbtCSPm3H7UQGUXuwKfLISwMa4n++vICy
	FAvQ==
X-Gm-Message-State: AN3rC/5AlQq9Dmo3a3fEMHVIYoYorBRbRsdpVeah9N5Vd42xfnSkAZzB53BfovBpSGPgnAW7O+A8A8oj1K+vXw==
X-Received: by 10.55.217.26 with SMTP id u26mr33767456qki.287.1492001481479;
	Wed, 12 Apr 2017 05:51:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 12 Apr 2017 05:51:20 -0700 (PDT)
In-Reply-To: <1491974111-31308-1-git-send-email-li.zhou@windriver.com>
References: <1491974111-31308-1-git-send-email-li.zhou@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Apr 2017 08:51:20 -0400
Message-ID: <CADkTA4MthaNuZHtrrUXn_0OWSCWYCMkFqBiUQswvUgz4-gH8Jg@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Use _sysconfigdata.py to initialize distutils.sysconfig
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
X-List-Received-Date: Wed, 12 Apr 2017 12:51:28 -0000
Content-Type: multipart/alternative; boundary=001a1149a5f04ee3f3054cf7aa01

--001a1149a5f04ee3f3054cf7aa01
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 1:15 AM, Li Zhou <li.zhou@windriver.com> wrote:

> Porting patch from
> <https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4
> b23d934159>
> to use _sysconfigdata.py to initialize distutils.sysconfig.
>


But what does this actually do ?  I'm sure it is obvious to the python
hackers, but to me,
this short log just describes what the patch does, not what problem it
solves and why this
is a good thing.

Bruce


>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  ...-Use-_sysconfigdata.py-to-initialize-dist.patch | 66
> ++++++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/
> python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-
> 21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> b/meta/recipes-devtools/python/python3/0001-Issue-
> 21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> new file mode 100644
> index 0000000..d1c92e9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Issue-
> 21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> @@ -0,0 +1,66 @@
> +From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
> +From: Libin Dang <libin.dang@windriver.com>
> +Date: Tue, 11 Apr 2017 14:12:15 +0800
> +Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
> + distutils.sysconfig
> +
> +Backport upstream commit
> +https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4
> b23d934159
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + Lib/distutils/sysconfig.py | 35 ++++-------------------------------
> + 1 file changed, 4 insertions(+), 31 deletions(-)
> +
> +diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> +index 6d5cfd0..9925d24 100644
> +--- a/Lib/distutils/sysconfig.py
> ++++ b/Lib/distutils/sysconfig.py
> +@@ -424,38 +424,11 @@ _config_vars = None
> +
> + def _init_posix():
> +     """Initialize the module as appropriate for POSIX systems."""
> +-    g = {}
> +-    # load the installed Makefile:
> +-    try:
> +-        filename = get_makefile_filename()
> +-        parse_makefile(filename, g)
> +-    except OSError as msg:
> +-        my_msg = "invalid Python installation: unable to open %s" %
> filename
> +-        if hasattr(msg, "strerror"):
> +-            my_msg = my_msg + " (%s)" % msg.strerror
> +-
> +-        raise DistutilsPlatformError(my_msg)
> +-
> +-    # load the installed pyconfig.h:
> +-    try:
> +-        filename = get_config_h_filename()
> +-        with open(filename) as file:
> +-            parse_config_h(file, g)
> +-    except OSError as msg:
> +-        my_msg = "invalid Python installation: unable to open %s" %
> filename
> +-        if hasattr(msg, "strerror"):
> +-            my_msg = my_msg + " (%s)" % msg.strerror
> +-
> +-        raise DistutilsPlatformError(my_msg)
> +-
> +-    # On AIX, there are wrong paths to the linker scripts in the Makefile
> +-    # -- these paths are relative to the Python source, but when
> installed
> +-    # the scripts are in another directory.
> +-    if python_build:
> +-        g['LDSHARED'] = g['BLDSHARED']
> +-
> ++    # _sysconfigdata is generated at build time, see the sysconfig module
> ++    from _sysconfigdata import build_time_vars
> +     global _config_vars
> +-    _config_vars = g
> ++    _config_vars = {}
> ++    _config_vars.update(build_time_vars)
> +
> +
> + def _init_nt():
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb
> b/meta/recipes-devtools/python/python3_3.5.2.bb
> index ca8dfe3..a413da7 100644
> --- a/meta/recipes-devtools/python/python3_3.5.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.2.bb
> @@ -37,6 +37,7 @@ SRC_URI += "\
>              file://configure.ac-fix-LIBPL.patch \
>              file://python3-fix-CVE-2016-1000110.patch \
>              file://upstream-random-fixes.patch \
> +            file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> \
>             "
>  SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
>  SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a
> 32324b58b517403a10d1a2aa7cb22bca40"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1149a5f04ee3f3054cf7aa01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Apr 12, 2017 at 1:15 AM, Li Zhou <span dir=3D"ltr">&lt;<a href=
=3D"mailto:li.zhou@windriver.com" target=3D"_blank">li.zhou@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Porting patch from<b=
r>
&lt;<a href=3D"https://github.com/python/cpython/commit/409482251b06fe75c4e=
e56e85ffbb4b23d934159" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/python/<wbr>cpython/commit/<wbr>409482251b06fe75c4ee56e85ffbb4<wbr>b23d=
934159</a>&gt;<br>
to use _sysconfigdata.py to initialize distutils.sysconfig.<br></blockquote=
><div><br><br></div><div>But what does this actually do ?=C2=A0 I&#39;m sur=
e it is obvious to the python hackers, but to me, <br></div><div>this short=
 log just describes what the patch does, not what problem it solves and why=
 this<br></div><div>is a good thing.<br><br></div><div>Bruce<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-Use-_sysconfigdata.py-to-<wbr>initialize-dist.patch | 66 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>ython3_3.5.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 67 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<wbr>python3/0001-Iss=
ue-21272-Use-_<wbr>sysconfigdata.py-to-<wbr>initialize-dist.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python3/0001-Issue-<wbr>2127=
2-Use-_sysconfigdata.py-<wbr>to-initialize-dist.patch b/meta/recipes-devtoo=
ls/<wbr>python/python3/0001-Issue-<wbr>21272-Use-_sysconfigdata.py-<wbr>to-=
initialize-dist.patch<br>
new file mode 100644<br>
index 0000000..d1c92e9<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>python/python3/0001-Issue-<wbr>21272-Use-_=
sysconfigdata.py-<wbr>to-initialize-dist.patch<br>
@@ -0,0 +1,66 @@<br>
+From bcddbf40c7f1b80336268cdddacc17<wbr>369fb0ccea Mon Sep 17 00:00:00 200=
1<br>
+From: Libin Dang &lt;<a href=3D"mailto:libin.dang@windriver.com">libin.dan=
g@windriver.com</a>&gt;<br>
+Date: Tue, 11 Apr 2017 14:12:15 +0800<br>
+Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize<br>
+ distutils.sysconfig<br>
+<br>
+Backport upstream commit<br>
+<a href=3D"https://github.com/python/cpython/commit/409482251b06fe75c4ee56=
e85ffbb4b23d934159" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/python/<wbr>cpython/commit/<wbr>409482251b06fe75c4ee56e85ffbb4<wbr>b23d934=
159</a><br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zho=
u@windriver.com</a>&gt;<br>
+---<br>
+ Lib/distutils/sysconfig.py | 35 ++++--------------------------<wbr>-----<=
br>
+ 1 file changed, 4 insertions(+), 31 deletions(-)<br>
+<br>
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py<br>
+index 6d5cfd0..9925d24 100644<br>
+--- a/Lib/distutils/sysconfig.py<br>
++++ b/Lib/distutils/sysconfig.py<br>
+@@ -424,38 +424,11 @@ _config_vars =3D None<br>
+<br>
+ def _init_posix():<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Initialize the module as appropriate=
 for POSIX systems.&quot;&quot;&quot;<br>
+-=C2=A0 =C2=A0 g =3D {}<br>
+-=C2=A0 =C2=A0 # load the installed Makefile:<br>
+-=C2=A0 =C2=A0 try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D get_makefile_filename()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_makefile(filename, g)<br>
+-=C2=A0 =C2=A0 except OSError as msg:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D &quot;invalid Python installation:=
 unable to open %s&quot; % filename<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(msg, &quot;strerror&quot;):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D my_msg + &quot; (%s)=
&quot; % msg.strerror<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DistutilsPlatformError(my_msg)<br>
+-<br>
+-=C2=A0 =C2=A0 # load the installed pyconfig.h:<br>
+-=C2=A0 =C2=A0 try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D get_config_h_filename()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(filename) as file:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_config_h(file, g)<br>
+-=C2=A0 =C2=A0 except OSError as msg:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D &quot;invalid Python installation:=
 unable to open %s&quot; % filename<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasattr(msg, &quot;strerror&quot;):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my_msg =3D my_msg + &quot; (%s)=
&quot; % msg.strerror<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DistutilsPlatformError(my_msg)<br>
+-<br>
+-=C2=A0 =C2=A0 # On AIX, there are wrong paths to the linker scripts in th=
e Makefile<br>
+-=C2=A0 =C2=A0 # -- these paths are relative to the Python source, but whe=
n installed<br>
+-=C2=A0 =C2=A0 # the scripts are in another directory.<br>
+-=C2=A0 =C2=A0 if python_build:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g[&#39;LDSHARED&#39;] =3D g[&#39;BLDSHARED&#3=
9;]<br>
+-<br>
++=C2=A0 =C2=A0 # _sysconfigdata is generated at build time, see the syscon=
fig module<br>
++=C2=A0 =C2=A0 from _sysconfigdata import build_time_vars<br>
+=C2=A0 =C2=A0 =C2=A0global _config_vars<br>
+-=C2=A0 =C2=A0 _config_vars =3D g<br>
++=C2=A0 =C2=A0 _config_vars =3D {}<br>
++=C2=A0 =C2=A0 _config_vars.update(build_<wbr>time_vars)<br>
+<br>
+<br>
+ def _init_nt():<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3_3.=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.5.2.bb</a> b/meta/re=
cipes-devtools/<wbr>python/<a href=3D"http://python3_3.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3_3.5.2.bb</a><br>
index ca8dfe3..a413da7 100644<br>
--- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3_3.5.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.5.2.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3_3.5.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.5.2.bb</a><br>
@@ -37,6 +37,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.ac-fix-LIB=
PL.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://python3-fix-CVE-2016=
-<wbr>1000110.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://upstream-random-fixe=
s.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Issue-21272-Use-_<wb=
r>sysconfigdata.py-to-<wbr>initialize-dist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>8906efbacfcdc7c3c9198aeefafd15<wbr>9e&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>0010f56100b9b74259ebcd5d4b295a<wbr>=
32324b58b517403a10d1a2aa7cb22b<wbr>ca40&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a1149a5f04ee3f3054cf7aa01--
