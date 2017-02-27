Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3103D6078E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 10:08:52 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id m5so29606453wrm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 02:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ks8upgirFRPOeLULkXmLlV8VKt1aZmbHKanMqBcRWB0=;
	b=RTZDgjqcBS/cfIx8U64C7yj9zOFBRd+RWKzz5kg9Y90ZP6NMD4+kTX3vb5Y6yyt+6b
	sA1HcyubvSCKEnII+j26QqQ7hLKYRGh7gFHELJyv73ENwfdZOCSmxWpngmjJlh692qAG
	g3DmV0RFunNr6RQD01+WFn1SYdO5PJy86077UL6qscQrP86ROHSS3668VAc8Q8C+wFlY
	jCDIN60PcmPRI79pfLBxlhl8Nt0oQ6eak2i2/2qImVD2gl53SLv2qrk4fMO4t1Runqpf
	CTkt4b1zpszj7Um+PnvKU6h2WqPEFJiSFEUJz5HJ59wkybY/IM11ZQ0GU7+2U4S/G/Nm
	DSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ks8upgirFRPOeLULkXmLlV8VKt1aZmbHKanMqBcRWB0=;
	b=d9BQi3ROTouilkgahC9QzVDxxLIqqo+wnhkI8IMOpp7nQJXCWOkCZKZi1Q5XB4I4uR
	dTSE3UopnxImfA0CpeG6n51WG/yipBwkcpXWbp1G3GKx4M3RhJIz7GxlWFu7ak9XqLVG
	lzj9L1Y7igvDr3wM94FPWajyqGmdMgKhi5rg22y34XmpN3JmjQpvC5TRbQBS3IBPpCfM
	YT29GokK8BAAJLqnqyC/zXBLfueMBTREgeZozBeQnF0Hn/7Bkh4djmTtUQpZVJHezQ27
	7OTex6iT1jiclwoG5PmXNxAiFjB0T115Y8CY3DvaFQe3aHoghoJaxPJ18TirOTOGO1bU
	yRag==
X-Gm-Message-State: AMke39k/w46dey1JFr7pCrQeFLDjJc8IjKro+RxIAmXAXpg0bzyyP9LQGMAgPmjLJBh4d3MECxs7nR1wXPpmA/3I
X-Received: by 10.223.147.162 with SMTP id 31mr1467050wrp.133.1488190133716;
	Mon, 27 Feb 2017 02:08:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.31.135 with HTTP; Mon, 27 Feb 2017 02:08:53 -0800 (PST)
In-Reply-To: <1487393989-6667-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1487393989-6667-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Mon, 27 Feb 2017 15:38:53 +0530
Message-ID: <CAD3vsf7MSnLqqetitWmkENMD3fUueZbG=vOtEk1GmG-527P_8Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: fix failure to run python3 in a multilib env or when BASELIB != lib
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
X-List-Received-Date: Mon, 27 Feb 2017 10:08:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c0df184475f5c0549804428

--94eb2c0df184475f5c0549804428
Content-Type: text/plain; charset=UTF-8

Ping.

Could not see the patch included in
https://patchwork.openembedded.org/project/oe/series/?ordering=-last_updated,
do I need to resend it?

Regards,
Jagadeesh

