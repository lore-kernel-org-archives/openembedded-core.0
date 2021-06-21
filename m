Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.49117.1624291115963972651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 08:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=V3Dh5/Nd;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.48, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f48.google.com with SMTP id e22so16707248wrc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=plA+RTJBoJGmWFkMQreiKxd3oybqLVeva28ladOFm+k=;
        b=V3Dh5/Ndy3D3uPUOoZs/uVbzbV0zmjU0PghxkBls/mAaQhtMImMKtkRjnaBrRDHXX3
         plLO5vjpQLFjiZKyvMnG8hssg3/Me3rqSH/w2umUQ9xVyOMzbgIo+tjD+OgimQ1RKrVy
         PBUt0Trt+FvzTyWZkMCX/9rjVjtYKRGamo16rkOmm/H12vQbIiLkLqHyO6Kh6EfGZrR4
         HxwP9wDeB1q/hUK7Dk82pbUiuZaDdePP0Rfged1h6VIaK1CFOEhdZcHr/Eygfw1PdgIM
         lJb5G1H1HVbccER4DBgVKtx09vBeqnMs2HVqKS3NGKTizyQ9/FZ2Nj87IZ0CZSvVrbA7
         VBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=plA+RTJBoJGmWFkMQreiKxd3oybqLVeva28ladOFm+k=;
        b=BZKf0FNreFmWHix598Fsr3Eh1TI2nECMQVXA37YPDMUDXj/YbAUV6E1hiWsZKWszYO
         U/4szSUR+PnY3/ijtnSIhbbvDFgWlOX8+PuTkhkxA9b7zJkJXQKt5Q32/JW9O3cB3SmW
         rEInZ4tkQ//WhngX+kaEoMXqq7ey7ZiLpVSnIfxDAP1jORt58rRvZDdPILn8EkL8PT1l
         rHmR/w66yN/ZtCB/4E/lbq6nSNqS18W/HukKqFKMbEjMruRTLO10zk5ltG0t0j7woSWc
         0HbbhEH6/GQfRFyCv+muT3kF4mfyhGFdlKXFsl216bNAeur7JmsvhCnUqyv3ol+JJBGz
         4Lng==
X-Gm-Message-State: AOAM533IkaDrZQuKU936KkcFxNWNDo0n+faMKe0hC2NX4Nu38Qm5PUZZ
	D3V4hvsJNJaDuBcGhCijHa8Vy5mKJ1YSRiFa+6slNw==
X-Google-Smtp-Source: ABdhPJwYq8S3jJzmc4B03uXq4ttEIPZ9P24s79KTmM4VPnE75NfUH/iIABw+YPtWUUhlt01C4ZG2T0YFeOT98PGUQCE=
X-Received: by 2002:a5d:6daf:: with SMTP id u15mr29192777wrs.400.1624291114456;
 Mon, 21 Jun 2021 08:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210621141045.256726-1-jasper@fancydomain.eu>
 <CAGDS+nn3+01NZ3-GVD0wALQnyBgWmQU6Kz+3WZ_zB1UzEG7vsQ@mail.gmail.com> <DDFB19ED-C146-4163-9B4D-670CB43415F0@fancydomain.eu>
In-Reply-To: <DDFB19ED-C146-4163-9B4D-670CB43415F0@fancydomain.eu>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 21 Jun 2021 05:58:22 -1000
Message-ID: <CAOSpxdai0GCg37xVRo969BsZFGuZ-6TQgG=W6wZih=1Sig0-6Q@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH] libxml2: Fix CVE-2021-3518
To: jasper@fancydomain.eu
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 5:38 AM Jasper Orschulko via
lists.openembedded.org <jasper=3Dfancydomain.eu@lists.openembedded.org>
wrote:
>
> Hi Steve,
>
> sorry about that. Accidental checkout of dunfell-next. I sent a new patc=
h.

No worries!  V2 applied without issue.

Thanks,

Steve

