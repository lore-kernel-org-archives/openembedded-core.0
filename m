Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.6491.1615890678378372477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 03:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YsUGZW39;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id p24so17880615vsj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rSO8YKehZMIdZgXdDuTRRhoMzTlNUjfRz/BvyLcuIG4=;
        b=YsUGZW39g7djRCu9/UA/K3kdVZ+cY6VK3nWT9g1vUR2TvMVLWNaGQcK9T1Jc7i2p1T
         UhGNBvFA1KxqiUYBxUQi/lJ5JI3QGsdDhusIWHbsfdQliQ6ZHxD7RtmVF06mpjw4oGNV
         bOhKip99PHv8rYnPaMBSq1LpFO2Ufv/KfcnV5AHYV9/ogY957NJUmbsfAo4g70FKH4F5
         fHCa8G7psMNqtriUoJ83nnG++QKzthSMeuxI2sk3NFt8heR7AAuoqc19yvpk4+8UmNoE
         p2AroP8WSJoAbGaamUUlXNrx5SrxPpV4e+KefBAwF/eQ26tix+6H2SPg+m31/V7UzZg5
         7+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rSO8YKehZMIdZgXdDuTRRhoMzTlNUjfRz/BvyLcuIG4=;
        b=LEyM88tGYMajwfqR+fTffANLFo4OQVs3PwEwFI7iFoxqB9FcqMWGngS3H2OosRQfSD
         8Xt2JTvRZgZRqfyo0MsFQcS3CrhGbTJbY658iAk0QFXCmeU+qKkOH/SwKlgl8pBBB8KC
         cQQB2r4TtwFGXlUuB0TKCEpub8RC80mrGSCt3f/xdaXIZ79QTxqwZVG5zTaGoZnvSN9d
         C3tmuNMrGlNFAxXlrVKbXL3gua5rU4n5fqOPAuu9ggEjIsKSlDhraSh45sYBiQbmlF80
         jqeKy+0vPgcdTSa6gJga9hBuTdi7uT3R5QNGr1T73+ZyUgaAeEAhBAlXVvpZxRlsdZjk
         EOJA==
X-Gm-Message-State: AOAM531xhBwUmi3B22TyqcNW043GkzF0KSErtrUFlH2MA9Q+RG3pk29T
	1tXK5AZEJaIh9hAv5EuF95kLBTRFpqPJ+1YTnzw=
X-Google-Smtp-Source: ABdhPJzAWcC9LJK4/NG3jkv9tN+TRK1opqXnWBWrTOUj/yIO7uUQZhmJqBSWy2HiykkmIenB/eC4T+yHRS1G3mXF9UM=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr7013810vsn.51.1615890677524;
 Tue, 16 Mar 2021 03:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <1615889439-19781-1-git-send-email-wangmy@cn.fujitsu.com> <1615889439-19781-2-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615889439-19781-2-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 16 Mar 2021 11:31:06 +0100
Message-ID: <CANNYZj8ZWh8bJFWDkyVPQfstrCsbLnYGSVr12jSLdZeXnAbZXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-headers: upgrade 1.2.162.0 -> 1.2.170.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d46cb605bda4dd2f"

--000000000000d46cb605bda4dd2f
Content-Type: text/plain; charset="UTF-8"

This needs to be updated in tandem with vulkan-loader and vulkan-tools.

Alex

On Tue, 16 Mar 2021 at 11:11, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...{vulkan-headers_1.2.162.0.bb => vulkan-headers_1.2.170.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.162.0.bb =>
> vulkan-headers_1.2.170.0.bb} (93%)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
> b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
> index 19ae67cdd4..4c9c94f3d2 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
> @@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master
> "
>
> -SRCREV = "87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209"
> +SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> 
>
>

--000000000000d46cb605bda4dd2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This needs to be updated in tandem with vulkan-loader=
 and vulkan-tools.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 16 Mar 20=
21 at 11:11, Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangm=
y@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.=
fujitsu.com" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://vulkan-headers_1.2.162.0.bb" rel=3D"noreferrer=
" target=3D"_blank">vulkan-headers_1.2.162.0.bb</a> =3D&gt; <a href=3D"http=
://vulkan-headers_1.2.170.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan=
-headers_1.2.170.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/vulkan/{<a href=3D"http://vulkan-header=
s_1.2.162.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.162=
.0.bb</a> =3D&gt; <a href=3D"http://vulkan-headers_1.2.170.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">vulkan-headers_1.2.170.0.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers=
_1.2.162.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.162.=
0.bb</a> b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_1.=
2.170.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.170.0.b=
b</a><br>
similarity index 93%<br>
rename from meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_=
1.2.162.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.162.0=
.bb</a><br>
rename to meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_1.=
2.170.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.170.0.b=
b</a><br>
index 19ae67cdd4..4c9c94f3d2 100644<br>
--- a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_1.2.16=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.162.0.bb</a=
><br>
+++ b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_1.2.17=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.170.0.bb</a=
><br>
@@ -11,7 +11,7 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/Vu=
lkan-Headers.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/KhronosGroup/Vulkan-Headers.git;branch=3Dmaster</a>&quot;<br>
<br>
-SRCREV =3D &quot;87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209&quot;<br>
+SRCREV =3D &quot;1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d46cb605bda4dd2f--
