Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC4D71B19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:13:27 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id p9so1662246vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CQJV96ZWWUDptq9+dtfusZqSZxft9wGFHYGOtssz008=;
	b=bFTixPQ/O7J6qUEUuTb9UR7kmpS/hYvWTKhsZOhP7HV1eAK+AdEKdviYWViLwIZNuz
	gSbj6FfPUi819tq06K4YzNMuq09/DZq9GxCMffTQ0IV8bP5/uyGHP6Fi51j6rHau3ytl
	Pmq95QPPaOwLliDZLCTEFumT22qqXRyY/fsA5hDEsblR0DD4wJ9TJLmskHf9i2O55SrZ
	0N41o9bomuKNwlePqUuOc2EfCsPqI0PIo6zngYsEAciXuPVyZrZHhGPWURGpTQ3kAB4n
	sRbfqaZGWyoNjc3WMjwZlrBftVb3EuU1VzxI+pnhmmKW0LObr+mjBAnDUULVZJTNmlgI
	u2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CQJV96ZWWUDptq9+dtfusZqSZxft9wGFHYGOtssz008=;
	b=jAGyEXuVSZ8aU5rSkKZz3eE0ZvpaYLYkFJfx+H0YnPstfSfSMd/fsY36sEQAsvM9zi
	/qaFmuBeFgpW8oEIPy+WtUEZwcBonclCR4Tpw/QQFwp1zGM0iICD3pKTJ74Diq9g1bYk
	5Is/suIMc2IJV6VBRIxx4dO2vNwO4LjvGljRNPaeUR38Fpz56LG/QsG7RWA6jmH2yh1u
	CxqRy10Ho62dKI1FOZPrZokI3iCin0c1KR+7o74jMQvegVSrjH2FnGcrN8k5X4GZhxqj
	KXNc3rdUjKZKQsGkrU4KK1o2KbmyD0IbtCMUsCIvSHTAsnQ22PEpDRYFQ8/24P9TC1hy
	fG1A==
X-Gm-Message-State: ABUngvdMLN5XWjSxX9m2j+XnmoawkMP31MmIrsjU9CChoWWGqF+A1qhcslq5CaAld2apT+UC7w+aOZH39dLcEg==
X-Received: by 10.31.138.143 with SMTP id m137mr29299714vkd.148.1478027608897; 
	Tue, 01 Nov 2016 12:13:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 1 Nov 2016 12:13:28 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Tue, 1 Nov 2016 12:13:28 -0700 (PDT)
In-Reply-To: <20161101030102.11272-1-jackie.huang@windriver.com>
References: <20161101030102.11272-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Nov 2016 12:13:28 -0700
Message-ID: <CAMKF1sqGF89LxxBQOUR_Sc0FXCHsMqfTZxP6O8yE8h7+JQp-rA@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pax : strip off the trailing slash of file name
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
X-List-Received-Date: Tue, 01 Nov 2016 19:13:28 -0000
Content-Type: multipart/alternative; boundary=001a114381de98bfbe0540421e56

--001a114381de98bfbe0540421e56
Content-Type: text/plain; charset=UTF-8

This should be submitted upstream for further review. I believe this could
be covered by a cmdline option

On Oct 31, 2016 8:11 PM, <jackie.huang@windriver.com> wrote:

