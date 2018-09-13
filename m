Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id A502578493
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:36:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v16-v6so4865024wro.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N76TzuwRa7EFd5sm9Y47c5SpMH8BuHNX3M/7UzsD6So=;
	b=I7lDBF1k5g6mZF3Ucx+xdPnNg3P0hyY26utErxeGY79C+b0ptPUaoXgm9IX5YLuy07
	6xEnPdTg5qaisd9Mwv1M294ZgrtWlyxHfh+ots1PpdIK+Dd0lB6v+avtfXbFEV36z9w1
	AFEh3lkaCWgiIptH4ZGauY9s6oFH9K6vNFZDivR9nQxrLrBjlj7OZumOjDkXy/k4fdLu
	TrkFsVgTzjsjTsEfcLQbE9ndKJCGzQv4iyR/2ziOC6bhR5XZyqb7m5C6peo53Weo84ew
	+QV3CXS4y+vw8qShbhWE1KqPViwMDk3dTr1fwW4dhZLlyf0CyaaLDkn0Em2VSs8xOCZx
	S0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N76TzuwRa7EFd5sm9Y47c5SpMH8BuHNX3M/7UzsD6So=;
	b=Rw5+s5Vb+C5x+rHskQuQ6dlxP7Q5FtoyYyV2GsjarhR/wmumiyIUxn2304XXKyg7cU
	arbTC2japcOIn9uPhWhA3RMgQYlvIqR+94J8nCmgIdbJgSuBEQpJvNl+3ozQp5tRCGFJ
	4i4Hd+/AWk5d2hA6J3tKFiQ657Vitv4/OMEDnsZLkpkQobktU35W1GyFDozL3O9rr5SJ
	bxzaBjCGs0ZEfiu1qbOj2Rf8LPb749K3CroyJPIstP1up7TzlD8POnxczt0GZqIfHZoU
	FFpGudQZlrbuDFnJzKsglqiz9M3Io28Wgo/xRWNV9JV8I2Ev+RDvK29pNoQKWqIXRG/o
	b9JQ==
X-Gm-Message-State: APzg51BZcToSp7nZvIxTAybaNXb8b1oabgI8hWvxFn93ZFeeCu44wgO1
	59KWY2rElgbJNTTs8zvHpynMLjnCCYGGp96nrlM=
X-Google-Smtp-Source: ANB0VdYoT4PSAdpWLXeiTObJUuUb+x+/hJZ6NKz50z5CFvYwgdWB6yq4HhZTJf/aRGi7Lr7vhs48GyIosbl7LfnhHro=
X-Received: by 2002:adf:8567:: with SMTP id
	94-v6mr4903116wrh.223.1536831372282; 
	Thu, 13 Sep 2018 02:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180913092500.1161-1-sno@netbsd.org>
In-Reply-To: <20180913092500.1161-1-sno@netbsd.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Sep 2018 11:36:00 +0200
Message-ID: <CA+chaQeohTQjrrzWdkSEEq5_PYcqxWrtri=2Ty_gJPKuRif8EQ@mail.gmail.com>
To: sno@netbsd.org
Cc: igork@miltenyibiotec.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] coreutils: add alternative target for nice
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
X-List-Received-Date: Thu, 13 Sep 2018 09:36:11 -0000
Content-Type: multipart/alternative; boundary="000000000000064f3d0575bd7063"

--000000000000064f3d0575bd7063
Content-Type: text/plain; charset="UTF-8"

LGTM

On Thu, Sep 13, 2018 at 11:25 AM Jens Rehsack <sno@netbsd.org> wrote:

> Avoid coreutils conflicts with nice from other recipes, like
> busybox - even if that's not enabled by default.
> In situations, where coreutils is a dependency for -dev images
> and small busybox nice is available always, it avoids extra
> effort for coreutils for those users.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-core/coreutils/coreutils_8.30.bb | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb
> b/meta/recipes-core/coreutils/coreutils_8.30.bb
> index 053891f6ea..eb1dd2a93a 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.30.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
> @@ -42,10 +42,10 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>  PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
>  PACKAGECONFIG[single-binary] =
> "--enable-single-binary,--disable-single-binary,,"
>
> -# [ df mktemp base64 gets a special treatment and is not included in this
> +# [ df mktemp nice base64 gets a special treatment and is not included in
> this
>  bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors
> dirname du \
>                  env expand expr factor fmt fold groups head hostid id
> install \
> -                join link logname md5sum mkfifo nice nl nohup nproc od
> paste pathchk \
> +                join link logname md5sum mkfifo nl nohup nproc od paste
> pathchk \
>                  pinky pr printenv printf ptx readlink realpath runcon seq
> sha1sum sha224sum sha256sum \
>                  sha384sum sha512sum shred shuf sort split stdbuf sum tac
> tail tee test timeout\
>                  tr truncate tsort tty unexpand uniq unlink uptime users
> vdir wc who whoami yes"
> @@ -77,7 +77,7 @@ do_install_class-native() {
>  }
>
>  do_install_append() {
> -       for i in df mktemp base64; do mv ${D}${bindir}/$i
> ${D}${bindir}/$i.${BPN}; done
> +       for i in df mktemp nice base64; do mv ${D}${bindir}/$i
> ${D}${bindir}/$i.${BPN}; done
>
>         install -d ${D}${base_bindir}
>         [ "${base_bindir}" != "${bindir}" ] && for i in
> ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN};
> done
> @@ -96,8 +96,8 @@ inherit update-alternatives
>  ALTERNATIVE_PRIORITY = "100"
>  # Make hostname's priority higher than busybox but lower than net-tools
>  ALTERNATIVE_PRIORITY[hostname] = "90"
> -ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs}
> ${sbindir_progs} base64 mktemp df"
> -ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 groups.1 kill.1 uptime.1
> stat.1  hostname.1"
> +ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs}
> ${sbindir_progs} base64 nice mktemp df"
> +ALTERNATIVE_${PN}-doc = "base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1
> uptime.1 stat.1 hostname.1"
>
>  ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
>
> @@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
>  ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
>  ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
>
> +ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
> +ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
> +ALTERNATIVE_LINK_NAME[nice.1] = "${mandir}/man1/nice.1"
> +
>  ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
>  ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
>
> --
> 2.17.1
>
>

