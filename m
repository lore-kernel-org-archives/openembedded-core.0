Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFB1CE79A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 22:11:54 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.23248.1695161512021054937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 15:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QydB5JTB;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59bebd5bdadso64000327b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 15:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695161511; x=1695766311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tqVAKIumEOG197SbuM6CQLDvIyZIO3/DtIAQuuwmxro=;
        b=QydB5JTBiVAE4K4tSOq089ZP0hNSP7W+S+UAO8T0oMVM7+GswTBQl28rt10Bqqb8sY
         FacxpCZKZ6DnnUDSFwKdYeSC3/5QZOKHQwfFb0ZXzFQowzeIakYt8XnOQ1ifDF+C340r
         MC688Cep7bPESFauEeu6FcinCm2HaSDGIRGX2fSMNWksvbTJY+8TeLJUQuvz7xu/m+0O
         e9mLY/Xcqrm1kReQZ9gy1UF2sPFPyA3p6nV4EMI9sordwUE+Ase7Q+y9QNZ11fTvYXZO
         srP5EfUX1yfWrU8XNpDzRZHaGkO1ZHFTqLqaobBt+i+yI57HAP07OwEMnl+3n30AvOFW
         Z17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695161511; x=1695766311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqVAKIumEOG197SbuM6CQLDvIyZIO3/DtIAQuuwmxro=;
        b=mhUfxgxs0OHlcj9mTaR4yDPOUcPFWSJdH9BjzX6tHMHIG3H9fTvlmxjj7yVgmuVwHv
         26PKZODCR9pFYzo/4FUk4yP1FEr2q5oI30ykCZoISHG1zNOxxIwY8LCmkyoBU97czcLG
         nE6nqjjHB5Ct6hCgJQvHwY2t+zL5aEcw6mfYf8geVAHukGo6ry8BoJaV9T821QzSBhy1
         8df9IJ/WVdJkDEgV+LCoz3QoBUBGaKGxzW8Ka2sA0tTLkUa/J+hbXoUWP3aSLk6mjwtn
         1NuwvnyC15A5xV4rZFovrMg3DNOJ3tjBZPxzjaiDlfHtmoIOLkVO6PYcgS/4TNcUS8Ak
         2FvQ==
X-Gm-Message-State: AOJu0YxCdYgBbEW+nM7he8GTmNlZ6JuGEhXCjwiVGeMdFUT3iuUD4C1I
	C2TyKxCddE5VhEZ/6E65r+OADrQ8kI5mWVpnAik=
X-Google-Smtp-Source: AGHT+IGyV/DzQ33SPivIevGLE1kRxTsFwo9lpD7BjX505lQKtYlOOWBcKRiM6LPqboZcKemA5Yynh71DeWyMMGacpCA=
X-Received: by 2002:a81:8497:0:b0:583:b72c:883b with SMTP id
 u145-20020a818497000000b00583b72c883bmr770358ywf.11.1695161510875; Tue, 19
 Sep 2023 15:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230816110211.79747-1-adrian.freihofer@siemens.com> <20230816110211.79747-2-adrian.freihofer@siemens.com>
In-Reply-To: <20230816110211.79747-2-adrian.freihofer@siemens.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 19 Sep 2023 15:11:39 -0700
Message-ID: <CANx9H-DnN=BTR5RxpS1H6ayw+hJ_BuRDnW62dSqUC4UjFP2aLw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2 1/1] dmidecode: fixup for CVE-2023-30630
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000b1551c0605bd8be3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187884

--000000000000b1551c0605bd8be3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 4:02=E2=80=AFAM Adrian Freihofer <adrian.freihofer@=
gmail.com>
wrote:

> The previous CVE-2023-30630_1.patch picked only the patch
> "dmidecode: Write the whole dump file at once" d8cfbc808f.
> But there was a refactoring which does not allow to cherry-pick it fast
> forward. Resolving this conflict was not correctly done. The patch was:
>
> +    u32 len;
> +    u8 *table;
> ...
> -    if (!(opt.flags & FLAG_QUIET))
> -        pr_comment("Writing %d bytes to %s.", crafted[0x05],
> -                   opt.dumpfile);
> -    write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
> +    dmi_table_dump(crafted, crafted[0x05], table, len);
>
> It looks like the variables len and table have been added without
> initialization.
> Now this problem is solved by applying the previous refactoring as
> well. Patch 1 gets replaced by Patch 1a and Patch 1b. Patch 2..4 are
> rebased without changes.
>
>
Thank you for fixing a problem that we have been chasing since 28 July!


> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../dmidecode/CVE-2023-30630_1a.patch         | 236 ++++++++++++++++++
>  ...-30630_1.patch =3D> CVE-2023-30630_1b.patch} | 126 ++++------
>  .../dmidecode/CVE-2023-30630_2.patch          |  11 +-
>  .../dmidecode/CVE-2023-30630_3.patch          |  60 ++---
>  .../dmidecode/CVE-2023-30630_4.patch          | 149 +++++------
>  .../dmidecode/dmidecode_3.3.bb                |   3 +-
>  6 files changed, 394 insertions(+), 191 deletions(-)
>  create mode 100644
> meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
>  rename meta/recipes-devtools/dmidecode/dmidecode/{CVE-2023-30630_1.patch
> =3D> CVE-2023-30630_1b.patch} (63%)
>
> diff --git
> a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
> b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
> new file mode 100644
> index 0000000000..bf93fbc13c
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
> @@ -0,0 +1,236 @@
> +From ee6db10dd70b8fdc7a93cffd7cf5bc7a28f9d3d7 Mon Sep 17 00:00:00 2001
> +From: Jean Delvare <jdelvare@suse.de>
> +Date: Mon, 20 Feb 2023 14:53:21 +0100
> +Subject: [PATCH 1/5] dmidecode: Split table fetching from decoding
> +
> +Clean up function dmi_table so that it does only one thing:
> +* dmi_table() is renamed to dmi_table_get(). It now retrieves the
> +  DMI table, but does not process it any longer.
> +* Decoding or dumping the table is now done in smbios3_decode(),
> +  smbios_decode() and legacy_decode().
> +No functional change.
> +
> +A side effect of this change is that writing the header and body of
> +dump files is now done in a single location. This is required to
> +further consolidate the writing of dump files.
> +
> +Signed-off-by: Jean Delvare <jdelvare@suse.de>
> +Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
> +
> +CVE: CVE-2023-30630
> +
> +Upstream-Status: Backport [
> https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3D39b2dd7b6=
ab719b920e96ed832cfb4bdd664e808
> ]
> +
> +Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> +---
> + dmidecode.c | 86 ++++++++++++++++++++++++++++++++++++++---------------
> + 1 file changed, 62 insertions(+), 24 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index cd2b5c9..b082c03 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -5247,8 +5247,9 @@ static void dmi_table_decode(u8 *buf, u32 len, u16
> num, u16 ver, u32 flags)
> +       }
> + }
> +
> +-static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char
> *devmem,
> +-                    u32 flags)
> ++/* Allocates a buffer for the table, must be freed by the caller */
> ++static u8 *dmi_table_get(off_t base, u32 *len, u16 num, u32 ver,
> ++                       const char *devmem, u32 flags)
> + {
> +       u8 *buf;
> +
> +@@ -5267,7 +5268,7 @@ static void dmi_table(off_t base, u32 len, u16 num=
,
> u32 ver, const char *devmem,
> +               {
> +                       if (num)
> +                               pr_info("%u structures occupying %u
> bytes.",
> +-                                      num, len);
> ++                                      num, *len);
> +                       if (!(opt.flags & FLAG_FROM_DUMP))
> +                               pr_info("Table at 0x%08llX.",
> +                                       (unsigned long long)base);
> +@@ -5285,19 +5286,19 @@ static void dmi_table(off_t base, u32 len, u16
> num, u32 ver, const char *devmem,
> +                * would be the result of the kernel truncating the table
> on
> +                * parse error.
> +                */
> +-              size_t size =3D len;
> ++              size_t size =3D *len;
> +               buf =3D read_file(flags & FLAG_NO_FILE_OFFSET ? 0 : base,
> +                       &size, devmem);
> +-              if (!(opt.flags & FLAG_QUIET) && num && size !=3D
> (size_t)len)
> ++              if (!(opt.flags & FLAG_QUIET) && num && size !=3D
> (size_t)*len)
> +               {
> +                       fprintf(stderr, "Wrong DMI structures length: %u
> bytes "
> +                               "announced, only %lu bytes available.\n",
> +-                              len, (unsigned long)size);
> ++                              *len, (unsigned long)size);
> +               }
> +-              len =3D size;
> ++              *len =3D size;
> +       }
> +       else
> +-              buf =3D mem_chunk(base, len, devmem);
> ++              buf =3D mem_chunk(base, *len, devmem);
> +
> +       if (buf =3D=3D NULL)
> +       {
> +@@ -5307,15 +5308,9 @@ static void dmi_table(off_t base, u32 len, u16
> num, u32 ver, const char *devmem,
> +                       fprintf(stderr,
> +                               "Try compiling dmidecode with
> -DUSE_MMAP.\n");
> + #endif
> +-              return;
> +       }
> +
> +-      if (opt.flags & FLAG_DUMP_BIN)
> +-              dmi_table_dump(buf, len);
> +-      else
> +-              dmi_table_decode(buf, len, num, ver >> 8, flags);
> +-
> +-      free(buf);
> ++      return buf;
> + }
> +
> +
> +@@ -5350,8 +5345,9 @@ static void overwrite_smbios3_address(u8 *buf)
> +
> + static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> +-      u32 ver;
> ++      u32 ver, len;
> +       u64 offset;
> ++      u8 *table;
> +
> +       /* Don't let checksum run beyond the buffer */
> +       if (buf[0x06] > 0x20)
> +@@ -5377,8 +5373,12 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               return 0;
> +       }
> +
> +-      dmi_table(((off_t)offset.h << 32) | offset.l,
> +-                DWORD(buf + 0x0C), 0, ver, devmem, flags |
> FLAG_STOP_AT_EOT);
> ++      /* Maximum length, may get trimmed */
> ++      len =3D DWORD(buf + 0x0C);
> ++      table =3D dmi_table_get(((off_t)offset.h << 32) | offset.l, &len,=
 0,
> ver,
> ++                            devmem, flags | FLAG_STOP_AT_EOT);
> ++      if (table =3D=3D NULL)
> ++              return 1;
> +
> +       if (opt.flags & FLAG_DUMP_BIN)
> +       {
> +@@ -5387,18 +5387,28 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               memcpy(crafted, buf, 32);
> +               overwrite_smbios3_address(crafted);
> +
> ++              dmi_table_dump(table, len);
> +               if (!(opt.flags & FLAG_QUIET))
> +                       pr_comment("Writing %d bytes to %s.",
> crafted[0x06],
> +                                  opt.dumpfile);
> +               write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
> +       }
> ++      else
> ++      {
> ++              dmi_table_decode(table, len, 0, ver >> 8,
> ++                               flags | FLAG_STOP_AT_EOT);
> ++      }
> ++
> ++      free(table);
> +
> +       return 1;
> + }
> +
> + static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> +-      u16 ver;
> ++      u16 ver, num;
> ++      u32 len;
> ++      u8 *table;
> +
> +       /* Don't let checksum run beyond the buffer */
> +       if (buf[0x05] > 0x20)
> +@@ -5438,8 +5448,13 @@ static int smbios_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               pr_info("SMBIOS %u.%u present.",
> +                       ver >> 8, ver & 0xFF);
> +
> +-      dmi_table(DWORD(buf + 0x18), WORD(buf + 0x16), WORD(buf + 0x1C),
> +-              ver << 8, devmem, flags);
> ++      /* Maximum length, may get trimmed */
> ++      len =3D WORD(buf + 0x16);
> ++      num =3D WORD(buf + 0x1C);
> ++      table =3D dmi_table_get(DWORD(buf + 0x18), &len, num, ver << 8,
> ++                            devmem, flags);
> ++      if (table =3D=3D NULL)
> ++              return 1;
> +
> +       if (opt.flags & FLAG_DUMP_BIN)
> +       {
> +@@ -5448,27 +5463,43 @@ static int smbios_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               memcpy(crafted, buf, 32);
> +               overwrite_dmi_address(crafted + 0x10);
> +
> ++              dmi_table_dump(table, len);
> +               if (!(opt.flags & FLAG_QUIET))
> +                       pr_comment("Writing %d bytes to %s.",
> crafted[0x05],
> +                                  opt.dumpfile);
> +               write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
> +       }
> ++      else
> ++      {
> ++              dmi_table_decode(table, len, num, ver, flags);
> ++      }
> ++
> ++      free(table);
> +
> +       return 1;
> + }
> +
> + static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
> + {
> ++      u16 ver, num;
> ++      u32 len;
> ++      u8 *table;
> ++
> +       if (!checksum(buf, 0x0F))
> +               return 0;
> +
> ++      ver =3D ((buf[0x0E] & 0xF0) << 4) + (buf[0x0E] & 0x0F);
> +       if (!(opt.flags & FLAG_QUIET))
> +               pr_info("Legacy DMI %u.%u present.",
> +                       buf[0x0E] >> 4, buf[0x0E] & 0x0F);
> +
> +-      dmi_table(DWORD(buf + 0x08), WORD(buf + 0x06), WORD(buf + 0x0C),
> +-              ((buf[0x0E] & 0xF0) << 12) + ((buf[0x0E] & 0x0F) << 8),
> +-              devmem, flags);
> ++      /* Maximum length, may get trimmed */
> ++      len =3D WORD(buf + 0x06);
> ++      num =3D WORD(buf + 0x0C);
> ++      table =3D dmi_table_get(DWORD(buf + 0x08), &len, num, ver << 8,
> ++                            devmem, flags);
> ++      if (table =3D=3D NULL)
> ++              return 1;
> +
> +       if (opt.flags & FLAG_DUMP_BIN)
> +       {
> +@@ -5477,11 +5508,18 @@ static int legacy_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               memcpy(crafted, buf, 16);
> +               overwrite_dmi_address(crafted);
> +
> ++              dmi_table_dump(table, len);
> +               if (!(opt.flags & FLAG_QUIET))
> +                       pr_comment("Writing %d bytes to %s.", 0x0F,
> +                                  opt.dumpfile);
> +               write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
> +       }
> ++      else
> ++      {
> ++              dmi_table_decode(table, len, num, ver, flags);
> ++      }
> ++
> ++      free(table);
> +
> +       return 1;
> + }
> +--
> +2.41.0
> +
> diff --git
> a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
> similarity index 63%
> rename from
> meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> rename to meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.pat=
ch
> index 53480d6299..e03bda05e4 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
> @@ -1,7 +1,7 @@
> -From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 2001
> +From d362549bce92ac22860cda8cad4532c1a3fe6928 Mon Sep 17 00:00:00 2001
>  From: Jean Delvare <jdelvare@suse.de>
> -Date: Tue, 27 Jun 2023 09:40:23 +0000
> -Subject: [PATCH] dmidecode: Write the whole dump file at once
> +Date: Mon, 20 Feb 2023 14:53:25 +0100
> +Subject: [PATCH 2/5] dmidecode: Write the whole dump file at once
>
>  When option --dump-bin is used, write the whole dump file at once,
>  instead of opening and closing the file separately for the table
> @@ -19,25 +19,23 @@ Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
>
>  CVE: CVE-2023-30630
>
> -Reference:
> https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4=
bdd664e808
> +Upstream-Status
> <https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb=
4bdd664e808+Upstream-Status>:
> Backport [
> https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=3Dd8cfbc808=
f387e87091c25e7d5b8c2bb348bb206
> ]
>
> -Upstream-Status: Backport [
> https://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c25e7d5b8c2=
bb348bb206
> ]
> -
> -Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>  ---
> - dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------
> - util.c      | 40 ---------------------------
> + dmidecode.c | 69 +++++++++++++++++++++++++++++++++++++++--------------
> + util.c      | 40 -------------------------------
>   util.h      |  1 -
> - 3 files changed, 58 insertions(+), 62 deletions(-)
> + 3 files changed, 51 insertions(+), 59 deletions(-)
>
>  diff --git a/dmidecode.c b/dmidecode.c
> -index 9aeff91..5477309 100644
> +index b082c03..a80a140 100644
>  --- a/dmidecode.c
>  +++ b/dmidecode.c
> -@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct
> dmi_header *h, const u8 *data, u16 ver
> -       }
> +@@ -5130,11 +5130,56 @@ static void dmi_table_string(const struct
> dmi_header *h, const u8 *data, u16 ver
> +       }
>   }
> -
> +
>  -static void dmi_table_dump(const u8 *buf, u32 len)
>  +static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
>  +                        u32 table_len)
> @@ -68,7 +66,7 @@ index 9aeff91..5477309 100644
>  +              goto err_close;
>  +      }
>  +
> -       if (!(opt.flags & FLAG_QUIET))
> +       if (!(opt.flags & FLAG_QUIET))
>  -              pr_comment("Writing %d bytes to %s.", len, opt.dumpfile);
>  -      write_dump(32, len, buf, opt.dumpfile, 0);
>  +              pr_comment("Writing %d bytes to %s.", table_len,
> opt.dumpfile);
> @@ -92,94 +90,55 @@ index 9aeff91..5477309 100644
>  +      fclose(f);
>  +      return -1;
>   }
> -
> +
>   static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32
> flags)
> -@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16
> num, u32 ver, const char *devmem,
> -               return;
> -       }
> -
> --      if (opt.flags & FLAG_DUMP_BIN)
> --              dmi_table_dump(buf, len);
> --      else
> --              dmi_table_decode(buf, len, num, ver >> 8, flags);
> --
> -       free(buf);
> - }
> -
> -@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
> -
> - static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
> - {
> --      u32 ver;
> -+      u32 ver, len;
> -       u64 offset;
> -+      u8 *table;
> -
> -       /* Don't let checksum run beyond the buffer */
> -       if (buf[0x06] > 0x20)
> -@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> -               memcpy(crafted, buf, 32);
> -               overwrite_smbios3_address(crafted);
> -
> +@@ -5387,11 +5432,7 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               memcpy(crafted, buf, 32);
> +               overwrite_smbios3_address(crafted);
> +
> +-              dmi_table_dump(table, len);
>  -              if (!(opt.flags & FLAG_QUIET))
>  -                      pr_comment("Writing %d bytes to %s.",
> crafted[0x06],
>  -                                 opt.dumpfile);
>  -              write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
>  +              dmi_table_dump(crafted, crafted[0x06], table, len);
> -       }
> -
> -       return 1;
> -@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> - static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
> - {
> -       u16 ver;
> -+      u32 len;
> -+        u8 *table;
> -
> -       /* Don't let checksum run beyond the buffer */
> -       if (buf[0x05] > 0x20)
> -@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char
> *devmem, u32 flags)
> -               memcpy(crafted, buf, 32);
> -               overwrite_dmi_address(crafted + 0x10);
> -
> +       }
> +       else
> +       {
> +@@ -5463,11 +5504,7 @@ static int smbios_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               memcpy(crafted, buf, 32);
> +               overwrite_dmi_address(crafted + 0x10);
> +
> +-              dmi_table_dump(table, len);
>  -              if (!(opt.flags & FLAG_QUIET))
>  -                      pr_comment("Writing %d bytes to %s.",
> crafted[0x05],
>  -                                 opt.dumpfile);
>  -              write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
>  +              dmi_table_dump(crafted, crafted[0x05], table, len);
> -       }
> -
> -       return 1;
> -@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char
> *devmem, u32 flags)
> -
> - static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
> - {
> -+      u32 len;
> -+      u8 *table;
> -+
> -       if (!checksum(buf, 0x0F))
> -               return 0;
> -
> -@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char
> *devmem, u32 flags)
> -               memcpy(crafted, buf, 16);
> -               overwrite_dmi_address(crafted);
> -
> +       }
> +       else
> +       {
> +@@ -5508,11 +5545,7 @@ static int legacy_decode(u8 *buf, const char
> *devmem, u32 flags)
> +               memcpy(crafted, buf, 16);
> +               overwrite_dmi_address(crafted);
> +
> +-              dmi_table_dump(table, len);
>  -              if (!(opt.flags & FLAG_QUIET))
>  -                      pr_comment("Writing %d bytes to %s.", 0x0F,
>  -                                 opt.dumpfile);
>  -              write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
>  +              dmi_table_dump(crafted, 0x0F, table, len);
> -       }
> -
> -       return 1;
> +       }
> +       else
> +       {
>  diff --git a/util.c b/util.c
>  index 04aaadd..1547096 100644
>  --- a/util.c
>  +++ b/util.c
>  @@ -259,46 +259,6 @@ out:
> -       return p;
> +       return p;
>   }
> -
> +
>  -int write_dump(size_t base, size_t len, const void *data, const char
> *dumpfile, int add)
>  -{
>  -      FILE *f;
> @@ -233,5 +192,6 @@ index 3094cf8..ef24eb9 100644
>   void *mem_chunk(off_t base, size_t len, const char *devmem);
>  -int write_dump(size_t base, size_t len, const void *data, const char
> *dumpfile, int add);
>   u64 u64_range(u64 start, u64 end);
> ---
> -2.35.5
> +--
> +2.41.0
> +
> diff --git
> a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> index 9f53a205ac..37167a9c4f 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
> @@ -1,7 +1,8 @@
> -From 47101389dd52b50123a3ec59fed4d2021752e489 Mon Sep 17 00:00:00 2001
> +From 2d26f187c734635d072d24ea401255b84f03f4c4 Mon Sep 17 00:00:00 2001
>  From: Jean Delvare <jdelvare@suse.de>
>  Date: Tue, 27 Jun 2023 10:03:53 +0000
> -Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing
> file
> +Subject: [PATCH 3/5] dmidecode: Do not let --dump-bin overwrite an
> existing
> + file
>
>  Make sure that the file passed to option --dump-bin does not already
>  exist. In practice, it is rather unlikely that an honest user would
> @@ -17,14 +18,13 @@ Upstream-Status: Backport
>  [
> https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70=
bdda72e6f2
> ]
>
>  Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> -
>  ---
>   dmidecode.c     | 14 ++++++++++++--
>   man/dmidecode.8 |  3 ++-
>   2 files changed, 14 insertions(+), 3 deletions(-)
>
>  diff --git a/dmidecode.c b/dmidecode.c
> -index ae461de..6446040 100644
> +index a80a140..32a77cc 100644
>  --- a/dmidecode.c
>  +++ b/dmidecode.c
>  @@ -60,6 +60,7 @@
> @@ -78,3 +78,6 @@ index 64dc7e7..d5b7f01 100644
>   .TP
>   .BR "  " "  " "--from-dump FILE"
>   Read the DMI data from a binary file previously generated using
> +--
> +2.41.0
> +
> diff --git
> a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> index 01d0d1f867..181092a3fd 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
> @@ -1,7 +1,8 @@
> -From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
> +From ac881f801b92b57fd8daac65fb16fff6d84fd366 Mon Sep 17 00:00:00 2001
>  From: Jean Delvare <jdelvare@suse.de>
>  Date: Tue, 27 Jun 2023 10:25:50 +0000
> -Subject: [PATCH] Consistently use read_file() when reading from a dump
> file
> +Subject: [PATCH 4/5] Consistently use read_file() when reading from a du=
mp
> + file
>
>  Use read_file() instead of mem_chunk() to read the entry point from a
>  dump file. This is faster, and consistent with how we then read the
> @@ -27,26 +28,26 @@ Signed-off-by: Yogita Urade <
> yogita.urade@windriver.com>
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
>  diff --git a/dmidecode.c b/dmidecode.c
> -index 98f9692..b4dbc9d 100644
> +index 32a77cc..9a691e0 100644
>  --- a/dmidecode.c
>  +++ b/dmidecode.c
> -@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
> -               pr_comment("dmidecode %s", VERSION);
> -
> -       /* Read from dump if so instructed */
> +@@ -5693,17 +5693,25 @@ int main(int argc, char * const argv[])
> +               pr_comment("dmidecode %s", VERSION);
> +
> +       /* Read from dump if so instructed */
>  +        size =3D 0x20;
> -       if (opt.flags & FLAG_FROM_DUMP)
> -       {
> -               if (!(opt.flags & FLAG_QUIET))
> -                       pr_info("Reading SMBIOS/DMI data from file %s.",
> -                               opt.dumpfile);
> +       if (opt.flags & FLAG_FROM_DUMP)
> +       {
> +               if (!(opt.flags & FLAG_QUIET))
> +                       pr_info("Reading SMBIOS/DMI data from file %s.",
> +                               opt.dumpfile);
>  -              if ((buf =3D mem_chunk(0, 0x20, opt.dumpfile)) =3D=3D NUL=
L)
>  +                if ((buf =3D read_file(0, &size, opt.dumpfile)) =3D=3D =
NULL)
> -               {
> -                       ret =3D 1;
> -                       goto exit_free;
> -               }
> -
> +               {
> +                       ret =3D 1;
> +                       goto exit_free;
> +               }
> +
>  +                /* Truncated entry point can't be processed */
>  +                if (size < 0x20)
>  +                {
> @@ -54,16 +55,17 @@ index 98f9692..b4dbc9d 100644
>  +                        goto done;
>  +                }
>  +
> -               if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> -               {
> -                       if (smbios3_decode(buf, opt.dumpfile, 0))
> -@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
> -        * contain one of several types of entry points, so read enough f=
or
> -        * the largest one, then determine what type it contains.
> -        */
> +               if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +               {
> +                       if (smbios3_decode(buf, opt.dumpfile, 0))
> +@@ -5727,7 +5735,6 @@ int main(int argc, char * const argv[])
> +        * contain one of several types of entry points, so read enough f=
or
> +        * the largest one, then determine what type it contains.
> +        */
>  -      size =3D 0x20;
> -       if (!(opt.flags & FLAG_NO_SYSFS)
> -        && (buf =3D read_file(0, &size, SYS_ENTRY_FILE)) !=3D NULL)
> -       {
> ---
> -2.40.0
> +       if (!(opt.flags & FLAG_NO_SYSFS)
> +        && (buf =3D read_file(0, &size, SYS_ENTRY_FILE)) !=3D NULL)
> +       {
> +--
> +2.41.0
> +
> diff --git
> a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> index 5fa72b4f9b..b7d7f4ff96 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
> @@ -1,7 +1,7 @@
> -From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
> +From 2fb126eef436389a2dc48d4225b4a9888b0625a8 Mon Sep 17 00:00:00 2001
>  From: Jean Delvare <jdelvare@suse.de>
>  Date: Tue, 27 Jun 2023 10:58:11 +0000
> -Subject: [PATCH] Don't read beyond sysfs entry point buffer
> +Subject: [PATCH 5/5] Don't read beyond sysfs entry point buffer
>
>  Functions smbios_decode() and smbios3_decode() include a check
>  against buffer overrun. This check assumes that the buffer length is
> @@ -33,105 +33,106 @@ Signed-off-by: Yogita Urade <
> yogita.urade@windriver.com>
>   1 file changed, 12 insertions(+), 12 deletions(-)
>
>  diff --git a/dmidecode.c b/dmidecode.c
> -index b4dbc9d..870d94e 100644
> +index 9a691e0..e725801 100644
>  --- a/dmidecode.c
>  +++ b/dmidecode.c
> -@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
> -       buf[0x17] =3D 0;
> +@@ -5398,14 +5398,14 @@ static void overwrite_smbios3_address(u8 *buf)
> +       buf[0x17] =3D 0;
>   }
> -
> +
>  -static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
>  +static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem,
> u32 flags)
>   {
> -       u32 ver, len;
> -       u64 offset;
> -       u8 *table;
> -
> -       /* Don't let checksum run beyond the buffer */
> +       u32 ver, len;
> +       u64 offset;
> +       u8 *table;
> +
> +       /* Don't let checksum run beyond the buffer */
>  -      if (buf[0x06] > 0x20)
>  +        if (buf[0x06] > buf_len)
> -       {
> -               fprintf(stderr,
> -                       "Entry point length too large (%u bytes, expected
> %u).\n",
> -@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> -       return 1;
> +       {
> +               fprintf(stderr,
> +                       "Entry point length too large (%u bytes, expected
> %u).\n",
> +@@ -5455,14 +5455,14 @@ static int smbios3_decode(u8 *buf, const char
> *devmem, u32 flags)
> +       return 1;
>   }
> -
> +
>  -static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
>  +static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem,
> u32 flags)
>   {
> -       u16 ver;
> -       u32 len;
> -         u8 *table;
> -
> -       /* Don't let checksum run beyond the buffer */
> +       u16 ver, num;
> +       u32 len;
> +       u8 *table;
> +
> +       /* Don't let checksum run beyond the buffer */
>  -      if (buf[0x05] > 0x20)
>  +        if (buf[0x05] > buf_len)
> -       {
> -               fprintf(stderr,
> -                       "Entry point length too large (%u bytes, expected
> %u).\n",
> -@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
> -
> -               if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> -               {
> +       {
> +               fprintf(stderr,
> +                       "Entry point length too large (%u bytes, expected
> %u).\n",
> +@@ -5714,12 +5714,12 @@ int main(int argc, char * const argv[])
> +
> +               if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +               {
>  -                      if (smbios3_decode(buf, opt.dumpfile, 0))
>  +                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
> -                               found++;
> -               }
> -               else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> -               {
> +                               found++;
> +               }
> +               else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> +               {
>  -                      if (smbios_decode(buf, opt.dumpfile, 0))
>  +                        if (smbios_decode(buf, size, opt.dumpfile, 0))
> -                               found++;
> -               }
> -               else if (memcmp(buf, "_DMI_", 5) =3D=3D 0)
> -@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
> -                       pr_info("Getting SMBIOS data from sysfs.");
> -               if (size >=3D 24 && memcmp(buf, "_SM3_", 5) =3D=3D 0)
> -               {
> +                               found++;
> +               }
> +               else if (memcmp(buf, "_DMI_", 5) =3D=3D 0)
> +@@ -5742,12 +5742,12 @@ int main(int argc, char * const argv[])
> +                       pr_info("Getting SMBIOS data from sysfs.");
> +               if (size >=3D 24 && memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +               {
>  -                      if (smbios3_decode(buf, SYS_TABLE_FILE,
> FLAG_NO_FILE_OFFSET))
>  +                        if (smbios3_decode(buf, size, SYS_TABLE_FILE,
> FLAG_NO_FILE_OFFSET))
> -                               found++;
> -               }
> -               else if (size >=3D 31 && memcmp(buf, "_SM_", 4) =3D=3D 0)
> -               {
> +                               found++;
> +               }
> +               else if (size >=3D 31 && memcmp(buf, "_SM_", 4) =3D=3D 0)
> +               {
>  -                      if (smbios_decode(buf, SYS_TABLE_FILE,
> FLAG_NO_FILE_OFFSET))
>  +                        if (smbios_decode(buf, size, SYS_TABLE_FILE,
> FLAG_NO_FILE_OFFSET))
> -                               found++;
> -               }
> -               else if (size >=3D 15 && memcmp(buf, "_DMI_", 5) =3D=3D 0=
)
> -@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
> -
> -       if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> -       {
> +                               found++;
> +               }
> +               else if (size >=3D 15 && memcmp(buf, "_DMI_", 5) =3D=3D 0=
)
> +@@ -5784,12 +5784,12 @@ int main(int argc, char * const argv[])
> +
> +       if (memcmp(buf, "_SM3_", 5) =3D=3D 0)
> +       {
>  -              if (smbios3_decode(buf, opt.devmem, 0))
>  +                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
> -                       found++;
> -       }
> -       else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> -       {
> +                       found++;
> +       }
> +       else if (memcmp(buf, "_SM_", 4) =3D=3D 0)
> +       {
>  -              if (smbios_decode(buf, opt.devmem, 0))
>  +                if (smbios_decode(buf, 0x20, opt.devmem, 0))
> -                       found++;
> -       }
> -       goto done;
> -@@ -6114,7 +6114,7 @@ memory_scan:
> -       {
> -               if (memcmp(buf + fp, "_SM3_", 5) =3D=3D 0)
> -               {
> +                       found++;
> +       }
> +       goto done;
> +@@ -5810,7 +5810,7 @@ memory_scan:
> +       {
> +               if (memcmp(buf + fp, "_SM3_", 5) =3D=3D 0)
> +               {
>  -                      if (smbios3_decode(buf + fp, opt.devmem, 0))
>  +                        if (smbios3_decode(buf + fp, 0x20, opt.devmem,
> 0))
> -                       {
> -                               found++;
> -                               goto done;
> -@@ -6127,7 +6127,7 @@ memory_scan:
> -       {
> -               if (memcmp(buf + fp, "_SM_", 4) =3D=3D 0 && fp <=3D 0xFFE=
0)
> -               {
> +                       {
> +                               found++;
> +                               goto done;
> +@@ -5823,7 +5823,7 @@ memory_scan:
> +       {
> +               if (memcmp(buf + fp, "_SM_", 4) =3D=3D 0 && fp <=3D 0xFFE=
0)
> +               {
>  -                      if (smbios_decode(buf + fp, opt.devmem, 0))
>  +                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0=
))
> -                       {
> -                               found++;
> -                               goto done;
> ---
> -2.35.5
> +                       {
> +                               found++;
> +                               goto done;
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
> b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
> index b99c2ea99d..c0f6b45313 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
>             file://0001-Committing-changes-from-do_unpack_extra.patch \
> -           file://CVE-2023-30630_1.patch \
> +           file://CVE-2023-30630_1a.patch \
> +           file://CVE-2023-30630_1b.patch \
>             file://CVE-2023-30630_2.patch \
>             file://CVE-2023-30630_3.patch \
>             file://CVE-2023-30630_4.patch \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186131):
> https://lists.openembedded.org/g/openembedded-core/message/186131
> Mute This Topic: https://lists.openembedded.org/mt/100776995/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b1551c0605bd8be3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 16, 2023 at 4:02=E2=80=AF=
AM Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.com">adria=
n.freihofer@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The previous CVE-2023-30630_1.patch picked only the pa=
tch<br>
&quot;dmidecode: Write the whole dump file at once&quot; d8cfbc808f.<br>
But there was a refactoring which does not allow to cherry-pick it fast<br>
forward. Resolving this conflict was not correctly done. The patch was:<br>
<br>
+=C2=A0 =C2=A0 u32 len;<br>
+=C2=A0 =C2=A0 u8 *table;<br>
...<br>
-=C2=A0 =C2=A0 if (!(opt.flags &amp; FLAG_QUIET))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_comment(&quot;Writing %d bytes to %s.&quot;=
, crafted[0x05],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt.d=
umpfile);<br>
-=C2=A0 =C2=A0 write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);<br>
+=C2=A0 =C2=A0 dmi_table_dump(crafted, crafted[0x05], table, len);<br>
<br>
It looks like the variables len and table have been added without<br>
initialization.<br>
Now this problem is solved by applying the previous refactoring as<br>
well. Patch 1 gets replaced by Patch 1a and Patch 1b. Patch 2..4 are<br>
rebased without changes.<br>
<br></blockquote><div><br></div><div>Thank you for fixing a problem that we=
 have been chasing since 28 July!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../dmidecode/CVE-2023-30630_1a.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 236 ++++++++++++++++++<br>
=C2=A0...-30630_1.patch =3D&gt; CVE-2023-30630_1b.patch} | 126 ++++------<b=
r>
=C2=A0.../dmidecode/CVE-2023-30630_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 11 +-<br>
=C2=A0.../dmidecode/CVE-2023-30630_3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 60 ++---<br>
=C2=A0.../dmidecode/CVE-2023-30630_4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 149 +++++------<br>
=C2=A0.../dmidecode/<a href=3D"http://dmidecode_3.3.bb" rel=3D"noreferrer" =
target=3D"_blank">dmidecode_3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A06 files changed, 394 insertions(+), 191 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023=
-30630_1a.patch<br>
=C2=A0rename meta/recipes-devtools/dmidecode/dmidecode/{CVE-2023-30630_1.pa=
tch =3D&gt; CVE-2023-30630_1b.patch} (63%)<br>
<br>
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.pa=
tch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch<br>
new file mode 100644<br>
index 0000000000..bf93fbc13c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch<br>
@@ -0,0 +1,236 @@<br>
+From ee6db10dd70b8fdc7a93cffd7cf5bc7a28f9d3d7 Mon Sep 17 00:00:00 2001<br>
+From: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.de" target=3D"_blan=
k">jdelvare@suse.de</a>&gt;<br>
+Date: Mon, 20 Feb 2023 14:53:21 +0100<br>
+Subject: [PATCH 1/5] dmidecode: Split table fetching from decoding<br>
+<br>
+Clean up function dmi_table so that it does only one thing:<br>
+* dmi_table() is renamed to dmi_table_get(). It now retrieves the<br>
+=C2=A0 DMI table, but does not process it any longer.<br>
+* Decoding or dumping the table is now done in smbios3_decode(),<br>
+=C2=A0 smbios_decode() and legacy_decode().<br>
+No functional change.<br>
+<br>
+A side effect of this change is that writing the header and body of<br>
+dump files is now done in a single location. This is required to<br>
+further consolidate the writing of dump files.<br>
+<br>
+Signed-off-by: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.de" target=
=3D"_blank">jdelvare@suse.de</a>&gt;<br>
+Reviewed-by: Jerry Hoemann &lt;<a href=3D"mailto:jerry.hoemann@hpe.com" ta=
rget=3D"_blank">jerry.hoemann@hpe.com</a>&gt;<br>
+<br>
+CVE: CVE-2023-30630<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.savannah.nongnu.org/cgit=
/dmidecode.git/commit/?id=3D39b2dd7b6ab719b920e96ed832cfb4bdd664e808" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.nongnu.org/cgit/dmid=
ecode.git/commit/?id=3D39b2dd7b6ab719b920e96ed832cfb4bdd664e808</a>]<br>
+<br>
+Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@sie=
mens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
+---<br>
+ dmidecode.c | 86 ++++++++++++++++++++++++++++++++++++++---------------<br=
>
+ 1 file changed, 62 insertions(+), 24 deletions(-)<br>
+<br>
+diff --git a/dmidecode.c b/dmidecode.c<br>
+index cd2b5c9..b082c03 100644<br>
+--- a/dmidecode.c<br>
++++ b/dmidecode.c<br>
+@@ -5247,8 +5247,9 @@ static void dmi_table_decode(u8 *buf, u32 len, u16 n=
um, u16 ver, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *=
devmem,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32=
 flags)<br>
++/* Allocates a buffer for the table, must be freed by the caller */<br>
++static u8 *dmi_table_get(off_t base, u32 *len, u16 num, u32 ver,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *devmem, u32 flags)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf;<br>
+ <br>
+@@ -5267,7 +5268,7 @@ static void dmi_table(off_t base, u32 len, u16 num, =
u32 ver, const char *devmem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (num)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;%u structures occupying=
 %u bytes.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num, len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num, *len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!(opt.flags &amp; FLAG_FROM_DUMP))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;Table at 0x%08llX.&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned=
 long long)base);<br>
+@@ -5285,19 +5286,19 @@ static void dmi_table(off_t base, u32 len, u16 num=
, u32 ver, const char *devmem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * would be the res=
ult of the kernel truncating the table on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * parse error.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size =3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size =3D *len;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D read_file(f=
lags &amp; FLAG_NO_FILE_OFFSET ? 0 : base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;size, devmem);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(opt.flags &amp; FL=
AG_QUIET) &amp;&amp; num &amp;&amp; size !=3D (size_t)len)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(opt.flags &amp; FL=
AG_QUIET) &amp;&amp; num &amp;&amp; size !=3D (size_t)*len)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fprintf(stderr, &quot;Wrong DMI structures length: %u bytes &quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;announced, only %lu bytes avail=
able.\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len, (unsigned long)size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *len, (unsigned long)size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *len =3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D mem_chunk(base, =
len, devmem);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D mem_chunk(base, =
*len, devmem);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -5307,15 +5308,9 @@ static void dmi_table(off_t base, u32 len, u16 num,=
 u32 ver, const char *devmem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Try compiling dmidecode with -D=
USE_MMAP.\n&quot;);<br>
+ #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (opt.flags &amp; FLAG_DUMP_BIN)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(buf, len)=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_decode(buf, le=
n, num, ver &gt;&gt; 8, flags);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 free(buf);<br>
++=C2=A0 =C2=A0 =C2=A0 return buf;<br>
+ }<br>
+ <br>
+ <br>
+@@ -5350,8 +5345,9 @@ static void overwrite_smbios3_address(u8 *buf)<br>
+ <br>
+ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 u32 ver;<br>
++=C2=A0 =C2=A0 =C2=A0 u32 ver, len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset;<br>
++=C2=A0 =C2=A0 =C2=A0 u8 *table;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0x06] &gt; 0x20)<br>
+@@ -5377,8 +5373,12 @@ static int smbios3_decode(u8 *buf, const char *devm=
em, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 dmi_table(((off_t)offset.h &lt;&lt; 32) | offset.l,<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWORD(buf + 0x0C)=
, 0, ver, devmem, flags | FLAG_STOP_AT_EOT);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Maximum length, may get trimmed */<br>
++=C2=A0 =C2=A0 =C2=A0 len =3D DWORD(buf + 0x0C);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D dmi_table_get(((off_t)offset.h &lt;&lt; 32=
) | offset.l, &amp;len, 0, ver,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 devmem, flags | FLAG_STOP_AT_EOT);<br>
++=C2=A0 =C2=A0 =C2=A0 if (table =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt.flags &amp; FLAG_DUMP_BIN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -5387,18 +5387,28 @@ static int smbios3_decode(u8 *buf, const char *dev=
mem, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_smbios3_a=
ddress(crafted);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(table, le=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &am=
p; FLAG_QUIET))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_comment(&quot;Writing %d bytes to %s.&quot;, crafted[0x06],<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt.dumpfile);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_dump(0, craft=
ed[0x06], crafted, opt.dumpfile, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_decode(table, =
len, 0, ver &gt;&gt; 8,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | FLAG_STOP_AT_EOT);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 free(table);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+ <br>
+ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 u16 ver;<br>
++=C2=A0 =C2=A0 =C2=A0 u16 ver, num;<br>
++=C2=A0 =C2=A0 =C2=A0 u32 len;<br>
++=C2=A0 =C2=A0 =C2=A0 u8 *table;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0x05] &gt; 0x20)<br>
+@@ -5438,8 +5448,13 @@ static int smbios_decode(u8 *buf, const char *devme=
m, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;SMBIO=
S %u.%u present.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ver &gt;&gt; 8, ver &amp; 0xFF);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 dmi_table(DWORD(buf + 0x18), WORD(buf + 0x16), WORD(=
buf + 0x1C),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ver &lt;&lt; 8, devmem, =
flags);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Maximum length, may get trimmed */<br>
++=C2=A0 =C2=A0 =C2=A0 len =3D WORD(buf + 0x16);<br>
++=C2=A0 =C2=A0 =C2=A0 num =3D WORD(buf + 0x1C);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D dmi_table_get(DWORD(buf + 0x18), &amp;len,=
 num, ver &lt;&lt; 8,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 devmem, flags);<br>
++=C2=A0 =C2=A0 =C2=A0 if (table =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt.flags &amp; FLAG_DUMP_BIN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -5448,27 +5463,43 @@ static int smbios_decode(u8 *buf, const char *devm=
em, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_dmi_addre=
ss(crafted + 0x10);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(table, le=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &am=
p; FLAG_QUIET))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_comment(&quot;Writing %d bytes to %s.&quot;, crafted[0x05],<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt.dumpfile);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_dump(0, craft=
ed[0x05], crafted, opt.dumpfile, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_decode(table, =
len, num, ver, flags);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 free(table);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+ <br>
+ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 u16 ver, num;<br>
++=C2=A0 =C2=A0 =C2=A0 u32 len;<br>
++=C2=A0 =C2=A0 =C2=A0 u8 *table;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!checksum(buf, 0x0F))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 ver =3D ((buf[0x0E] &amp; 0xF0) &lt;&lt; 4) + (buf[0=
x0E] &amp; 0x0F);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &amp; FLAG_QUIET))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;Legac=
y DMI %u.%u present.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf[0x0E] &gt;&gt; 4, buf[0x0E] &amp; 0x0F);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 dmi_table(DWORD(buf + 0x08), WORD(buf + 0x06), WORD(=
buf + 0x0C),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((buf[0x0E] &amp; 0xF0) =
&lt;&lt; 12) + ((buf[0x0E] &amp; 0x0F) &lt;&lt; 8),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devmem, flags);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Maximum length, may get trimmed */<br>
++=C2=A0 =C2=A0 =C2=A0 len =3D WORD(buf + 0x06);<br>
++=C2=A0 =C2=A0 =C2=A0 num =3D WORD(buf + 0x0C);<br>
++=C2=A0 =C2=A0 =C2=A0 table =3D dmi_table_get(DWORD(buf + 0x08), &amp;len,=
 num, ver &lt;&lt; 8,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 devmem, flags);<br>
++=C2=A0 =C2=A0 =C2=A0 if (table =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt.flags &amp; FLAG_DUMP_BIN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -5477,11 +5508,18 @@ static int legacy_decode(u8 *buf, const char *devm=
em, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_dmi_addre=
ss(crafted);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(table, le=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &am=
p; FLAG_QUIET))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_comment(&quot;Writing %d bytes to %s.&quot;, 0x0F,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opt.dumpfile);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_dump(0, 0x0F,=
 crafted, opt.dumpfile, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_decode(table, =
len, num, ver, flags);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 free(table);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.pat=
ch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch<br>
similarity index 63%<br>
rename from meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patc=
h<br>
rename to meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch=
<br>
index 53480d6299..e03bda05e4 100644<br>
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch<br>
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch<br>
@@ -1,7 +1,7 @@<br>
-From=C2=A0 d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 20=
01<br>
+From d362549bce92ac22860cda8cad4532c1a3fe6928 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.de" target=3D"=
_blank">jdelvare@suse.de</a>&gt;<br>
-Date: Tue, 27 Jun 2023 09:40:23 +0000<br>
-Subject: [PATCH] dmidecode: Write the whole dump file at once<br>
+Date: Mon, 20 Feb 2023 14:53:25 +0100<br>
+Subject: [PATCH 2/5] dmidecode: Write the whole dump file at once<br>
<br>
=C2=A0When option --dump-bin is used, write the whole dump file at once,<br=
>
=C2=A0instead of opening and closing the file separately for the table<br>
@@ -19,25 +19,23 @@ Reviewed-by: Jerry Hoemann &lt;<a href=3D"mailto:jerry.=
hoemann@hpe.com" target=3D"_blank">jerry.hoemann@hpe.com</a>&gt;<br>
<br>
=C2=A0CVE: CVE-2023-30630<br>
<br>
-Reference: <a href=3D"https://github.com/mirror/dmidecode/commit/39b2dd7b6=
ab719b920e96ed832cfb4bdd664e808+Upstream-Status" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e9=
6ed832cfb4bdd664e808<br>
+Upstream-Status</a>: Backport [<a href=3D"https://git.savannah.nongnu.org/=
cgit/dmidecode.git/commit/?id=3Dd8cfbc808f387e87091c25e7d5b8c2bb348bb206" r=
el=3D"noreferrer" target=3D"_blank">https://git.savannah.nongnu.org/cgit/dm=
idecode.git/commit/?id=3Dd8cfbc808f387e87091c25e7d5b8c2bb348bb206</a>]<br>
<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/mirror/dmidecode/=
commit/d8cfbc808f387e87091c25e7d5b8c2bb348bb206" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c=
25e7d5b8c2bb348bb206</a>]<br>
-<br>
-Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.c=
om" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
+Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@sie=
mens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
=C2=A0---<br>
- dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------<br=
>
- util.c=C2=A0 =C2=A0 =C2=A0 | 40 ---------------------------<br>
+ dmidecode.c | 69 +++++++++++++++++++++++++++++++++++++++--------------<br=
>
+ util.c=C2=A0 =C2=A0 =C2=A0 | 40 -------------------------------<br>
=C2=A0 util.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
- 3 files changed, 58 insertions(+), 62 deletions(-)<br>
+ 3 files changed, 51 insertions(+), 59 deletions(-)<br>
<br>
=C2=A0diff --git a/dmidecode.c b/dmidecode.c<br>
-index 9aeff91..5477309 100644<br>
+index b082c03..a80a140 100644<br>
=C2=A0--- a/dmidecode.c<br>
=C2=A0+++ b/dmidecode.c<br>
-@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_head=
er *h, const u8 *data, u16 ver<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -5130,11 +5130,56 @@ static void dmi_table_string(const struct dmi_head=
er *h, const u8 *data, u16 ver<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 }<br>
-<br>
+ <br>
=C2=A0-static void dmi_table_dump(const u8 *buf, u32 len)<br>
=C2=A0+static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,=
<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u32 table_len)<br>
@@ -68,7 +66,7 @@ index 9aeff91..5477309 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_close;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &amp; FLAG_QUIET))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &amp; FLAG_QUIET))<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_comment(&quot;Wr=
iting %d bytes to %s.&quot;, len, opt.dumpfile);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 write_dump(32, len, buf, opt.dumpfile, 0);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_comment(&quot;Wr=
iting %d bytes to %s.&quot;, table_len, opt.dumpfile);<br>
@@ -92,94 +90,55 @@ index 9aeff91..5477309 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 fclose(f);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 return -1;<br>
=C2=A0 }<br>
-<br>
+ <br>
=C2=A0 static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32=
 flags)<br>
-@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 num,=
 u32 ver, const char *devmem,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (opt.flags &amp; FLAG_DUMP_BIN)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(buf, len)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_decode(buf, le=
n, num, ver &gt;&gt; 8, flags);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
- }<br>
-<br>
-@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)<br>
-<br>
- static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 u32 ver;<br>
-+=C2=A0 =C2=A0 =C2=A0 u32 ver, len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 u8 *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0x06] &gt; 0x20)<br>
-@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *devm=
em, u32 flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 32);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_smbios3_a=
ddress(crafted);<br>
-<br>
+@@ -5387,11 +5432,7 @@ static int smbios3_decode(u8 *buf, const char *devm=
em, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_smbios3_a=
ddress(crafted);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(table, le=
n);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(opt.flags &am=
p; FLAG_QUIET))<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_comment(&quot;Writing %d bytes to %s.&quot;, crafted[0x06],<b=
r>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt.dumpfile);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_dump(0, craft=
ed[0x06], crafted, opt.dumpfile, 1);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(craf=
ted, crafted[0x06], table, len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *devme=
m, u32 flags)<br>
- static int smbios_decode(u8 *buf, const char *devmem, u32 flags)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 ver;<br>
-+=C2=A0 =C2=A0 =C2=A0 u32 len;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0x05] &gt; 0x20)<br>
-@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *devme=
m, u32 flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 32);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_dmi_addre=
ss(crafted + 0x10);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -5463,11 +5504,7 @@ static int smbios_decode(u8 *buf, const char *devme=
m, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_dmi_addre=
ss(crafted + 0x10);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(table, le=
n);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(opt.flags &am=
p; FLAG_QUIET))<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_comment(&quot;Writing %d bytes to %s.&quot;, crafted[0x05],<b=
r>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt.dumpfile);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_dump(0, craft=
ed[0x05], crafted, opt.dumpfile, 1);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(craf=
ted, crafted[0x05], table, len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *devmem=
, u32 flags)<br>
-<br>
- static int legacy_decode(u8 *buf, const char *devmem, u32 flags)<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 u32 len;<br>
-+=C2=A0 =C2=A0 =C2=A0 u8 *table;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!checksum(buf, 0x0F))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *devme=
m, u32 flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_dmi_addre=
ss(crafted);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -5508,11 +5545,7 @@ static int legacy_decode(u8 *buf, const char *devme=
m, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(crafted, buf=
, 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overwrite_dmi_addre=
ss(crafted);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(table, le=
n);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(opt.flags &am=
p; FLAG_QUIET))<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_comment(&quot;Writing %d bytes to %s.&quot;, 0x0F,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt.dumpfile);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_dump(0, 0x0F,=
 crafted, opt.dumpfile, 1);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmi_table_dump(craf=
ted, 0x0F, table, len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0diff --git a/util.c b/util.c<br>
=C2=A0index 04aaadd..1547096 100644<br>
=C2=A0--- a/util.c<br>
=C2=A0+++ b/util.c<br>
=C2=A0@@ -259,46 +259,6 @@ out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return p;<br>
=C2=A0 }<br>
-<br>
+ <br>
=C2=A0-int write_dump(size_t base, size_t len, const void *data, const char=
 *dumpfile, int add)<br>
=C2=A0-{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 FILE *f;<br>
@@ -233,5 +192,6 @@ index 3094cf8..ef24eb9 100644<br>
=C2=A0 void *mem_chunk(off_t base, size_t len, const char *devmem);<br>
=C2=A0-int write_dump(size_t base, size_t len, const void *data, const char=
 *dumpfile, int add);<br>
=C2=A0 u64 u64_range(u64 start, u64 end);<br>
---<br>
-2.35.5<br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.pat=
ch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch<br>
index 9f53a205ac..37167a9c4f 100644<br>
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch<br>
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch<br>
@@ -1,7 +1,8 @@<br>
-From 47101389dd52b50123a3ec59fed4d2021752e489 Mon Sep 17 00:00:00 2001<br>
+From 2d26f187c734635d072d24ea401255b84f03f4c4 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.de" target=3D"=
_blank">jdelvare@suse.de</a>&gt;<br>
=C2=A0Date: Tue, 27 Jun 2023 10:03:53 +0000<br>
-Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing fi=
le<br>
+Subject: [PATCH 3/5] dmidecode: Do not let --dump-bin overwrite an existin=
g<br>
+ file<br>
<br>
=C2=A0Make sure that the file passed to option --dump-bin does not already<=
br>
=C2=A0exist. In practice, it is rather unlikely that an honest user would<b=
r>
@@ -17,14 +18,13 @@ Upstream-Status: Backport<br>
=C2=A0[<a href=3D"https://github.com/mirror/dmidecode/commit/6ca381c1247c81=
f74e1ca4e7706f70bdda72e6f2" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2</=
a>]<br>
<br>
=C2=A0Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windri=
ver.com" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 dmidecode.c=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++--<br>
=C2=A0 man/dmidecode.8 |=C2=A0 3 ++-<br>
=C2=A0 2 files changed, 14 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/dmidecode.c b/dmidecode.c<br>
-index ae461de..6446040 100644<br>
+index a80a140..32a77cc 100644<br>
=C2=A0--- a/dmidecode.c<br>
=C2=A0+++ b/dmidecode.c<br>
=C2=A0@@ -60,6 +60,7 @@<br>
@@ -78,3 +78,6 @@ index 64dc7e7..d5b7f01 100644<br>
=C2=A0 .TP<br>
=C2=A0 .BR &quot;=C2=A0 &quot; &quot;=C2=A0 &quot; &quot;--from-dump FILE&q=
uot;<br>
=C2=A0 Read the DMI data from a binary file previously generated using <br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.pat=
ch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch<br>
index 01d0d1f867..181092a3fd 100644<br>
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch<br>
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch<br>
@@ -1,7 +1,8 @@<br>
-From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001<br>
+From ac881f801b92b57fd8daac65fb16fff6d84fd366 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.de" target=3D"=
_blank">jdelvare@suse.de</a>&gt;<br>
=C2=A0Date: Tue, 27 Jun 2023 10:25:50 +0000<br>
-Subject: [PATCH] Consistently use read_file() when reading from a dump fil=
e<br>
+Subject: [PATCH 4/5] Consistently use read_file() when reading from a dump=
<br>
+ file<br>
<br>
=C2=A0Use read_file() instead of mem_chunk() to read the entry point from a=
<br>
=C2=A0dump file. This is faster, and consistent with how we then read the<b=
r>
@@ -27,26 +28,26 @@ Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogit=
a.urade@windriver.com" target=3D"_blank">yogita.urade@windriver.com</a>&gt;=
<br>
=C2=A0 1 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/dmidecode.c b/dmidecode.c<br>
-index 98f9692..b4dbc9d 100644<br>
+index 32a77cc..9a691e0 100644<br>
=C2=A0--- a/dmidecode.c<br>
=C2=A0+++ b/dmidecode.c<br>
-@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_comment(&quot;dm=
idecode %s&quot;, VERSION);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read from dump if so instructed */<br>
+@@ -5693,17 +5693,25 @@ int main(int argc, char * const argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_comment(&quot;dm=
idecode %s&quot;, VERSION);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read from dump if so instructed */<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0x20;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt.flags &amp; FLAG_FROM_DUMP)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &am=
p; FLAG_QUIET))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_info(&quot;Reading SMBIOS/DMI data from file %s.&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt.dumpfile);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt.flags &amp; FLAG_FROM_DUMP)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &am=
p; FLAG_QUIET))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_info(&quot;Reading SMBIOS/DMI data from file %s.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt.dumpfile);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((buf =3D mem_ch=
unk(0, 0x20, opt.dumpfile)) =3D=3D NULL)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((buf =3D=
 read_file(0, &amp;size, opt.dumpfile)) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto exit_free;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto exit_free;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Truncated=
 entry point can&#39;t be processed */<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt=
; 0x20)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
@@ -54,16 +55,17 @@ index 98f9692..b4dbc9d 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto done;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, &qu=
ot;_SM3_&quot;, 5) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (smbios3_decode(buf, opt.dumpfile, 0))<br>
-@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * contain one of several types of entry points=
, so read enough for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the largest one, then determine what type it=
 contains.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, &qu=
