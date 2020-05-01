Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.10638.1588341389275644840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 06:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xofr57+/;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id u203so2690960vkb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2020 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJOezKp+8KnQPZLXQ2JG9rB3WdbjMUqlr6uYxo30JG0=;
        b=Xofr57+/XQyjvKea+AzDNLOnrkI/kcx3m12SvAPTwNpHoRCnApiydsznC7Dl1l4zL1
         IgLRjXQWU2cSOOwuOuXifY7TzvnsMWTUmb98lDAyTLcOzPK+9v3uJfoqCBcsOxpHtyg8
         I7T6mw8J7diAO+aIegvOrvxV2tfbJBWJgLViP5cb9q1vskCuCXgn502BLyvQfbok+XUf
         TAxwow5I64FE05Ofq4L9zAhkEqSeL0D8fDN7U5eyOedVW1VJEyqvC/wVKgJUKVnOW1tf
         lwLNAtQSwJSy9uuH/1D+khLroQDNSyM4uBZibGQUy0FHFPmI5VH7/WYvIyXyI2ivDXvg
         uDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJOezKp+8KnQPZLXQ2JG9rB3WdbjMUqlr6uYxo30JG0=;
        b=FDpbUXBkwtYSRsoaTe8flP6vUS6iULov4w8k3YKkTfwtFVqDw1zLDTTbM3VAVyfpoO
         wTpZyCgWivbtLuCzRlZp0a/xbsPLn3wUY/LtgA+0AB8cR+hLzs+Axot4qZkAn1a16Os6
         zJ3zJDyu+ZxZnSr31Kl7g/qj+cFjK5wTla0+9WBAGR1QMuWjJThVLc8UzShMJzzwp8+h
         fpgf5Mgg84UMJ7u8peoXqeId56eHEkpkuKSlhs3c4cDDQO28/aNk1kZ8CmFdthcnSGRk
         KPgKsoN7Fb1WNkJUnX3NjPD/zE0e6Q24mNAM93Gn8hAcRIJM0XQncOvKrsWr7RqCSYNU
         jLPg==
X-Gm-Message-State: AGi0PuYkYWz6wFWaDUL9iyx0DUBWHDbgMi1UZFH7D/rVnjdr+rbyPJRq
	RX6rrw1xAyUBIa+mQKlOUXosHEvBEODxcaX5O4Y=
X-Google-Smtp-Source: APiQypLIDmQHjoFbFM52/JxcztaF81+IEqqvv40H4QmfK+dCtLAdHjMhf8KnVdyIYtK71oJZz4YqtMojNOmZMyPtFw8=
X-Received: by 2002:a1f:2154:: with SMTP id h81mr2809798vkh.9.1588341388306;
 Fri, 01 May 2020 06:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200501082616.11296-1-andrej.valek@siemens.com> <AM6PR10MB3000A0A64DB428E5ED6F33D292AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM6PR10MB3000A0A64DB428E5ED6F33D292AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 1 May 2020 15:56:16 +0200
Message-ID: <CANNYZj-0k=gL0K6b5r5U4SJpRo-cnUNO7zymt4J43uzapH6JKA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003b6ed005a4968c77"

--0000000000003b6ed005a4968c77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrej,

can you publish the patch in git somewhere so I could take a look at
exactly what goes wrong? Occasionally we have patches that can't make it
through the mailing list for whatever reason, then RP pulls them directly
from git on request.

Alex

On Fri, 1 May 2020 at 15:48, Valek, Andrej <andrej.valek@siemens.com> wrote=
:

> Hello Alex,
>
> I wanted to upgrade ICU to 67.1 release but without success. Locally it
> was working as well. When I was trying to apply the upgrading patch it
> failed. I realized that, there are mixed line endings Linux/Windows. I am
> able to apply patch with "git am --keep-cr", but It's still failing on
> patchwork.
>
> I was trying to send the patch with different encodings, auto, 7bit, but
> still without success (3-times). Which kind of "
> --transfer-encoding=3D(7bit|8bit|quoted-printable|base64" should I use fo=
r
> it? Is there an another way to submit the patch?
>
> Thank you,
> Andrej
>
> -----Original Message-----
> From: Andrej Valek <andrej.valek@siemens.com>
> Sent: Friday, May 1, 2020 10:26 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Valek, Andrej (IOT DS EU SK SI-BP1) <andrej.valek@siemens.com>
> Subject: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
>
> - 0001-icu-Added-armeb-support.patch - rebased
> - 0001-Fix-big-endian-build.patch - removed, already included in new
> version
> - icu-pkgdata-large-cmd.patch - removed, implemented correct size
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../icu/icu/0001-Fix-big-endian-build.patch        | 28 -------------
>  .../icu/icu/0001-icu-Added-armeb-support.patch     |  6 +--
>  .../icu/icu/icu-pkgdata-large-cmd.patch            | 49
> ----------------------
>  .../icu/{icu_66.1.bb =3D> icu_67.1.bb}               |  7 +---
>  4 files changed, 5 insertions(+), 85 deletions(-)  delete mode 100644
> meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
>  delete mode 100644
> meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
>  rename meta/recipes-support/icu/{icu_66.1.bb =3D> icu_67.1.bb} (84%)
>
> diff --git a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
> b/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
> deleted file mode 100644
> index 91d68848c7..0000000000
> --- a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 17 Apr 2019 16:41:58 +0200
> -Subject: [PATCH] Fix big-endian build
> -
> -Bug-report:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Funico=
de-org.atlassian.net%2Fbrowse%2FICU-20533&amp;data=3D02%7C01%7Candrej.valek=
%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42=
e1495d55a%7C1%7C0%7C637239184284814122&amp;sdata=3DlkF0ueFchcq6kB67u%2BE52D=
noJTVlb%2BhD5YtUQKo2TWI%3D&amp;reserved=3D0
> -Patch
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Funic=
ode-org.atlassian.net%2Fbrowse%2FICU-20533&amp;data=3D02%7C01%7Candrej.vale=
k%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab4=
2e1495d55a%7C1%7C0%7C637239184284814122&amp;sdata=3DlkF0ueFchcq6kB67u%2BE52=
DnoJTVlb%2BhD5YtUQKo2TWI%3D&amp;reserved=3D0-Patch>
> taken from:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugs.=
gentoo.org%2F682170&amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699c=
a9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63=
7239184284814122&amp;sdata=3DGiOAPhwkklHKkOtWwBWk6RdbyvvHiNGii7U1psFjhx8%3D=
&amp;reserved=3D0
> -
> -it is applied upstream and will be in version 67+
> -
> -Upstream-Status: Backport [
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Funicode-org%2Ficu%2Fcommit%2F4a3a457b38cd828b7b3fa4fdbc6e2504a57275=
e9&amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908=
d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&=
amp;sdata=3Dsqj%2B6HJBvmGjkMFTUOoW2%2F9pHppNCQDhjp4pufpfSDM%3D&amp;reserved=
=3D0
> ]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - data/Makefile.in | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> ---- a/data/Makefile.in
> -+++ b/data/Makefile.in
> -@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE =3D $(firstword $(wildcard
> - # and convert it to the current type.
> - ifneq ($(ICUDATA_ARCHIVE),)
> - ICUDATA_SOURCE_ARCHIVE =3D $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
> --$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
> -+$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
> -+      $(MKINSTALLDIRS) $(OUTDIR)
> -       $(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR)
> $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
> - endif
> - else
> diff --git
> a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> index 299689d95c..145efc0e01 100644
> --- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> +++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> @@ -13,10 +13,10 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/i18n/double-conversion-utils.h
> b/i18n/double-conversion-utils.h -index 1e44fca..e4f2a8b 100644
> +index 8c6a0e1..cf89907 100644
>  --- a/i18n/double-conversion-utils.h
>  +++ b/i18n/double-conversion-utils.h
> -@@ -92,7 +92,7 @@ int main(int argc, char** argv) {
> +@@ -115,7 +115,7 @@ int main(int argc, char** argv) {
>   //
>   // If it prints "correct" then the architecture should be here, in the
> "correct" section.
>   #if defined(_M_X64) || defined(__x86_64__) || \ @@ -24,7 +24,7 @@ index
> 1e44fca..e4f2a8b 100644
>  +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) ||
> defined(_M_ARM64) || \
>       defined(__hppa__) || defined(__ia64__) || \
>       defined(__mips__) || \
> -     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
> +     defined(__nios2__) || \
>  --
>  2.7.4
>
> diff --git a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
> b/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
> deleted file mode 100644
> index e758a623ef..0000000000
> --- a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
> -
> -Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE,
> -otherwise there was a Segmentation fault error when the command line is
> -long, this should be a misplay since other cmd uses -LARGE_BUFFER_MAX_SI=
ZE.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - tools/pkgdata/pkgdata.cpp | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp -inde=
x
> 60167dd..506dd32 100644
> ---- a/tools/pkgdata/pkgdata.cpp
> -+++ b/tools/pkgdata/pkgdata.cpp
> -@@ -1084,7 +1084,7 @@ normal_symlink_mode:
> -
> - static int32_t pkg_installLibrary(const char *installDir, const char
> *targetDir, UBool noVersion) {
> -     int32_t result =3D 0;
> --    char cmd[SMALL_BUFFER_MAX_SIZE];
> -+    char cmd[LARGE_BUFFER_MAX_SIZE];
> -
> -     sprintf(cmd, "cd %s && %s %s %s%s%s",
> -             targetDir,
> -@@ -1152,7 +1152,7 @@ static int32_t pkg_installLibrary(const char
> *installDir, const char *targetDir,
> -
> - static int32_t pkg_installCommonMode(const char *installDir, const char
> *fileName) {
> -     int32_t result =3D 0;
> --    char cmd[SMALL_BUFFER_MAX_SIZE] =3D "";
> -+    char cmd[LARGE_BUFFER_MAX_SIZE] =3D "";
> -
> -     if (!T_FileStream_file_exists(installDir)) {
> -         UErrorCode status =3D U_ZERO_ERROR;
> -@@ -1184,7 +1184,7 @@ static int32_t pkg_installCommonMode(const char
> *installDir, const char *fileNam
> - #endif
> - static int32_t pkg_installFileMode(const char *installDir, const char
> *srcDir, const char *fileListName) {
> -     int32_t result =3D 0;
> --    char cmd[SMALL_BUFFER_MAX_SIZE] =3D "";
> -+    char cmd[LARGE_BUFFER_MAX_SIZE] =3D "";
> -
> -     if (!T_FileStream_file_exists(installDir)) {
> -         UErrorCode status =3D U_ZERO_ERROR;
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-support/icu/icu_66.1.bb
> b/meta/recipes-support/icu/icu_67.1.bb
> similarity index 84%
> rename from meta/recipes-support/icu/icu_66.1.bb
> rename to meta/recipes-support/icu/icu_67.1.bb
> index f2bb344e33..58638507c9 100644
> --- a/meta/recipes-support/icu/icu_66.1.bb
> +++ b/meta/recipes-support/icu/icu_67.1.bb
> @@ -22,17 +22,15 @@ DATA_SRC_URI =3D "
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Funicode-org%2Ficu%2Freleases%2Fdownload%2Frelease-%24&amp;data=3D02=
%7C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38a=
e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&amp;sdata=3DtOWF=
0krhT2h0ba16I8RDpLLqZglg4o48ULQg5xW7OjI%3D&amp;reserved=3D0{I
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Funicode-org%2Ficu%2Freleases%2Fdownload%2Frelease-%24&amp;data=3D0=
2%7C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38=
ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&amp;sdata=3DtOW=
F0krhT2h0ba16I8RDpLLqZglg4o48ULQg5xW7OjI%3D&amp;reserved=3D0%7BI>
>  SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
>             ${DATA_SRC_URI};name=3Ddata \
>             file://filter.json \
> -           file://icu-pkgdata-large-cmd.patch \
>             file://fix-install-manx.patch \
> -           file://0001-Fix-big-endian-build.patch;apply=3Dno \
>             file://0001-icu-Added-armeb-support.patch \
>             "
>
>  SRC_URI_append_class-target =3D "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[code.sha256sum] =3D
> "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
> -SRC_URI[data.sha256sum] =3D
> "8be647f738891d2beb79d48f99077b3499948430eae6f1be112553b15ab0243e"
> +SRC_URI[code.sha256sum] =3D
> "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
> +SRC_URI[data.sha256sum] =3D
> "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4a7e"
>
>  UPSTREAM_CHECK_REGEX =3D "icu4c-(?P<pver>\d+(_\d+)+)-src"
>  UPSTREAM_CHECK_URI =3D "
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Funicode-org%2Ficu%2Freleases&amp;data=3D02%7C01%7Candrej.valek%40si=
emens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495=
d55a%7C1%7C0%7C637239184284814122&amp;sdata=3Doc4vNTJru5V9fuwz7ODlmQDVMB8EQ=
F6EkXT1mfGM1gA%3D&amp;reserved=3D0
> "
> @@ -43,7 +41,6 @@ do_make_icudata_class-target () {
>      cd ${S}
>      rm -rf data
>      cp -a ${WORKDIR}/data .
> -    patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
>      AR=3D'${BUILD_AR}' \
>      CC=3D'${BUILD_CC}' \
>      CPP=3D'${BUILD_CPP}' \
> --
> 2.11.0
>
>

--0000000000003b6ed005a4968c77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Andrej,</div><div><br></div><div>can you publis=
h the patch in git somewhere so I could take a look at exactly what goes wr=
ong? Occasionally we have patches that can&#39;t make it through the mailin=
g list for whatever reason, then RP pulls them directly from git on request=
.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1 May 2020 at 15:48, V=
alek, Andrej &lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_bla=
nk">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hello Alex,<br>
<br>
I wanted to upgrade ICU to 67.1 release but without success. Locally it was=
 working as well. When I was trying to apply the upgrading patch it failed.=
 I realized that, there are mixed line endings Linux/Windows. I am able to =
apply patch with &quot;git am --keep-cr&quot;, but It&#39;s still failing o=
n patchwork.<br>
<br>
I was trying to send the patch with different encodings, auto, 7bit, but st=
ill without success (3-times). Which kind of &quot; --transfer-encoding=3D(=
7bit|8bit|quoted-printable|base64&quot; should I use for it? Is there an an=
other way to submit the patch?<br>
<br>
Thank you,<br>
Andrej<br>
<br>
-----Original Message-----<br>
From: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com" target=
=3D"_blank">andrej.valek@siemens.com</a>&gt; <br>
Sent: Friday, May 1, 2020 10:26 AM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Cc: Valek, Andrej (IOT DS EU SK SI-BP1) &lt;<a href=3D"mailto:andrej.valek@=
siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
Subject: [OE-core][PATCH] icu: upgrade 66.1 -&gt; 67.1<br>
<br>
- 0001-icu-Added-armeb-support.patch - rebased<br>
- 0001-Fix-big-endian-build.patch - removed, already included in new versio=
n<br>
- icu-pkgdata-large-cmd.patch - removed, implemented correct size<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
 target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../icu/icu/0001-Fix-big-endian-build.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 28 -------------<br>
=C2=A0.../icu/icu/0001-icu-Added-armeb-support.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 +--<br>
=C2=A0.../icu/icu/icu-pkgdata-large-cmd.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 49 ----------------------<br>
=C2=A0.../icu/{<a href=3D"http://icu_66.1.bb" rel=3D"noreferrer" target=3D"=
_blank">icu_66.1.bb</a> =3D&gt; <a href=3D"http://icu_67.1.bb" rel=3D"noref=
errer" target=3D"_blank">icu_67.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +---<br>
=C2=A04 files changed, 5 insertions(+), 85 deletions(-)=C2=A0 delete mode 1=
00644 meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/icu/icu/icu-pkgdata-large-cmd=
.patch<br>
=C2=A0rename meta/recipes-support/icu/{<a href=3D"http://icu_66.1.bb" rel=
=3D"noreferrer" target=3D"_blank">icu_66.1.bb</a> =3D&gt; <a href=3D"http:/=
/icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a>} (84%)<b=
r>
<br>
diff --git a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch b=
/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch<br>
deleted file mode 100644<br>
index 91d68848c7..0000000000<br>
--- a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Wed, 17 Apr 2019 16:41:58 +0200<br>
-Subject: [PATCH] Fix big-endian build<br>
-<br>
-Bug-report: <a href=3D"https://eur01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Funicode-org.atlassian.net%2Fbrowse%2FICU-20533&amp;amp;dat=
a=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb=
%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&amp;amp;sd=
ata=3DlkF0ueFchcq6kB67u%2BE52DnoJTVlb%2BhD5YtUQKo2TWI%3D&amp;amp;reserved=
=3D0-Patch" rel=3D"noreferrer" target=3D"_blank">https://eur01.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Funicode-org.atlassian.net%2Fbrows=
e%2FICU-20533&amp;amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699ca9=
e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6372=
39184284814122&amp;amp;sdata=3DlkF0ueFchcq6kB67u%2BE52DnoJTVlb%2BhD5YtUQKo2=
TWI%3D&amp;amp;reserved=3D0<br>
-Patch</a> taken from: <a href=3D"https://eur01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fbugs.gentoo.org%2F682170&amp;amp;data=3D02%7C01%=
7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd9=
5794fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&amp;amp;sdata=3DGiOAPh=
wkklHKkOtWwBWk6RdbyvvHiNGii7U1psFjhx8%3D&amp;amp;reserved=3D0" rel=3D"noref=
errer" target=3D"_blank">https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fbugs.gentoo.org%2F682170&amp;amp;data=3D02%7C01%7Candrej.=
valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4ad=
dab42e1495d55a%7C1%7C0%7C637239184284814122&amp;amp;sdata=3DGiOAPhwkklHKkOt=
WwBWk6RdbyvvHiNGii7U1psFjhx8%3D&amp;amp;reserved=3D0</a><br>
-<br>
-it is applied upstream and will be in version 67+<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://eur01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Fcommit%2F4=
a3a457b38cd828b7b3fa4fdbc6e2504a57275e9&amp;amp;data=3D02%7C01%7Candrej.val=
ek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab=
42e1495d55a%7C1%7C0%7C637239184284814122&amp;amp;sdata=3Dsqj%2B6HJBvmGjkMFT=
UOoW2%2F9pHppNCQDhjp4pufpfSDM%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" t=
arget=3D"_blank">https://eur01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Fcommit%2F4a3a457b38cd828b7b3fa4f=
dbc6e2504a57275e9&amp;amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf69=
9ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C=
637239184284814122&amp;amp;sdata=3Dsqj%2B6HJBvmGjkMFTUOoW2%2F9pHppNCQDhjp4p=
ufpfSDM%3D&amp;amp;reserved=3D0</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- data/Makefile.in | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
---- a/data/Makefile.in<br>
-+++ b/data/Makefile.in<br>
-@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE =3D $(firstword $(wildcard<br>
- # and convert it to the current type.<br>
- ifneq ($(ICUDATA_ARCHIVE),)<br>
- ICUDATA_SOURCE_ARCHIVE =3D $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat<br>
--$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)<br>
-+$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(MKINSTALLDIRS) $(OUTDIR)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR=
) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)<br>
- endif<br>
- else<br>
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patc=
h b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch<br>
index 299689d95c..145efc0e01 100644<br>
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch<br>
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch<br>
@@ -13,10 +13,10 @@ Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaoh=
ui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-=
utils.h -index 1e44fca..e4f2a8b 100644<br>
+index 8c6a0e1..cf89907 100644<br>
=C2=A0--- a/i18n/double-conversion-utils.h<br>
=C2=A0+++ b/i18n/double-conversion-utils.h<br>
-@@ -92,7 +92,7 @@ int main(int argc, char** argv) {<br>
+@@ -115,7 +115,7 @@ int main(int argc, char** argv) {<br>
=C2=A0 //<br>
=C2=A0 // If it prints &quot;correct&quot; then the architecture should be =
here, in the &quot;correct&quot; section.<br>
=C2=A0 #if defined(_M_X64) || defined(__x86_64__) || \ @@ -24,7 +24,7 @@ in=
dex 1e44fca..e4f2a8b 100644<br>
=C2=A0+=C2=A0 =C2=A0 defined(__arm__) || defined(__avr32__) || defined(_M_A=
RM) || defined(_M_ARM64) || \<br>
=C2=A0 =C2=A0 =C2=A0 defined(__hppa__) || defined(__ia64__) || \<br>
=C2=A0 =C2=A0 =C2=A0 defined(__mips__) || \<br>
-=C2=A0 =C2=A0 =C2=A0defined(__powerpc__) || defined(__ppc__) || defined(__=
ppc64__) || \<br>
+=C2=A0 =C2=A0 =C2=A0defined(__nios2__) || \<br>
=C2=A0--<br>
=C2=A02.7.4<br>
<br>
diff --git a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch b/met=
a/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch<br>
deleted file mode 100644<br>
index e758a623ef..0000000000<br>
--- a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch<br>
+++ /dev/null<br>
@@ -1,49 +0,0 @@<br>
-pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd<br>
-<br>
-Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE, -othe=
rwise there was a Segmentation fault error when the command line is -long, =
this should be a misplay since other cmd uses -LARGE_BUFFER_MAX_SIZE.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com=
" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
-Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.c=
om" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
----<br>
- tools/pkgdata/pkgdata.cpp | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp -index =
60167dd..506dd32 100644<br>
---- a/tools/pkgdata/pkgdata.cpp<br>
-+++ b/tools/pkgdata/pkgdata.cpp<br>
-@@ -1084,7 +1084,7 @@ normal_symlink_mode:<br>
-<br>
- static int32_t pkg_installLibrary(const char *installDir, const char *tar=
getDir, UBool noVersion) {<br>
-=C2=A0 =C2=A0 =C2=A0int32_t result =3D 0;<br>
--=C2=A0 =C2=A0 char cmd[SMALL_BUFFER_MAX_SIZE];<br>
-+=C2=A0 =C2=A0 char cmd[LARGE_BUFFER_MAX_SIZE];<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0sprintf(cmd, &quot;cd %s &amp;&amp; %s %s %s%s%s&quot;=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targetDir,<br>
-@@ -1152,7 +1152,7 @@ static int32_t pkg_installLibrary(const char *instal=
lDir, const char *targetDir,<br>
-<br>
- static int32_t pkg_installCommonMode(const char *installDir, const char *=
fileName) {<br>
-=C2=A0 =C2=A0 =C2=A0int32_t result =3D 0;<br>
--=C2=A0 =C2=A0 char cmd[SMALL_BUFFER_MAX_SIZE] =3D &quot;&quot;;<br>
-+=C2=A0 =C2=A0 char cmd[LARGE_BUFFER_MAX_SIZE] =3D &quot;&quot;;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!T_FileStream_file_exists(installDir)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UErrorCode status =3D U_ZERO_ERROR;<br>
-@@ -1184,7 +1184,7 @@ static int32_t pkg_installCommonMode(const char *ins=
tallDir, const char *fileNam<br>
- #endif<br>
- static int32_t pkg_installFileMode(const char *installDir, const char *sr=
cDir, const char *fileListName) {<br>
-=C2=A0 =C2=A0 =C2=A0int32_t result =3D 0;<br>
--=C2=A0 =C2=A0 char cmd[SMALL_BUFFER_MAX_SIZE] =3D &quot;&quot;;<br>
-+=C2=A0 =C2=A0 char cmd[LARGE_BUFFER_MAX_SIZE] =3D &quot;&quot;;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!T_FileStream_file_exists(installDir)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UErrorCode status =3D U_ZERO_ERROR;<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-support/icu/<a href=3D"http://icu_66.1.bb" rel=3D=
"noreferrer" target=3D"_blank">icu_66.1.bb</a> b/meta/recipes-support/icu/<=
a href=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1=
.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-support/icu/<a href=3D"http://icu_66.1.bb" rel=3D"=
noreferrer" target=3D"_blank">icu_66.1.bb</a><br>
rename to meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" rel=3D"no=
referrer" target=3D"_blank">icu_67.1.bb</a><br>
index f2bb344e33..58638507c9 100644<br>
--- a/meta/recipes-support/icu/<a href=3D"http://icu_66.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_66.1.bb</a><br>
+++ b/meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_67.1.bb</a><br>
@@ -22,17 +22,15 @@ DATA_SRC_URI =3D &quot;<a href=3D"https://eur01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Fi=
cu%2Freleases%2Fdownload%2Frelease-%24&amp;amp;data=3D02%7C01%7Candrej.vale=
k%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab4=
2e1495d55a%7C1%7C0%7C637239184284814122&amp;amp;sdata=3DtOWF0krhT2h0ba16I8R=
DpLLqZglg4o48ULQg5xW7OjI%3D&amp;amp;reserved=3D0%7BI" rel=3D"noreferrer" ta=
rget=3D"_blank">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Freleases%2Fdownload%2Frelease-%24=
&amp;amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f9=
08d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63723918428481412=
2&amp;amp;sdata=3DtOWF0krhT2h0ba16I8RDpLLqZglg4o48ULQg5xW7OjI%3D&amp;amp;re=
served=3D0{I</a><br>
=C2=A0SRC_URI =3D &quot;${BASE_SRC_URI};name=3Dcode \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${DATA_SRC_URI};name=3Ddata \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://filter.json \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://icu-pkgdata-large-cmd.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-install-manx.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-big-endian-build.=
patch;apply=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-icu-Added-armeb-suppo=
rt.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-target =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-LDFLAGSICUDT-=
for-Linux.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[code.sha256sum] =3D &quot;52a3f2209ab95559c1cf0a14f24338001f389615=
bf00e2585ef3dbc43ecf0a2e&quot;<br>
-SRC_URI[data.sha256sum] =3D &quot;8be647f738891d2beb79d48f99077b3499948430=
eae6f1be112553b15ab0243e&quot;<br>
+SRC_URI[code.sha256sum] =3D &quot;94a80cd6f251a53bd2a997f6f1b5ac6653fe791d=
fab66e1eb0227740fb86d5dc&quot;<br>
+SRC_URI[data.sha256sum] =3D &quot;7c16a59cc8c06128b7ecc1dc4fc056b36b173493=
12829b17408b9e67b05c4a7e&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;icu4c-(?P&lt;pver&gt;\d+(_\d+)+)-src&q=
uot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://eur01.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Frel=
eases&amp;amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6=
a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637239184284=
814122&amp;amp;sdata=3Doc4vNTJru5V9fuwz7ODlmQDVMB8EQF6EkXT1mfGM1gA%3D&amp;a=
mp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">https://eur01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Fi=
cu%2Freleases&amp;amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf699ca9=
e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6372=
39184284814122&amp;amp;sdata=3Doc4vNTJru5V9fuwz7ODlmQDVMB8EQF6EkXT1mfGM1gA%=
3D&amp;amp;reserved=3D0</a>&quot;<br>
@@ -43,7 +41,6 @@ do_make_icudata_class-target () {<br>
=C2=A0 =C2=A0 =C2=A0cd ${S}<br>
=C2=A0 =C2=A0 =C2=A0rm -rf data<br>
=C2=A0 =C2=A0 =C2=A0cp -a ${WORKDIR}/data .<br>
-=C2=A0 =C2=A0 patch -p1 &lt; ${WORKDIR}/0001-Fix-big-endian-build.patch<br=
>
=C2=A0 =C2=A0 =C2=A0AR=3D&#39;${BUILD_AR}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0CC=3D&#39;${BUILD_CC}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0CPP=3D&#39;${BUILD_CPP}&#39; \<br>
--<br>
2.11.0<br>
<br>
</blockquote></div>

--0000000000003b6ed005a4968c77--