--000000000000064f3d0575bd7063
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Thu, Sep 13, 2018 at 11:25 AM Jens Rehsack &lt;<a href=3D"mailto:sno@net=
bsd.org">sno@netbsd.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Avoid coreutils conflicts with nice from other recipes, like<br>
busybox - even if that&#39;s not enabled by default.<br>
In situations, where coreutils is a dependency for -dev images<br>
and small busybox nice is available always, it avoids extra<br>
effort for coreutils for those users.<br>
<br>
Signed-off-by: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" target=3D=
"_blank">sno@netbsd.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a> | 14 +++++++++-----=
<br>
=C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.b=
b" rel=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a> b/meta/recipe=
s-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">coreutils_8.30.bb</a><br>
index 053891f6ea..eb1dd2a93a 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a><br>
@@ -42,10 +42,10 @@ PACKAGECONFIG[acl] =3D &quot;--enable-acl,--disable-acl=
,acl,&quot;<br>
=C2=A0PACKAGECONFIG[xattr] =3D &quot;--enable-xattr,--disable-xattr,attr,&q=
uot;<br>
=C2=A0PACKAGECONFIG[single-binary] =3D &quot;--enable-single-binary,--disab=
le-single-binary,,&quot;<br>
<br>
-# [ df mktemp base64 gets a special treatment and is not included in this<=
br>
+# [ df mktemp nice base64 gets a special treatment and is not included in =
this<br>
=C2=A0bindir_progs =3D &quot;arch basename chcon cksum comm csplit cut dir =
dircolors dirname du \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env expand ex=
pr factor fmt fold groups head hostid id install \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 join link logname =
md5sum mkfifo nice nl nohup nproc od paste pathchk \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 join link logname =
md5sum mkfifo nl nohup nproc od paste pathchk \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinky pr prin=
tenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sha384sum sha=
512sum shred shuf sort split stdbuf sum tac tail tee test timeout\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr truncate t=
sort tty unexpand uniq unlink uptime users vdir wc who whoami yes&quot;<br>
@@ -77,7 +77,7 @@ do_install_class-native() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in df mktemp base64; do mv ${D}${bindir}/=
$i ${D}${bindir}/$i.${BPN}; done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in df mktemp nice base64; do mv ${D}${bin=
dir}/$i ${D}${bindir}/$i.${BPN}; done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${base_bindir}&quot; !=3D &quot;${bindi=
r}&quot; ] &amp;&amp; for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i=
 ${D}${base_bindir}/$i.${BPN}; done<br>
@@ -96,8 +96,8 @@ inherit update-alternatives<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
=C2=A0# Make hostname&#39;s priority higher than busybox but lower than net=
-tools<br>
=C2=A0ALTERNATIVE_PRIORITY[hostname] =3D &quot;90&quot;<br>
-ALTERNATIVE_${PN} =3D &quot;lbracket ${bindir_progs} ${base_bindir_progs} =
${sbindir_progs} base64 mktemp df&quot;<br>
-ALTERNATIVE_${PN}-doc =3D &quot;base64.1 mktemp.1 df.1 groups.1 kill.1 upt=
ime.1 stat.1=C2=A0 hostname.1&quot;<br>
+ALTERNATIVE_${PN} =3D &quot;lbracket ${bindir_progs} ${base_bindir_progs} =
${sbindir_progs} base64 nice mktemp df&quot;<br>
+ALTERNATIVE_${PN}-doc =3D &quot;base64.1 nice.1 mktemp.1 df.1 groups.1 kil=
l.1 uptime.1 stat.1 hostname.1&quot;<br>
<br>
=C2=A0ALTERNATIVE_LINK_NAME[hostname.1] =3D &quot;${mandir}/man1/hostname.1=
&quot;<br>
<br>
@@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] =3D &quot;${base_bindir}/df&=
quot;<br>
=C2=A0ALTERNATIVE_TARGET[df] =3D &quot;${bindir}/df.${BPN}&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[df.1] =3D &quot;${mandir}/man1/df.1&quot;<br>
<br>
+ALTERNATIVE_LINK_NAME[nice] =3D &quot;${base_bindir}/nice&quot;<br>
+ALTERNATIVE_TARGET[nice] =3D &quot;${bindir}/nice.${BPN}&quot;<br>
+ALTERNATIVE_LINK_NAME[nice.1] =3D &quot;${mandir}/man1/nice.1&quot;<br>
+<br>
=C2=A0ALTERNATIVE_LINK_NAME[lbracket] =3D &quot;${bindir}/[&quot;<br>
=C2=A0ALTERNATIVE_TARGET[lbracket] =3D &quot;${bindir}/lbracket.${BPN}&quot=
;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000064f3d0575bd7063--
