Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8622AC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 15:52:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.260.1711727572676755131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 08:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dk3SDfOD;
 spf=pass (domain: mvista.com, ip: 209.85.208.178, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d68651e253so30477081fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711727571; x=1712332371; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ffYjNOvtrPXiaTeHfD71NzDmq9VNyGlgHQf5xJMKKM=;
        b=dk3SDfOD2l5IPpwO2u8VkvM5E6y2srEWGd3Y/2Awomx5J+Mn7G091swlOSgAeJ3eRl
         ZUTumNUQrNDWnjp7Ol0EtABOTF+WrDdlimwmuF4TUvIfW5FjWAwk9hfopzVZpEo1Ry44
         WNGMi/PktZ+d13X1X8fSL+PcKxPr63qRT5Azg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711727571; x=1712332371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ffYjNOvtrPXiaTeHfD71NzDmq9VNyGlgHQf5xJMKKM=;
        b=P3F81ePdGtK+m540innGZ1E8C2iuJsF9rJDUMPOHiuGRepaaZrHiTXwkM7q3DqtLng
         T6/NTF4JaQV7uMtTHKX9+PP3KxRXDX0+gRfzuFYdLZeWtqG/Qhnd8Rw2r31vrppsnPyU
         0BL7Jp0Rjy9ChiPel42pWRCKHp1QVkkBprSYI68EW9oVJd1WLnnYGDVPllhPuVmrW2XY
         hIDFVYlvYDGGEaQnP1yGwWjMiqtvPWj/1IycJyrM1WyvMDhwUcR4L/2rGwtFJ71jcQgD
         zJFB63L3YXyFl7dIxAW2uvNN7VdjWXultCVRrZV0xpbCkyGPkgyyLNJFHOCK/2+arABv
         Yiqw==
X-Gm-Message-State: AOJu0Yx1gLisKoBBA/vsDv3y5i8Yot4/jkbEwuyr/9im6X+ldx5UCwqu
	cjL8YIKZZ0M46WBUmzG8KpluMcttRRc9UJsIdD9Ip+oFr814SKO8F85UkwiETFQSeB2lU3lyj3/
	r0ec0HH0SPrkEAU44nyUJikYvPLhlvipxtNshVA==
X-Google-Smtp-Source: AGHT+IGpXVko2h5g5gT3UsNSrdTctFyFjwdzpZUCupW7ZQ5B9KUi6yu3/YTA+Er0XUygTekoZ0KJzLCqB9MkKkrr6qw=
X-Received: by 2002:a2e:b904:0:b0:2d3:1bd0:6bcf with SMTP id
 b4-20020a2eb904000000b002d31bd06bcfmr1465234ljb.8.1711727570350; Fri, 29 Mar
 2024 08:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <17C137F27040B581.32709@lists.openembedded.org>
In-Reply-To: <17C137F27040B581.32709@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 29 Mar 2024 21:22:37 +0530
Message-ID: <CANQUz1_hPjw4kCpAG90Xc2O61p2EQgzWQH_DZ_DA2jq=UWpuOg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] util-linux: Fix for CVE-2024-28085
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c88e1b0614cea1ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 15:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197638

--000000000000c88e1b0614cea1ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Please ignore this patch.

Thanks & Regards,
Vijay