ot;_SM3_&quot;, 5) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (smbios3_decode(buf, opt.dumpfile, 0))<br>
+@@ -5727,7 +5735,6 @@ int main(int argc, char * const argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * contain one of several types of entry points=
, so read enough for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the largest one, then determine what type it=
 contains.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 size =3D 0x20;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &amp; FLAG_NO_SYSFS)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (buf =3D read_file(0, &amp;size, SY=
S_ENTRY_FILE)) !=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
---<br>
-2.40.0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(opt.flags &amp; FLAG_NO_SYSFS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (buf =3D read_file(0, &amp;size, SY=
S_ENTRY_FILE)) !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.pat=
ch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch<br>
index 5fa72b4f9b..b7d7f4ff96 100644<br>
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch<br>
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch<br>
@@ -1,7 +1,7 @@<br>
-From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001<br>
+From 2fb126eef436389a2dc48d4225b4a9888b0625a8 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.de" target=3D"=
_blank">jdelvare@suse.de</a>&gt;<br>
=C2=A0Date: Tue, 27 Jun 2023 10:58:11 +0000<br>
-Subject: [PATCH] Don&#39;t read beyond sysfs entry point buffer<br>
+Subject: [PATCH 5/5] Don&#39;t read beyond sysfs entry point buffer<br>
<br>
=C2=A0Functions smbios_decode() and smbios3_decode() include a check<br>
=C2=A0against buffer overrun. This check assumes that the buffer length is<=
br>
@@ -33,105 +33,106 @@ Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yog=
ita.urade@windriver.com" target=3D"_blank">yogita.urade@windriver.com</a>&g=
t;<br>
=C2=A0 1 file changed, 12 insertions(+), 12 deletions(-)<br>
<br>
=C2=A0diff --git a/dmidecode.c b/dmidecode.c<br>
-index b4dbc9d..870d94e 100644<br>
+index 9a691e0..e725801 100644<br>
=C2=A0--- a/dmidecode.c<br>
=C2=A0+++ b/dmidecode.c<br>
-@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[0x17] =3D 0;<br>
+@@ -5398,14 +5398,14 @@ static void overwrite_smbios3_address(u8 *buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[0x17] =3D 0;<br>
=C2=A0 }<br>
-<br>
+ <br>
=C2=A0-static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)<br=
>
=C2=A0+static int smbios3_decode(u8 *buf, size_t buf_len, const char *devme=
m, u32 flags)<br>
=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ver, len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ver, len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *table;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 if (buf[0x06] &gt; 0x20)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[0x06] &gt; buf_len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Entry point length too large (%u bytes, expected %u).\n&quo=
t;,<br>
-@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char *dev=
mem, u32 flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Entry point length too large (%u bytes, expected %u).\n&quo=
t;,<br>
+@@ -5455,14 +5455,14 @@ static int smbios3_decode(u8 *buf, const char *dev=
mem, u32 flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0 }<br>
-<br>
+ <br>
=C2=A0-static int smbios_decode(u8 *buf, const char *devmem, u32 flags)<br>
=C2=A0+static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem=
, u32 flags)<br>
=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 ver;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 ver, num;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *table;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t let checksum run beyond the buffer=
 */<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 if (buf[0x05] &gt; 0x20)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[0x05] &gt; buf_len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Entry point length too large (%u bytes, expected %u).\n&quo=