> From: Zhang Xiao <xiao.zhang@windriver.com>
>
> When extracting packaes, the trailing slash of the file name
> has no means but may cause some issue on system call lstat.
> Remove it.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../pax-strip-off-file-name-s-trailing-slash.patch | 48
> ++++++++++++++++++++++
>  meta/recipes-extended/pax/pax_3.4.bb               |  4 +-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/pax/pax/
> pax-strip-off-file-name-s-trailing-slash.patch
>
> diff --git a/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-slash.patch
> b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-
> trailing-slash.patch
> new file mode 100644
> index 0000000..9e0a335
> --- /dev/null
> +++ b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-
> trailing-slash.patch
> @@ -0,0 +1,48 @@
> +From aa8ba118869b75a2a9cd681b2f0362d9d8f1c7ec Mon Sep 17 00:00:00 2001
> +From: Zhang Xiao <xiao.zhang@windriver.com>
> +Date: Tue, 12 Jul 2016 11:34:45 +0800
> +Subject: [PATCH] pax: strip off the trailing slash of file name
> +
> +When extracting packaes, the trailing slash of the file name
> +has no means but may cause some issue on system call lstat.
> +Remove it.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> +---
> + src/pat_rep.c | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/pat_rep.c b/src/pat_rep.c
> +index b9a4636..4cbf6bf 100644
> +--- a/src/pat_rep.c
> ++++ b/src/pat_rep.c
> +@@ -605,7 +605,7 @@ int
> + mod_name(ARCHD *arcn)
> + {
> +       int res = 0;
> +-
> ++      char *pt;
> +       /*
> +        * Strip off leading '/' if appropriate.
> +        * Currently, this option is only set for the tar format.
> +@@ -639,6 +639,15 @@ mod_name(ARCHD *arcn)
> +       }
> +
> +       /*
> ++       * strip off trailing slash.
> ++       */
> ++      pt = &(arcn->name[strlen(arcn->name) - 1]);
> ++      if (*pt == '/') {
> ++               *pt = '\0';
> ++              arcn->nlen = strlen(arcn->name);
> ++      }
> ++
> ++      /*
> +        * IMPORTANT: We have a problem. what do we do with symlinks?
> +        * Modifying a hard link name makes sense, as we know the file it
> +        * points at should have been seen already in the archive (and if
> it
> +--
> +1.8.5.2.233.g932f7e4
> +
> diff --git a/meta/recipes-extended/pax/pax_3.4.bb
> b/meta/recipes-extended/pax/pax_3.4.bb
> index 9d1abfb..7ce43ce 100644
> --- a/meta/recipes-extended/pax/pax_3.4.bb
> +++ b/meta/recipes-extended/pax/pax_3.4.bb
> @@ -16,7 +16,9 @@ DEPENDS_append_libc-musl = " fts "
>
>  SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz2/
> fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
>         file://fix_for_compile_with_gcc-4.6.0.patch \
> -       file://pax-3.4_fix_for_x32.patch"
> +       file://pax-3.4_fix_for_x32.patch \
> +       file://pax-strip-off-file-name-s-trailing-slash.patch \
> +"
>
>  SRC_URI_append_libc-musl = " file://0001-Fix-build-with-musl.patch \
>                               file://0001-use-strtoll-instead-of-strtoq.patch
> \
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114381de98bfbe0540421e56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This should be submitted upstream for further review. I beli=
eve this could be covered by a cmdline option</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 31, 2016 8=
:11 PM,  &lt;<a href=3D"mailto:jackie.huang@windriver.com">jackie.huang@win=
driver.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">From: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">xiao=
.zhang@windriver.com</a>&gt;<br>
<br>
When extracting packaes, the trailing slash of the file name<br>
has no means but may cause some issue on system call lstat.<br>
Remove it.<br>
<br>
Signed-off-by: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">x=
iao.zhang@windriver.com</a>&gt;<br>
Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.co=
m">jackie.huang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../pax-strip-off-file-name-s-<wbr>trailing-slash.patch | 48 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-extended/pax/<a href=3D"http://pax_3.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">pax_<wbr>3.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A02 files changed, 51 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/pax/pax/<wbr>pax-strip-off-f=
ile-name-s-<wbr>trailing-slash.patch<br>
<br>
diff --git a/meta/recipes-extended/pax/<wbr>pax/pax-strip-off-file-name-s-<=
wbr>trailing-slash.patch b/meta/recipes-extended/pax/<wbr>pax/pax-strip-off=
-file-name-s-<wbr>trailing-slash.patch<br>
new file mode 100644<br>
index 0000000..9e0a335<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/pax/<wbr>pax/pax-strip-off-file-name-s-<wbr>tra=
iling-slash.patch<br>
@@ -0,0 +1,48 @@<br>
+From aa8ba118869b75a2a9cd681b2f0362<wbr>d9d8f1c7ec Mon Sep 17 00:00:00 200=
1<br>
+From: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">xiao.zhan=
g@windriver.com</a>&gt;<br>
+Date: Tue, 12 Jul 2016 11:34:45 +0800<br>
+Subject: [PATCH] pax: strip off the trailing slash of file name<br>
+<br>
+When extracting packaes, the trailing slash of the file name<br>
+has no means but may cause some issue on system call lstat.<br>
+Remove it.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">=
xiao.zhang@windriver.com</a>&gt;<br>
+---<br>
+ src/pat_rep.c | 11 ++++++++++-<br>
+ 1 file changed, 10 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/pat_rep.c b/src/pat_rep.c<br>
+index b9a4636..4cbf6bf 100644<br>
+--- a/src/pat_rep.c<br>
++++ b/src/pat_rep.c<br>
+@@ -605,7 +605,7 @@ int<br>
+ mod_name(ARCHD *arcn)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int res =3D 0;<br>
+-<br>
++=C2=A0 =C2=A0 =C2=A0 char *pt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Strip off leading &#39;/&#39; if appropriate=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Currently, this option is only set for the t=
ar format.<br>
+@@ -639,6 +639,15 @@ mod_name(ARCHD *arcn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* strip off trailing slash.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 pt =3D &amp;(arcn-&gt;name[strlen(arcn-&gt;<wbr>name=
) - 1]);<br>
++=C2=A0 =C2=A0 =C2=A0 if (*pt =3D=3D &#39;/&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*pt =3D &#39;\0&#3=
9;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arcn-&gt;nlen =3D strlen=
(arcn-&gt;name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * IMPORTANT: We have a problem. what do we do =
with symlinks?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Modifying a hard link name makes sense, as w=
e know the file it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * points at should have been seen already in t=
he archive (and if it<br>
+--<br>
+1.8.5.2.233.g932f7e4<br>
+<br>
diff --git a/meta/recipes-extended/pax/<a href=3D"http://pax_3.4.bb" rel=3D=
"noreferrer" target=3D"_blank">pa<wbr>x_3.4.bb</a> b/meta/recipes-extended/=
pax/<a href=3D"http://pax_3.4.bb" rel=3D"noreferrer" target=3D"_blank">pa<w=
br>x_3.4.bb</a><br>
index 9d1abfb..7ce43ce 100644<br>
--- a/meta/recipes-extended/pax/<a href=3D"http://pax_3.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">pa<wbr>x_3.4.bb</a><br>
+++ b/meta/recipes-extended/pax/<a href=3D"http://pax_3.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">pa<wbr>x_3.4.bb</a><br>
@@ -16,7 +16,9 @@ DEPENDS_append_libc-musl =3D &quot; fts &quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://pkgs.fedoraproject.org/repo/pkgs/=
${BPN}/${BP}.tar.bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2" rel=3D=
"noreferrer" target=3D"_blank">http://pkgs.fedoraproject.<wbr>org/repo/pkgs=
/${BPN}/${BP}.<wbr>tar.bz2/<wbr>fbd9023b590b45ac3ade95870702a0<wbr>d6/${BP}=
.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_for_compile_with_<wbr>gcc-4.6.0.patc=
h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://pax-3.4_fix_for_x32.<wbr>patch&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://pax-3.4_fix_for_x32.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://pax-strip-off-file-<wbr>name-s-trailing-=
slash.patch \<br>
+&quot;<br>
<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0001-Fix-build-with-<wbr>m=
usl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-use-strtoll-<wbr>instead-of-str=
toq.patch \<br>
--<br>
2.8.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--001a114381de98bfbe0540421e56--
