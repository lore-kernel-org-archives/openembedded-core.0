Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C8DC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 16:15:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.13771.1639066545754789812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 08:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mbx43Nwf;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.42,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f42.google.com with SMTP id a18so10588768wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 08:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PIJ07uP241cWbJVfZ+LB5XUNptn2HV/qIRMrmpdRPAc=;
        b=mbx43NwflRUj3NqsVImUMNtZ/SwqjF2ePRcHC+8F3gEXNKJftqEHmsm/ThCPGxKinr
         hEFhZcEi2fBI70a0Sksou0o7Cp5zroF5RN1iE/LWv07viLuoXzom019tFG6EDzXjngs1
         AGETcp6QAOyUc+BdPUxQTfPR3KQpvHO3U6aY4FsaVgMgU6f/SYhr2A6bdibF5EFOZm0V
         Rm610zSsK1oaxo6x0RzMhBFC6qrR22sAc7uWNU6mdR8jB7v6jSjUulAmbmJfdGt4J9ar
         fj0nFkugwEpzgedqEI9xZ3uqcI7IftYymUn5t9Oa/KPoOn3eGWk4uIwRLovxNHe6CeC8
         fDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PIJ07uP241cWbJVfZ+LB5XUNptn2HV/qIRMrmpdRPAc=;
        b=3paNYTOA+beJnalNUBPyfzCOgqe0e4tYZ1pbphVatPZFHXi0FQCjDOwBCm/7X8Tihg
         sP3aiBUvAov2o3K0hjqaibjI8YqaInp5FYD7LcGBaRDSwCS99YFAG+RFwkF/lsiWkk7p
         0QiWJO2/SJzr+ntko8TB8ZKveVTboV80GRVJquLmTkEU1B2NCLy81v46+r8gv7IsEjVK
         lJw45HY9hQm44/ohz5Xw5b3pT6i0b9yeKVaaXGC9sMqGaTlVZ4DVNaGSuCnOXLbs/Xz4
         DNC3k7vRthci7IBL00Bl0xIMGyc3DlpeBPkG9gmxmjinvKDupx/I3T3k8BvygTGk45dz
         OHnA==
X-Gm-Message-State: AOAM531DoWkG4Nw944vKJ9u6Vg57jOWM4SWPc7xjfcErVwYAvCn7vxRI
	t6uXgQIHX+wiopi7ZIjjb3qqQJZHjzmneCz2SKKHww==
X-Google-Smtp-Source: 
 ABdhPJyXBXWshjh45O68eRn1u5Q8xonqfngbAMG0ZjhAltdsDJr0uSrJY+OdCkDFuFkIoG+mpUSx/txHBeTmkJrFr48=
X-Received: by 2002:adf:8010:: with SMTP id 16mr7614406wrk.559.1639066543506;
 Thu, 09 Dec 2021 08:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211209051213.18813-1-sanakazisk19@gmail.com>
In-Reply-To: <20211209051213.18813-1-sanakazisk19@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 9 Dec 2021 06:15:32 -1000
Message-ID: 
 <CAOSpxdaXUBzoYh_8SFu5ApNk4-q5ZXpsGwe83cHoXbGHTacBwQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] busybox: Fix multiple security
 issues in awk
To: sana kazi <sanakazisk19@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 16:15:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159460

Could you rebase this patch on current dunfell head (and fix fuzz if necessary)?

Thanks!

Steve