t;,<br>
-@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, &qu=
ot;_SM3_&quot;, 5) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Entry point length too large (%u bytes, expected %u).\n&quo=
t;,<br>
+@@ -5714,12 +5714,12 @@ int main(int argc, char * const argv[])<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, &qu=
ot;_SM3_&quot;, 5) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (smbios3_decode(buf, opt.dumpfile, 0))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (smbios3_decode(buf, size, opt.dumpfile, 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf=
, &quot;_SM_&quot;, 4) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf=
, &quot;_SM_&quot;, 4) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (smbios_decode(buf, opt.dumpfile, 0))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (smbios_decode(buf, size, opt.dumpfile, 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf=
, &quot;_DMI_&quot;, 5) =3D=3D 0)<br>
-@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_info(&quot;Getting SMBIOS data from sysfs.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &gt;=3D 24=
 &amp;&amp; memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf=
, &quot;_DMI_&quot;, 5) =3D=3D 0)<br>
+@@ -5742,12 +5742,12 @@ int main(int argc, char * const argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_info(&quot;Getting SMBIOS data from sysfs.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &gt;=3D 24=
 &amp;&amp; memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))<br=
>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (smbios3_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FIL=
E_OFFSET))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (size &gt;=
=3D 31 &amp;&amp; memcmp(buf, &quot;_SM_&quot;, 4) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (size &gt;=
=3D 31 &amp;&amp; memcmp(buf, &quot;_SM_&quot;, 4) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (smbios_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE=
_OFFSET))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (size &gt;=
=3D 15 &amp;&amp; memcmp(buf, &quot;_DMI_&quot;, 5) =3D=3D 0)<br>
-@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (size &gt;=
=3D 15 &amp;&amp; memcmp(buf, &quot;_DMI_&quot;, 5) =3D=3D 0)<br>
+@@ -5784,12 +5784,12 @@ int main(int argc, char * const argv[])<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, &quot;_SM3_&quot;, 5) =3D=3D 0)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (smbios3_decode(=
buf, opt.devmem, 0))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (smbios3_=
decode(buf, 0x20, opt.devmem, 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf, &quot;_SM_&quot;, 4) =3D=
=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf, &quot;_SM_&quot;, 4) =3D=
=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (smbios_decode(b=
uf, opt.devmem, 0))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (smbios_d=
ecode(buf, 0x20, opt.devmem, 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
-@@ -6114,7 +6114,7 @@ memory_scan:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf + fp=
, &quot;_SM3_&quot;, 5) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+@@ -5810,7 +5810,7 @@ memory_scan:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf + fp=
, &quot;_SM3_&quot;, 5) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (smbios3_decode(buf + fp, opt.devmem, 0))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (smbios3_decode(buf + fp, 0x20, opt.devmem, 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
-@@ -6127,7 +6127,7 @@ memory_scan:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf + fp=
, &quot;_SM_&quot;, 4) =3D=3D 0 &amp;&amp; fp &lt;=3D 0xFFE0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+@@ -5823,7 +5823,7 @@ memory_scan:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf + fp=
, &quot;_SM_&quot;, 4) =3D=3D 0 &amp;&amp; fp &lt;=3D 0xFFE0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (smbios_decode(buf + fp, opt.devmem, 0))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (smbios_decode(buf + fp, 0x20, opt.devmem, 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
---<br>
-2.35.5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+-- <br>
+2.41.0<br>
+<br>
diff --git a/meta/recipes-devtools/dmidecode/<a href=3D"http://dmidecode_3.=
3.bb" rel=3D"noreferrer" target=3D"_blank">dmidecode_3.3.bb</a> b/meta/reci=
pes-devtools/dmidecode/<a href=3D"http://dmidecode_3.3.bb" rel=3D"noreferre=
r" target=3D"_blank">dmidecode_3.3.bb</a><br>
index b99c2ea99d..c0f6b45313 100644<br>
--- a/meta/recipes-devtools/dmidecode/<a href=3D"http://dmidecode_3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">dmidecode_3.3.bb</a><br>
+++ b/meta/recipes-devtools/dmidecode/<a href=3D"http://dmidecode_3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">dmidecode_3.3.bb</a><br>
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Committing-changes-fr=
om-do_unpack_extra.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-30630_1.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-30630_1a.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-30630_1b.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-30630_2.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-30630_3.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-30630_4.patch \<b=
r>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186131): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186131" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186131</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100776995/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100776995/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b1551c0605bd8be3--