>
> Best regards,
> Jasper
>
> On 21 June 2021 17:26:14 CEST, Steve Sakoman <sakoman@gmail.com> wrote:
>>
>> Sadly this patch won't apply.
>>
>> Could you rebase it on the current head of dunfell?  It seems you
>> generated this patch with an older version of dunfell that is missing
>> "libxml: fix CVE-2021-3517 CVE-2021-3537":
>>
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstab=
le/dunfell-nut&id=3Df177c0ec321f005dd9ce63aec2d700fd53c993ff
>>
>> Thanks again for helping with CVEs!
>>
>> Steve
>>
>> On Mon, Jun 21, 2021 at 4:11 AM Jasper Orschulko via
>> lists.openembedded.org <jasper=3Dfancydomain.eu@lists.openembedded.org>
>> wrote:
>>>
>>>
>>>  There's a flaw in libxml2 in versions before 2.9.11. An attacker who =
is able to submit a crafted file to be processed by an application linked w=
ith libxml2 could trigger a use-after-free. The greatest impact from this f=
law is to confidentiality, integrity, and availability.
>>>
>>>  Upstream-Status: Backport [from fedora:
>>>  https://bugzilla.redhat.com/show_bug.cgi?id=3D1954243]
>>>
>>>  Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
>>> ________________________________
>>>   .../libxml/libxml2/CVE-2021-3518.patch        | 108 ++++++++++++++++=
++
>>>   meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
>>>   2 files changed, 109 insertions(+)
>>>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518.pa=
tch
>>>
>>>  diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch b/m=
eta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
>>>  new file mode 100644
>>>  index 0000000000..c22cccf1b1
>>>  --- /dev/null
>>>  +++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
>>>  @@ -0,0 +1,108 @@
>>>  +From ac82a514e16eb81b4506e2cba1a1ee45b9f025b5 Mon Sep 17 00:00:00 20=
01
>>>  +From: Nick Wellnhofer <wellnhofer@aevum.de>
>>>  +Date: Wed, 10 Jun 2020 16:34:52 +0200
>>>  +Subject: [PATCH 1/2] Don't recurse into xi:include children in
>>>  + xmlXIncludeDoProcess
>>>  +
>>>  +Otherwise, nested xi:include nodes might result in a use-after-free
>>>  +if XML_PARSE_NOXINCNODE is specified.
>>>  +
>>>  +Found with libFuzzer and ASan.
>>>  +
>>>  +The upstream patch 752e5f71d7cea2ca5a7e7c0b8f72ed04ce654be4 has been=
 modified,
>>>  +as to avoid unnecessary modifications to fallback files.
>>>  +
>>>  +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
>>>  +---
>>>  + xinclude.c | 24 ++++++++++--------------
>>>  + 1 file changed, 10 insertions(+), 14 deletions(-)
>>>  +
>>>  +diff --git a/xinclude.c b/xinclude.c
>>>  +index ba850fa5..f260c1a7 100644
>>>  +--- a/xinclude.c
>>>  ++++ b/xinclude.c
>>>  +@@ -2392,21 +2392,19 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt=
, xmlDocPtr doc, xmlNodePtr tree) {
>>>  +      * First phase: lookup the elements in the document
>>>  +      */
>>>  +     cur =3D tree;
>>>  +-    if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1)
>>>  +-      xmlXIncludePreProcessNode(ctxt, cur);
>>>  +     while ((cur !=3D NULL) && (cur !=3D tree->parent)) {
>>>  +       /* TODO: need to work on entities -> stack */
>>>  +-      if ((cur->children !=3D NULL) &&
>>>  +-          (cur->children->type !=3D XML_ENTITY_DECL) &&
>>>  +-          (cur->children->type !=3D XML_XINCLUDE_START) &&
>>>  +-          (cur->children->type !=3D XML_XINCLUDE_END)) {
>>>  +-          cur =3D cur->children;
>>>  +-          if (xmlXIncludeTestNode(ctxt, cur))
>>>  +-              xmlXIncludePreProcessNode(ctxt, cur);
>>>  +-      } else if (cur->next !=3D NULL) {
>>>  ++        if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
>>>  ++            xmlXIncludePreProcessNode(ctxt, cur);
>>>  ++        } else if ((cur->children !=3D NULL) &&
>>>  ++                   (cur->children->type !=3D XML_ENTITY_DECL) &&
>>>  ++                   (cur->children->type !=3D XML_XINCLUDE_START) &&
>>>  ++                   (cur->children->type !=3D XML_XINCLUDE_END)) {
>>>  ++            cur =3D cur->children;
>>>  ++            continue;
>>>  ++        }
>>>  ++      if (cur->next !=3D NULL) {
>>>  +           cur =3D cur->next;
>>>  +-          if (xmlXIncludeTestNode(ctxt, cur))
>>>  +-              xmlXIncludePreProcessNode(ctxt, cur);
>>>  +       } else {
>>>  +           if (cur =3D=3D tree)
>>>  +               break;
>>>  +@@ -2416,8 +2414,6 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, =
xmlDocPtr doc, xmlNodePtr tree) {
>>>  +                   break; /* do */
>>>  +               if (cur->next !=3D NULL) {
>>>  +                   cur =3D cur->next;
>>>  +-                  if (xmlXIncludeTestNode(ctxt, cur))
>>>  +-                      xmlXIncludePreProcessNode(ctxt, cur);
>>>  +                   break; /* do */
>>>  +               }
>>>  +           } while (cur !=3D NULL);
>>>  +--
>>>  +2.32.0
>>>  +
>>>  +
>>>  +From 3ad5ac1e39e3cd42f838c1cd27ffd4e9b79e6121 Mon Sep 17 00:00:00 20=
01
>>>  +From: Nick Wellnhofer <wellnhofer@aevum.de>
>>>  +Date: Thu, 22 Apr 2021 19:26:28 +0200
>>>  +Subject: [PATCH 2/2] Fix user-after-free with `xmllint --xinclude --=
dropdtd`
>>>  +
>>>  +The --dropdtd option can leave dangling pointers in entity reference
>>>  +nodes. Make sure to skip these nodes when processing XIncludes.
>>>  +
>>>  +This also avoids scanning entity declarations and even modifying
>>>  +them inadvertently during XInclude processing.
>>>  +
>>>  +Move from a block list to an allow list approach to avoid descending
>>>  +into other node types that can't contain elements.
>>>  +
>>>  +Fixes #237.
>>>  +
>>>  +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
>>>  +---
>>>  + xinclude.c | 5 ++---
>>>  + 1 file changed, 2 insertions(+), 3 deletions(-)
>>>  +
>>>  +diff --git a/xinclude.c b/xinclude.c
>>>  +index f260c1a7..d7648529 100644
>>>  +--- a/xinclude.c
>>>  ++++ b/xinclude.c
>>>  +@@ -2397,9 +2397,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, =
xmlDocPtr doc, xmlNodePtr tree) {
>>>  +         if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
>>>  +             xmlXIncludePreProcessNode(ctxt, cur);
>>>  +         } else if ((cur->children !=3D NULL) &&
>>>  +-                   (cur->children->type !=3D XML_ENTITY_DECL) &&
>>>  +-                   (cur->children->type !=3D XML_XINCLUDE_START) &&
>>>  +-                   (cur->children->type !=3D XML_XINCLUDE_END)) {
>>>  ++                   ((cur->type =3D=3D XML_DOCUMENT_NODE) ||
>>>  ++                    (cur->type =3D=3D XML_ELEMENT_NODE))) {
>>>  +             cur =3D cur->children;
>>>  +             continue;
>>>  +         }
>>>  +--
>>>  +2.32.0
>>>  +
>>>  diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipe=
s-core/libxml/libxml2_2.9.10.bb
>>>  index 4ebfb9e556..04d32ade69 100644
>>>  --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
>>>  +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
>>>  @@ -23,6 +23,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2=
-${PV}.tar.gz;name=3Dlibtar \
>>>              file://CVE-2020-7595.patch \
>>>              file://CVE-2019-20388.patch \
>>>              file://CVE-2020-24977.patch \
>>>  +           file://CVE-2021-3518.patch \
>>>              "
>>>
>>>   SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
>>>  --
>>>  2.32.0
>>>
>>>
>>>
>>>
>
> --
> Sent from my Android device with K-9 Mail. Please excuse my brevity.
>
>=20
>