On Fri, Mar 29, 2024 at 4:44=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from
>
> https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7ca557d1ac3=
1f638986704757f
> &
> <https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7ca557d1ac=
31f638986704757f&>
>
> https://github.com/util-linux/util-linux/commit/27ee6446503af7ec0c2647704=
ca47ac4de3852ef
> &
> <https://github.com/util-linux/util-linux/commit/27ee6446503af7ec0c264770=
4ca47ac4de3852ef&>
>
> https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e4f6eb331f=
4d4d2dbc875e22f
> &
> <https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e4f6eb331=
f4d4d2dbc875e22f&>
> https://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2d=
ceec526408ac253
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |   4 +
>  .../util-linux/CVE-2024-28085-pre1.patch      | 200 ++++++++++++++++
>  .../util-linux/CVE-2024-28085-pre2.patch      | 171 ++++++++++++++
>  .../util-linux/CVE-2024-28085-pre3.patch      | 219 ++++++++++++++++++
>  .../util-linux/CVE-2024-28085.patch           |  30 +++
>  5 files changed, 624 insertions(+)
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 982ec669a2..079359c55c 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -35,6 +35,10 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>             file://run-ptest \
>             file://display_testname_for_subtest.patch \
>             file://avoid_parallel_tests.patch \
> +           file://CVE-2024-28085-pre1.patch \
> +           file://CVE-2024-28085-pre2.patch \
> +           file://CVE-2024-28085-pre3.patch \
> +           file://CVE-2024-28085.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
> diff --git
> a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
> b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
> new file mode 100644
> index 0000000000..ce3056eabe
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
> @@ -0,0 +1,200 @@
> +From 8a7b8456d1dc0e7ca557d1ac31f638986704757f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?=3DD0=3DBD=3DD0=3DB0=3DD0=3DB1?=3D <nabijaczleweli@nab=
ijaczleweli.xyz>
> +Date: Wed, 15 Mar 2023 16:16:31 +0100
> +Subject: [PATCH] write: correctly handle wide characters
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Do this by replacing fputc_careful() (notice that the description said
> +it's locale-aware =E2=80=92 it very much is /not/), with a fputs_careful=
() which
> +does the same thing, but if it were to output a byte in the \123 format,
> +first it checks whether this byte starts a valid multibyte character.
> +
> +If it does, and that character is printable, write it verbatim.
> +This means that
> +  echo 'foo =C3=A5=C3=A4=C3=B6 =C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84 bar'=
 | write nabijaczleweli pts/4
> +instead of
> +  foo \303\245\303\244\303\266
> +  \304\205\304\231\304\207\305\272\305\274\305\204 bar
> +yields
> +  foo =C3=A5=C3=A4=C3=B6 =C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84 bar
> +or, more realistically, from a message I got earlier today,
> +  Filip powiedzia\305\202 \305\274e zap\305\202aci jutro
> +becomes
> +  Filip powiedzia=C5=82 =C5=BCe zap=C5=82aci jutro
> +
> +Invalid/non-printable sequences get processed as before.
> +
> +Line reading in write must become getline() to avoid dealing with
> +partial characters: for example on input consisting solely of
> +=C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84, where every {1} is an instance, th=
e output would be
> +  {42}=C4=85=C4=99=C4=87\305\272=C5=BC=C5=84{84}=C4=85=C4=99=C4=87=C5=BA=
\305\274=C5=84{84}=C4=85=C4=99=C4=87=C5=BA=C5=BC\305\204{39}
> +with just fixed-512 fgets()
> +
> +Bug-Debian: https://bugs.debian.org/826596
> +
> +Upstream-Status: Backport [
> https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7ca557d1ac3=
1f638986704757f
> ]
> +CVE: CVE-2024-28085 #Dependency Patch1
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + include/carefulputc.h | 60 +++++++++++++++++++++++++++++++------------
> + login-utils/last.c    |  4 +--
> + term-utils/write.c    | 25 +++++-------------
> + 3 files changed, 52 insertions(+), 37 deletions(-)
> +
> +diff --git a/include/carefulputc.h b/include/carefulputc.h
> +index 8860b12340..740add68e8 100644
> +--- a/include/carefulputc.h
> ++++ b/include/carefulputc.h
> +@@ -1,31 +1,59 @@
> + #ifndef UTIL_LINUX_CAREFULPUTC_H
> + #define UTIL_LINUX_CAREFULPUTC_H
> +
> +-/*
> +- * A putc() for use in write and wall (that sometimes are sgid tty).
> +- * It avoids control characters in our locale, and also ASCII control
> +- * characters.   Note that the locale of the recipient is unknown.
> +-*/
> + #include <stdio.h>
> + #include <string.h>
> + #include <ctype.h>
> ++#ifdef HAVE_WIDECHAR
> ++#include <wctype.h>
> ++#endif
> ++#include <stdbool.h>
> +
> + #include "cctype.h"
> +
> +-static inline int fputc_careful(int c, FILE *fp, const char fail)
> ++/*
> ++ * A puts() for use in write and wall (that sometimes are sgid tty).
> ++ * It avoids control and invalid characters.
> ++ * The locale of the recipient is nominally unknown,
> ++ * but it's a solid bet that the encoding is compatible with the
> author's.
> ++ */
> ++static inline int fputs_careful(const char * s, FILE *fp, const char
> ctrl, bool cr_lf)
> + {
> +-      int ret;
> ++      int ret =3D 0;
> +
> +-      if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r'=
 || c =3D=3D '\n')
> +-              ret =3D putc(c, fp);
> +-      else if (!c_isascii(c))
> +-              ret =3D fprintf(fp, "\\%3o", (unsigned char)c);
> +-      else {
> +-              ret =3D putc(fail, fp);
> +-              if (ret !=3D EOF)
> +-                      ret =3D putc(c ^ 0x40, fp);
> ++      for (size_t slen =3D strlen(s); *s; ++s, --slen) {
> ++              if (*s =3D=3D '\n')
> ++                      ret =3D fputs(cr_lf ? "\r\n" : "\n", fp);
> ++              else if (isprint(*s) || *s =3D=3D '\a' || *s =3D=3D '\t' =
|| *s =3D=3D
> '\r')
> ++                      ret =3D putc(*s, fp);
> ++              else if (!c_isascii(*s)) {
> ++#ifdef HAVE_WIDECHAR
> ++                      wchar_t w;
> ++                      size_t clen =3D mbtowc(&w, s, slen);
> ++                      switch(clen) {
> ++                              case (size_t)-2:  // incomplete
> ++                              case (size_t)-1:  // EILSEQ
> ++                                      mbtowc(NULL, NULL, 0);
> ++                              nonprint:
> ++                                      ret =3D fprintf(fp, "\\%3hho", *s=
);
> ++                                      break;
> ++                              default:
> ++                                      if(!iswprint(w))
> ++                                              goto nonprint;
> ++                                      ret =3D fwrite(s, 1, clen, fp);
> ++                                      s +=3D clen - 1;
> ++                                      slen -=3D clen - 1;
> ++                                      break;
> ++                      }
> ++#else
> ++                      ret =3D fprintf(fp, "\\%3hho", *s);
> ++#endif
> ++              } else
> ++                      ret =3D fputs((char[]){ ctrl, *s ^ 0x40, '\0' }, =
fp);
> ++              if (ret < 0)
> ++                      return EOF;
> +       }
> +-      return (ret < 0) ? EOF : 0;
> ++      return 0;
> + }
> +
> + static inline void fputs_quoted_case(const char *data, FILE *out, int
> dir)
> +diff --git a/login-utils/last.c b/login-utils/last.c
> +index d3eeed4b6e..1b45dbf24d 100644
> +--- a/login-utils/last.c
> ++++ b/login-utils/last.c
> +@@ -392,7 +392,6 @@ static int list(const struct last_control *ctl,
> struct utmpx *p, time_t logout_t
> +       char            final[512];
> +       char            utline[sizeof(p->ut_line) + 1];
> +       char            domain[256];
> +-      char            *s;
> +       int             mins, hours, days;
> +       int             r, len;
> +       struct last_timefmt *fmt;
> +@@ -548,8 +547,7 @@ static int list(const struct last_control *ctl,
> struct utmpx *p, time_t logout_t
> +       /*
> +        *      Print out "final" string safely.
> +        */
> +-      for (s =3D final; *s; s++)
> +-              fputc_careful(*s, stdout, '*');
> ++      fputs_careful(final, stdout, '*', false);
> +
> +       if (len < 0 || (size_t)len >=3D sizeof(final))
> +               putchar('\n');
> +diff --git a/term-utils/write.c b/term-utils/write.c
> +index 8b86e9a9d5..b485e28fd5 100644
> +--- a/term-utils/write.c
> ++++ b/term-utils/write.c
> +@@ -223,21 +223,6 @@ static void signal_handler(int signo)
> +       signal_received =3D signo;
> + }
> +
> +-/*
> +- * write_line - like fputs(), but makes control characters visible and
> +- *     turns \n into \r\n.
> +- */
> +-static void write_line(char *s)
> +-{
> +-      while (*s) {
> +-              const int c =3D *s++;
> +-
> +-              if ((c =3D=3D '\n' && fputc_careful('\r', stdout, '^') =
=3D=3D EOF)
> +-                  || fputc_careful(c, stdout, '^') =3D=3D EOF)
> +-                      err(EXIT_FAILURE, _("carefulputc failed"));
> +-      }
> +-}
> +-
> + /*
> +  * do_write - actually make the connection
> +  */
> +@@ -247,7 +232,8 @@ static void do_write(const struct write_control *ctl=
)
> +       struct passwd *pwd;
> +       time_t now;
> +       struct tm *tm;
> +-      char *host, line[512];
> ++      char *host, *line =3D NULL;
> ++      size_t linelen =3D 0;
> +       struct sigaction sigact;
> +
> +       /* Determine our login name(s) before the we reopen() stdout */
> +@@ -286,11 +272,14 @@ static void do_write(const struct write_control
> *ctl)
> +       free(host);
> +       printf("\r\n");
> +
> +-      while (fgets(line, sizeof(line), stdin) !=3D NULL) {
> ++      while (getline(&line, &linelen, stdin) >=3D 0) {
> +               if (signal_received)
> +                       break;
> +-              write_line(line);
> ++
> ++              if (fputs_careful(line, stdout, '^', true) =3D=3D EOF)
> ++                      err(EXIT_FAILURE, _("carefulputc failed"));
> +       }
> ++      free(line);
> +       printf("EOF\r\n");
> + }
> +
> diff --git
> a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
> b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
> new file mode 100644
> index 0000000000..1c4e4394cc
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
> @@ -0,0 +1,171 @@
> +From 27ee6446503af7ec0c2647704ca47ac4de3852ef Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?=3DD0=3DBD=3DD0=3DB0=3DD0=3DB1?=3D <nabijaczleweli@nab=
ijaczleweli.xyz>
> +Date: Wed, 15 Mar 2023 16:16:43 +0100
> +Subject: [PATCH] wall: convert homebrew buffering to open_memstream()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The struct buffer system duplicates a plethora of standard I/O
> +functions (including a fork of fputc_careful())
> +and adds a lot of complexity =E2=80=92 open_memstream() is standard,
> +and fits perfectly into this niche
> +
> +Upstream-Status: Backport [
> https://github.com/util-linux/util-linux/commit/27ee6446503af7ec0c2647704=
ca47ac4de3852ef
> ]
> +CVE: CVE-2024-28085 #Dependency Patch2
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + term-utils/wall.c | 95 ++++++++++-------------------------------------
> + 1 file changed, 20 insertions(+), 75 deletions(-)
> +
> +diff --git a/term-utils/wall.c b/term-utils/wall.c
> +index c601d3e5b7..a51a928293 100644
> +--- a/term-utils/wall.c
> ++++ b/term-utils/wall.c
> +@@ -274,74 +274,22 @@ int main(int argc, char **argv)
> +       exit(EXIT_SUCCESS);
> + }
> +
> +-struct buffer {
> +-      size_t  sz;
> +-      size_t  used;
> +-      char    *data;
> +-};
> +-
> +-static void buf_enlarge(struct buffer *bs, size_t len)
> ++static void buf_putc_careful(FILE *fs, int c)
> + {
> +-      if (bs->sz =3D=3D 0 || len > bs->sz - bs->used) {
> +-              bs->sz +=3D len < 128 ? 128 : len;
> +-              bs->data =3D xrealloc(bs->data, bs->sz);
> +-      }
> +-}
> +-
> +-static void buf_puts(struct buffer *bs, const char *s)
> +-{
> +-      size_t len =3D strlen(s);
> +-
> +-      buf_enlarge(bs, len + 1);
> +-      memcpy(bs->data + bs->used, s, len + 1);
> +-      bs->used +=3D len;
> +-}
> +-
> +-static void __attribute__((__format__ (__printf__, 2, 3)))
> +-      buf_printf(struct buffer *bs, const char *fmt, ...)
> +-{
> +-      int rc;
> +-      va_list ap;
> +-      size_t limit;
> +-
> +-      buf_enlarge(bs, 0);     /* default size */
> +-      limit =3D bs->sz - bs->used;
> +-
> +-      va_start(ap, fmt);
> +-      rc =3D vsnprintf(bs->data + bs->used, limit, fmt, ap);
> +-      va_end(ap);
> +-
> +-      if (rc >=3D 0 && (size_t) rc >=3D limit) {  /* not enough, enlarg=
e */
> +-              buf_enlarge(bs, (size_t)rc + 1);
> +-              limit =3D bs->sz - bs->used;
> +-              va_start(ap, fmt);
> +-              rc =3D vsnprintf(bs->data  + bs->used, limit, fmt, ap);
> +-              va_end(ap);
> +-      }
> +-
> +-      if (rc > 0)
> +-              bs->used +=3D rc;
> +-}
> +-
> +-static void buf_putc_careful(struct buffer *bs, int c)
> +-{
> +-      if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r'=
 || c =3D=3D
> '\n') {
> +-              buf_enlarge(bs, 1);
> +-              bs->data[bs->used++] =3D c;
> +-      } else if (!c_isascii(c))
> +-              buf_printf(bs, "\\%3o", (unsigned char)c);
> +-      else {
> +-              char tmp[] =3D { '^', c ^ 0x40, '\0' };
> +-              buf_puts(bs, tmp);
> +-      }
> ++      if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r'=
 || c =3D=3D '\n')
