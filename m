Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.782.1630009042162812057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 13:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tq6yTDD0;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id c19so3544294qte.7
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQc4uDfr5wUIUdoNRXfgxy4C2ZXx3TeU8SKSV2FJV+k=;
        b=tq6yTDD0CvwS68GwEtguOvuFfbvCzOWFNgHLZcJxasS9DCCyWe/8Orx0KDSIINxIyw
         PSXkcGtA1F5VpiZvf1ex2bXDD9gRBKAC23gZ1URUDCKkOdnUNjueO+RsQ851ba03oFHg
         8I+TgW3CMqXnYHppeUBp1EFoGmifUsv8LdD+EL5ZEwP02GyQbONtJWRM5oxVAnsTCQpi
         8MomeoWVrLNWktcNuZASkRIc4SJaq/AoVC+s5AqFf0VedqCHlmjckhAjy6oiPL6z/cPA
         s7q8M4SB1+1nwhLHGq/rQZH0Cy0Qg7l3QOBFwI16Uh6ivEP3enjpuykTeW5p5ztpwIgm
         gG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQc4uDfr5wUIUdoNRXfgxy4C2ZXx3TeU8SKSV2FJV+k=;
        b=kpmqHJUf6RmE/7ZTm1XS8aMGlIA4NeVCrlyqhe4J+bdT6TXzjFE4W0iN181mAQBaDq
         LmVvpLtEXSw47Uv9mGuXSIdvchsyamXOS9AKKFb64j/EWaZ9599V+DSCLITmj4RluNJd
         seGq96DjCLfSv6Q7gOvqLVwKc4njSbh30w/b4IOmDoLGSMGGicRiJXrUrEux7opL/uPC
         3Fkd9Mc+TzCshTN1CeoCpJ/FSU8zn58BcUeeFYISM8rWCp9cdIhgxbS6nTFJSfnMoLpz
         ZRBnouKiSwO+bWI59riZugDiZ1yPHa3nhcY+jUNigoDZzUZDTFjsmGuSB4JqwF8c0W5B
         2gIw==
X-Gm-Message-State: AOAM5307TE5QEnO5BqAI0TWUaG7fVGaTM/ta3BmGk4KY94TjAPKD7FiO
	tWd7dNlBtJ8QJBa72cFI+xlD7pRZQV2p4GOlsP0=
X-Google-Smtp-Source: ABdhPJyPXuONyM7yT0ywS4QXI8PVyFnlyjHfx9YehIJLpO5ZhGv2IEJ8W/X3M5x2b35zkB2RTht7OzBjZFoaKgJZuMA=
X-Received: by 2002:ac8:46cd:: with SMTP id h13mr5115317qto.369.1630009041139;
 Thu, 26 Aug 2021 13:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210825215938.10941-1-jsbronder@cold-front.org>
In-Reply-To: <20210825215938.10941-1-jsbronder@cold-front.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Aug 2021 13:17:10 -0700
Message-ID: <CAMKF1sq2t6duOAxc5v=taPC4owArE79Ox1mB1trpCFBrWo4ttg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] hidapi: add rdep on glibc-gconv-utf-16
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0ba7305ca7c0dc6"

--000000000000e0ba7305ca7c0dc6
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 2:59 PM Justin Bronder <jsbronder@cold-front.org>
wrote:

> libhidapi-libusb needs to convert from UTF-16LE to WCHAR_T in order to
> read various libusb string descriptors.
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta-oe/recipes-support/hidapi/hidapi_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb
> b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> index 76f5dc762..54b794774 100644
> --- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
> +++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> @@ -7,6 +7,7 @@ LICENSE = "BSD-3-Clause | GPLv3"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
>
>  DEPENDS = "libusb udev"
> +RDEPENDS_${PN} += "glibc-gconv-utf-16"


Make it glibc specific too using libc-glibc override

>
>
>  inherit autotools pkgconfig
>
> --
> 2.33.0
>
>
> 
>
>

--000000000000e0ba7305ca7c0dc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 25, 2021 at 2:59 PM Justin Bronder &lt;<a href=
=3D"mailto:jsbronder@cold-front.org">jsbronder@cold-front.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">libhidapi-libusb needs to convert=
 from UTF-16LE to WCHAR_T in order to<br>
read various libusb string descriptors.<br>
<br>
Signed-off-by: Justin Bronder &lt;<a href=3D"mailto:jsbronder@cold-front.or=
g" target=3D"_blank">jsbronder@cold-front.org</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/hidapi/<a href=3D"http://hidapi_git.bb" rel=
=3D"noreferrer" target=3D"_blank">hidapi_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-support/hidapi/<a href=3D"http://hidapi_git.bb=
" rel=3D"noreferrer" target=3D"_blank">hidapi_git.bb</a> b/meta-oe/recipes-=
support/hidapi/<a href=3D"http://hidapi_git.bb" rel=3D"noreferrer" target=
=3D"_blank">hidapi_git.bb</a><br>
index 76f5dc762..54b794774 100644<br>
--- a/meta-oe/recipes-support/hidapi/<a href=3D"http://hidapi_git.bb" rel=
=3D"noreferrer" target=3D"_blank">hidapi_git.bb</a><br>
+++ b/meta-oe/recipes-support/hidapi/<a href=3D"http://hidapi_git.bb" rel=
=3D"noreferrer" target=3D"_blank">hidapi_git.bb</a><br>
@@ -7,6 +7,7 @@ LICENSE =3D &quot;BSD-3-Clause | GPLv3&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D7c3949a631240cb6c=
31c50f3eb696077&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libusb udev&quot;<br>
+RDEPENDS_${PN} +=3D &quot;glibc-gconv-utf-16&quot;</blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">Make it glibc specific too using libc-gl=
ibc override=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-- <br>
2.33.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000e0ba7305ca7c0dc6--