On Sat, Feb 18, 2017 at 10:29 AM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Having hard coded "lib" string in lib_python path, searches for modules
> under /usr/lib/python3.x directory. This would result in an error on
> multilib environment, where BASELIB is other than lib.
>
> Example: On qemux86-64 with base_libdir and libdir as /lib64 and /usr/lib64
> respectively, would result in below error when python3 is executed:
> -- snip --
> root@qemux86-64:~# python3
> Could not find platform independent libraries <prefix>
> Could not find platform dependent libraries <exec_prefix>
> Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> Fatal Python error: Py_Initialize: Unable to get the locale encoding
> ImportError: No module named 'encodings'
>
> Current thread 0x00007f65dbb53700 (most recent call first):
> Aborted
> root@qemux86-64:~#
> -- snip --
>
> Similar issue observed at:
> https://knowledge.windriver.com/en-us/000_Products/000/
> 010/040/040/000_LIN8-4040_%3A_python3_does_not_work_in_a_
> multilib_environment
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  ...remove-hard-coded-lib-string-for-multilib.patch | 37
> ++++++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/
> python3/python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch
>
> diff --git a/meta/recipes-devtools/python/python3/python-3.5.2-
> remove-hard-coded-lib-string-for-multilib.patch b/meta/recipes-devtools/
> python/python3/python-3.5.2-remove-hard-coded-lib-string-
> for-multilib.patch
> new file mode 100644
> index 0000000..786f086
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/python-3.5.2-
> remove-hard-coded-lib-string-for-multilib.patch
> @@ -0,0 +1,37 @@
> +Having hard coded "lib" string in lib_python path, searches for modules
> +under /usr/lib/python3.x directory. This would result in an error on
> +multilib environment, where BASELIB is other than lib.
> +
> +Example: On qemux86-64 with base_libdir and libdir as /lib64 and
> /usr/lib64
> +respectively, would result in below error when python3 is executed:
> +-- snip --
> +root@qemux86-64:~# python3
> +Could not find platform independent libraries <prefix>
> +Could not find platform dependent libraries <exec_prefix>
> +Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> +Fatal Python error: Py_Initialize: Unable to get the locale encoding
> +ImportError: No module named 'encodings'
> +
> +Current thread 0x00007f65dbb53700 (most recent call first):
> +Aborted
> +root@qemux86-64:~#
> +-- snip --
> +
> +Note: LIB is defined with actual base_libdir used via -DLIB during
> +compilation.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> +diff -Naurp Python-3.5.2_org/Modules/getpath.c
> Python-3.5.2/Modules/getpath.c
> +--- Python-3.5.2_org/Modules/getpath.c 2017-02-17 00:58:28.312583182
> +0530
> ++++ Python-3.5.2/Modules/getpath.c     2017-02-17 01:01:58.984805492 +0530
> +@@ -502,7 +502,7 @@ calculate_path(void)
> +     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
> +     _prefix = Py_DecodeLocale(PREFIX, NULL);
> +     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
> +-    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
> ++    lib_python = Py_DecodeLocale(LIB "/python" VERSION, NULL);
> +
> +     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
> +         Py_FatalError(
> diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb
> b/meta/recipes-devtools/python/python3_3.5.2.bb
> index 2ff7c9e..26f49f6 100644
> --- a/meta/recipes-devtools/python/python3_3.5.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.2.bb
> @@ -37,6 +37,7 @@ SRC_URI += "\
>              file://configure.ac-fix-LIBPL.patch \
>              file://python3-fix-CVE-2016-1000110.patch \
>              file://upstream-random-fixes.patch \
> +            file://python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch
> \
>             "
>  SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
>  SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a
> 32324b58b517403a10d1a2aa7cb22bca40"
> --
> 2.7.4
>
>

--94eb2c0df184475f5c0549804428
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Ping.<br><br></div>Could not see the patch =
included in <a href=3D"https://patchwork.openembedded.org/project/oe/series=
/?ordering=3D-last_updated">https://patchwork.openembedded.org/project/oe/s=
eries/?ordering=3D-last_updated</a>, do I need to resend it?<br><br></div>R=
egards,<br></div>Jagadeesh<br></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Sat, Feb 18, 2017 at 10:29 AM, Jagadeesh Krishnanjana=
ppa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" ta=
rget=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Having hard coded &quot;lib&quot; string in lib_py=
thon path, searches for modules<br>
under /usr/lib/python3.x directory. This would result in an error on<br>
multilib environment, where BASELIB is other than lib.<br>
<br>
Example: On qemux86-64 with base_libdir and libdir as /lib64 and /usr/lib64=
<br>
respectively, would result in below error when python3 is executed:<br>
-- snip --<br>
root@qemux86-64:~# python3<br>
Could not find platform independent libraries &lt;prefix&gt;<br>
Could not find platform dependent libraries &lt;exec_prefix&gt;<br>
Consider setting $PYTHONHOME to &lt;prefix&gt;[:&lt;exec_prefix&gt;]<br>
Fatal Python error: Py_Initialize: Unable to get the locale encoding<br>
ImportError: No module named &#39;encodings&#39;<br>
<br>
Current thread 0x00007f65dbb53700 (most recent call first):<br>
Aborted<br>
root@qemux86-64:~#<br>
-- snip --<br>
<br>
Similar issue observed at:<br>
<a href=3D"https://knowledge.windriver.com/en-us/000_Products/000/010/040/0=
40/000_LIN8-4040_%3A_python3_does_not_work_in_a_multilib_environment" rel=
=3D"noreferrer" target=3D"_blank">https://knowledge.windriver.<wbr>com/en-u=
s/000_Products/000/<wbr>010/040/040/000_LIN8-4040_%3A_<wbr>python3_does_not=
_work_in_a_<wbr>multilib_environment</a><br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0...remove-hard-coded-lib-<wbr>string-for-multilib.patch | 37 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>ython3_3.5.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<wbr>python3/python-3=
.5.2-remove-<wbr>hard-coded-lib-string-for-<wbr>multilib.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python3/python-3.5.2-<wbr>re=
move-hard-coded-lib-string-<wbr>for-multilib.patch b/meta/recipes-devtools/=
<wbr>python/python3/python-3.5.2-<wbr>remove-hard-coded-lib-string-<wbr>for=
-multilib.patch<br>
new file mode 100644<br>
index 0000000..786f086<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>python/python3/python-3.5.2-<wbr>remove-ha=
rd-coded-lib-string-<wbr>for-multilib.patch<br>
@@ -0,0 +1,37 @@<br>
+Having hard coded &quot;lib&quot; string in lib_python path, searches for =
modules<br>
+under /usr/lib/python3.x directory. This would result in an error on<br>
+multilib environment, where BASELIB is other than lib.<br>
+<br>
+Example: On qemux86-64 with base_libdir and libdir as /lib64 and /usr/lib6=
4<br>
+respectively, would result in below error when python3 is executed:<br>
+-- snip --<br>
+root@qemux86-64:~# python3<br>
+Could not find platform independent libraries &lt;prefix&gt;<br>
+Could not find platform dependent libraries &lt;exec_prefix&gt;<br>
+Consider setting $PYTHONHOME to &lt;prefix&gt;[:&lt;exec_prefix&gt;]<br>
+Fatal Python error: Py_Initialize: Unable to get the locale encoding<br>
+ImportError: No module named &#39;encodings&#39;<br>
+<br>
+Current thread 0x00007f65dbb53700 (most recent call first):<br>
+Aborted<br>
+root@qemux86-64:~#<br>
+-- snip --<br>
+<br>
+Note: LIB is defined with actual base_libdir used via -DLIB during<br>
+compilation.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanja=
nappa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
+diff -Naurp Python-3.5.2_org/Modules/<wbr>getpath.c Python-3.5.2/Modules/g=
etpath.c<br>
+--- Python-3.5.2_org/Modules/<wbr>getpath.c 2017-02-17 00:58:28.312583182 =
+0530<br>
++++ Python-3.5.2/Modules/getpath.c=C2=A0 =C2=A0 =C2=A02017-02-17 01:01:58.=
984805492 +0530<br>
+@@ -502,7 +502,7 @@ calculate_path(void)<br>
+=C2=A0 =C2=A0 =C2=A0_pythonpath =3D Py_DecodeLocale(PYTHONPATH, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0_prefix =3D Py_DecodeLocale(PREFIX, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0_exec_prefix =3D Py_DecodeLocale(EXEC_PREFIX, NULL);<b=
r>
+-=C2=A0 =C2=A0 lib_python =3D Py_DecodeLocale(&quot;lib/python&quot; VERSI=
ON, NULL);<br>
++=C2=A0 =C2=A0 lib_python =3D Py_DecodeLocale(LIB &quot;/python&quot; VERS=
ION, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0if (!_pythonpath || !_prefix || !_exec_prefix || !lib_=
python) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Py_FatalError(<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3_3.=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.5.2.bb</a> b/meta/re=
cipes-devtools/<wbr>python/<a href=3D"http://python3_3.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3_3.5.2.bb</a><br>
index 2ff7c9e..26f49f6 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-3.5.2-remove-<wbr>=
hard-coded-lib-string-for-<wbr>multilib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>8906efbacfcdc7c3c9198aeefafd15<wbr>9e&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>0010f56100b9b74259ebcd5d4b295a<wbr>=
32324b58b517403a10d1a2aa7cb22b<wbr>ca40&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0df184475f5c0549804428--