On Wed, Dec 8, 2021 at 7:13 PM sana kazi <sanakazisk19@gmail.com> wrote:
>
> CVE-2021-423xx-awk.patch fixes below listed CVEs for busybox:
> CVE-2021-42378, CVE-2021-42379, CVE-2021-42380, CVE-2021-42381,
> CVE-2021-42382, CVE-2021-42384, CVE-2021-42385, CVE-2021-42386
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
>  .../busybox/files/CVE-2021-423xx-awk.patch    | 203 ++++++++++++++++++
>  2 files changed, 204 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
>
> diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
> index d9d5f4f96b..1bb0c028ac 100644
> --- a/meta/recipes-core/busybox/busybox_1.31.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
> @@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://0001-hwclock-make-glibc-2.31-compatible.patch \
>             file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
>             file://0001-mktemp-add-tmpdir-option.patch \
> +           file://CVE-2021-423xx-awk.patch \
>             "
>  SRC_URI_append_libc-musl = " file://musl.cfg "
>
> diff --git a/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch b/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
> new file mode 100644
> index 0000000000..49296354cb
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
> @@ -0,0 +1,203 @@
> +Description: fix multiple security issues in awk
> +Origin: backported awk.c from busybox 1.34.1
> +
> +CVE: CVE-2021-42378
> +CVE: CVE-2021-42379
> +CVE: CVE-2021-42380
> +CVE: CVE-2021-42381
> +CVE: CVE-2021-42382
> +CVE: CVE-2021-42384
> +CVE: CVE-2021-42385
> +CVE: CVE-2021-42386
> +
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/busybox/1:1.30.1-6ubuntu3.1/busybox_1.30.1-6ubuntu3.1.debian.tar.xz]
> +
> +Comment: Refreshed first hunk and removed few hunks as they are already present in source.
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +--- a/editors/awk.c
> ++++ b/editors/awk.c
> +@@ -272,7 +272,8 @@
> + /* if previous token class is CONCAT1 and next is CONCAT2, concatenation */
> + /* operator is inserted between them */
> + #define       TC_CONCAT1 (TC_VARIABLE | TC_ARRTERM | TC_SEQTERM \
> +-                   | TC_STRING | TC_NUMBER | TC_UOPPOST)
> ++                   | TC_STRING | TC_NUMBER | TC_UOPPOST \
> ++                   | TC_LENGTH)
> + #define       TC_CONCAT2 (TC_OPERAND | TC_UOPPRE)
> +
> + #define       OF_RES1     0x010000
> +@@ -401,7 +405,7 @@ static const char tokenlist[] ALIGN1 =
> +
> + #define OC_B  OC_BUILTINCVE-2021-423xx-awk.patch
> +
> +-static const uint32_t tokeninfo[] = {
> ++static const uint32_t tokeninfo[] ALIGN4 = {
> +       0,
> +       0,
> +       OC_REGEXP
> +@@ -1067,8 +1071,10 @@ static uint32_t next_token(uint32_t expe
> +       const uint32_t *ti;
> +
> +       if (t_rollback) {
> ++              debug_printf_parse("%s: using rolled-back token\n", __func__);
> +               t_rollback = FALSE;
> +       } else if (concat_inserted) {
> ++              debug_printf_parse("%s: using concat-inserted token\n", __func__);
> +               concat_inserted = FALSE;
> +               t_tclass = save_tclass;
> +               t_info = save_info;
> +@@ -1197,7 +1203,11 @@ static uint32_t next_token(uint32_t expe
> +                       goto readnext;
> +
> +               /* insert concatenation operator when needed */
> +-              if ((ltclass & TC_CONCAT1) && (tc & TC_CONCAT2) && (expected & TC_BINOP)) {
> ++              debug_printf_parse("%s: %x %x %x concat_inserted?\n", __func__,
> ++                      (ltclass & TC_CONCAT1), (tc & TC_CONCAT2), (expected & TC_BINOP));
> ++              if ((ltclass & TC_CONCAT1) && (tc & TC_CONCAT2) && (expected & TC_BINOP)
> ++               && !(ltclass == TC_LENGTH && tc == TC_SEQSTART) /* but not for "length(..." */
> ++              ) {
> +                       concat_inserted = TRUE;
> +                       save_tclass = tc;
> +                       save_info = t_info;
> +@@ -1205,6 +1215,7 @@ static uint32_t next_token(uint32_t expe
> +                       t_info = OC_CONCAT | SS | P(35);
> +               }
> +
> ++              debug_printf_parse("%s: t_tclass=tc=%x\n", __func__, t_tclass);
> +               t_tclass = tc;
> +       }
> +       ltclass = t_tclass;
> +@@ -1215,6 +1226,7 @@ static uint32_t next_token(uint32_t expe
> +                               EMSG_UNEXP_EOS : EMSG_UNEXP_TOKEN);
> +       }
> +
> ++      debug_printf_parse("%s: returning, ltclass:%x t_double:%f\n", __func__, ltclass, t_double);
> +       return ltclass;
> + #undef concat_inserted
> + #undef save_tclass
> +@@ -1279,7 +1291,7 @@ static node *parse_expr(uint32_t iexp)
> +                       glptr = NULL;
> +
> +               } else if (tc & (TC_BINOP | TC_UOPPOST)) {
> +-                      debug_printf_parse("%s: TC_BINOP | TC_UOPPOST\n", __func__);
> ++                      debug_printf_parse("%s: TC_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
> +                       /* for binary and postfix-unary operators, jump back over
> +                        * previous operators with higher priority */
> +                       vn = cn;
> +@@ -1346,8 +1359,10 @@ static node *parse_expr(uint32_t iexp)
> +                                       v = cn->l.v = xzalloc(sizeof(var));
> +                                       if (tc & TC_NUMBER)
> +                                               setvar_i(v, t_double);
> +-                                      else
> ++                                      else {
> +                                               setvar_s(v, t_string);
> ++                                              xtc &= ~TC_UOPPOST; /* "str"++ is not allowed */
> ++                                      }
> +                                       break;
> +
> +                               case TC_REGEXP:
> +@@ -1383,7 +1398,12 @@ static node *parse_expr(uint32_t iexp)
> +
> +                               case TC_LENGTH:
> +                                       debug_printf_parse("%s: TC_LENGTH\n", __func__);
> +-                                      next_token(TC_SEQSTART | TC_OPTERM | TC_GRPTERM);
> ++                                      next_token(TC_SEQSTART /* length(...) */
> ++                                              | TC_OPTERM    /* length; (or newline)*/
> ++                                              | TC_GRPTERM   /* length } */
> ++                                              | TC_BINOPX    /* length <op> NUM */
> ++                                              | TC_COMMA     /* print length, 1 */
> ++                                      );
> +                                       rollback_token();
> +                                       if (t_tclass & TC_SEQSTART) {
> +                                               /* It was a "(" token. Handle just like TC_BUILTIN */
> +@@ -1726,12 +1763,34 @@ static void fsrealloc(int size)
> +       nfields = size;
> + }
> +
> ++static int regexec1_nonempty(const regex_t *preg, const char *s, regmatch_t pmatch[])
> ++{
> ++      int r = regexec(preg, s, 1, pmatch, 0);
> ++      if (r == 0 && pmatch[0].rm_eo == 0) {
> ++              /* For example, happens when FS can match
> ++               * an empty string (awk -F ' *'). Logically,
> ++               * this should split into one-char fields.
> ++               * However, gawk 5.0.1 searches for first
> ++               * _non-empty_ separator string match:
> ++               */
> ++              size_t ofs = 0;
> ++              do {
> ++                      ofs++;
> ++                      if (!s[ofs])
> ++                              return REG_NOMATCH;
> ++                      regexec(preg, s + ofs, 1, pmatch, 0);
> ++              } while (pmatch[0].rm_eo == 0);
> ++              pmatch[0].rm_so += ofs;
> ++              pmatch[0].rm_eo += ofs;
> ++      }
> ++      return r;
> ++}
> ++
> + static int awk_split(const char *s, node *spl, char **slist)
> + {
> +-      int l, n;
> ++      int n;
> +       char c[4];
> +       char *s1;
> +-      regmatch_t pmatch[2]; // TODO: why [2]? [1] is enough...
> +
> +       /* in worst case, each char would be a separate field */
> +       *slist = s1 = xzalloc(strlen(s) * 2 + 3);
> +@@ -1748,29 +1807,31 @@ static int awk_split(const char *s, node
> +                       return n; /* "": zero fields */
> +               n++; /* at least one field will be there */
> +               do {
> ++                      int l;
> ++                      regmatch_t pmatch[2]; // TODO: why [2]? [1] is enough...
> ++
> +                       l = strcspn(s, c+2); /* len till next NUL or \n */
> +-                      if (regexec(icase ? spl->r.ire : spl->l.re, s, 1, pmatch, 0) == 0
> ++                      if (regexec1_nonempty(icase ? spl->r.ire : spl->l.re, s, pmatch) == 0
> +                        && pmatch[0].rm_so <= l
> +                       ) {
> ++                              /* if (pmatch[0].rm_eo == 0) ... - impossible */
> +                               l = pmatch[0].rm_so;
> +-                              if (pmatch[0].rm_eo == 0) {
> +-                                      l++;
> +-                                      pmatch[0].rm_eo++;
> +-                              }
> +                               n++; /* we saw yet another delimiter */
> +                       } else {
> +                               pmatch[0].rm_eo = l;
> +                               if (s[l])
> +                                       pmatch[0].rm_eo++;
> +                       }
> +-                      memcpy(s1, s, l);
> +-                      /* make sure we remove *all* of the separator chars */
> +-                      do {
> +-                              s1[l] = '\0';
> +-                      } while (++l < pmatch[0].rm_eo);
> +-                      nextword(&s1);
> ++                      s1 = mempcpy(s1, s, l);
> ++                      *s1++ = '\0';
> +                       s += pmatch[0].rm_eo;
> +               } while (*s);
> ++
> ++              /* echo a-- | awk -F-- '{ print NF, length($NF), $NF }'
> ++               * should print "2 0 ":
> ++               */
> ++              *s1 = '\0';
> ++
> +               return n;
> +       }
> +       if (c[0] == '\0') {  /* null split */
> +@@ -1974,7 +2035,7 @@ static int ptest(node *pattern)
> + static int awk_getline(rstream *rsm, var *v)
> + {
> +       char *b;
> +-      regmatch_t pmatch[2];
> ++      regmatch_t pmatch[2]; // TODO: why [2]? [1] is enough...
> +       int size, a, p, pp = 0;
> +       int fd, so, eo, r, rp;
> +       char c, *m, *s;
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159440): https://lists.openembedded.org/g/openembedded-core/message/159440
> Mute This Topic: https://lists.openembedded.org/mt/87606868/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

