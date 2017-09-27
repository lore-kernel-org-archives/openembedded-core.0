Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id A7E5977809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 10:52:22 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id y138so6562467itc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SmnvkuTlrMmoZTWUCpOtUgS5QJidTyCAsq4VNPJ7yuk=;
	b=1TUXdU9iLxHxgxntv1LnMa+o915iBZ0ri3qITtjK5fmWkV/8E1HQlZDxar9+6m1Rti
	SYm07BfpF3BGNIFlJ2H6Ut1jczci2QWIPHmlYnhoIqCOMhPNT/NBnuKr/JAV6Wgn4lg7
	IxgsrdJrpTDQ3qwcoTCdN6gW28hDfLiChG7OdGTCeikgCYuqs746b0wXKzhmQ2KnMj43
	w9ucJOP8Gt9c30sjoopcaxTNIEA/KTjtFEq6al1/8L7xH3ewUgB1jIRrWb6eW2ejGiim
	g0Le5QxGTNpxbotURreQZBN502x0ab8GKDWrEVrXsvJXx+VJ1OizPYNp6g1XwM6sokJB
	P6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SmnvkuTlrMmoZTWUCpOtUgS5QJidTyCAsq4VNPJ7yuk=;
	b=LKwuJR9hr5FJEwTswxoNUJFECxmdn/Vaf+WQL8ZzYc11qMDTJdNo/RMsFhQPnKDXiB
	J7osQ9iAA1sAzkYjr83t9ljNmfU/hcV+qOVi/wHC0x/kGA4g/0uEahEEOuQZIP1/vEHX
	hWgYnOBWQAmnd5Wikya1raNL8zzNnI3LK6TPSFmDXMlkr0U464dsCgS/64jlcct+BTYO
	lHbF8kZzx4eE1gBRcooxliI7zM2pkdl1gZPQTBsuB4LjIIvmE4G9S3mopoDiTGZj4hez
	uekTklI6Z2PDn8O/rKZOc8rTpuT+afMid+zCvTts2EC+Ykg1rFjIgvSwFhC3Zaioi2wh
	Afzw==
X-Gm-Message-State: AHPjjUjInwh/yGEiJZ29BSrt47Rkx6OdD8z6KzhKWmXyyrQHO5fvfOx8
	pPUn5z3EFcftfMNdjwDTA3wO+EPZMasU2UeXzwFRsw==
X-Google-Smtp-Source: AOwi7QCntVcMpJiAqXrE5vT1GKBZ9Cf61YnWgFdX88aPLgk6DTxYiKWpRvHnBlNG6BVHMRHv/i6ZEVcD4eM+08pIlgk=
X-Received: by 10.36.181.73 with SMTP id j9mr1721929iti.6.1506509543484; Wed,
	27 Sep 2017 03:52:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 03:52:02 -0700 (PDT)
In-Reply-To: <1506486302-25510-1-git-send-email-zhixiong.chi@windriver.com>
References: <1506486302-25510-1-git-send-email-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 11:52:02 +0100
Message-ID: <CAJTo0LZyfDJjuWrB1rD=XuGS1OWS68r4Hmj_2LwhPkeLvu6FCw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libarchive: CVE-2017-14502
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
X-List-Received-Date: Wed, 27 Sep 2017 10:52:22 -0000
Content-Type: multipart/alternative; boundary="f403045d9e4230c77f055a299638"

--f403045d9e4230c77f055a299638
Content-Type: text/plain; charset="UTF-8"

This doesn't apply to master, can you rebase.

Ross

On 27 September 2017 at 05:25, Zhixiong Chi <zhixiong.chi@windriver.com>
wrote:

> read_header in archive_read_support_format_rar.c suffers from an
> off-by-one error for UTF-16 names in RAR archives, leading to an
> out-of-bounds read in archive_read_format_rar_read_header.
> Backport the patch from
> https://github.com/libarchive/libarchive/commit
> commit 5562545b5562f6d12a4ef991fae158bf4ccf92b6
>
> CVE: CVE-2017-14502
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../libarchive/libarchive/CVE-2017-14502.patch     | 35
> ++++++++++++++++++++++
>  .../libarchive/libarchive_3.3.2.bb                 |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-
> 2017-14502.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
> b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
> new file mode 100644
> index 0000000..442c671
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
> @@ -0,0 +1,35 @@
> +From 5562545b5562f6d12a4ef991fae158bf4ccf92b6 Mon Sep 17 00:00:00 2001
> +From: Joerg Sonnenberger <joerg@bec.de>
> +Date: Sat, 9 Sep 2017 17:47:32 +0200
> +Subject: [PATCH] Avoid a read off-by-one error for UTF16 names in RAR
> + archives.
> +
> +Reported-By: OSS-Fuzz issue 573
> +
> +CVE: CVE-2017-14502
> +
> +Upstream-Status: Backport
> +---
> + libarchive/archive_read_support_format_rar.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/libarchive/archive_read_support_format_rar.c
> b/libarchive/archive_read_support_format_rar.c
> +index cbb14c3..751de69 100644
> +--- a/libarchive/archive_read_support_format_rar.c
> ++++ b/libarchive/archive_read_support_format_rar.c
> +@@ -1496,7 +1496,11 @@ read_header(struct archive_read *a, struct
> archive_entry *entry,
> +         return (ARCHIVE_FATAL);
> +       }
> +       filename[filename_size++] = '\0';
> +-      filename[filename_size++] = '\0';
> ++      /*
> ++       * Do not increment filename_size here as the computations below
> ++       * add the space for the terminating NUL explicitly.
> ++       */
> ++      filename[filename_size] = '\0';
> +
> +       /* Decoded unicode form is UTF-16BE, so we have to update a string
> +        * conversion object for it. */
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
> b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
> index 5c3895e..0196eb3 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
> @@ -32,6 +32,7 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
>  EXTRA_OECONF += "--enable-largefile"
>
>  SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
> +           file://CVE-2017-14502.patch \
>            "
>
>  SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d9e4230c77f055a299638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t apply to master, can you rebase.<div><br>=
</div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 27 September 2017 at 05:25, Zhixiong Chi <span dir=3D"ltr">&lt=
;<a href=3D"mailto:zhixiong.chi@windriver.com" target=3D"_blank">zhixiong.c=
hi@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">re=
ad_header in archive_read_support_format_<wbr>rar.c suffers from an<br>
off-by-one error for UTF-16 names in RAR archives, leading to an<br>
out-of-bounds read in archive_read_format_rar_read_<wbr>header.<br>
Backport the patch from<br>
<a href=3D"https://github.com/libarchive/libarchive/commit" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/libarchive/<wbr>libarchive/commit<=
/a><br>
commit 5562545b5562f6d12a4ef991fae158<wbr>bf4ccf92b6<br>
<br>
CVE: CVE-2017-14502<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libarchive/libarchive/CVE-<wbr>2017-14502.patch=C2=A0 =C2=A0 =C2=
=A0| 35 ++++++++++++++++++++++<br>
=C2=A0.../libarchive/<a href=3D"http://libarchive_3.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libarchive_3.3.<wbr>2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>libarchive/libarchive/C=
VE-<wbr>2017-14502.patch<br>
<br>
diff --git a/meta/recipes-extended/<wbr>libarchive/libarchive/CVE-<wbr>2017=
-14502.patch b/meta/recipes-extended/<wbr>libarchive/libarchive/CVE-<wbr>20=
17-14502.patch<br>
new file mode 100644<br>
index 0000000..442c671<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>libarchive/libarchive/CVE-<wbr>2017-14502.=
patch<br>
@@ -0,0 +1,35 @@<br>
+From 5562545b5562f6d12a4ef991fae158<wbr>bf4ccf92b6 Mon Sep 17 00:00:00 200=
1<br>
+From: Joerg Sonnenberger &lt;<a href=3D"mailto:joerg@bec.de">joerg@bec.de<=
/a>&gt;<br>
+Date: Sat, 9 Sep 2017 17:47:32 +0200<br>
+Subject: [PATCH] Avoid a read off-by-one error for UTF16 names in RAR<br>
+ archives.<br>
+<br>
+Reported-By: OSS-Fuzz issue 573<br>
+<br>
+CVE: CVE-2017-14502<br>
+<br>
+Upstream-Status: Backport<br>
+---<br>
+ libarchive/archive_read_<wbr>support_format_rar.c | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/libarchive/archive_read_<wbr>support_format_rar.c b/libarchiv=
e/archive_read_<wbr>support_format_rar.c<br>
+index cbb14c3..751de69 100644<br>
+--- a/libarchive/archive_read_<wbr>support_format_rar.c<br>
++++ b/libarchive/archive_read_<wbr>support_format_rar.c<br>
+@@ -1496,7 +1496,11 @@ read_header(struct archive_read *a, struct archive_=
entry *entry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (ARCHIVE_FATAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0filename[filename_size++] =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 =C2=A0 filename[filename_size++] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Do not increment filename_size here as the c=
omputations below<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* add the space for the terminating NUL explic=
itly.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 filename[filename_size] =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Decoded unicode form is UTF-16BE, so we have=
 to update a string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * conversion object for it. */<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>libarchive/<a href=3D"http://libarc=
hive_3.3.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.3.2.bb</a>=
 b/meta/recipes-extended/<wbr>libarchive/<a href=3D"http://libarchive_3.3.2=
.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.3.2.bb</a><br>
index 5c3895e..0196eb3 100644<br>
--- a/meta/recipes-extended/<wbr>libarchive/<a href=3D"http://libarchive_3.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.3.2.bb</a><br>
+++ b/meta/recipes-extended/<wbr>libarchive/<a href=3D"http://libarchive_3.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.3.2.bb</a><br>
@@ -32,6 +32,7 @@ PACKAGECONFIG[lz4] =3D &quot;--with-lz4,--without-lz4,lz4=
,<wbr>&quot;<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-largefile&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://libarchive.org/downloads/libarchi=
ve-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://libarchive.org=
/<wbr>downloads/libarchive-${PV}.<wbr>tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-14502.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>4583bd6b2ebf7e0e8963d90879eb1b<wbr>27&=
quot;<br>
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
</font></span></blockquote></div><br></div>

--f403045d9e4230c77f055a299638--