> ++              fputc(c, fs);
> ++      else if (!c_isascii(c))
> ++              fprintf(fs, "\\%3o", (unsigned char)c);
> ++      else
> ++              fputs((char[]){ '^', c ^ 0x40, '\0' }, fs);
> + }
> +
> + static char *makemsg(char *fname, char **mvec, int mvecsz,
> +                    size_t *mbufsize, int print_banner)
> + {
> +-      struct buffer _bs =3D {.used =3D 0}, *bs =3D &_bs;
> +       register int ch, cnt;
> +-      char *p, *lbuf;
> ++      char *p, *lbuf, *retbuf;
> ++      FILE * fs =3D open_memstream(&retbuf, mbufsize);
> +       long line_max;
> +
> +       line_max =3D sysconf(_SC_LINE_MAX);
> +@@ -379,15 +327,15 @@ static char *makemsg(char *fname, char **mvec, int
> mvecsz,
> +                */
> +               /* snprintf is not always available, but the sprintf's he=
re
> +                  will not overflow as long as %d takes at most 100 char=
s
> */
> +-              buf_printf(bs, "\r%*s\r\n", TERM_WIDTH, " ");
> ++              fprintf(fs, "\r%*s\r\n", TERM_WIDTH, " ");
> +
> +               snprintf(lbuf, line_max,
> +                               _("Broadcast message from %s@%s (%s)
> (%s):"),
> +                               whom, hostname, where, date);
> +-              buf_printf(bs, "%-*.*s\007\007\r\n", TERM_WIDTH,
> TERM_WIDTH, lbuf);
> ++              fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH,
> lbuf);
> +               free(hostname);
> +       }
> +-      buf_printf(bs, "%*s\r\n", TERM_WIDTH, " ");
> ++      fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
> +
> +        if (mvec) {
> +               /*
> +@@ -396,11 +344,11 @@ static char *makemsg(char *fname, char **mvec, int
> mvecsz,
> +               int i;
> +
> +               for (i =3D 0; i < mvecsz; i++) {
> +-                      buf_puts(bs, mvec[i]);
> ++                      fputs(mvec[i], fs);
> +                       if (i < mvecsz - 1)
> +-                              buf_puts(bs, " ");
> ++                              fputc(' ', fs);
> +               }
> +-              buf_puts(bs, "\r\n");
> ++              fputs("\r\n", fs);
> +       } else {
> +               /*
> +                * read message from <file>
> +@@ -428,23 +376,20 @@ static char *makemsg(char *fname, char **mvec, int
> mvecsz,
> +               while (fgets(lbuf, line_max, stdin)) {
> +                       for (cnt =3D 0, p =3D lbuf; (ch =3D *p) !=3D '\0'=
; ++p,
> ++cnt) {
> +                               if (cnt =3D=3D TERM_WIDTH || ch =3D=3D '\=
n') {
> +-                                      for (; cnt < TERM_WIDTH; ++cnt)
> +-                                              buf_puts(bs, " ");
> +-                                      buf_puts(bs, "\r\n");
> ++                                      fprintf(fs, "%*s\r\n", TERM_WIDTH
> - cnt, "");
> +                                       cnt =3D 0;
> +                               }
> +                               if (ch =3D=3D '\t')
> +                                       cnt +=3D (7 - (cnt % 8));
> +                               if (ch !=3D '\n')
> +-                                      buf_putc_careful(bs, ch);
> ++                                      buf_putc_careful(fs, ch);
> +                       }
> +               }
> +       }
> +-      buf_printf(bs, "%*s\r\n", TERM_WIDTH, " ");
> ++      fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
> +
> +       free(lbuf);
> +
> +-      bs->data[bs->used] =3D '\0';      /* be paranoid */
> +-      *mbufsize =3D bs->used;
> +-      return bs->data;
> ++      fclose(fs);
> ++      return retbuf;
> + }
> diff --git
> a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
> b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
> new file mode 100644
> index 0000000000..91beb53d1c
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
> @@ -0,0 +1,219 @@
> +From aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?=3DD0=3DBD=3DD0=3DB0=3DD0=3DB1?=3D <nabijaczleweli@nab=
ijaczleweli.xyz>
> +Date: Wed, 15 Mar 2023 16:16:48 +0100
> +Subject: [PATCH] wall: use fputs_careful()
> +
> +LINE_MAX only applies to teletypes in canonical mode: when stdin is a
> +file, it could still very much tear; start off at 512 for the sprintf(),
> +then use getline() like in write.
> +
> +The line wrapping has one suboptimal edge-case:
> +  $ wall < all
> +
> +  Broadcast message from nabijaczleweli@tarta (pts/4) (Tue Mar 14
> 22:31:25
> +  2023):
> +
> +  ^N^O^P^Q^R^S^T^U^V^W^X^Y^Z^[^\^]^^^_
> +  !"#$%&'()*+,-./0123456789:;<=3D>?@ABCDEFGHIJ
> +
> KLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~^?\200\201\202\203\20=
4\205\206
> +
> \207\210\211\212\213\214\215\216\217\220\221\222\223\224\225\226\227\230\=
231\232
> +
> \233\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\254\=
255\256
> +
> \257\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277\300\=
301\302
> +
> \303\304\305\306\307\310\311\312\313\314\315\316\317\320\321\322\323\324\=
325\326
> +
> \327\330\331\332\333\334\335\336\337\340\341\342\343\344\345\346\347\350\=
351\352
> +
> \353\354\355\356\357\360\361\362\363\364\365\366\367\370\371\372\373\374\=
375\376
> +  \377
> +but that's a pathological input, and the result is still infinitely
> +better than it was before, so fixing that is more trouble than it's
> +worth.
> +
> +Bug-Debian: https://bugs.debian.org/826596
> +
> +Upstream-Status: Backport [
> https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e4f6eb331f=
4d4d2dbc875e22f
> ]
> +CVE: CVE-2024-28085 #Dependency Patch3
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + include/carefulputc.h | 42 +++++++++++++++++++++++++++++++++---------
> + login-utils/last.c    |  2 +-
> + term-utils/wall.c     | 38 ++++++--------------------------------
> + term-utils/write.c    |  2 +-
> + 4 files changed, 41 insertions(+), 43 deletions(-)
> +
> +diff --git a/include/carefulputc.h b/include/carefulputc.h
> +index 740add68e8..3cc6f7ff99 100644
> +--- a/include/carefulputc.h
> ++++ b/include/carefulputc.h
> +@@ -6,6 +6,7 @@
> + #include <ctype.h>
> + #ifdef HAVE_WIDECHAR
> + #include <wctype.h>
> ++#include <wchar.h>
> + #endif
> + #include <stdbool.h>
> +
> +@@ -15,18 +16,35 @@
> +  * A puts() for use in write and wall (that sometimes are sgid tty).
> +  * It avoids control and invalid characters.
> +  * The locale of the recipient is nominally unknown,
> +- * but it's a solid bet that the encoding is compatible with the
> author's.
> ++ * but it's a solid bet that it's compatible with the author's.
> ++ * Use soft_width=3D0 to disable wrapping.
> +  */
> +-static inline int fputs_careful(const char * s, FILE *fp, const char
> ctrl, bool cr_lf)
> ++static inline int fputs_careful(const char * s, FILE *fp, const char
> ctrl, bool cr_lf, int soft_width)
> + {
> +-      int ret =3D 0;
> ++      int ret =3D 0, col =3D 0;
> +
> +       for (size_t slen =3D strlen(s); *s; ++s, --slen) {
> +-              if (*s =3D=3D '\n')
> ++              if (*s =3D=3D '\t')
> ++                      col +=3D (7 - (col % 8)) - 1;
> ++              else if (*s =3D=3D '\r')
> ++                      col =3D -1;
> ++              else if (*s =3D=3D '\a')
> ++                      --col;
> ++
> ++              if ((soft_width && col >=3D soft_width) || *s =3D=3D '\n'=
) {
> ++                      if (soft_width) {
> ++                              fprintf(fp, "%*s", soft_width - col, "");
> ++                              col =3D 0;
> ++                      }
> +                       ret =3D fputs(cr_lf ? "\r\n" : "\n", fp);
> +-              else if (isprint(*s) || *s =3D=3D '\a' || *s =3D=3D '\t' =
|| *s =3D=3D
> '\r')
> ++                      if (*s =3D=3D '\n' || ret < 0)
> ++                              goto wrote;
> ++              }
> ++
> ++              if (isprint(*s) || *s =3D=3D '\a' || *s =3D=3D '\t' || *s=
 =3D=3D '\r')
> {
> +                       ret =3D putc(*s, fp);
> +-              else if (!c_isascii(*s)) {
> ++                      ++col;
> ++              } else if (!c_isascii(*s)) {
> + #ifdef HAVE_WIDECHAR
> +                       wchar_t w;
> +                       size_t clen =3D mbtowc(&w, s, slen);
> +@@ -35,21 +53,27 @@ static inline int fputs_careful(const char * s, FILE
> *fp, const char ctrl, bool
> +                               case (size_t)-1:  // EILSEQ
> +                                       mbtowc(NULL, NULL, 0);
> +                               nonprint:
> +-                                      ret =3D fprintf(fp, "\\%3hho", *s=
);
> ++                                      col +=3D ret =3D fprintf(fp,
> "\\%3hho", *s);
> +                                       break;
> +                               default:
> +                                       if(!iswprint(w))
> +                                               goto nonprint;
> +                                       ret =3D fwrite(s, 1, clen, fp);
> ++                                      if (soft_width)
> ++                                              col +=3D wcwidth(w);
> +                                       s +=3D clen - 1;
> +                                       slen -=3D clen - 1;
> +                                       break;
> +                       }
> + #else
> +-                      ret =3D fprintf(fp, "\\%3hho", *s);
> ++                      col +=3D ret =3D fprintf(fp, "\\%3hho", *s);
> + #endif
> +-              } else
> ++              } else {
> +                       ret =3D fputs((char[]){ ctrl, *s ^ 0x40, '\0' }, =
fp);
> ++                      col +=3D 2;
> ++              }
> ++
> ++      wrote:
> +               if (ret < 0)
> +                       return EOF;
> +       }
> +diff --git a/login-utils/last.c b/login-utils/last.c
> +index 1b45dbf24d..37c6abe972 100644
> +--- a/login-utils/last.c
> ++++ b/login-utils/last.c
> +@@ -547,7 +547,7 @@ static int list(const struct last_control *ctl,
> struct utmpx *p, time_t logout_t
> +       /*
> +        *      Print out "final" string safely.
> +        */
> +-      fputs_careful(final, stdout, '*', false);
> ++      fputs_careful(final, stdout, '*', false, 0);
> +
> +       if (len < 0 || (size_t)len >=3D sizeof(final))
> +               putchar('\n');
> +diff --git a/term-utils/wall.c b/term-utils/wall.c
> +index a51a928293..377db45183 100644
> +--- a/term-utils/wall.c
> ++++ b/term-utils/wall.c
> +@@ -274,29 +274,13 @@ int main(int argc, char **argv)
> +       exit(EXIT_SUCCESS);
> + }
> +
> +-static void buf_putc_careful(FILE *fs, int c)
> +-{
> +-      if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r'=
 || c =3D=3D '\n')
> +-              fputc(c, fs);
> +-      else if (!c_isascii(c))
> +-              fprintf(fs, "\\%3o", (unsigned char)c);
> +-      else
> +-              fputs((char[]){ '^', c ^ 0x40, '\0' }, fs);
> +-}
> +-
> + static char *makemsg(char *fname, char **mvec, int mvecsz,
> +                    size_t *mbufsize, int print_banner)
> + {
> +-      register int ch, cnt;
> +-      char *p, *lbuf, *retbuf;
> ++      char *lbuf, *retbuf;
> +       FILE * fs =3D open_memstream(&retbuf, mbufsize);
> +-      long line_max;
> +-
> +-      line_max =3D sysconf(_SC_LINE_MAX);
> +-      if (line_max <=3D 0)
> +-              line_max =3D 512;
> +-
> +-      lbuf =3D xmalloc(line_max);
> ++      size_t lbuflen =3D 512;
> ++      lbuf =3D xmalloc(lbuflen);
> +
> +       if (print_banner =3D=3D TRUE) {
> +               char *hostname =3D xgethostname();
> +@@ -329,7 +313,7 @@ static char *makemsg(char *fname, char **mvec, int
> mvecsz,
> +                  will not overflow as long as %d takes at most 100 char=
s
> */
> +               fprintf(fs, "\r%*s\r\n", TERM_WIDTH, " ");
> +
> +-              snprintf(lbuf, line_max,
> ++              snprintf(lbuf, lbuflen,
> +                               _("Broadcast message from %s@%s (%s)
> (%s):"),
> +                               whom, hostname, where, date);
> +               fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH,
> lbuf);
> +@@ -373,18 +357,8 @@ static char *makemsg(char *fname, char **mvec, int
> mvecsz,
> +               /*
> +                * Read message from stdin.
> +                */
> +-              while (fgets(lbuf, line_max, stdin)) {
> +-                      for (cnt =3D 0, p =3D lbuf; (ch =3D *p) !=3D '\0'=
; ++p,
> ++cnt) {
> +-                              if (cnt =3D=3D TERM_WIDTH || ch =3D=3D '\=
n') {
> +-                                      fprintf(fs, "%*s\r\n", TERM_WIDTH
> - cnt, "");
> +-                                      cnt =3D 0;
> +-                              }
> +-                              if (ch =3D=3D '\t')
> +-                                      cnt +=3D (7 - (cnt % 8));
> +-                              if (ch !=3D '\n')
> +-                                      buf_putc_careful(fs, ch);
> +-                      }
> +-              }
> ++              while (getline(&lbuf, &lbuflen, stdin) >=3D 0)
> ++                      fputs_careful(lbuf, fs, '^', true, TERM_WIDTH);
> +       }
> +       fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
> +
> +diff --git a/term-utils/write.c b/term-utils/write.c
> +index b485e28fd5..a5a21280c3 100644
> +--- a/term-utils/write.c
> ++++ b/term-utils/write.c
> +@@ -276,7 +276,7 @@ static void do_write(const struct write_control *ctl=
)
> +               if (signal_received)
> +                       break;
> +
> +-              if (fputs_careful(line, stdout, '^', true) =3D=3D EOF)
> ++              if (fputs_careful(line, stdout, '^', true, 0) =3D=3D EOF)
> +                       err(EXIT_FAILURE, _("carefulputc failed"));
> +       }
> +       free(line);
> diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch
> b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch
> new file mode 100644
> index 0000000000..0bfc3cde75
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch
> @@ -0,0 +1,30 @@
> +From 404b0781f52f7c045ca811b2dceec526408ac253 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Thu, 21 Mar 2024 11:16:20 +0100
> +Subject: [PATCH] wall: fix escape sequence Injection [CVE-2024-28085]
> +
> +Let's use for all cases the same output function.
> +
> +Reported-by: Skyler Ferrante <sjf5462@rit.edu>
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +Upstream-Status: Backport [
> https://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2d=
ceec526408ac253
> ]
> +CVE: CVE-2024-28085
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + term-utils/wall.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/term-utils/wall.c b/term-utils/wall.c
> +index f894a32f86..588d3a9636 100644
> +--- a/term-utils/wall.c
> ++++ b/term-utils/wall.c
> +@@ -368,7 +368,7 @@ static char *makemsg(char *fname, char **mvec, int
> mvecsz,
> +               int i;
> +
> +               for (i =3D 0; i < mvecsz; i++) {
> +-                      fputs(mvec[i], fs);
> ++                      fputs_careful(mvec[i], fs, '^', true, TERM_WIDTH)=
;
> +                       if (i < mvecsz - 1)
> +                               fputc(' ', fs);
> +               }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197629):
> https://lists.openembedded.org/g/openembedded-core/message/197629
> Mute This Topic: https://lists.openembedded.org/mt/105213911/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c88e1b0614cea1ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>Please ignore this=
 patch.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Mar 29, 2024 at 4:44=E2=80=AFPM Vijay Anusuri via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;vanusuri=3D<a =
href=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" targ=
et=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from<br>
<a href=3D"https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7c=
a557d1ac31f638986704757f&amp;" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7ca557d1ac31f6389867=
04757f<br>
&amp;</a><br>
<a href=3D"https://github.com/util-linux/util-linux/commit/27ee6446503af7ec=
0c2647704ca47ac4de3852ef&amp;" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/util-linux/util-linux/commit/27ee6446503af7ec0c2647704ca47ac4de=
3852ef<br>
&amp;</a><br>
<a href=3D"https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e=
4f6eb331f4d4d2dbc875e22f&amp;" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/util-linux/util-linux/commit/aa13246a1bf1be9e4f6eb331f4d4d2dbc8=
75e22f<br>
&amp;</a> <a href=3D"https://github.com/util-linux/util-linux/commit/404b07=
81f52f7c045ca811b2dceec526408ac253" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2dceec=
526408ac253</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0.../util-linux/CVE-2024-28085-pre1.patch=C2=A0 =C2=A0 =C2=A0 | 200 ++=
++++++++++++++<br>
=C2=A0.../util-linux/CVE-2024-28085-pre2.patch=C2=A0 =C2=A0 =C2=A0 | 171 ++=
++++++++++++<br>
=C2=A0.../util-linux/CVE-2024-28085-pre3.patch=C2=A0 =C2=A0 =C2=A0 | 219 ++=
++++++++++++++++<br>
=C2=A0.../util-linux/CVE-2024-28085.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 30 +++<br>
=C2=A05 files changed, 624 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2=
8085-pre1.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2=
8085-pre2.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2=
8085-pre3.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2=
8085.patch<br>
<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index 982ec669a2..079359c55c 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -35,6 +35,10 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/util-l=
inux/v${MAJOR_VERSION}/util-lin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://display_testname_for_subte=
st.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid_parallel_tests.patch=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-28085-pre1.patch =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-28085-pre2.patch =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-28085-pre3.patch =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-28085.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;634e6916ad913366c3536b6468e7844769549b99=
a7b2bf80314de78ab5655b83&quot;<br>
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.pa=
tch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch<br>
new file mode 100644<br>
index 0000000000..ce3056eabe<br>
--- /dev/null<br>
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch<br>
@@ -0,0 +1,200 @@<br>
+From 8a7b8456d1dc0e7ca557d1ac31f638986704757f Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?=3DD0=3DBD=3DD0=3DB0=3DD0=3DB1?=3D &lt;<a href=3D"mailto=
:nabijaczleweli@nabijaczleweli.xyz" target=3D"_blank">nabijaczleweli@nabija=
czleweli.xyz</a>&gt;<br>
+Date: Wed, 15 Mar 2023 16:16:31 +0100<br>
+Subject: [PATCH] write: correctly handle wide characters<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Do this by replacing fputc_careful() (notice that the description said<br>
+it&#39;s locale-aware =E2=80=92 it very much is /not/), with a fputs_caref=
ul() which<br>
+does the same thing, but if it were to output a byte in the \123 format,<b=
r>
+first it checks whether this byte starts a valid multibyte character.<br>
+<br>
+If it does, and that character is printable, write it verbatim.<br>
+This means that<br>
+=C2=A0 echo &#39;foo =C3=A5=C3=A4=C3=B6 =C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=
=84 bar&#39; | write nabijaczleweli pts/4<br>
+instead of<br>
+=C2=A0 foo \303\245\303\244\303\266<br>
+=C2=A0 \304\205\304\231\304\207\305\272\305\274\305\204 bar<br>
+yields<br>
+=C2=A0 foo =C3=A5=C3=A4=C3=B6 =C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84 bar<br>
+or, more realistically, from a message I got earlier today,<br>
+=C2=A0 Filip powiedzia\305\202 \305\274e zap\305\202aci jutro<br>
+becomes<br>
+=C2=A0 Filip powiedzia=C5=82 =C5=BCe zap=C5=82aci jutro<br>
+<br>
+Invalid/non-printable sequences get processed as before.<br>
+<br>
+Line reading in write must become getline() to avoid dealing with<br>
+partial characters: for example on input consisting solely of<br>
+=C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84, where every {1} is an instance, the =
output would be<br>
+=C2=A0 {42}=C4=85=C4=99=C4=87\305\272=C5=BC=C5=84{84}=C4=85=C4=99=C4=87=C5=
=BA\305\274=C5=84{84}=C4=85=C4=99=C4=87=C5=BA=C5=BC\305\204{39}<br>
+with just fixed-512 fgets()<br>
+<br>
+Bug-Debian: <a href=3D"https://bugs.debian.org/826596" rel=3D"noreferrer" =
target=3D"_blank">https://bugs.debian.org/826596</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/util-linux/util-l=
inux/commit/8a7b8456d1dc0e7ca557d1ac31f638986704757f" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/util-linux/util-linux/commit/8a7b8456d1d=
c0e7ca557d1ac31f638986704757f</a>]<br>
+CVE: CVE-2024-28085 #Dependency Patch1<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ include/carefulputc.h | 60 +++++++++++++++++++++++++++++++------------<br=
>
+ login-utils/last.c=C2=A0 =C2=A0 |=C2=A0 4 +--<br>
+ term-utils/write.c=C2=A0 =C2=A0 | 25 +++++-------------<br>
+ 3 files changed, 52 insertions(+), 37 deletions(-)<br>
+<br>
+diff --git a/include/carefulputc.h b/include/carefulputc.h<br>
+index 8860b12340..740add68e8 100644<br>
+--- a/include/carefulputc.h<br>
++++ b/include/carefulputc.h<br>
+@@ -1,31 +1,59 @@<br>
+ #ifndef UTIL_LINUX_CAREFULPUTC_H<br>
+ #define UTIL_LINUX_CAREFULPUTC_H<br>
+ <br>
+-/*<br>
+- * A putc() for use in write and wall (that sometimes are sgid tty).<br>
+- * It avoids control characters in our locale, and also ASCII control<br>
+- * characters.=C2=A0 =C2=A0Note that the locale of the recipient is unkno=
wn.<br>
+-*/<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;ctype.h&gt;<br>
++#ifdef HAVE_WIDECHAR<br>
++#include &lt;wctype.h&gt;<br>
++#endif<br>
++#include &lt;stdbool.h&gt;<br>
+ <br>
+ #include &quot;cctype.h&quot;<br>
+ <br>
+-static inline int fputc_careful(int c, FILE *fp, const char fail)<br>
++/*<br>
++ * A puts() for use in write and wall (that sometimes are sgid tty).<br>
++ * It avoids control and invalid characters.<br>
++ * The locale of the recipient is nominally unknown,<br>
++ * but it&#39;s a solid bet that the encoding is compatible with the auth=
or&#39;s.<br>
++ */<br>
++static inline int fputs_careful(const char * s, FILE *fp, const char ctrl=
, bool cr_lf)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 int ret;<br>
++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (isprint(c) || c =3D=3D &#39;\a&#39; || c =3D=3D =
&#39;\t&#39; || c =3D=3D &#39;\r&#39; || c =3D=3D &#39;\n&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D putc(c, fp);<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (!c_isascii(c))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fprintf(fp, &quo=
t;\\%3o&quot;, (unsigned char)c);<br>
+-=C2=A0 =C2=A0 =C2=A0 else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D putc(fail, fp);<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D EOF)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D putc(c ^ 0x40, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 for (size_t slen =3D strlen(s); *s; ++s, --slen) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*s =3D=3D &#39;\n&#3=
9;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D fputs(cr_lf ? &quot;\r\n&quot; : &quot;\n&quot;, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (isprint(*s) || =
*s =3D=3D &#39;\a&#39; || *s =3D=3D &#39;\t&#39; || *s =3D=3D &#39;\r&#39;)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D putc(*s, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (!c_isascii(*s))=
 {<br>
++#ifdef HAVE_WIDECHAR<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 wchar_t w;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t clen =3D mbtowc(&amp;w, s, slen);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 switch(clen) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case (size_t)-2:=C2=A0 // incomplete<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case (size_t)-1:=C2=A0 // EILSEQ<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mbtowc(NULL, NU=
LL, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nonprint:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fprintf=
(fp, &quot;\\%3hho&quot;, *s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!iswprint(w)=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 goto nonprint;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fwrite(=
s, 1, clen, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D clen - 1=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slen -=3D clen =
- 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D fprintf(fp, &quot;\\%3hho&quot;, *s);<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D fputs((char[]){ ctrl, *s ^ 0x40, &#39;\0&#39; }, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return EOF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 return (ret &lt; 0) ? EOF : 0;<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+ }<br>
+ <br>
+ static inline void fputs_quoted_case(const char *data, FILE *out, int dir=
)<br>
+diff --git a/login-utils/last.c b/login-utils/last.c<br>
+index d3eeed4b6e..1b45dbf24d 100644<br>
+--- a/login-utils/last.c<br>
++++ b/login-utils/last.c<br>
+@@ -392,7 +392,6 @@ static int list(const struct last_control *ctl, struct=
 utmpx *p, time_t logout_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
inal[512];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
tline[sizeof(p-&gt;ut_line) + 1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
omain[256];<br>
+-=C2=A0 =C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *s;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mins, hours, days;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0r, len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct last_timefmt *fmt;<br>
+@@ -548,8 +547,7 @@ static int list(const struct last_control *ctl, struct=
 utmpx *p, time_t logout_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 Print out &quot;final&qu=
ot; string safely.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 for (s =3D final; *s; s++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc_careful(*s, stdout=
, &#39;*&#39;);<br>
++=C2=A0 =C2=A0 =C2=A0 fputs_careful(final, stdout, &#39;*&#39;, false);<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt; 0 || (size_t)len &gt;=3D sizeof(fi=
nal))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0putchar(&#39;\n&#39=
;);<br>
+diff --git a/term-utils/write.c b/term-utils/write.c<br>
+index 8b86e9a9d5..b485e28fd5 100644<br>
+--- a/term-utils/write.c<br>
++++ b/term-utils/write.c<br>
+@@ -223,21 +223,6 @@ static void signal_handler(int signo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0signal_received =3D signo;<br>
+ }<br>
+ <br>
+-/*<br>
+- * write_line - like fputs(), but makes control characters visible and<br=
>
+- *=C2=A0 =C2=A0 =C2=A0turns \n into \r\n.<br>
+- */<br>
+-static void write_line(char *s)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 while (*s) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const int c =3D *s++;<br=
>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((c =3D=3D &#39;\n&#3=
9; &amp;&amp; fputc_careful(&#39;\r&#39;, stdout, &#39;^&#39;) =3D=3D EOF)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || fputc_c=
areful(c, stdout, &#39;^&#39;) =3D=3D EOF)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err(EXIT_FAILURE, _(&quot;carefulputc failed&quot;));<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+ /*<br>
+=C2=A0 * do_write - actually make the connection<br>
+=C2=A0 */<br>
+@@ -247,7 +232,8 @@ static void do_write(const struct write_control *ctl)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct passwd *pwd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0time_t now;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tm *tm;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *host, line[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char *host, *line =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t linelen =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sigaction sigact;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Determine our login name(s) before the we re=
open() stdout */<br>
+@@ -286,11 +272,14 @@ static void do_write(const struct write_control *ctl=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(host);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\r\n&quot;);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 while (fgets(line, sizeof(line), stdin) !=3D NULL) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 while (getline(&amp;line, &amp;linelen, stdin) &gt;=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (signal_received=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_line(line);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fputs_careful(line, =
stdout, &#39;^&#39;, true) =3D=3D EOF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err(EXIT_FAILURE, _(&quot;carefulputc failed&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 free(line);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;EOF\r\n&quot;);<br>
+ }<br>
+ <br>
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.pa=
tch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch<br>
new file mode 100644<br>
index 0000000000..1c4e4394cc<br>
--- /dev/null<br>
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch<br>
@@ -0,0 +1,171 @@<br>
+From 27ee6446503af7ec0c2647704ca47ac4de3852ef Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?=3DD0=3DBD=3DD0=3DB0=3DD0=3DB1?=3D &lt;<a href=3D"mailto=
:nabijaczleweli@nabijaczleweli.xyz" target=3D"_blank">nabijaczleweli@nabija=
czleweli.xyz</a>&gt;<br>
+Date: Wed, 15 Mar 2023 16:16:43 +0100<br>
+Subject: [PATCH] wall: convert homebrew buffering to open_memstream()<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The struct buffer system duplicates a plethora of standard I/O<br>
+functions (including a fork of fputc_careful())<br>
+and adds a lot of complexity =E2=80=92 open_memstream() is standard,<br>
+and fits perfectly into this niche<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/util-linux/util-l=
inux/commit/27ee6446503af7ec0c2647704ca47ac4de3852ef" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/util-linux/util-linux/commit/27ee6446503=
af7ec0c2647704ca47ac4de3852ef</a>]<br>
+CVE: CVE-2024-28085 #Dependency Patch2<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ term-utils/wall.c | 95 ++++++++++-------------------------------------<br=
>
+ 1 file changed, 20 insertions(+), 75 deletions(-)<br>
+<br>
+diff --git a/term-utils/wall.c b/term-utils/wall.c<br>
+index c601d3e5b7..a51a928293 100644<br>
+--- a/term-utils/wall.c<br>
++++ b/term-utils/wall.c<br>
+@@ -274,74 +274,22 @@ int main(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_SUCCESS);<br>
+ }<br>
+ <br>
+-struct buffer {<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 sz;<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 used;<br>
+-=C2=A0 =C2=A0 =C2=A0 char=C2=A0 =C2=A0 *data;<br>
+-};<br>
+-<br>
+-static void buf_enlarge(struct buffer *bs, size_t len)<br>
++static void buf_putc_careful(FILE *fs, int c)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (bs-&gt;sz =3D=3D 0 || len &gt; bs-&gt;sz - bs-&g=
t;used) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;sz +=3D len &lt; =
128 ? 128 : len;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;data =3D xrealloc=
(bs-&gt;data, bs-&gt;sz);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-static void buf_puts(struct buffer *bs, const char *s)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(s);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 buf_enlarge(bs, len + 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 memcpy(bs-&gt;data + bs-&gt;used, s, len + 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 bs-&gt;used +=3D len;<br>
+-}<br>
+-<br>
+-static void __attribute__((__format__ (__printf__, 2, 3)))<br>
+-=C2=A0 =C2=A0 =C2=A0 buf_printf(struct buffer *bs, const char *fmt, ...)<=
br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 int rc;<br>
+-=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t limit;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 buf_enlarge(bs, 0);=C2=A0 =C2=A0 =C2=A0/* default si=
ze */<br>
+-=C2=A0 =C2=A0 =C2=A0 limit =3D bs-&gt;sz - bs-&gt;used;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
+-=C2=A0 =C2=A0 =C2=A0 rc =3D vsnprintf(bs-&gt;data + bs-&gt;used, limit, f=
mt, ap);<br>
+-=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rc &gt;=3D 0 &amp;&amp; (size_t) rc &gt;=3D limi=
t) {=C2=A0 /* not enough, enlarge */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_enlarge(bs, (size_t)=
rc + 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D bs-&gt;sz - bs=
-&gt;used;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D vsnprintf(bs-&gt;=
data=C2=A0 + bs-&gt;used, limit, fmt, ap);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rc &gt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;used +=3D rc;<br>
+-}<br>
+-<br>
+-static void buf_putc_careful(struct buffer *bs, int c)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 if (isprint(c) || c =3D=3D &#39;\a&#39; || c =3D=3D =
&#39;\t&#39; || c =3D=3D &#39;\r&#39; || c =3D=3D &#39;\n&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_enlarge(bs, 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;data[bs-&gt;used+=
+] =3D c;<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if (!c_isascii(c))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_printf(bs, &quot;\\%=
3o&quot;, (unsigned char)c);<br>
+-=C2=A0 =C2=A0 =C2=A0 else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char tmp[] =3D { &#39;^&=
#39;, c ^ 0x40, &#39;\0&#39; };<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_puts(bs, tmp);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (isprint(c) || c =3D=3D &#39;\a&#39; || c =3D=3D =
&#39;\t&#39; || c =3D=3D &#39;\r&#39; || c =3D=3D &#39;\n&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc(c, fs);<br>
++=C2=A0 =C2=A0 =C2=A0 else if (!c_isascii(c))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fs, &quot;\\%3o&=
quot;, (unsigned char)c);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs((char[]){ &#39;^&#=
39;, c ^ 0x40, &#39;\0&#39; }, fs);<br>
+ }<br>
+ <br>
+ static char *makemsg(char *fname, char **mvec, int mvecsz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
_t *mbufsize, int print_banner)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 struct buffer _bs =3D {.used =3D 0}, *bs =3D &amp;_b=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0register int ch, cnt;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *p, *lbuf;<br>
++=C2=A0 =C2=A0 =C2=A0 char *p, *lbuf, *retbuf;<br>
++=C2=A0 =C2=A0 =C2=A0 FILE * fs =3D open_memstream(&amp;retbuf, mbufsize);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long line_max;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0line_max =3D sysconf(_SC_LINE_MAX);<br>
+@@ -379,15 +327,15 @@ static char *makemsg(char *fname, char **mvec, int m=
vecsz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* snprintf is not =
always available, but the sprintf&#39;s here<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will not ov=
erflow as long as %d takes at most 100 chars */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_printf(bs, &quot;\r%=
*s\r\n&quot;, TERM_WIDTH, &quot; &quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fs, &quot;\r%*s\=
r\n&quot;, TERM_WIDTH, &quot; &quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(lbuf, line=
_max,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;Broadcast message from %s@%s =
(%s) (%s):&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whom, hostname, where, date);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_printf(bs, &quot;%-*=
.*s\007\007\r\n&quot;, TERM_WIDTH, TERM_WIDTH, lbuf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fs, &quot;%-*.*s=
\007\007\r\n&quot;, TERM_WIDTH, TERM_WIDTH, lbuf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(hostname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 buf_printf(bs, &quot;%*s\r\n&quot;, TERM_WIDTH, &quo=
t; &quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(fs, &quot;%*s\r\n&quot;, TERM_WIDTH, &quot; =
&quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mvec) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+@@ -396,11 +344,11 @@ static char *makemsg(char *fname, char **mvec, int m=
vecsz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; mvecsz; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf_puts(bs, mvec[i]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fputs(mvec[i], fs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (i &lt; mvecsz - 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_puts(bs, &quot; &quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc(&#39; &#39;, fs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_puts(bs, &quot;\r\n&=
quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs(&quot;\r\n&quot;, =
fs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * read message fro=
m &lt;file&gt;<br>
+@@ -428,23 +376,20 @@ static char *makemsg(char *fname, char **mvec, int m=
vecsz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (fgets(lbuf, =
line_max, stdin)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for (cnt =3D 0, p =3D lbuf; (ch =3D *p) !=3D &#39;\0&#39;; ++p, +=
+cnt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cnt =3D=3D TERM_WIDTH || ch =3D=
=3D &#39;\n&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (; cnt &lt;=
 TERM_WIDTH; ++cnt)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 buf_puts(bs, &quot; &quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_puts(bs, &q=
uot;\r\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fs, &qu=
ot;%*s\r\n&quot;, TERM_WIDTH - cnt, &quot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cnt =3D 0=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ch =3D=3D &#39;\t&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cnt +=3D =
(7 - (cnt % 8));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ch !=3D &#39;\n&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_putc_carefu=
l(bs, ch);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_putc_carefu=
l(fs, ch);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 buf_printf(bs, &quot;%*s\r\n&quot;, TERM_WIDTH, &quo=
t; &quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(fs, &quot;%*s\r\n&quot;, TERM_WIDTH, &quot; =
&quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(lbuf);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 bs-&gt;data[bs-&gt;used] =3D &#39;\0&#39;;=C2=A0 =C2=
=A0 =C2=A0 /* be paranoid */<br>
+-=C2=A0 =C2=A0 =C2=A0 *mbufsize =3D bs-&gt;used;<br>
+-=C2=A0 =C2=A0 =C2=A0 return bs-&gt;data;<br>
++=C2=A0 =C2=A0 =C2=A0 fclose(fs);<br>
++=C2=A0 =C2=A0 =C2=A0 return retbuf;<br>
+ }<br>
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.pa=
tch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch<br>
new file mode 100644<br>
index 0000000000..91beb53d1c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch<br>
@@ -0,0 +1,219 @@<br>
+From aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?=3DD0=3DBD=3DD0=3DB0=3DD0=3DB1?=3D &lt;<a href=3D"mailto=
:nabijaczleweli@nabijaczleweli.xyz" target=3D"_blank">nabijaczleweli@nabija=
czleweli.xyz</a>&gt;<br>
+Date: Wed, 15 Mar 2023 16:16:48 +0100<br>
+Subject: [PATCH] wall: use fputs_careful()<br>
+<br>
+LINE_MAX only applies to teletypes in canonical mode: when stdin is a<br>
+file, it could still very much tear; start off at 512 for the sprintf(),<b=
r>
+then use getline() like in write.<br>
+<br>
+The line wrapping has one suboptimal edge-case:<br>
+=C2=A0 $ wall &lt; all<br>
+<br>
+=C2=A0 Broadcast message from nabijaczleweli@tarta (pts/4) (Tue Mar 14 22:=
31:25<br>
+=C2=A0 2023):<br>
+<br>
+=C2=A0 ^N^O^P^Q^R^S^T^U^V^W^X^Y^Z^[^\^]^^^_<br>
+=C2=A0 !&quot;#$%&amp;&#39;()*+,-./0123456789:;&lt;=3D&gt;?@ABCDEFGHIJ<br>
+=C2=A0 KLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~^?\200\201\202\=
203\204\205\206<br>
+=C2=A0 \207\210\211\212\213\214\215\216\217\220\221\222\223\224\225\226\22=
7\230\231\232<br>
+=C2=A0 \233\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\25=
3\254\255\256<br>
+=C2=A0 \257\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\27=
7\300\301\302<br>
+=C2=A0 \303\304\305\306\307\310\311\312\313\314\315\316\317\320\321\322\32=
3\324\325\326<br>
+=C2=A0 \327\330\331\332\333\334\335\336\337\340\341\342\343\344\345\346\34=
7\350\351\352<br>
+=C2=A0 \353\354\355\356\357\360\361\362\363\364\365\366\367\370\371\372\37=
3\374\375\376<br>
+=C2=A0 \377<br>
+but that&#39;s a pathological input, and the result is still infinitely<br=
>
+better than it was before, so fixing that is more trouble than it&#39;s<br=
>
+worth.<br>
+<br>
+Bug-Debian: <a href=3D"https://bugs.debian.org/826596" rel=3D"noreferrer" =
target=3D"_blank">https://bugs.debian.org/826596</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/util-linux/util-l=
inux/commit/aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/util-linux/util-linux/commit/aa13246a1bf=
1be9e4f6eb331f4d4d2dbc875e22f</a>]<br>
+CVE: CVE-2024-28085 #Dependency Patch3<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ include/carefulputc.h | 42 +++++++++++++++++++++++++++++++++---------<br>
+ login-utils/last.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ term-utils/wall.c=C2=A0 =C2=A0 =C2=A0| 38 ++++++-------------------------=
-------<br>
+ term-utils/write.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ 4 files changed, 41 insertions(+), 43 deletions(-)<br>
+<br>
+diff --git a/include/carefulputc.h b/include/carefulputc.h<br>
+index 740add68e8..3cc6f7ff99 100644<br>
+--- a/include/carefulputc.h<br>
++++ b/include/carefulputc.h<br>
+@@ -6,6 +6,7 @@<br>
+ #include &lt;ctype.h&gt;<br>
+ #ifdef HAVE_WIDECHAR<br>
+ #include &lt;wctype.h&gt;<br>
++#include &lt;wchar.h&gt;<br>
+ #endif<br>
+ #include &lt;stdbool.h&gt;<br>
+ <br>
+@@ -15,18 +16,35 @@<br>
+=C2=A0 * A puts() for use in write and wall (that sometimes are sgid tty).=
<br>
+=C2=A0 * It avoids control and invalid characters.<br>
+=C2=A0 * The locale of the recipient is nominally unknown,<br>
+- * but it&#39;s a solid bet that the encoding is compatible with the auth=
or&#39;s.<br>
++ * but it&#39;s a solid bet that it&#39;s compatible with the author&#39;=
s.<br>
++ * Use soft_width=3D0 to disable wrapping.<br>
+=C2=A0 */<br>
+-static inline int fputs_careful(const char * s, FILE *fp, const char ctrl=
, bool cr_lf)<br>
++static inline int fputs_careful(const char * s, FILE *fp, const char ctrl=
, bool cr_lf, int soft_width)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0, col =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (size_t slen =3D strlen(s); *s; ++s, --slen=
) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*s =3D=3D &#39;\n&#3=
9;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*s =3D=3D &#39;\t&#3=
9;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col +=3D (7 - (col % 8)) - 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (*s =3D=3D &#39;=
\r&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D -1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (*s =3D=3D &#39;=
\a&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --col;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((soft_width &amp;&am=
p; col &gt;=3D soft_width) || *s =3D=3D &#39;\n&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (soft_width) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fp, &quot;%*s&quot;, soft_width - c=
ol, &quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D fputs(cr_lf ? &quot;\r\n&quot; : &quot;\n&quot;, fp);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (isprint(*s) || =
*s =3D=3D &#39;\a&#39; || *s =3D=3D &#39;\t&#39; || *s =3D=3D &#39;\r&#39;)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (*s =3D=3D &#39;\n&#39; || ret &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto wrote;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isprint(*s) || *s =
=3D=3D &#39;\a&#39; || *s =3D=3D &#39;\t&#39; || *s =3D=3D &#39;\r&#39;) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D putc(*s, fp);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (!c_isascii(*s))=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ++col;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!c_isascii(*s=
)) {<br>
+ #ifdef HAVE_WIDECHAR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0wchar_t w;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0size_t clen =3D mbtowc(&amp;w, s, slen);<br>
+@@ -35,21 +53,27 @@ static inline int fputs_careful(const char * s, FILE *=
fp, const char ctrl, bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case (size_t)-1:=C2=A0 // EILSEQ<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mbtowc(NU=
LL, NULL, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nonprint:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fprintf=
(fp, &quot;\\%3hho&quot;, *s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col +=3D ret =
=3D fprintf(fp, &quot;\\%3hho&quot;, *s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!iswpr=
int(w))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0goto nonprint;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D f=
write(s, 1, clen, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (soft_width)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 col +=3D wcwidth(w);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s +=3D cl=
en - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slen -=3D=
 clen - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+ #else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D fprintf(fp, &quot;\\%3hho&quot;, *s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col +=3D ret =3D fprintf(fp, &quot;\\%3hho&quot;, *s);<br>
+ #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D fputs((char[]){ ctrl, *s ^ 0x40, &#39;\0&#39; }, fp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col +=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 wrote:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return EOF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/login-utils/last.c b/login-utils/last.c<br>
+index 1b45dbf24d..37c6abe972 100644<br>
+--- a/login-utils/last.c<br>
++++ b/login-utils/last.c<br>
+@@ -547,7 +547,7 @@ static int list(const struct last_control *ctl, struct=
 utmpx *p, time_t logout_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 Print out &quot;final&qu=
ot; string safely.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 fputs_careful(final, stdout, &#39;*&#39;, false);<br=
>
++=C2=A0 =C2=A0 =C2=A0 fputs_careful(final, stdout, &#39;*&#39;, false, 0);=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt; 0 || (size_t)len &gt;=3D sizeof(fi=
nal))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0putchar(&#39;\n&#39=
;);<br>
+diff --git a/term-utils/wall.c b/term-utils/wall.c<br>
+index a51a928293..377db45183 100644<br>
+--- a/term-utils/wall.c<br>
++++ b/term-utils/wall.c<br>
+@@ -274,29 +274,13 @@ int main(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_SUCCESS);<br>
+ }<br>
+ <br>
+-static void buf_putc_careful(FILE *fs, int c)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0 if (isprint(c) || c =3D=3D &#39;\a&#39; || c =3D=3D =
&#39;\t&#39; || c =3D=3D &#39;\r&#39; || c =3D=3D &#39;\n&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputc(c, fs);<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (!c_isascii(c))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fs, &quot;\\%3o&=
quot;, (unsigned char)c);<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs((char[]){ &#39;^&#=
39;, c ^ 0x40, &#39;\0&#39; }, fs);<br>
+-}<br>
+-<br>
+ static char *makemsg(char *fname, char **mvec, int mvecsz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
_t *mbufsize, int print_banner)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 register int ch, cnt;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *p, *lbuf, *retbuf;<br>
++=C2=A0 =C2=A0 =C2=A0 char *lbuf, *retbuf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE * fs =3D open_memstream(&amp;retbuf, mbufs=
ize);<br>
+-=C2=A0 =C2=A0 =C2=A0 long line_max;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 line_max =3D sysconf(_SC_LINE_MAX);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (line_max &lt;=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line_max =3D 512;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 lbuf =3D xmalloc(line_max);<br>
++=C2=A0 =C2=A0 =C2=A0 size_t lbuflen =3D 512;<br>
++=C2=A0 =C2=A0 =C2=A0 lbuf =3D xmalloc(lbuflen);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (print_banner =3D=3D TRUE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *hostname =3D =
xgethostname();<br>
+@@ -329,7 +313,7 @@ static char *makemsg(char *fname, char **mvec, int mve=
csz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will not ov=
erflow as long as %d takes at most 100 chars */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(fs, &quot;\=
r%*s\r\n&quot;, TERM_WIDTH, &quot; &quot;);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(lbuf, line_max,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(lbuf, lbuflen,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;Broadcast message from %s@%s =
(%s) (%s):&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whom, hostname, where, date);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(fs, &quot;%=
-*.*s\007\007\r\n&quot;, TERM_WIDTH, TERM_WIDTH, lbuf);<br>
+@@ -373,18 +357,8 @@ static char *makemsg(char *fname, char **mvec, int mv=
ecsz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Read message fro=
m stdin.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (fgets(lbuf, line_=
max, stdin)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for (cnt =3D 0, p =3D lbuf; (ch =3D *p) !=3D &#39;\0&#39;; ++p, ++cnt) =
{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cnt =3D=3D TERM_WIDTH || ch =3D=3D &#39=
;\n&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(fs, &qu=
ot;%*s\r\n&quot;, TERM_WIDTH - cnt, &quot;&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnt =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch =3D=3D &#39;\t&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnt +=3D (7 - (=
cnt % 8));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch !=3D &#39;\n&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_putc_carefu=
l(fs, ch);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (getline(&amp;lbuf=
, &amp;lbuflen, stdin) &gt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fputs_careful(lbuf, fs, &#39;^&#39;, true, TERM_WIDTH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(fs, &quot;%*s\r\n&quot;, TERM_WIDTH, &q=
uot; &quot;);<br>
+ <br>
+diff --git a/term-utils/write.c b/term-utils/write.c<br>
+index b485e28fd5..a5a21280c3 100644<br>
+--- a/term-utils/write.c<br>
++++ b/term-utils/write.c<br>
+@@ -276,7 +276,7 @@ static void do_write(const struct write_control *ctl)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (signal_received=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fputs_careful(line, =
stdout, &#39;^&#39;, true) =3D=3D EOF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fputs_careful(line, =
stdout, &#39;^&#39;, true, 0) =3D=3D EOF)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0err(EXIT_FAILURE, _(&quot;carefulputc failed&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(line);<br>
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch b=
/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch<br>
new file mode 100644<br>
index 0000000000..0bfc3cde75<br>
--- /dev/null<br>
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch<br>
@@ -0,0 +1,30 @@<br>
+From 404b0781f52f7c045ca811b2dceec526408ac253 Mon Sep 17 00:00:00 2001<br>
+From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"_blank">k=
zak@redhat.com</a>&gt;<br>
+Date: Thu, 21 Mar 2024 11:16:20 +0100<br>
+Subject: [PATCH] wall: fix escape sequence Injection [CVE-2024-28085]<br>
+<br>
+Let&#39;s use for all cases the same output function.<br>
+<br>
+Reported-by: Skyler Ferrante &lt;<a href=3D"mailto:sjf5462@rit.edu" target=
=3D"_blank">sjf5462@rit.edu</a>&gt;<br>
+Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D"=
_blank">kzak@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/util-linux/util-l=
inux/commit/404b0781f52f7c045ca811b2dceec526408ac253" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/util-linux/util-linux/commit/404b0781f52=
f7c045ca811b2dceec526408ac253</a>]<br>
+CVE: CVE-2024-28085<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ term-utils/wall.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/term-utils/wall.c b/term-utils/wall.c<br>
+index f894a32f86..588d3a9636 100644<br>
+--- a/term-utils/wall.c<br>
++++ b/term-utils/wall.c<br>
+@@ -368,7 +368,7 @@ static char *makemsg(char *fname, char **mvec, int mve=
csz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; mvecsz; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fputs(mvec[i], fs);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fputs_careful(mvec[i], fs, &#39;^&#39;, true, TERM_WIDTH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (i &lt; mvecsz - 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fputc(&#39; &#39;, fs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197629): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197629" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197629</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105213911/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105213911/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c88e1b0614cea1ae--

