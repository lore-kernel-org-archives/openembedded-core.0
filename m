Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1BFC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 10:02:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.58888.1638180176042369532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 02:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qlq4Ks8e;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r25so4075256edq.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=oxZwrfPwYcZ0nUYZjCubLYTA687iIfD2bfdqupFd4gA=;
        b=qlq4Ks8e12TPSwTlA298Wi9vnwnNzokiG6illo/GnxEJzcH6/xNyKylocSOUhyk1Pg
         peUBWTxlE7kDWDF7gvILy4UpejHzcFK+aTQzleHXqXDMlO1LCLzAIl5hxZYS+WR2zLfk
         jlj0ccS/NYCD88ba77ED5su/kT16tcZig9SmkG4Nxws1TE+v66ggPq3qCknhu7AroBFp
         eSbbV7QswOsEhP7crglsRrCiGlmt3/DPrMH1IFluXhjVycz1/iFnADvA3/MPG8dWu4I/
         /eEsx69mZTb3wDN4XOf0lVdaluOfhkm4as8Blcb0y0g9E1ZnkG2/t9ZFlk5lJyz8Np8L
         pasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=oxZwrfPwYcZ0nUYZjCubLYTA687iIfD2bfdqupFd4gA=;
        b=IZwL4R9P+7zTUE9gJoexNsE/qpiMl2zO+QqWbQaxY8KCnBsr/2VRKqE3CZcI44umQz
         sUBlePxtYr37TRQjkBB5Nzi6Dgt1LcuJLsMI3L42/1Fzmq//HTghps3FaTnaEL8SI9pY
         rD/pRPIw1isUv2e5SrcJvc5KkErMBl7y98zpYJRJoeX0eA3DCW25blwxtQgYbulQ0rr4
         EDrM3vOl5fcBCa1ZtT1x8Afetppz2HWYYfVHZAMMYJnXk1EmjijOz3OmGqWXSoM2opW0
         G4kJHYKOWYZs8p7xrVpPG94yK71ty2Sh7uoh1RL6//m2Zwt/wwFrjYix3KSljlrfiDEv
         5RMg==
X-Gm-Message-State: AOAM530Y9OI7x9Z08M8dxq/8/FUr7ethcV1nxi9HdKMXpVMG93TjBD6I
	Bgql8Fm8UJrxPn5MpRi4+kDRgM1fo7f6F2Ea7KAoeMoqNb/lLw==
X-Google-Smtp-Source: 
 ABdhPJxdU6LKhTCyETlRrxYm25wqCCsVAZooZPIK7SKkfXJZfP2HAWsin4Wzk88Ajgh+IpnWdShfSCPNcnzkOH8ajmU=
X-Received: by 2002:a05:6402:4242:: with SMTP id
 g2mr72729057edb.158.1638180173108;
 Mon, 29 Nov 2021 02:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20211007133921.3753-1-sanakazisk19@gmail.com>
In-Reply-To: <20211007133921.3753-1-sanakazisk19@gmail.com>
From: sana kazi <sanakazisk19@gmail.com>
Date: Mon, 29 Nov 2021 15:32:40 +0530
Message-ID: 
 <CAPxU0msn=h7LpgZ_fxHpkJFVx=VwLpOreer+nkbopSyB4Yxzmw@mail.gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH 1/3] dovecot: Fix CVE-2020-12100
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004bd71e05d1ea8b47"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 10:02:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158936

--0000000000004bd71e05d1ea8b47
Content-Type: text/plain; charset="UTF-8"

Hi,

Could you please review the below patch?

On Thu, 7 Oct 2021 at 19:10, Sana Kazi <sanakazisk19@gmail.com> wrote:

> Added patches to fix CVE-2020-12100
>
> Link:
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  ...-parser-Add-a-message_part_finish-he.patch |  76 +++++++
>  ...-parser-Change-message_part_append-t.patch |  71 +++++++
>  ...-parser-Optimize-updating-children_c.patch |  49 +++++
>  ...-parser-Optimize-appending-new-part-.patch |  88 ++++++++
>  ...-parser-Minor-code-cleanup-to-findin.patch |  45 +++++
>  ...-parser-Truncate-excessively-long-MI.patch | 163 +++++++++++++++
>  ...-parser-Optimize-boundary-lookups-wh.patch |  72 +++++++
>  ...-parser-Add-boundary_remove_until-he.patch |  50 +++++
>  ...-parser-Don-t-use-memory-pool-for-pa.patch | 169 ++++++++++++++++
>  ...-parser-Support-limiting-max-number-.patch | 188 ++++++++++++++++++
>  ...-parser-Support-limiting-max-number-.patch |  87 ++++++++
>  ...handling-trailing-in-MIME-boundaries.patch | 133 +++++++++++++
>  ...Fix-parse_too_many_nested_mime_parts.patch |  32 +++
>  .../dovecot/dovecot/buffer_free_fix.patch     |  27 +++
>  .../dovecot/dovecot_2.2.36.4.bb               |  14 ++
>  15 files changed, 1264 insertions(+)
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
>
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
> new file mode 100644
> index 000000000..583f71ca5
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
> @@ -0,0 +1,76 @@
> +From 667d353b0f217372e8cc43ea4fe13466689c7ed0 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 11:33:31 +0300
> +Subject: [PATCH 01/13] lib-mail: message-parser - Add a
> message_part_finish()
> + helper function
> +
> +---
> + src/lib-mail/message-parser.c | 25 ++++++++++++-------------
> + 1 file changed, 12 insertions(+), 13 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index b1de1950a..aaa8dd8b7 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -195,6 +195,13 @@ message_part_append(pool_t pool, struct message_part
> *parent)
> +       return part;
> + }
> +
> ++static void message_part_finish(struct message_parser_ctx *ctx)
> ++{
> ++      message_size_add(&ctx->part->parent->body_size,
> &ctx->part->body_size);
> ++      message_size_add(&ctx->part->parent->body_size,
> &ctx->part->header_size);
> ++      ctx->part = ctx->part->parent;
> ++}
> ++
> + static void parse_next_body_multipart_init(struct message_parser_ctx
> *ctx)
> + {
> +       struct message_boundary *b;
> +@@ -312,19 +319,16 @@ static int parse_part_finish(struct
> message_parser_ctx *ctx,
> +                            struct message_boundary *boundary,
> +                            struct message_block *block_r, bool
> first_line)
> + {
> +-      struct message_part *part;
> +       size_t line_size;
> +
> +       i_assert(ctx->last_boundary == NULL);
> +
> +       /* get back to parent MIME part, summing the child MIME part sizes
> +          into parent's body sizes */
> +-      for (part = ctx->part; part != boundary->part; part =
> part->parent) {
> +-              message_size_add(&part->parent->body_size,
> &part->body_size);
> +-              message_size_add(&part->parent->body_size,
> &part->header_size);
> ++      while (ctx->part != boundary->part) {
> ++              message_part_finish(ctx);
> ++              i_assert(ctx->part != NULL);
> +       }
> +-      i_assert(part != NULL);
> +-      ctx->part = part;
> +
> +       if (boundary->epilogue_found) {
> +               /* this boundary isn't needed anymore */
> +@@ -1132,13 +1136,8 @@ int message_parser_parse_next_block(struct
> message_parser_ctx *ctx,
> +               i_assert(ctx->input->eof || ctx->input->closed ||
> +                        ctx->input->stream_errno != 0 ||
> +                        ctx->broken_reason != NULL);
> +-              while (ctx->part->parent != NULL) {
> +-                      message_size_add(&ctx->part->parent->body_size,
> +-                                       &ctx->part->body_size);
> +-                      message_size_add(&ctx->part->parent->body_size,
> +-                                       &ctx->part->header_size);
> +-                      ctx->part = ctx->part->parent;
> +-              }
> ++              while (ctx->part->parent != NULL)
> ++                      message_part_finish(ctx);
> +       }
> +
> +       if (block_r->size == 0) {
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
> new file mode 100644
> index 000000000..9f24320eb
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
> @@ -0,0 +1,71 @@
> +From de0da7bc8df55521db8fa787f88e293618c96386 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 11:34:22 +0300
> +Subject: [PATCH 02/13] lib-mail: message-parser - Change
> message_part_append()
> + to do all work internally
> +
> +---
> + src/lib-mail/message-parser.c | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index aaa8dd8b7..2edf3e7a6 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -167,16 +167,17 @@ static int message_parser_read_more(struct
> message_parser_ctx *ctx,
> +       return 1;
> + }
> +
> +-static struct message_part *
> +-message_part_append(pool_t pool, struct message_part *parent)
> ++static void
> ++message_part_append(struct message_parser_ctx *ctx)
> + {
> ++      struct message_part *parent = ctx->part;
> +       struct message_part *p, *part, **list;
> +
> +       i_assert(parent != NULL);
> +       i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
> +                                  MESSAGE_PART_FLAG_MESSAGE_RFC822)) !=
> 0);
> +
> +-      part = p_new(pool, struct message_part, 1);
> ++      part = p_new(ctx->part_pool, struct message_part, 1);
> +       part->parent = parent;
> +       for (p = parent; p != NULL; p = p->parent)
> +               p->children_count++;
> +@@ -192,7 +193,7 @@ message_part_append(pool_t pool, struct message_part
> *parent)
> +               list = &(*list)->next;
> +
> +       *list = part;
> +-      return part;
> ++      ctx->part = part;
> + }
> +
> + static void message_part_finish(struct message_parser_ctx *ctx)
> +@@ -220,7 +221,7 @@ static void parse_next_body_multipart_init(struct
> message_parser_ctx *ctx)
> + static int parse_next_body_message_rfc822_init(struct message_parser_ctx
> *ctx,
> +                                              struct message_block
> *block_r)
> + {
> +-      ctx->part = message_part_append(ctx->part_pool, ctx->part);
> ++      message_part_append(ctx);
> +       return parse_next_header_init(ctx, block_r);
> + }
> +
> +@@ -270,7 +271,7 @@ boundary_line_find(struct message_parser_ctx *ctx,
> + static int parse_next_mime_header_init(struct message_parser_ctx *ctx,
> +                                      struct message_block *block_r)
> + {
> +-      ctx->part = message_part_append(ctx->part_pool, ctx->part);
> ++      message_part_append(ctx);
> +       ctx->part->flags |= MESSAGE_PART_FLAG_IS_MIME;
> +
> +       return parse_next_header_init(ctx, block_r);
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
> new file mode 100644
> index 000000000..e53090235
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
> @@ -0,0 +1,49 @@
> +From a9800b436fcf1f9633c2b136a9c5cb7a486a8a52 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 11:36:48 +0300
> +Subject: [PATCH 03/13] lib-mail: message-parser - Optimize updating
> + children_count
> +
> +---
> + src/lib-mail/message-parser.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 2edf3e7a6..05768a058 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -171,7 +171,7 @@ static void
> + message_part_append(struct message_parser_ctx *ctx)
> + {
> +       struct message_part *parent = ctx->part;
> +-      struct message_part *p, *part, **list;
> ++      struct message_part *part, **list;
> +
> +       i_assert(parent != NULL);
> +       i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
> +@@ -179,8 +179,6 @@ message_part_append(struct message_parser_ctx *ctx)
> +
> +       part = p_new(ctx->part_pool, struct message_part, 1);
> +       part->parent = parent;
> +-      for (p = parent; p != NULL; p = p->parent)
> +-              p->children_count++;
> +
> +       /* set child position */
> +       part->physical_pos =
> +@@ -200,6 +198,7 @@ static void message_part_finish(struct
> message_parser_ctx *ctx)
> + {
> +       message_size_add(&ctx->part->parent->body_size,
> &ctx->part->body_size);
> +       message_size_add(&ctx->part->parent->body_size,
> &ctx->part->header_size);
> ++      ctx->part->parent->children_count += 1 + ctx->part->children_count;
> +       ctx->part = ctx->part->parent;
> + }
> +
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
> new file mode 100644
> index 000000000..c35bf883e
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
> @@ -0,0 +1,88 @@
> +From 99ee7596712cf0ea0a288b712bc898ecb2b35f9b Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 12:00:38 +0300
> +Subject: [PATCH 04/13] lib-mail: message-parser - Optimize appending new
> part
> + to linked list
> +
> +---
> + src/lib-mail/message-parser.c | 28 ++++++++++++++++++++++------
> + 1 file changed, 22 insertions(+), 6 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -1,7 +1,7 @@
> + /* Copyright (c) 2002-2017 Dovecot authors, see the included COPYING
> file */
> +
> + #include "lib.h"
> +-#include "buffer.h"
> ++#include "array.h"
> + #include "str.h"
> + #include "istream.h"
> + #include "rfc822-parser.h"
> +@@ -34,6 +34,9 @@ struct message_parser_ctx {
> +       const char *last_boundary;
> +       struct message_boundary *boundaries;
> +
> ++      struct message_part **next_part;
> ++      ARRAY(struct message_part **) next_part_stack;
> ++
> +       size_t skip;
> +       char last_chr;
> +       unsigned int want_count;
> +@@ -171,7 +174,7 @@ static void
> + message_part_append(struct message_parser_ctx *ctx)
> + {
> +       struct message_part *parent = ctx->part;
> +-      struct message_part *part, **list;
> ++      struct message_part *part;
> +
> +       i_assert(parent != NULL);
> +       i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
> +@@ -186,16 +189,27 @@ message_part_append(struct message_parse
> +               parent->body_size.physical_size +
> +               parent->header_size.physical_size;
> +
> +-      list = &part->parent->children;
> +-      while (*list != NULL)
> +-              list = &(*list)->next;
> ++      /* add to parent's linked list */
> ++      *ctx->next_part = part;
> ++      /* update the parent's end-of-linked-list pointer */
> ++      struct message_part **next_part = &part->next;
> ++      array_append(&ctx->next_part_stack, &next_part, 1);
> ++      /* This part is now the new parent for the next
> message_part_append()
> ++         call. Its linked list begins with the children pointer. */
> ++      ctx->next_part = &part->children;
> +
> +-      *list = part;
> +       ctx->part = part;
> + }
> +
> + static void message_part_finish(struct message_parser_ctx *ctx)
> + {
> ++      struct message_part **const *parent_next_partp;
> ++      unsigned int count = array_count(&ctx->next_part_stack);
> ++
> ++      parent_next_partp = array_idx(&ctx->next_part_stack, count-1);
> ++      array_delete(&ctx->next_part_stack, count-1, 1);
> ++      ctx->next_part = *parent_next_partp;
> ++
> +       message_size_add(&ctx->part->parent->body_size,
> &ctx->part->body_size);
> +       message_size_add(&ctx->part->parent->body_size,
> &ctx->part->header_size);
> +       ctx->part->parent->children_count += 1 + ctx->part->children_count;
> +@@ -1062,7 +1076,9 @@ message_parser_init(pool_t part_pool, st
> +       ctx = message_parser_init_int(input, hdr_flags, flags);
> +       ctx->part_pool = part_pool;
> +       ctx->parts = ctx->part = p_new(part_pool, struct message_part, 1);
> ++      ctx->next_part = &ctx->part->children;
> +       ctx->parse_next_block = parse_next_header_init;
> ++      p_array_init(&ctx->next_part_stack, ctx->parser_pool, 4);
> +       return ctx;
> + }
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
> new file mode 100644
> index 000000000..4e63509b4
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
> @@ -0,0 +1,45 @@
> +From e39c95b248917eb2b596ca55a957f3cbc7fd406f Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 12:10:07 +0300
> +Subject: [PATCH 05/13] lib-mail: message-parser - Minor code cleanup to
> + finding the end of boundary line
> +
> +---
> + src/lib-mail/message-parser.c | 9 ++++-----
> + 1 file changed, 4 insertions(+), 5 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index ff4e09e5a..6c6a680b5 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -260,17 +260,16 @@ boundary_line_find(struct message_parser_ctx *ctx,
> +       }
> +
> +       /* need to find the end of line */
> +-      if (memchr(data + 2, '\n', size - 2) == NULL &&
> +-          size < BOUNDARY_END_MAX_LEN &&
> ++      data += 2;
> ++      size -= 2;
> ++      if (memchr(data, '\n', size) == NULL &&
> ++          size+2 < BOUNDARY_END_MAX_LEN &&
> +           !ctx->input->eof && !full) {
> +               /* no LF found */
> +               ctx->want_count = BOUNDARY_END_MAX_LEN;
> +               return 0;
> +       }
> +
> +-      data += 2;
> +-      size -= 2;
> +-
> +       *boundary_r = boundary_find(ctx->boundaries, data, size);
> +       if (*boundary_r == NULL)
> +               return -1;
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
> new file mode 100644
> index 000000000..1012d7983
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
> @@ -0,0 +1,163 @@
> +From aed125484a346b4893c1a169088c39fe7ced01f3 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 12:53:12 +0300
> +Subject: [PATCH 06/13] lib-mail: message-parser - Truncate excessively
> long
> + MIME boundaries
> +
> +RFC 2046 requires that the boundaries are a maximum of 70 characters
> +(excluding the "--" prefix and suffix). We allow 80 characters for a bit
> of
> +extra safety. Anything longer than that is truncated and treated the same
> +as if it was just 80 characters.
> +---
> + src/lib-mail/message-parser.c      |  7 ++-
> + src/lib-mail/test-message-parser.c | 95
> ++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 100 insertions(+), 2 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 6c6a680b5..92f541b02 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -10,7 +10,8 @@
> +
> + /* RFC-2046 requires boundaries are max. 70 chars + "--" prefix + "--"
> suffix.
> +    We'll add a bit more just in case. */
> +-#define BOUNDARY_END_MAX_LEN (70 + 2 + 2 + 10)
> ++#define BOUNDARY_STRING_MAX_LEN (70 + 10)
> ++#define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
> +
> + struct message_boundary {
> +       struct message_boundary *next;
> +@@ -526,8 +527,10 @@ static void parse_content_type(struct
> message_parser_ctx *ctx,
> +       rfc2231_parse(&parser, &results);
> +       for (; *results != NULL; results += 2) {
> +               if (strcasecmp(results[0], "boundary") == 0) {
> ++                      /* truncate excessively long boundaries */
> +                       ctx->last_boundary =
> +-                              p_strdup(ctx->parser_pool, results[1]);
> ++                              p_strndup(ctx->parser_pool, results[1],
> ++                                        BOUNDARY_STRING_MAX_LEN);
> +                       break;
> +               }
> +       }
> +diff --git a/src/lib-mail/test-message-parser.c
> b/src/lib-mail/test-message-parser.c
> +index 1f1aa1437..94aa3eb7c 100644
> +--- a/src/lib-mail/test-message-parser.c
> ++++ b/src/lib-mail/test-message-parser.c
> +@@ -642,6 +642,100 @@ static void test_message_parser_no_eoh(void)
> +       test_end();
> + }
> +
> ++static void test_message_parser_long_mime_boundary(void)
> ++{
> ++      /* Close the boundaries in wrong reverse order. But because all
> ++         boundaries are actually truncated to the same size (..890) it
> ++         works the same as if all of them were duplicate boundaries. */
> ++static const char input_msg[] =
> ++"Content-Type: multipart/mixed;
> boundary=\"1234567890123456789012345678901234567890123456789012345678901234567890123456789012\"\n"
> ++"\n"
>
> ++"--1234567890123456789012345678901234567890123456789012345678901234567890123456789012\n"
> ++"Content-Type: multipart/mixed;
> boundary=\"123456789012345678901234567890123456789012345678901234567890123456789012345678901\"\n"
> ++"\n"
>
> ++"--123456789012345678901234567890123456789012345678901234567890123456789012345678901\n"
> ++"Content-Type: multipart/mixed;
> boundary=\"12345678901234567890123456789012345678901234567890123456789012345678901234567890\"\n"
> ++"\n"
>
> ++"--12345678901234567890123456789012345678901234567890123456789012345678901234567890\n"
> ++"Content-Type: text/plain\n"
> ++"\n"
> ++"1\n"
>
> ++"--1234567890123456789012345678901234567890123456789012345678901234567890123456789012\n"
> ++"Content-Type: text/plain\n"
> ++"\n"
> ++"22\n"
>
> ++"--123456789012345678901234567890123456789012345678901234567890123456789012345678901\n"
> ++"Content-Type: text/plain\n"
> ++"\n"
> ++"333\n"
>
> ++"--12345678901234567890123456789012345678901234567890123456789012345678901234567890\n"
> ++"Content-Type: text/plain\n"
> ++"\n"
> ++"4444\n";
> ++      struct message_parser_ctx *parser;
> ++      struct istream *input;
> ++      struct message_part *parts, *part;
> ++      struct message_block block;
> ++      pool_t pool;
> ++      int ret;
> ++
> ++      test_begin("message parser long mime boundary");
> ++      pool = pool_alloconly_create("message parser", 10240);
> ++      input = test_istream_create(input_msg);
> ++
> ++      parser = message_parser_init(pool, input, 0, 0);
> ++      while ((ret = message_parser_parse_next_block(parser, &block)) >
> 0) ;
> ++      test_assert(ret < 0);
> ++      message_parser_deinit(&parser, &parts);
> ++
> ++      part = parts;
> ++      test_assert(part->children_count == 6);
> ++      test_assert(part->flags == (MESSAGE_PART_FLAG_MULTIPART |
> MESSAGE_PART_FLAG_IS_MIME));
> ++      test_assert(part->header_size.lines == 2);
> ++      test_assert(part->header_size.physical_size == 126);
> ++      test_assert(part->header_size.virtual_size == 126+2);
> ++      test_assert(part->body_size.lines == 22);
> ++      test_assert(part->body_size.physical_size == 871);
> ++      test_assert(part->body_size.virtual_size == 871+22);
> ++
> ++      part = parts->children;
> ++      test_assert(part->children_count == 5);
> ++      test_assert(part->flags == (MESSAGE_PART_FLAG_MULTIPART |
> MESSAGE_PART_FLAG_IS_MIME));
> ++      test_assert(part->header_size.lines == 2);
> ++      test_assert(part->header_size.physical_size == 125);
> ++      test_assert(part->header_size.virtual_size == 125+2);
> ++      test_assert(part->body_size.lines == 19);
> ++      test_assert(part->body_size.physical_size == 661);
> ++      test_assert(part->body_size.virtual_size == 661+19);
> ++
> ++      part = parts->children->children;
> ++      test_assert(part->children_count == 4);
> ++      test_assert(part->flags == (MESSAGE_PART_FLAG_MULTIPART |
> MESSAGE_PART_FLAG_IS_MIME));
> ++      test_assert(part->header_size.lines == 2);
> ++      test_assert(part->header_size.physical_size == 124);
> ++      test_assert(part->header_size.virtual_size == 124+2);
> ++      test_assert(part->body_size.lines == 16);
> ++      test_assert(part->body_size.physical_size == 453);
> ++      test_assert(part->body_size.virtual_size == 453+16);
> ++
> ++      part = parts->children->children->children;
> ++      for (unsigned int i = 1; i <= 3; i++, part = part->next) {
> ++              test_assert(part->children_count == 0);
> ++              test_assert(part->flags == (MESSAGE_PART_FLAG_TEXT |
> MESSAGE_PART_FLAG_IS_MIME));
> ++              test_assert(part->header_size.lines == 2);
> ++              test_assert(part->header_size.physical_size == 26);
> ++              test_assert(part->header_size.virtual_size == 26+2);
> ++              test_assert(part->body_size.lines == 0);
> ++              test_assert(part->body_size.physical_size == i);
> ++              test_assert(part->body_size.virtual_size == i);
> ++      }
> ++
> ++      test_parsed_parts(input, parts);
> ++      i_stream_unref(&input);
> ++      pool_unref(&pool);
> ++      test_end();
> ++}
> ++
> + int main(void)
> + {
> +       static void (*test_functions[])(void) = {
> +@@ -654,6 +748,7 @@ int main(void)
> +               test_message_parser_garbage_suffix_mime_boundary,
> +               test_message_parser_continuing_mime_boundary,
> +               test_message_parser_continuing_truncated_mime_boundary,
> ++              test_message_parser_long_mime_boundary,
> +               test_message_parser_no_eoh,
> +               NULL
> +       };
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
> new file mode 100644
> index 000000000..eeb6c96f1
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
> @@ -0,0 +1,72 @@
> +From 5f8de52fec3191a1aa68a399ee2068485737dc4f Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 13:06:02 +0300
> +Subject: [PATCH 07/13] lib-mail: message-parser - Optimize boundary
> lookups
> + when exact boundary is found
> +
> +When an exact boundary is found, there's no need to continue looking for
> +more boundaries.
> +---
> + src/lib-mail/message-parser.c | 26 ++++++++++++++++++++++----
> + 1 file changed, 22 insertions(+), 4 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 92f541b02..c2934c761 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -80,8 +80,14 @@ boundary_find(struct message_boundary *boundaries,
> +       while (boundaries != NULL) {
> +               if (boundaries->len <= len &&
> +                   memcmp(boundaries->boundary, data, boundaries->len) ==
> 0 &&
> +-                  (best == NULL || best->len < boundaries->len))
> ++                  (best == NULL || best->len < boundaries->len)) {
> +                       best = boundaries;
> ++                      if (best->len == len) {
> ++                              /* This is exactly the wanted boundary.
> There
> ++                                 can't be a better one. */
> ++                              break;
> ++                      }
> ++              }
> +
> +               boundaries = boundaries->next;
> +       }
> +@@ -263,15 +269,27 @@ boundary_line_find(struct message_parser_ctx *ctx,
> +       /* need to find the end of line */
> +       data += 2;
> +       size -= 2;
> +-      if (memchr(data, '\n', size) == NULL &&
> ++      const unsigned char *lf_pos = memchr(data, '\n', size);
> ++      if (lf_pos == NULL &&
> +           size+2 < BOUNDARY_END_MAX_LEN &&
> +           !ctx->input->eof && !full) {
> +               /* no LF found */
> +               ctx->want_count = BOUNDARY_END_MAX_LEN;
> +               return 0;
> +       }
> +-
> +-      *boundary_r = boundary_find(ctx->boundaries, data, size);
> ++      size_t find_size = size;
> ++
> ++      if (lf_pos != NULL) {
> ++              find_size = lf_pos - data;
> ++              if (find_size > 0 && data[find_size-1] == '\r')
> ++                      find_size--;
> ++              if (find_size > 2 && data[find_size-1] == '-' &&
> ++                  data[find_size-2] == '-')
> ++                      find_size -= 2;
> ++      } else if (find_size > BOUNDARY_END_MAX_LEN)
> ++              find_size = BOUNDARY_END_MAX_LEN;
> ++
> ++      *boundary_r = boundary_find(ctx->boundaries, data, find_size);
> +       if (*boundary_r == NULL)
> +               return -1;
> +
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
> new file mode 100644
> index 000000000..4af070a87
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
> @@ -0,0 +1,50 @@
> +From 929396767d831bedbdec6392aaa835b045332fd3 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 14:53:27 +0300
> +Subject: [PATCH 08/13] lib-mail: message-parser - Add
> boundary_remove_until()
> + helper function
> +
> +---
> + src/lib-mail/message-parser.c | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index c2934c761..028f74159 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -223,6 +223,13 @@ static void message_part_finish(struct
> message_parser_ctx *ctx)
> +       ctx->part = ctx->part->parent;
> + }
> +
> ++static void
> ++boundary_remove_until(struct message_parser_ctx *ctx,
> ++                    struct message_boundary *boundary)
> ++{
> ++      ctx->boundaries = boundary;
> ++}
> ++
> + static void parse_next_body_multipart_init(struct message_parser_ctx
> *ctx)
> + {
> +       struct message_boundary *b;
> +@@ -364,10 +371,10 @@ static int parse_part_finish(struct
> message_parser_ctx *ctx,
> +
> +       if (boundary->epilogue_found) {
> +               /* this boundary isn't needed anymore */
> +-              ctx->boundaries = boundary->next;
> ++              boundary_remove_until(ctx, boundary->next);
> +       } else {
> +               /* forget about the boundaries we possibly skipped */
> +-              ctx->boundaries = boundary;
> ++              boundary_remove_until(ctx, boundary);
> +       }
> +
> +       /* the boundary itself should already be in buffer. add that. */
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
> new file mode 100644
> index 000000000..aade7dc2b
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
> @@ -0,0 +1,169 @@
> +From d53d83214b1d635446a8cf8ff9438cc530133d62 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 15:00:57 +0300
> +Subject: [PATCH 09/13] lib-mail: message-parser - Don't use memory pool
> for
> + parser
> +
> +This reduces memory usage when parsing many MIME parts where boundaries
> are
> +being added and removed constantly.
> +---
> + src/lib-mail/message-parser.c | 48
> ++++++++++++++++++++++++++++---------------
> + 1 file changed, 32 insertions(+), 16 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 028f74159..8970d8e0e 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -17,14 +17,14 @@ struct message_boundary {
> +       struct message_boundary *next;
> +
> +       struct message_part *part;
> +-      const char *boundary;
> ++      char *boundary;
> +       size_t len;
> +
> +       unsigned int epilogue_found:1;
> + };
> +
> + struct message_parser_ctx {
> +-      pool_t parser_pool, part_pool;
> ++      pool_t part_pool;
> +       struct istream *input;
> +       struct message_part *parts, *part;
> +       const char *broken_reason;
> +@@ -32,7 +32,7 @@ struct message_parser_ctx {
> +       enum message_header_parser_flags hdr_flags;
> +       enum message_parser_flags flags;
> +
> +-      const char *last_boundary;
> ++      char *last_boundary;
> +       struct message_boundary *boundaries;
> +
> +       struct message_part **next_part;
> +@@ -223,10 +223,24 @@ static void message_part_finish(struct
> message_parser_ctx *ctx)
> +       ctx->part = ctx->part->parent;
> + }
> +
> ++static void message_boundary_free(struct message_boundary *b)
> ++{
> ++      i_free(b->boundary);
> ++      i_free(b);
> ++}
> ++
> + static void
> + boundary_remove_until(struct message_parser_ctx *ctx,
> +                     struct message_boundary *boundary)
> + {
> ++      while (ctx->boundaries != boundary) {
> ++              struct message_boundary *cur = ctx->boundaries;
> ++
> ++              i_assert(cur != NULL);
> ++              ctx->boundaries = cur->next;
> ++              message_boundary_free(cur);
> ++
> ++      }
> +       ctx->boundaries = boundary;
> + }
> +
> +@@ -234,15 +248,14 @@ static void parse_next_body_multipart_init(struct
> message_parser_ctx *ctx)
> + {
> +       struct message_boundary *b;
> +
> +-      b = p_new(ctx->parser_pool, struct message_boundary, 1);
> ++      b = i_new(struct message_boundary, 1);
> +       b->part = ctx->part;
> +       b->boundary = ctx->last_boundary;
> ++      ctx->last_boundary = NULL;
> +       b->len = strlen(b->boundary);
> +
> +       b->next = ctx->boundaries;
> +       ctx->boundaries = b;
> +-
> +-      ctx->last_boundary = NULL;
> + }
> +
> + static int parse_next_body_message_rfc822_init(struct message_parser_ctx
> *ctx,
> +@@ -359,6 +372,8 @@ static int parse_part_finish(struct
> message_parser_ctx *ctx,
> +                            struct message_block *block_r, bool
> first_line)
> + {
> +       size_t line_size;
> ++      size_t boundary_len = boundary->len;
> ++      bool boundary_epilogue_found = boundary->epilogue_found;
> +
> +       i_assert(ctx->last_boundary == NULL);
> +
> +@@ -391,7 +406,7 @@ static int parse_part_finish(struct
> message_parser_ctx *ctx,
> +               i_assert(block_r->data[0] == '\n');
> +               line_size = 1;
> +       }
> +-      line_size += 2 + boundary->len + (boundary->epilogue_found ? 2 :
> 0);
> ++      line_size += 2 + boundary_len + (boundary_epilogue_found ? 2 : 0);
> +       i_assert(block_r->size >= ctx->skip + line_size);
> +       block_r->size = line_size;
> +       parse_body_add_block(ctx, block_r);
> +@@ -553,9 +568,9 @@ static void parse_content_type(struct
> message_parser_ctx *ctx,
> +       for (; *results != NULL; results += 2) {
> +               if (strcasecmp(results[0], "boundary") == 0) {
> +                       /* truncate excessively long boundaries */
> ++                      i_free(ctx->last_boundary);
> +                       ctx->last_boundary =
> +-                              p_strndup(ctx->parser_pool, results[1],
> +-                                        BOUNDARY_STRING_MAX_LEN);
> ++                              i_strndup(results[1],
> BOUNDARY_STRING_MAX_LEN);
> +                       break;
> +               }
> +       }
> +@@ -678,7 +693,7 @@ static int parse_next_header(struct
> message_parser_ctx *ctx,
> +               i_assert(!ctx->multipart);
> +               part->flags = 0;
> +       }
> +-      ctx->last_boundary = NULL;
> ++      i_free(ctx->last_boundary);
> +
> +       if (!ctx->part_seen_content_type ||
> +           (part->flags & MESSAGE_PART_FLAG_IS_MIME) == 0) {
> +@@ -1081,11 +1096,8 @@ message_parser_init_int(struct istream *input,
> +                       enum message_parser_flags flags)
> + {
> +       struct message_parser_ctx *ctx;
> +-      pool_t pool;
> +
> +-      pool = pool_alloconly_create("Message Parser", 1024);
> +-      ctx = p_new(pool, struct message_parser_ctx, 1);
> +-      ctx->parser_pool = pool;
> ++      ctx = i_new(struct message_parser_ctx, 1);
> +       ctx->hdr_flags = hdr_flags;
> +       ctx->flags = flags;
> +       ctx->input = input;
> +@@ -1105,7 +1117,7 @@ message_parser_init(pool_t part_pool, struct
> istream *input,
> +       ctx->parts = ctx->part = p_new(part_pool, struct message_part, 1);
> +       ctx->next_part = &ctx->part->children;
> +       ctx->parse_next_block = parse_next_header_init;
> +-      p_array_init(&ctx->next_part_stack, ctx->parser_pool, 4);
> ++      i_array_init(&ctx->next_part_stack, 4);
> +       return ctx;
> + }
> +
> +@@ -1146,8 +1158,12 @@ int message_parser_deinit_from_parts(struct
> message_parser_ctx **_ctx,
> +
> +       if (ctx->hdr_parser_ctx != NULL)
> +               message_parse_header_deinit(&ctx->hdr_parser_ctx);
> ++      boundary_remove_until(ctx, NULL);
> +       i_stream_unref(&ctx->input);
> +-      pool_unref(&ctx->parser_pool);
> ++      if (array_is_created(&ctx->next_part_stack))
> ++              array_free(&ctx->next_part_stack);
> ++      i_free(ctx->last_boundary);
> ++      i_free(ctx);
> +       i_assert(ret < 0 || *parts_r != NULL);
> +       return ret;
> + }
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
> new file mode 100644
> index 000000000..ae5254466
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
> @@ -0,0 +1,188 @@
> +From df9e0d358ef86e3342525dcdefcf79dc2d749a30 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 16:59:40 +0300
> +Subject: [PATCH 10/13] lib-mail: message-parser - Support limiting max
> number
> + of nested MIME parts
> +
> +The default is to allow 100 nested MIME parts. When the limit is reached,
> +the innermost MIME part's body contains all the rest of the inner bodies
> +until a parent MIME part is reached.
> +---
> + src/lib-mail/message-parser.c      | 43
> +++++++++++++++++++++++++++++++-------
> + src/lib-mail/test-message-parser.c | 31 +++++++++++++++++++++++++++
> + 2 files changed, 67 insertions(+), 7 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 8970d8e0e..721615f76 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -13,6 +13,8 @@
> + #define BOUNDARY_STRING_MAX_LEN (70 + 10)
> + #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
> +
> ++#define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100
> ++
> + struct message_boundary {
> +       struct message_boundary *next;
> +
> +@@ -28,9 +30,11 @@ struct message_parser_ctx {
> +       struct istream *input;
> +       struct message_part *parts, *part;
> +       const char *broken_reason;
> ++      unsigned int nested_parts_count;
> +
> +       enum message_header_parser_flags hdr_flags;
> +       enum message_parser_flags flags;
> ++      unsigned int max_nested_mime_parts;
> +
> +       char *last_boundary;
> +       struct message_boundary *boundaries;
> +@@ -206,6 +210,8 @@ message_part_append(struct message_parser_ctx *ctx)
> +       ctx->next_part = &part->children;
> +
> +       ctx->part = part;
> ++      ctx->nested_parts_count++;
> ++      i_assert(ctx->nested_parts_count < ctx->max_nested_mime_parts);
> + }
> +
> + static void message_part_finish(struct message_parser_ctx *ctx)
> +@@ -213,8 +219,12 @@ static void message_part_finish(struct
> message_parser_ctx *ctx)
> +       struct message_part **const *parent_next_partp;
> +       unsigned int count = array_count(&ctx->next_part_stack);
> +
> ++      i_assert(ctx->nested_parts_count > 0);
> ++      ctx->nested_parts_count--;
> ++
> +       parent_next_partp = array_idx(&ctx->next_part_stack, count-1);
> +       array_delete(&ctx->next_part_stack, count-1, 1);
> ++
> +       ctx->next_part = *parent_next_partp;
> +
> +       message_size_add(&ctx->part->parent->body_size,
> &ctx->part->body_size);
> +@@ -592,6 +602,11 @@ static bool block_is_at_eoh(const struct
> message_block *block)
> +       return FALSE;
> + }
> +
> ++static bool parse_too_many_nested_mime_parts(struct message_parser_ctx
> *ctx)
> ++{
> ++      return ctx->nested_parts_count > ctx->max_nested_mime_parts;
> ++}
> ++
> + #define MUTEX_FLAGS \
> +       (MESSAGE_PART_FLAG_MESSAGE_RFC822 | MESSAGE_PART_FLAG_MULTIPART)
> +
> +@@ -616,8 +631,12 @@ static int parse_next_header(struct
> message_parser_ctx *ctx,
> +                  "\n--boundary" belongs to us or to a previous boundary.
> +                  this is a problem if the boundary prefixes are
> identical,
> +                  because MIME requires only the prefix to match. */
> +-              parse_next_body_multipart_init(ctx);
> +-              ctx->multipart = TRUE;
> ++              if (!parse_too_many_nested_mime_parts(ctx)) {
> ++                      parse_next_body_multipart_init(ctx);
> ++                      ctx->multipart = TRUE;
> ++              } else {
> ++                      part->flags &= ~MESSAGE_PART_FLAG_MULTIPART;
> ++              }
> +       }
> +
> +       /* before parsing the header see if we can find a --boundary from
> here.
> +@@ -721,12 +740,16 @@ static int parse_next_header(struct
> message_parser_ctx *ctx,
> +               i_assert(ctx->last_boundary == NULL);
> +               ctx->multipart = FALSE;
> +               ctx->parse_next_block = parse_next_body_to_boundary;
> +-      } else if (part->flags & MESSAGE_PART_FLAG_MESSAGE_RFC822)
> ++      } else if ((part->flags & MESSAGE_PART_FLAG_MESSAGE_RFC822) != 0 &&
> ++                 !parse_too_many_nested_mime_parts(ctx)) {
> +               ctx->parse_next_block =
> parse_next_body_message_rfc822_init;
> +-      else if (ctx->boundaries != NULL)
> +-              ctx->parse_next_block = parse_next_body_to_boundary;
> +-      else
> +-              ctx->parse_next_block = parse_next_body_to_eof;
> ++      } else {
> ++              part->flags &= ~MESSAGE_PART_FLAG_MESSAGE_RFC822;
> ++              if (ctx->boundaries != NULL)
> ++                      ctx->parse_next_block =
> parse_next_body_to_boundary;
> ++              else
> ++                      ctx->parse_next_block = parse_next_body_to_eof;
> ++      }
> +
> +       ctx->want_count = 1;
> +
> +@@ -1100,6 +1123,8 @@ message_parser_init_int(struct istream *input,
> +       ctx = i_new(struct message_parser_ctx, 1);
> +       ctx->hdr_flags = hdr_flags;
> +       ctx->flags = flags;
> ++      ctx->max_nested_mime_parts =
> ++              MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS;
> +       ctx->input = input;
> +       i_stream_ref(input);
> +       return ctx;
> +@@ -1159,6 +1184,10 @@ int message_parser_deinit_from_parts(struct
> message_parser_ctx **_ctx,
> +       if (ctx->hdr_parser_ctx != NULL)
> +               message_parse_header_deinit(&ctx->hdr_parser_ctx);
> +       boundary_remove_until(ctx, NULL);
> ++      /* caller might have stopped the parsing early */
> ++      i_assert(ctx->nested_parts_count == 0 ||
> ++               i_stream_have_bytes_left(ctx->input));
> ++
> +       i_stream_unref(&ctx->input);
> +       if (array_is_created(&ctx->next_part_stack))
> +               array_free(&ctx->next_part_stack);
> +diff --git a/src/lib-mail/test-message-parser.c
> b/src/lib-mail/test-message-parser.c
> +index 94aa3eb7c..481d05942 100644
> +--- a/src/lib-mail/test-message-parser.c
> ++++ b/src/lib-mail/test-message-parser.c
> +@@ -166,6 +166,36 @@ static void test_message_parser_small_blocks(void)
> +       test_end();
> + }
> +
> ++static void test_message_parser_stop_early(void)
> ++{
> ++      struct message_parser_ctx *parser;
> ++      struct istream *input;
> ++      struct message_part *parts;
> ++      struct message_block block;
> ++      unsigned int i;
> ++      pool_t pool;
> ++      int ret;
> ++
> ++      test_begin("message parser stop early");
> ++      pool = pool_alloconly_create("message parser", 10240);
> ++      input = test_istream_create(test_msg);
> ++
> ++      test_istream_set_allow_eof(input, FALSE);
> ++      for (i = 1; i <= TEST_MSG_LEN+1; i++) {
> ++              i_stream_seek(input, 0);
> ++              test_istream_set_size(input, i);
> ++              parser = message_parser_init(pool, input, 0, 0);
> ++              while ((ret = message_parser_parse_next_block(parser,
> ++                                                            &block)) >
> 0) ;
> ++              test_assert(ret == 0);
> ++              message_parser_deinit(&parser, &parts);
> ++      }
> ++
> ++      i_stream_unref(&input);
> ++      pool_unref(&pool);
> ++      test_end();
> ++}
> ++
> + static void test_message_parser_truncated_mime_headers(void)
> + {
> + static const char input_msg[] =
> +@@ -740,6 +770,7 @@ int main(void)
> + {
> +       static void (*test_functions[])(void) = {
> +               test_message_parser_small_blocks,
> ++              test_message_parser_stop_early,
> +               test_message_parser_truncated_mime_headers,
> +               test_message_parser_truncated_mime_headers2,
> +               test_message_parser_truncated_mime_headers3,
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
> new file mode 100644
> index 000000000..52848bf3a
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
> @@ -0,0 +1,87 @@
> +From d7bba401dd234802bcdb55ff27dfb99bffdab804 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 23 Apr 2020 17:09:33 +0300
> +Subject: [PATCH 11/13] lib-mail: message-parser - Support limiting max
> number
> + of MIME parts
> +
> +The default is to allow 10000 MIME parts. When it's reached, no more
> +MIME boundary lines will be recognized, so the rest of the mail belongs
> +to the last added MIME part.
> +---
> + src/lib-mail/message-parser.c | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 721615f76..646307802 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -14,6 +14,7 @@
> + #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
> +
> + #define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100
> ++#define MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS 10000
> +
> + struct message_boundary {
> +       struct message_boundary *next;
> +@@ -31,10 +32,12 @@ struct message_parser_ctx {
> +       struct message_part *parts, *part;
> +       const char *broken_reason;
> +       unsigned int nested_parts_count;
> ++      unsigned int total_parts_count;
> +
> +       enum message_header_parser_flags hdr_flags;
> +       enum message_parser_flags flags;
> +       unsigned int max_nested_mime_parts;
> ++      unsigned int max_total_mime_parts;
> +
> +       char *last_boundary;
> +       struct message_boundary *boundaries;
> +@@ -211,7 +214,9 @@ message_part_append(struct message_parser_ctx *ctx)
> +
> +       ctx->part = part;
> +       ctx->nested_parts_count++;
> ++      ctx->total_parts_count++;
> +       i_assert(ctx->nested_parts_count < ctx->max_nested_mime_parts);
> ++      i_assert(ctx->total_parts_count <= ctx->max_total_mime_parts);
> + }
> +
> + static void message_part_finish(struct message_parser_ctx *ctx)
> +@@ -296,6 +301,12 @@ boundary_line_find(struct message_parser_ctx *ctx,
> +               return -1;
> +       }
> +
> ++      if (ctx->total_parts_count >= ctx->max_total_mime_parts) {
> ++              /* can't add any more MIME parts. just stop trying to find
> ++                 more boundaries. */
> ++              return -1;
> ++      }
> ++
> +       /* need to find the end of line */
> +       data += 2;
> +       size -= 2;
> +@@ -1125,6 +1136,8 @@ message_parser_init_int(struct istream *input,
> +       ctx->flags = flags;
> +       ctx->max_nested_mime_parts =
> +               MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS;
> ++      ctx->max_total_mime_parts =
> ++              MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS;
> +       ctx->input = input;
> +       i_stream_ref(input);
> +       return ctx;
> +@@ -1142,6 +1155,7 @@ message_parser_init(pool_t part_pool, struct
> istream *input,
> +       ctx->parts = ctx->part = p_new(part_pool, struct message_part, 1);
> +       ctx->next_part = &ctx->part->children;
> +       ctx->parse_next_block = parse_next_header_init;
> ++      ctx->total_parts_count = 1;
> +       i_array_init(&ctx->next_part_stack, 4);
> +       return ctx;
> + }
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
> new file mode 100644
> index 000000000..a81177d2b
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
> @@ -0,0 +1,133 @@
> +From 0c9d56b41b992a868f299e05677a67c4d0495523 Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Thu, 2 Jul 2020 17:31:19 +0300
> +Subject: [PATCH 12/13] lib-mail: Fix handling trailing "--" in MIME
> boundaries
> +
> +Broken by 5b8ec27fae941d06516c30476dcf4820c6d200ab
> +---
> + src/lib-mail/message-parser.c      | 14 ++++++++----
> + src/lib-mail/test-message-parser.c | 46
> ++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 56 insertions(+), 4 deletions(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 646307802..175d4b488 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -75,7 +75,7 @@ static int preparsed_parse_next_header_init(struct
> message_parser_ctx *ctx,
> +
> + static struct message_boundary *
> + boundary_find(struct message_boundary *boundaries,
> +-            const unsigned char *data, size_t len)
> ++            const unsigned char *data, size_t len, bool trailing_dashes)
> + {
> +       struct message_boundary *best = NULL;
> +
> +@@ -89,7 +89,11 @@ boundary_find(struct message_boundary *boundaries,
> +                   memcmp(boundaries->boundary, data, boundaries->len) ==
> 0 &&
> +                   (best == NULL || best->len < boundaries->len)) {
> +                       best = boundaries;
> +-                      if (best->len == len) {
> ++                      /* If we see "foo--", it could either mean that
> there
> ++                         is a boundary named "foo" that ends now or
> there's
> ++                         a boundary "foo--" which continues. */
> ++                      if (best->len == len ||
> ++                          (best->len == len-2 && trailing_dashes)) {
> +                               /* This is exactly the wanted boundary.
> There
> +                                  can't be a better one. */
> +                               break;
> +@@ -319,6 +323,7 @@ boundary_line_find(struct message_parser_ctx *ctx,
> +               return 0;
> +       }
> +       size_t find_size = size;
> ++      bool trailing_dashes = FALSE;
> +
> +       if (lf_pos != NULL) {
> +               find_size = lf_pos - data;
> +@@ -326,11 +331,12 @@ boundary_line_find(struct message_parser_ctx *ctx,
> +                       find_size--;
> +               if (find_size > 2 && data[find_size-1] == '-' &&
> +                   data[find_size-2] == '-')
> +-                      find_size -= 2;
> ++                      trailing_dashes = TRUE;
> +       } else if (find_size > BOUNDARY_END_MAX_LEN)
> +               find_size = BOUNDARY_END_MAX_LEN;
> +
> +-      *boundary_r = boundary_find(ctx->boundaries, data, find_size);
> ++      *boundary_r = boundary_find(ctx->boundaries, data, find_size,
> ++                                  trailing_dashes);
> +       if (*boundary_r == NULL)
> +               return -1;
> +
> +diff --git a/src/lib-mail/test-message-parser.c
> b/src/lib-mail/test-message-parser.c
> +index 481d05942..113454ea0 100644
> +--- a/src/lib-mail/test-message-parser.c
> ++++ b/src/lib-mail/test-message-parser.c
> +@@ -510,6 +510,51 @@ static const char input_msg[] =
> +       test_end();
> + }
> +
> ++static void test_message_parser_trailing_dashes(void)
> ++{
> ++static const char input_msg[] =
> ++"Content-Type: multipart/mixed; boundary=\"a--\"\n"
> ++"\n"
> ++"--a--\n"
> ++"Content-Type: multipart/mixed; boundary=\"a----\"\n"
> ++"\n"
> ++"--a----\n"
> ++"Content-Type: text/plain\n"
> ++"\n"
> ++"body\n"
> ++"--a------\n"
> ++"Content-Type: text/html\n"
> ++"\n"
> ++"body2\n"
> ++"--a----";
> ++      struct message_parser_ctx *parser;
> ++      struct istream *input;
> ++      struct message_part *parts;
> ++      struct message_block block;
> ++      pool_t pool;
> ++      int ret;
> ++
> ++      test_begin("message parser trailing dashes");
> ++      pool = pool_alloconly_create("message parser", 10240);
> ++      input = test_istream_create(input_msg);
> ++
> ++      parser = message_parser_init(pool, input, 0, 0);
> ++      while ((ret = message_parser_parse_next_block(parser, &block)) >
> 0) ;
> ++      test_assert(ret < 0);
> ++      message_parser_deinit(&parser, &parts);
> ++
> ++      test_assert(parts->children_count == 2);
> ++      test_assert(parts->children->next == NULL);
> ++      test_assert(parts->children->children_count == 1);
> ++      test_assert(parts->children->children->next == NULL);
> ++      test_assert(parts->children->children->children_count == 0);
> ++
> ++      test_parsed_parts(input, parts);
> ++      i_stream_unref(&input);
> ++      pool_unref(&pool);
> ++      test_end();
> ++}
> ++
> + static void test_message_parser_continuing_mime_boundary(void)
> + {
> + static const char input_msg[] =
> +@@ -777,6 +822,7 @@ int main(void)
> +               test_message_parser_empty_multipart,
> +               test_message_parser_duplicate_mime_boundary,
> +               test_message_parser_garbage_suffix_mime_boundary,
> ++              test_message_parser_trailing_dashes,
> +               test_message_parser_continuing_mime_boundary,
> +               test_message_parser_continuing_truncated_mime_boundary,
> +               test_message_parser_long_mime_boundary,
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
> b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
> new file mode 100644
> index 000000000..97068345f
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
> @@ -0,0 +1,32 @@
> +From f77a2b6c3ffe2ea96f4a4b05ec38dc9d53266ecb Mon Sep 17 00:00:00 2001
> +From: Timo Sirainen <timo.sirainen@open-xchange.com>
> +Date: Wed, 27 May 2020 11:35:55 +0300
> +Subject: [PATCH 13/13] lib-mail: Fix parse_too_many_nested_mime_parts()
> +
> +This was originally correct, until it was "optimized" wrong and got
> merged.
> +---
> + src/lib-mail/message-parser.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
> +index 175d4b488..5b11772ff 100644
> +--- a/src/lib-mail/message-parser.c
> ++++ b/src/lib-mail/message-parser.c
> +@@ -621,7 +621,7 @@ static bool block_is_at_eoh(const struct
> message_block *block)
> +
> + static bool parse_too_many_nested_mime_parts(struct message_parser_ctx
> *ctx)
> + {
> +-      return ctx->nested_parts_count > ctx->max_nested_mime_parts;
> ++      return ctx->nested_parts_count+1 >= ctx->max_nested_mime_parts;
> + }
> +
> + #define MUTEX_FLAGS \
> +--
> +2.11.0
> +
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
> b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
> new file mode 100644
> index 000000000..44f6564f8
> --- /dev/null
> +++ b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
> @@ -0,0 +1,27 @@
> +From 1a6ff0beebf0ab0c71081eaff1d5d7fd26015a94 Mon Sep 17 00:00:00 2001
> +From: Josef 'Jeff' Sipek <jeff.sipek@dovecot.fi>
> +Date: Tue, 19 Sep 2017 13:26:57 +0300
> +Subject: [PATCH] lib: buffer_free(NULL) should be a no-op
> +
> +---
> + src/lib/buffer.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +CVE: CVE-2020-12100
> +Upstream-Status: Backport [
> http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz
> ]
> +Comment: No change in any hunk
> +
> +--- a/src/lib/buffer.c
> ++++ b/src/lib/buffer.c
> +@@ -148,6 +148,9 @@ void buffer_free(buffer_t **_buf)
> + {
> +       struct real_buffer *buf = (struct real_buffer *)*_buf;
> +
> ++      if (buf == NULL)
> ++              return;
> ++
> +       *_buf = NULL;
> +       if (buf->alloced)
> +               p_free(buf->pool, buf->w_buffer);
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
> b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
> index e21a94ad6..407604c81 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
> @@ -10,6 +10,20 @@ SRC_URI = "
> http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
>             file://dovecot.service \
>             file://dovecot.socket \
>             file://0001-doveadm-Fix-parallel-build.patch \
> +
>  file://0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch \
> +
>  file://0002-lib-mail-message-parser-Change-message_part_append-t.patch \
> +
>  file://0003-lib-mail-message-parser-Optimize-updating-children_c.patch \
> +
>  file://0004-lib-mail-message-parser-Optimize-appending-new-part-.patch \
> +
>  file://0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch \
> +
>  file://0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch \
> +
>  file://0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch \
> +
>  file://0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch \
> +
>  file://0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch \
> +
>  file://0010-lib-mail-message-parser-Support-limiting-max-number-.patch \
> +
>  file://0011-lib-mail-message-parser-Support-limiting-max-number-.patch \
> +
>  file://0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch \
> +
>  file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch \
> +           file://buffer_free_fix.patch \
>             "
>
>  SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
> --
> 2.17.1
>
>

--0000000000004bd71e05d1ea8b47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Could you please r=
eview the below patch?</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 7 Oct 2021 at 19:10, Sana Kazi &lt;<a=
 href=3D"mailto:sanakazisk19@gmail.com">sanakazisk19@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Added patches=
 to fix CVE-2020-12100<br>
<br>
Link: <a href=3D"http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovec=
ot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubun=
tu4.7.debian.tar.xz</a><br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com" targ=
et=3D"_blank">sanakazisk19@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-parser-Add-a-message_part_finish-he.patch |=C2=A0 76 +++++++<br>
=C2=A0...-parser-Change-message_part_append-t.patch |=C2=A0 71 +++++++<br>
=C2=A0...-parser-Optimize-updating-children_c.patch |=C2=A0 49 +++++<br>
=C2=A0...-parser-Optimize-appending-new-part-.patch |=C2=A0 88 ++++++++<br>
=C2=A0...-parser-Minor-code-cleanup-to-findin.patch |=C2=A0 45 +++++<br>
=C2=A0...-parser-Truncate-excessively-long-MI.patch | 163 +++++++++++++++<b=
r>
=C2=A0...-parser-Optimize-boundary-lookups-wh.patch |=C2=A0 72 +++++++<br>
=C2=A0...-parser-Add-boundary_remove_until-he.patch |=C2=A0 50 +++++<br>
=C2=A0...-parser-Don-t-use-memory-pool-for-pa.patch | 169 ++++++++++++++++<=
br>
=C2=A0...-parser-Support-limiting-max-number-.patch | 188 +++++++++++++++++=
+<br>
=C2=A0...-parser-Support-limiting-max-number-.patch |=C2=A0 87 ++++++++<br>
=C2=A0...handling-trailing-in-MIME-boundaries.patch | 133 +++++++++++++<br>
=C2=A0...Fix-parse_too_many_nested_mime_parts.patch |=C2=A0 32 +++<br>
=C2=A0.../dovecot/dovecot/buffer_free_fix.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
27 +++<br>
=C2=A0.../dovecot/<a href=3D"http://dovecot_2.2.36.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">dovecot_2.2.36.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++<br>
=C2=A015 files changed, 1264 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
01-lib-mail-message-parser-Add-a-message_part_finish-he.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
02-lib-mail-message-parser-Change-message_part_append-t.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
03-lib-mail-message-parser-Optimize-updating-children_c.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
04-lib-mail-message-parser-Optimize-appending-new-part-.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
05-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
06-lib-mail-message-parser-Truncate-excessively-long-MI.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
07-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
08-lib-mail-message-parser-Add-boundary_remove_until-he.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
09-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
10-lib-mail-message-parser-Support-limiting-max-number-.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
11-lib-mail-message-parser-Support-limiting-max-number-.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
12-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/00=
13-lib-mail-Fix-parse_too_many_nested_mime_parts.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/bu=
ffer_free_fix.patch<br>
<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-=
message-parser-Add-a-message_part_finish-he.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_fi=
nish-he.patch<br>
new file mode 100644<br>
index 000000000..583f71ca5<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message=
-parser-Add-a-message_part_finish-he.patch<br>
@@ -0,0 +1,76 @@<br>
+From 667d353b0f217372e8cc43ea4fe13466689c7ed0 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 11:33:31 +0300<br>
+Subject: [PATCH 01/13] lib-mail: message-parser - Add a message_part_finis=
h()<br>
+ helper function<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 25 ++++++++++++-------------<br>
+ 1 file changed, 12 insertions(+), 13 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index b1de1950a..aaa8dd8b7 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -195,6 +195,13 @@ message_part_append(pool_t pool, struct message_part =
*parent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return part;<br>
+ }<br>
+ <br>
++static void message_part_finish(struct message_parser_ctx *ctx)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;bo=
dy_size, &amp;ctx-&gt;part-&gt;body_size);<br>
++=C2=A0 =C2=A0 =C2=A0 message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;bo=
dy_size, &amp;ctx-&gt;part-&gt;header_size);<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
++}<br>
++<br>
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx=
)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *b;<br>
+@@ -312,19 +319,16 @@ static int parse_part_finish(struct message_parser_c=
tx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct message_boundary *boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct message_block *block_r, bool first_line)<br=
>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 struct message_part *part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t line_size;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(ctx-&gt;last_boundary =3D=3D NULL);<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get back to parent MIME part, summing the ch=
ild MIME part sizes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 into parent&#39;s body sizes */<br>
+-=C2=A0 =C2=A0 =C2=A0 for (part =3D ctx-&gt;part; part !=3D boundary-&gt;p=
art; part =3D part-&gt;parent) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_size_add(&amp;pa=
rt-&gt;parent-&gt;body_size, &amp;part-&gt;body_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_size_add(&amp;pa=
rt-&gt;parent-&gt;body_size, &amp;part-&gt;header_size);<br>
++=C2=A0 =C2=A0 =C2=A0 while (ctx-&gt;part !=3D boundary-&gt;part) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_part_finish(ctx)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_assert(ctx-&gt;part !=
=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 i_assert(part !=3D NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 ctx-&gt;part =3D part;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (boundary-&gt;epilogue_found) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* this boundary is=
n&#39;t needed anymore */<br>
+@@ -1132,13 +1136,8 @@ int message_parser_parse_next_block(struct message_=
parser_ctx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(ctx-&gt;in=
put-&gt;eof || ctx-&gt;input-&gt;closed ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ctx-&gt;input-&gt;stream_errno !=3D 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ctx-&gt;broken_reason !=3D NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (ctx-&gt;part-&gt;=
parent !=3D NULL) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;body_size,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ctx-=
&gt;part-&gt;body_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 message_size_add(&amp;ctx-&gt;part-&gt;parent-&gt;body_size,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ctx-=
&gt;part-&gt;header_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (ctx-&gt;part-&gt;=
parent !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 message_part_finish(ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (block_r-&gt;size =3D=3D 0) {<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-=
message-parser-Change-message_part_append-t.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_a=
ppend-t.patch<br>
new file mode 100644<br>
index 000000000..9f24320eb<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message=
-parser-Change-message_part_append-t.patch<br>
@@ -0,0 +1,71 @@<br>
+From de0da7bc8df55521db8fa787f88e293618c96386 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 11:34:22 +0300<br>
+Subject: [PATCH 02/13] lib-mail: message-parser - Change message_part_appe=
nd()<br>
+ to do all work internally<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 13 +++++++------<br>
+ 1 file changed, 7 insertions(+), 6 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index aaa8dd8b7..2edf3e7a6 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -167,16 +167,17 @@ static int message_parser_read_more(struct message_p=
arser_ctx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+ <br>
+-static struct message_part *<br>
+-message_part_append(pool_t pool, struct message_part *parent)<br>
++static void<br>
++message_part_append(struct message_parser_ctx *ctx)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part *parent =3D ctx-&gt;part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *p, *part, **list;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(parent !=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert((parent-&gt;flags &amp; (MESSAGE_PART_=
FLAG_MULTIPART |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MESSAGE_PART_FLAG_MESSAGE_RFC=
822)) !=3D 0);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 part =3D p_new(pool, struct message_part, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 part =3D p_new(ctx-&gt;part_pool, struct message_par=
t, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0part-&gt;parent =3D parent;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (p =3D parent; p !=3D NULL; p =3D p-&gt;par=
ent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;children_coun=
t++;<br>
+@@ -192,7 +193,7 @@ message_part_append(pool_t pool, struct message_part *=
parent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list =3D &amp;(*lis=
t)-&gt;next;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*list =3D part;<br>
+-=C2=A0 =C2=A0 =C2=A0 return part;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;part =3D part;<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+@@ -220,7 +221,7 @@ static void parse_next_body_multipart_init(struct mess=
age_parser_ctx *ctx)<br>
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx =
*ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct message_block *block_r)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 ctx-&gt;part =3D message_part_append(ctx-&gt;part_po=
ol, ctx-&gt;part);<br>
++=C2=A0 =C2=A0 =C2=A0 message_part_append(ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return parse_next_header_init(ctx, block_r);<br=
>
+ }<br>
+ <br>
+@@ -270,7 +271,7 @@ boundary_line_find(struct message_parser_ctx *ctx,<br>
+ static int parse_next_mime_header_init(struct message_parser_ctx *ctx,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct message_=
block *block_r)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 ctx-&gt;part =3D message_part_append(ctx-&gt;part_po=
ol, ctx-&gt;part);<br>
++=C2=A0 =C2=A0 =C2=A0 message_part_append(ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part-&gt;flags |=3D MESSAGE_PART_FLAG_I=
S_MIME;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return parse_next_header_init(ctx, block_r);<br=
>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-=
message-parser-Optimize-updating-children_c.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-chi=
ldren_c.patch<br>
new file mode 100644<br>
index 000000000..e53090235<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message=
-parser-Optimize-updating-children_c.patch<br>
@@ -0,0 +1,49 @@<br>
+From a9800b436fcf1f9633c2b136a9c5cb7a486a8a52 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 11:36:48 +0300<br>
+Subject: [PATCH 03/13] lib-mail: message-parser - Optimize updating<br>
+ children_count<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 5 ++---<br>
+ 1 file changed, 2 insertions(+), 3 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 2edf3e7a6..05768a058 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -171,7 +171,7 @@ static void<br>
+ message_part_append(struct message_parser_ctx *ctx)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *parent =3D ctx-&gt;part;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 struct message_part *p, *part, **list;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part *part, **list;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(parent !=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert((parent-&gt;flags &amp; (MESSAGE_PART_=
FLAG_MULTIPART |<br>
+@@ -179,8 +179,6 @@ message_part_append(struct message_parser_ctx *ctx)<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0part =3D p_new(ctx-&gt;part_pool, struct messag=
e_part, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0part-&gt;parent =3D parent;<br>
+-=C2=A0 =C2=A0 =C2=A0 for (p =3D parent; p !=3D NULL; p =3D p-&gt;parent)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;children_count++;<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* set child position */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0part-&gt;physical_pos =3D<br>
+@@ -200,6 +198,7 @@ static void message_part_finish(struct message_parser_=
ctx *ctx)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;body_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;header_size);<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;part-&gt;parent-&gt;children_count +=3D 1 + =
ctx-&gt;part-&gt;children_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+ }<br>
+ <br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-=
message-parser-Optimize-appending-new-part-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-ne=
w-part-.patch<br>
new file mode 100644<br>
index 000000000..c35bf883e<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message=
-parser-Optimize-appending-new-part-.patch<br>
@@ -0,0 +1,88 @@<br>
+From 99ee7596712cf0ea0a288b712bc898ecb2b35f9b Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 12:00:38 +0300<br>
+Subject: [PATCH 04/13] lib-mail: message-parser - Optimize appending new p=
art<br>
+ to linked list<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 28 ++++++++++++++++++++++------<br>
+ 1 file changed, 22 insertions(+), 6 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -1,7 +1,7 @@<br>
+ /* Copyright (c) 2002-2017 Dovecot authors, see the included COPYING file=
 */<br>
+ <br>
+ #include &quot;lib.h&quot;<br>
+-#include &quot;buffer.h&quot;<br>
++#include &quot;array.h&quot;<br>
+ #include &quot;str.h&quot;<br>
+ #include &quot;istream.h&quot;<br>
+ #include &quot;rfc822-parser.h&quot;<br>
+@@ -34,6 +34,9 @@ struct message_parser_ctx {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *last_boundary;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *boundaries;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part **next_part;<br>
++=C2=A0 =C2=A0 =C2=A0 ARRAY(struct message_part **) next_part_stack;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t skip;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char last_chr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int want_count;<br>
+@@ -171,7 +174,7 @@ static void<br>
+ message_part_append(struct message_parser_ctx *ctx)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *parent =3D ctx-&gt;part;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 struct message_part *part, **list;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part *part;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(parent !=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert((parent-&gt;flags &amp; (MESSAGE_PART_=
FLAG_MULTIPART |<br>
+@@ -186,16 +189,27 @@ message_part_append(struct message_parse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent-&gt;body_siz=
e.physical_size +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent-&gt;header_s=
ize.physical_size;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 list =3D &amp;part-&gt;parent-&gt;children;<br>
+-=C2=A0 =C2=A0 =C2=A0 while (*list !=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list =3D &amp;(*list)-&g=
t;next;<br>
++=C2=A0 =C2=A0 =C2=A0 /* add to parent&#39;s linked list */<br>
++=C2=A0 =C2=A0 =C2=A0 *ctx-&gt;next_part =3D part;<br>
++=C2=A0 =C2=A0 =C2=A0 /* update the parent&#39;s end-of-linked-list pointe=
r */<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part **next_part =3D &amp;part-&gt;ne=
xt;<br>
++=C2=A0 =C2=A0 =C2=A0 array_append(&amp;ctx-&gt;next_part_stack, &amp;next=
_part, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 /* This part is now the new parent for the next mess=
age_part_append()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call. Its linked list begins with the c=
hildren pointer. */<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;next_part =3D &amp;part-&gt;children;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 *list =3D part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part =3D part;<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part **const *parent_next_partp;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int count =3D array_count(&amp;ctx-&gt;next=
_part_stack);<br>
++=C2=A0 =C2=A0 =C2=A0 <br>
++=C2=A0 =C2=A0 =C2=A0 parent_next_partp =3D array_idx(&amp;ctx-&gt;next_pa=
rt_stack, count-1);<br>
++=C2=A0 =C2=A0 =C2=A0 array_delete(&amp;ctx-&gt;next_part_stack, count-1, =
1);<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;next_part =3D *parent_next_partp;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;body_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;header_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part-&gt;parent-&gt;children_count +=3D=
 1 + ctx-&gt;part-&gt;children_count;<br>
+@@ -1062,7 +1076,9 @@ message_parser_init(pool_t part_pool, st<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D message_parser_init_int(input, hdr_flag=
s, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part_pool =3D part_pool;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parts =3D ctx-&gt;part =3D p_new(part_p=
ool, struct message_part, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;next_part =3D &amp;ctx-&gt;part-&gt;children=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parse_next_block =3D parse_next_header_=
init;<br>
++=C2=A0 =C2=A0 =C2=A0 p_array_init(&amp;ctx-&gt;next_part_stack, ctx-&gt;p=
arser_pool, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx;<br>
+ }<br>
+ <br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-=
message-parser-Minor-code-cleanup-to-findin.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to=
-findin.patch<br>
new file mode 100644<br>
index 000000000..4e63509b4<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message=
-parser-Minor-code-cleanup-to-findin.patch<br>
@@ -0,0 +1,45 @@<br>
+From e39c95b248917eb2b596ca55a957f3cbc7fd406f Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 12:10:07 +0300<br>
+Subject: [PATCH 05/13] lib-mail: message-parser - Minor code cleanup to<br=
>
+ finding the end of boundary line<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 9 ++++-----<br>
+ 1 file changed, 4 insertions(+), 5 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index ff4e09e5a..6c6a680b5 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -260,17 +260,16 @@ boundary_line_find(struct message_parser_ctx *ctx,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* need to find the end of line */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (memchr(data + 2, &#39;\n&#39;, size - 2) =3D=3D =
NULL &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size &lt; BOUNDARY_END_MAX_LEN &amp;&a=
mp;<br>
++=C2=A0 =C2=A0 =C2=A0 data +=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 size -=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 if (memchr(data, &#39;\n&#39;, size) =3D=3D NULL &am=
p;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size+2 &lt; BOUNDARY_END_MAX_LEN &amp;=
&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!ctx-&gt;input-&gt;eof &amp;&amp;=
 !full) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no LF found */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;want_count =
=3D BOUNDARY_END_MAX_LEN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 data +=3D 2;<br>
+-=C2=A0 =C2=A0 =C2=A0 size -=3D 2;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*boundary_r =3D boundary_find(ctx-&gt;boundarie=
s, data, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*boundary_r =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-=
message-parser-Truncate-excessively-long-MI.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-=
long-MI.patch<br>
new file mode 100644<br>
index 000000000..1012d7983<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message=
-parser-Truncate-excessively-long-MI.patch<br>
@@ -0,0 +1,163 @@<br>
+From aed125484a346b4893c1a169088c39fe7ced01f3 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 12:53:12 +0300<br>
+Subject: [PATCH 06/13] lib-mail: message-parser - Truncate excessively lon=
g<br>
+ MIME boundaries<br>
+<br>
+RFC 2046 requires that the boundaries are a maximum of 70 characters<br>
+(excluding the &quot;--&quot; prefix and suffix). We allow 80 characters f=
or a bit of<br>
+extra safety. Anything longer than that is truncated and treated the same<=
br>
+as if it was just 80 characters.<br>
+---<br>
+ src/lib-mail/message-parser.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++-<br>
+ src/lib-mail/test-message-parser.c | 95 +++++++++++++++++++++++++++++++++=
+++++<br>
+ 2 files changed, 100 insertions(+), 2 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 6c6a680b5..92f541b02 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -10,7 +10,8 @@<br>
+ <br>
+ /* RFC-2046 requires boundaries are max. 70 chars + &quot;--&quot; prefix=
 + &quot;--&quot; suffix.<br>
+=C2=A0 =C2=A0 We&#39;ll add a bit more just in case. */<br>
+-#define BOUNDARY_END_MAX_LEN (70 + 2 + 2 + 10)<br>
++#define BOUNDARY_STRING_MAX_LEN (70 + 10)<br>
++#define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)<br>
+ <br>
+ struct message_boundary {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *next;<br>
+@@ -526,8 +527,10 @@ static void parse_content_type(struct message_parser_=
ctx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rfc2231_parse(&amp;parser, &amp;results);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; *results !=3D NULL; results +=3D 2) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcasecmp(resu=
lts[0], &quot;boundary&quot;) =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* truncate excessively long boundaries */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ctx-&gt;last_boundary =3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p_strdup(ctx-&gt;parser_pool, results[1]);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p_strndup(ctx-&gt;parser_pool, results[1],<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BOUNDARY=
_STRING_MAX_LEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c<br>
+index 1f1aa1437..94aa3eb7c 100644<br>
+--- a/src/lib-mail/test-message-parser.c<br>
++++ b/src/lib-mail/test-message-parser.c<br>
+@@ -642,6 +642,100 @@ static void test_message_parser_no_eoh(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_end();<br>
+ }<br>
+ <br>
++static void test_message_parser_long_mime_boundary(void)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 /* Close the boundaries in wrong reverse order. But =
because all<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boundaries are actually truncated to th=
e same size (..890) it<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0works the same as if all of them were d=
uplicate boundaries. */<br>
++static const char input_msg[] =3D<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;123456789012345678=
9012345678901234567890123456789012345678901234567890123456789012\&quot;\n&q=
uot;<br>
++&quot;\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
67890123456789012\n&quot;<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;123456789012345678=
901234567890123456789012345678901234567890123456789012345678901\&quot;\n&qu=
ot;<br>
++&quot;\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
6789012345678901\n&quot;<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;123456789012345678=
90123456789012345678901234567890123456789012345678901234567890\&quot;\n&quo=
t;<br>
++&quot;\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
678901234567890\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;1\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
67890123456789012\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;22\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
6789012345678901\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;333\n&quot;<br>
++&quot;--12345678901234567890123456789012345678901234567890123456789012345=
678901234567890\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;4444\n&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_parser_ctx *parser;<br>
++=C2=A0 =C2=A0 =C2=A0 struct istream *input;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part *parts, *part;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_block block;<br>
++=C2=A0 =C2=A0 =C2=A0 pool_t pool;<br>
++=C2=A0 =C2=A0 =C2=A0 int ret;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_begin(&quot;message parser long mime boundary&q=
uot;);<br>
++=C2=A0 =C2=A0 =C2=A0 pool =3D pool_alloconly_create(&quot;message parser&=
quot;, 10240);<br>
++=C2=A0 =C2=A0 =C2=A0 input =3D test_istream_create(input_msg);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 parser =3D message_parser_init(pool, input, 0, 0);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 while ((ret =3D message_parser_parse_next_block(pars=
er, &amp;block)) &gt; 0) ;<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(ret &lt; 0);<br>
++=C2=A0 =C2=A0 =C2=A0 message_parser_deinit(&amp;parser, &amp;parts);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 part =3D parts;<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;children_count =3D=3D 6);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;flags =3D=3D (MESSAGE_PART_FLAG=
_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.lines =3D=3D 2);<br=
>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.physical_size =3D=
=3D 126);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.virtual_size =3D=3D=
 126+2);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.lines =3D=3D 22);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.physical_size =3D=3D =
871);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.virtual_size =3D=3D 8=
71+22);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 part =3D parts-&gt;children;<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;children_count =3D=3D 5);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;flags =3D=3D (MESSAGE_PART_FLAG=
_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.lines =3D=3D 2);<br=
>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.physical_size =3D=
=3D 125);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.virtual_size =3D=3D=
 125+2);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.lines =3D=3D 19);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.physical_size =3D=3D =
661);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.virtual_size =3D=3D 6=
61+19);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 part =3D parts-&gt;children-&gt;children;<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;children_count =3D=3D 4);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;flags =3D=3D (MESSAGE_PART_FLAG=
_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.lines =3D=3D 2);<br=
>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.physical_size =3D=
=3D 124);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;header_size.virtual_size =3D=3D=
 124+2);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.lines =3D=3D 16);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.physical_size =3D=3D =
453);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;body_size.virtual_size =3D=3D 4=
53+16);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 part =3D parts-&gt;children-&gt;children-&gt;childre=
n;<br>
++=C2=A0 =C2=A0 =C2=A0 for (unsigned int i =3D 1; i &lt;=3D 3; i++, part =
=3D part-&gt;next) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;chi=
ldren_count =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;fla=
gs =3D=3D (MESSAGE_PART_FLAG_TEXT | MESSAGE_PART_FLAG_IS_MIME));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;hea=
der_size.lines =3D=3D 2);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;hea=
der_size.physical_size =3D=3D 26);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;hea=
der_size.virtual_size =3D=3D 26+2);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;bod=
y_size.lines =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;bod=
y_size.physical_size =3D=3D i);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(part-&gt;bod=
y_size.virtual_size =3D=3D i);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_parsed_parts(input, parts);<br>
++=C2=A0 =C2=A0 =C2=A0 i_stream_unref(&amp;input);<br>
++=C2=A0 =C2=A0 =C2=A0 pool_unref(&amp;pool);<br>
++=C2=A0 =C2=A0 =C2=A0 test_end();<br>
++}<br>
++<br>
+ int main(void)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static void (*test_functions[])(void) =3D {<br>
+@@ -654,6 +748,7 @@ int main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_garbage_suffix_mime_boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_continuing_mime_boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_continuing_truncated_mime_boundary,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_message_parser_long=
_mime_boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_no_eoh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-=
message-parser-Optimize-boundary-lookups-wh.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-loo=
kups-wh.patch<br>
new file mode 100644<br>
index 000000000..eeb6c96f1<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message=
-parser-Optimize-boundary-lookups-wh.patch<br>
@@ -0,0 +1,72 @@<br>
+From 5f8de52fec3191a1aa68a399ee2068485737dc4f Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 13:06:02 +0300<br>
+Subject: [PATCH 07/13] lib-mail: message-parser - Optimize boundary lookup=
s<br>
+ when exact boundary is found<br>
+<br>
+When an exact boundary is found, there&#39;s no need to continue looking f=
or<br>
+more boundaries.<br>
+---<br>
+ src/lib-mail/message-parser.c | 26 ++++++++++++++++++++++----<br>
+ 1 file changed, 22 insertions(+), 4 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 92f541b02..c2934c761 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -80,8 +80,14 @@ boundary_find(struct message_boundary *boundaries,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (boundaries !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (boundaries-&gt;=
len &lt;=3D len &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcm=
p(boundaries-&gt;boundary, data, boundaries-&gt;len) =3D=3D 0 &amp;&amp;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (best =3D=
=3D NULL || best-&gt;len &lt; boundaries-&gt;len))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (best =3D=
=3D NULL || best-&gt;len &lt; boundaries-&gt;len)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0best =3D boundaries;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (best-&gt;len =3D=3D len) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This is exactly the wanted boundary. The=
re<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0can&#39;t be a better one. */<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boundaries =3D boun=
daries-&gt;next;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -263,15 +269,27 @@ boundary_line_find(struct message_parser_ctx *ctx,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* need to find the end of line */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data +=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size -=3D 2;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (memchr(data, &#39;\n&#39;, size) =3D=3D NULL &am=
p;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 const unsigned char *lf_pos =3D memchr(data, &#39;\n=
&#39;, size);<br>
++=C2=A0 =C2=A0 =C2=A0 if (lf_pos =3D=3D NULL &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size+2 &lt; BOUNDARY_END_MAX_LEN =
&amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!ctx-&gt;input-&gt;eof &amp;&amp;=
 !full) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no LF found */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;want_count =
=3D BOUNDARY_END_MAX_LEN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, size);<br>
++=C2=A0 =C2=A0 =C2=A0 size_t find_size =3D size;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (lf_pos !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find_size =3D lf_pos - d=
ata;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (find_size &gt; 0 &am=
p;&amp; data[find_size-1] =3D=3D &#39;\r&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 find_size--;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (find_size &gt; 2 &am=
p;&amp; data[find_size-1] =3D=3D &#39;-&#39; &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data[find_=
size-2] =3D=3D &#39;-&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 find_size -=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (find_size &gt; BOUNDARY_END_MAX_LEN)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find_size =3D BOUNDARY_E=
ND_MAX_LEN;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, find_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*boundary_r =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+ <br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-=
message-parser-Add-boundary_remove_until-he.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_u=
ntil-he.patch<br>
new file mode 100644<br>
index 000000000..4af070a87<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message=
-parser-Add-boundary_remove_until-he.patch<br>
@@ -0,0 +1,50 @@<br>
+From 929396767d831bedbdec6392aaa835b045332fd3 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 14:53:27 +0300<br>
+Subject: [PATCH 08/13] lib-mail: message-parser - Add boundary_remove_unti=
l()<br>
+ helper function<br>
+<br>
+---<br>
+ src/lib-mail/message-parser.c | 11 +++++++++--<br>
+ 1 file changed, 9 insertions(+), 2 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index c2934c761..028f74159 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -223,6 +223,13 @@ static void message_part_finish(struct message_parser=
_ctx *ctx)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+ }<br>
+ <br>
++static void<br>
++boundary_remove_until(struct message_parser_ctx *ctx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
uct message_boundary *boundary)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;boundaries =3D boundary;<br>
++}<br>
++<br>
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx=
)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *b;<br>
+@@ -364,10 +371,10 @@ static int parse_part_finish(struct message_parser_c=
tx *ctx,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (boundary-&gt;epilogue_found) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* this boundary is=
n&#39;t needed anymore */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;boundaries =3D b=
oundary-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boundary_remove_until(ct=
x, boundary-&gt;next);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* forget about the=
 boundaries we possibly skipped */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;boundaries =3D b=
oundary;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boundary_remove_until(ct=
x, boundary);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* the boundary itself should already be in buf=
fer. add that. */<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-=
message-parser-Don-t-use-memory-pool-for-pa.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool=
-for-pa.patch<br>
new file mode 100644<br>
index 000000000..aade7dc2b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message=
-parser-Don-t-use-memory-pool-for-pa.patch<br>
@@ -0,0 +1,169 @@<br>
+From d53d83214b1d635446a8cf8ff9438cc530133d62 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 15:00:57 +0300<br>
+Subject: [PATCH 09/13] lib-mail: message-parser - Don&#39;t use memory poo=
l for<br>
+ parser<br>
+<br>
+This reduces memory usage when parsing many MIME parts where boundaries ar=
e<br>
+being added and removed constantly.<br>
+---<br>
+ src/lib-mail/message-parser.c | 48 ++++++++++++++++++++++++++++----------=
-----<br>
+ 1 file changed, 32 insertions(+), 16 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 028f74159..8970d8e0e 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -17,14 +17,14 @@ struct message_boundary {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *next;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *part;<br>
+-=C2=A0 =C2=A0 =C2=A0 const char *boundary;<br>
++=C2=A0 =C2=A0 =C2=A0 char *boundary;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int epilogue_found:1;<br>
+ };<br>
+ <br>
+ struct message_parser_ctx {<br>
+-=C2=A0 =C2=A0 =C2=A0 pool_t parser_pool, part_pool;<br>
++=C2=A0 =C2=A0 =C2=A0 pool_t part_pool;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct istream *input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *parts, *part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *broken_reason;<br>
+@@ -32,7 +32,7 @@ struct message_parser_ctx {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum message_header_parser_flags hdr_flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum message_parser_flags flags;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 const char *last_boundary;<br>
++=C2=A0 =C2=A0 =C2=A0 char *last_boundary;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *boundaries;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part **next_part;<br>
+@@ -223,10 +223,24 @@ static void message_part_finish(struct message_parse=
r_ctx *ctx)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part =3D ctx-&gt;part-&gt;parent;<br>
+ }<br>
+ <br>
++static void message_boundary_free(struct message_boundary *b)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 i_free(b-&gt;boundary);<br>
++=C2=A0 =C2=A0 =C2=A0 i_free(b);<br>
++}<br>
++<br>
+ static void<br>
+ boundary_remove_until(struct message_parser_ctx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct message_boundary *boundary)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 while (ctx-&gt;boundaries !=3D boundary) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct message_boundary =
*cur =3D ctx-&gt;boundaries;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_assert(cur !=3D NULL);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;boundaries =3D c=
ur-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_boundary_free(cu=
r);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;boundaries =3D boundary;<br>
+ }<br>
+ <br>
+@@ -234,15 +248,14 @@ static void parse_next_body_multipart_init(struct me=
ssage_parser_ctx *ctx)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *b;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 b =3D p_new(ctx-&gt;parser_pool, struct message_boun=
dary, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 b =3D i_new(struct message_boundary, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b-&gt;part =3D ctx-&gt;part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b-&gt;boundary =3D ctx-&gt;last_boundary;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;last_boundary =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b-&gt;len =3D strlen(b-&gt;boundary);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b-&gt;next =3D ctx-&gt;boundaries;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;boundaries =3D b;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 ctx-&gt;last_boundary =3D NULL;<br>
+ }<br>
+ <br>
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx =
*ctx,<br>
+@@ -359,6 +372,8 @@ static int parse_part_finish(struct message_parser_ctx=
 *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct message_block *block_r, bool first_line)<br=
>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t line_size;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t boundary_len =3D boundary-&gt;len;<br>
++=C2=A0 =C2=A0 =C2=A0 bool boundary_epilogue_found =3D boundary-&gt;epilog=
ue_found;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(ctx-&gt;last_boundary =3D=3D NULL);<br=
>
+ <br>
+@@ -391,7 +406,7 @@ static int parse_part_finish(struct message_parser_ctx=
 *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(block_r-&g=
t;data[0] =3D=3D &#39;\n&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line_size =3D 1;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 line_size +=3D 2 + boundary-&gt;len + (boundary-&gt;=
epilogue_found ? 2 : 0);<br>
++=C2=A0 =C2=A0 =C2=A0 line_size +=3D 2 + boundary_len + (boundary_epilogue=
_found ? 2 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(block_r-&gt;size &gt;=3D ctx-&gt;skip =
+ line_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0block_r-&gt;size =3D line_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_body_add_block(ctx, block_r);<br>
+@@ -553,9 +568,9 @@ static void parse_content_type(struct message_parser_c=
tx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; *results !=3D NULL; results +=3D 2) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcasecmp(resu=
lts[0], &quot;boundary&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* truncate excessively long boundaries */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i_free(ctx-&gt;last_boundary);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ctx-&gt;last_boundary =3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p_strndup(ctx-&gt;parser_pool, results[1],<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BOUNDARY=
_STRING_MAX_LEN);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_strndup(results[1], BOUNDARY_STRING_MAX_L=
EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -678,7 +693,7 @@ static int parse_next_header(struct message_parser_ctx=
 *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(!ctx-&gt;m=
ultipart);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part-&gt;flags =3D =
0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 ctx-&gt;last_boundary =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 i_free(ctx-&gt;last_boundary);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;part_seen_content_type ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(part-&gt;flags &amp; MESSAGE_PAR=
T_FLAG_IS_MIME) =3D=3D 0) {<br>
+@@ -1081,11 +1096,8 @@ message_parser_init_int(struct istream *input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enum message_parser_flags flags)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_parser_ctx *ctx;<br>
+-=C2=A0 =C2=A0 =C2=A0 pool_t pool;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 pool =3D pool_alloconly_create(&quot;Message Parser&=
quot;, 1024);<br>
+-=C2=A0 =C2=A0 =C2=A0 ctx =3D p_new(pool, struct message_parser_ctx, 1);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 ctx-&gt;parser_pool =3D pool;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx =3D i_new(struct message_parser_ctx, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;hdr_flags =3D hdr_flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;flags =3D flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;input =3D input;<br>
+@@ -1105,7 +1117,7 @@ message_parser_init(pool_t part_pool, struct istream=
 *input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parts =3D ctx-&gt;part =3D p_new(part_p=
ool, struct message_part, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;next_part =3D &amp;ctx-&gt;part-&gt;chi=
ldren;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parse_next_block =3D parse_next_header_=
init;<br>
+-=C2=A0 =C2=A0 =C2=A0 p_array_init(&amp;ctx-&gt;next_part_stack, ctx-&gt;p=
arser_pool, 4);<br>
++=C2=A0 =C2=A0 =C2=A0 i_array_init(&amp;ctx-&gt;next_part_stack, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx;<br>
+ }<br>
+ <br>
+@@ -1146,8 +1158,12 @@ int message_parser_deinit_from_parts(struct message=
_parser_ctx **_ctx,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;hdr_parser_ctx !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message_parse_heade=
r_deinit(&amp;ctx-&gt;hdr_parser_ctx);<br>
++=C2=A0 =C2=A0 =C2=A0 boundary_remove_until(ctx, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_stream_unref(&amp;ctx-&gt;input);<br>
+-=C2=A0 =C2=A0 =C2=A0 pool_unref(&amp;ctx-&gt;parser_pool);<br>
++=C2=A0 =C2=A0 =C2=A0 if (array_is_created(&amp;ctx-&gt;next_part_stack))<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 array_free(&amp;ctx-&gt;=
next_part_stack);<br>
++=C2=A0 =C2=A0 =C2=A0 i_free(ctx-&gt;last_boundary);<br>
++=C2=A0 =C2=A0 =C2=A0 i_free(ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(ret &lt; 0 || *parts_r !=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+ }<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-=
message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-=
number-.patch<br>
new file mode 100644<br>
index 000000000..ae5254466<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message=
-parser-Support-limiting-max-number-.patch<br>
@@ -0,0 +1,188 @@<br>
+From df9e0d358ef86e3342525dcdefcf79dc2d749a30 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 16:59:40 +0300<br>
+Subject: [PATCH 10/13] lib-mail: message-parser - Support limiting max num=
ber<br>
+ of nested MIME parts<br>
+<br>
+The default is to allow 100 nested MIME parts. When the limit is reached,<=
br>
+the innermost MIME part&#39;s body contains all the rest of the inner bodi=
es<br>
+until a parent MIME part is reached.<br>
+---<br>
+ src/lib-mail/message-parser.c=C2=A0 =C2=A0 =C2=A0 | 43 ++++++++++++++++++=
+++++++++++++-------<br>
+ src/lib-mail/test-message-parser.c | 31 +++++++++++++++++++++++++++<br>
+ 2 files changed, 67 insertions(+), 7 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 8970d8e0e..721615f76 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -13,6 +13,8 @@<br>
+ #define BOUNDARY_STRING_MAX_LEN (70 + 10)<br>
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)<br>
+ <br>
++#define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100<br>
++<br>
+ struct message_boundary {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *next;<br>
+ <br>
+@@ -28,9 +30,11 @@ struct message_parser_ctx {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct istream *input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *parts, *part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *broken_reason;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int nested_parts_count;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum message_header_parser_flags hdr_flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum message_parser_flags flags;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int max_nested_mime_parts;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *last_boundary;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *boundaries;<br>
+@@ -206,6 +210,8 @@ message_part_append(struct message_parser_ctx *ctx)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;next_part =3D &amp;part-&gt;children;<b=
r>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part =3D part;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;nested_parts_count++;<br>
++=C2=A0 =C2=A0 =C2=A0 i_assert(ctx-&gt;nested_parts_count &lt; ctx-&gt;max=
_nested_mime_parts);<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+@@ -213,8 +219,12 @@ static void message_part_finish(struct message_parser=
_ctx *ctx)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part **const *parent_next_partp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int count =3D array_count(&amp;ctx-&gt=
;next_part_stack);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
++=C2=A0 =C2=A0 =C2=A0 i_assert(ctx-&gt;nested_parts_count &gt; 0);<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;nested_parts_count--;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0parent_next_partp =3D array_idx(&amp;ctx-&gt;ne=
xt_part_stack, count-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0array_delete(&amp;ctx-&gt;next_part_stack, coun=
t-1, 1);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;next_part =3D *parent_next_partp;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message_size_add(&amp;ctx-&gt;part-&gt;parent-&=
gt;body_size, &amp;ctx-&gt;part-&gt;body_size);<br>
+@@ -592,6 +602,11 @@ static bool block_is_at_eoh(const struct message_bloc=
k *block)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
+ }<br>
+ <br>
++static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *c=
tx)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 return ctx-&gt;nested_parts_count &gt; ctx-&gt;max_n=
ested_mime_parts;<br>
++}<br>
++<br>
+ #define MUTEX_FLAGS \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(MESSAGE_PART_FLAG_MESSAGE_RFC822 | MESSAGE_PAR=
T_FLAG_MULTIPART)<br>
+ <br>
+@@ -616,8 +631,12 @@ static int parse_next_header(struct message_parser_ct=
x *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\n--b=
oundary&quot; belongs to us or to a previous boundary.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this is a p=
roblem if the boundary prefixes are identical,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because MIM=
E requires only the prefix to match. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_next_body_multipar=
t_init(ctx);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;multipart =3D TR=
UE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!parse_too_many_nest=
ed_mime_parts(ctx)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 parse_next_body_multipart_init(ctx);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;multipart =3D TRUE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 part-&gt;flags &amp;=3D ~MESSAGE_PART_FLAG_MULTIPART;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* before parsing the header see if we can find=
 a --boundary from here.<br>
+@@ -721,12 +740,16 @@ static int parse_next_header(struct message_parser_c=
tx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(ctx-&gt;la=
st_boundary =3D=3D NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;multipart =
=3D FALSE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parse_next_=
block =3D parse_next_body_to_boundary;<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if (part-&gt;flags &amp; MESSAGE_PART_FLAG_ME=
SSAGE_RFC822)<br>
++=C2=A0 =C2=A0 =C2=A0 } else if ((part-&gt;flags &amp; MESSAGE_PART_FLAG_M=
ESSAGE_RFC822) !=3D 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!parse_too_=
many_nested_mime_parts(ctx)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parse_next_=
block =3D parse_next_body_message_rfc822_init;<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (ctx-&gt;boundaries !=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;parse_next_block=
 =3D parse_next_body_to_boundary;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;parse_next_block=
 =3D parse_next_body_to_eof;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part-&gt;flags &amp;=3D =
~MESSAGE_PART_FLAG_MESSAGE_RFC822;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;boundaries !=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;parse_next_block =3D parse_next_body_to_boundary;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx-&gt;parse_next_block =3D parse_next_body_to_eof;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;want_count =3D 1;<br>
+ <br>
+@@ -1100,6 +1123,8 @@ message_parser_init_int(struct istream *input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D i_new(struct message_parser_ctx, 1);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;hdr_flags =3D hdr_flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;flags =3D flags;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;max_nested_mime_parts =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MESSAGE_PARSER_DEFAULT_M=
AX_NESTED_MIME_PARTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;input =3D input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_stream_ref(input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx;<br>
+@@ -1159,6 +1184,10 @@ int message_parser_deinit_from_parts(struct message=
_parser_ctx **_ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;hdr_parser_ctx !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message_parse_heade=
r_deinit(&amp;ctx-&gt;hdr_parser_ctx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0boundary_remove_until(ctx, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 /* caller might have stopped the parsing early */<br=
>
++=C2=A0 =C2=A0 =C2=A0 i_assert(ctx-&gt;nested_parts_count =3D=3D 0 ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i_stream_have_byte=
s_left(ctx-&gt;input));<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_stream_unref(&amp;ctx-&gt;input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (array_is_created(&amp;ctx-&gt;next_part_sta=
ck))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0array_free(&amp;ctx=
-&gt;next_part_stack);<br>
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c<br>
+index 94aa3eb7c..481d05942 100644<br>
+--- a/src/lib-mail/test-message-parser.c<br>
++++ b/src/lib-mail/test-message-parser.c<br>
+@@ -166,6 +166,36 @@ static void test_message_parser_small_blocks(void)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_end();<br>
+ }<br>
+ <br>
++static void test_message_parser_stop_early(void)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_parser_ctx *parser;<br>
++=C2=A0 =C2=A0 =C2=A0 struct istream *input;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part *parts;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_block block;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
++=C2=A0 =C2=A0 =C2=A0 pool_t pool;<br>
++=C2=A0 =C2=A0 =C2=A0 int ret;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_begin(&quot;message parser stop early&quot;);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 pool =3D pool_alloconly_create(&quot;message parser&=
quot;, 10240);<br>
++=C2=A0 =C2=A0 =C2=A0 input =3D test_istream_create(test_msg);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_istream_set_allow_eof(input, FALSE);<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt;=3D TEST_MSG_LEN+1; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_stream_seek(input, 0);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_istream_set_size(in=
put, i);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser =3D message_parse=
r_init(pool, input, 0, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((ret =3D message_=
parser_parse_next_block(parser,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;block))=
 &gt; 0) ;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_assert(ret =3D=3D 0=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_parser_deinit(&a=
mp;parser, &amp;parts);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 i_stream_unref(&amp;input);<br>
++=C2=A0 =C2=A0 =C2=A0 pool_unref(&amp;pool);<br>
++=C2=A0 =C2=A0 =C2=A0 test_end();<br>
++}<br>
++<br>
+ static void test_message_parser_truncated_mime_headers(void)<br>
+ {<br>
+ static const char input_msg[] =3D<br>
+@@ -740,6 +770,7 @@ int main(void)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static void (*test_functions[])(void) =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_small_blocks,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_message_parser_stop=
_early,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_truncated_mime_headers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_truncated_mime_headers2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_truncated_mime_headers3,<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-=
message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes=
-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-=
number-.patch<br>
new file mode 100644<br>
index 000000000..52848bf3a<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message=
-parser-Support-limiting-max-number-.patch<br>
@@ -0,0 +1,87 @@<br>
+From d7bba401dd234802bcdb55ff27dfb99bffdab804 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 23 Apr 2020 17:09:33 +0300<br>
+Subject: [PATCH 11/13] lib-mail: message-parser - Support limiting max num=
ber<br>
+ of MIME parts<br>
+<br>
+The default is to allow 10000 MIME parts. When it&#39;s reached, no more<b=
r>
+MIME boundary lines will be recognized, so the rest of the mail belongs<br=
>
+to the last added MIME part.<br>
+---<br>
+ src/lib-mail/message-parser.c | 14 ++++++++++++++<br>
+ 1 file changed, 14 insertions(+)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 721615f76..646307802 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -14,6 +14,7 @@<br>
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)<br>
+ <br>
+ #define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100<br>
++#define MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS 10000<br>
+ <br>
+ struct message_boundary {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *next;<br>
+@@ -31,10 +32,12 @@ struct message_parser_ctx {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_part *parts, *part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *broken_reason;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int nested_parts_count;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int total_parts_count;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum message_header_parser_flags hdr_flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum message_parser_flags flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int max_nested_mime_parts;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int max_total_mime_parts;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *last_boundary;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *boundaries;<br>
+@@ -211,7 +214,9 @@ message_part_append(struct message_parser_ctx *ctx)<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;part =3D part;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;nested_parts_count++;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;total_parts_count++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_assert(ctx-&gt;nested_parts_count &lt; ctx-&g=
t;max_nested_mime_parts);<br>
++=C2=A0 =C2=A0 =C2=A0 i_assert(ctx-&gt;total_parts_count &lt;=3D ctx-&gt;m=
ax_total_mime_parts);<br>
+ }<br>
+ <br>
+ static void message_part_finish(struct message_parser_ctx *ctx)<br>
+@@ -296,6 +301,12 @@ boundary_line_find(struct message_parser_ctx *ctx,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;total_parts_count &gt;=3D ctx-&gt;max_to=
tal_mime_parts) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* can&#39;t add any mor=
e MIME parts. just stop trying to find<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0more bounda=
ries. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* need to find the end of line */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data +=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size -=3D 2;<br>
+@@ -1125,6 +1136,8 @@ message_parser_init_int(struct istream *input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;flags =3D flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;max_nested_mime_parts =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MESSAGE_PARSER_DEFA=
ULT_MAX_NESTED_MIME_PARTS;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;max_total_mime_parts =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MESSAGE_PARSER_DEFAULT_M=
AX_TOTAL_MIME_PARTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;input =3D input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_stream_ref(input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx;<br>
+@@ -1142,6 +1155,7 @@ message_parser_init(pool_t part_pool, struct istream=
 *input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parts =3D ctx-&gt;part =3D p_new(part_p=
ool, struct message_part, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;next_part =3D &amp;ctx-&gt;part-&gt;chi=
ldren;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;parse_next_block =3D parse_next_header_=
init;<br>
++=C2=A0 =C2=A0 =C2=A0 ctx-&gt;total_parts_count =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i_array_init(&amp;ctx-&gt;next_part_stack, 4);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx;<br>
+ }<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-=
Fix-handling-trailing-in-MIME-boundaries.patch b/meta-networking/recipes-su=
pport/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundarie=
s.patch<br>
new file mode 100644<br>
index 000000000..a81177d2b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-han=
dling-trailing-in-MIME-boundaries.patch<br>
@@ -0,0 +1,133 @@<br>
+From 0c9d56b41b992a868f299e05677a67c4d0495523 Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Thu, 2 Jul 2020 17:31:19 +0300<br>
+Subject: [PATCH 12/13] lib-mail: Fix handling trailing &quot;--&quot; in M=
IME boundaries<br>
+<br>
+Broken by 5b8ec27fae941d06516c30476dcf4820c6d200ab<br>
+---<br>
+ src/lib-mail/message-parser.c=C2=A0 =C2=A0 =C2=A0 | 14 ++++++++----<br>
+ src/lib-mail/test-message-parser.c | 46 +++++++++++++++++++++++++++++++++=
+++++<br>
+ 2 files changed, 56 insertions(+), 4 deletions(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 646307802..175d4b488 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -75,7 +75,7 @@ static int preparsed_parse_next_header_init(struct messa=
ge_parser_ctx *ctx,<br>
+ <br>
+ static struct message_boundary *<br>
+ boundary_find(struct message_boundary *boundaries,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsigned char *data, size=
_t len)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsigned char *data, size=
_t len, bool trailing_dashes)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct message_boundary *best =3D NULL;<br>
+ <br>
+@@ -89,7 +89,11 @@ boundary_find(struct message_boundary *boundaries,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcm=
p(boundaries-&gt;boundary, data, boundaries-&gt;len) =3D=3D 0 &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(best=
 =3D=3D NULL || best-&gt;len &lt; boundaries-&gt;len)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0best =3D boundaries;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (best-&gt;len =3D=3D len) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* If we see &quot;foo--&quot;, it could either mean that there<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0is a boundary named &quot;foo&quot; that ends now or there=
&#39;s<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0a boundary &quot;foo--&quot; which continues. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (best-&gt;len =3D=3D len ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (best-&gt;len =3D=3D len-2 &amp;&amp; trailing_dashes)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is exactly the wanted boundar=
y. There<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 can&#39;t be a better one. */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -319,6 +323,7 @@ boundary_line_find(struct message_parser_ctx *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t find_size =3D size;<br>
++=C2=A0 =C2=A0 =C2=A0 bool trailing_dashes =3D FALSE;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lf_pos !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0find_size =3D lf_po=
s - data;<br>
+@@ -326,11 +331,12 @@ boundary_line_find(struct message_parser_ctx *ctx,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0find_size--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (find_size &gt; =
2 &amp;&amp; data[find_size-1] =3D=3D &#39;-&#39; &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data[=
find_size-2] =3D=3D &#39;-&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 find_size -=3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 trailing_dashes =3D TRUE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (find_size &gt; BOUNDARY_END_MAX_LEN)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0find_size =3D BOUND=
ARY_END_MAX_LEN;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, find_size);<br>
++=C2=A0 =C2=A0 =C2=A0 *boundary_r =3D boundary_find(ctx-&gt;boundaries, da=
ta, find_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trailing_dashes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*boundary_r =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+ <br>
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-messag=
e-parser.c<br>
+index 481d05942..113454ea0 100644<br>
+--- a/src/lib-mail/test-message-parser.c<br>
++++ b/src/lib-mail/test-message-parser.c<br>
+@@ -510,6 +510,51 @@ static const char input_msg[] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_end();<br>
+ }<br>
+ <br>
++static void test_message_parser_trailing_dashes(void)<br>
++{<br>
++static const char input_msg[] =3D<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;a--\&quot;\n&quot;=
<br>
++&quot;\n&quot;<br>
++&quot;--a--\n&quot;<br>
++&quot;Content-Type: multipart/mixed; boundary=3D\&quot;a----\&quot;\n&quo=
t;<br>
++&quot;\n&quot;<br>
++&quot;--a----\n&quot;<br>
++&quot;Content-Type: text/plain\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;body\n&quot;<br>
++&quot;--a------\n&quot;<br>
++&quot;Content-Type: text/html\n&quot;<br>
++&quot;\n&quot;<br>
++&quot;body2\n&quot;<br>
++&quot;--a----&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_parser_ctx *parser;<br>
++=C2=A0 =C2=A0 =C2=A0 struct istream *input;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_part *parts;<br>
++=C2=A0 =C2=A0 =C2=A0 struct message_block block;<br>
++=C2=A0 =C2=A0 =C2=A0 pool_t pool;<br>
++=C2=A0 =C2=A0 =C2=A0 int ret;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_begin(&quot;message parser trailing dashes&quot=
;);<br>
++=C2=A0 =C2=A0 =C2=A0 pool =3D pool_alloconly_create(&quot;message parser&=
quot;, 10240);<br>
++=C2=A0 =C2=A0 =C2=A0 input =3D test_istream_create(input_msg);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 parser =3D message_parser_init(pool, input, 0, 0);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 while ((ret =3D message_parser_parse_next_block(pars=
er, &amp;block)) &gt; 0) ;<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(ret &lt; 0);<br>
++=C2=A0 =C2=A0 =C2=A0 message_parser_deinit(&amp;parser, &amp;parts);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(parts-&gt;children_count =3D=3D 2);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(parts-&gt;children-&gt;next =3D=3D NULL)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(parts-&gt;children-&gt;children_count =
=3D=3D 1);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(parts-&gt;children-&gt;children-&gt;next=
 =3D=3D NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 test_assert(parts-&gt;children-&gt;children-&gt;chil=
dren_count =3D=3D 0);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_parsed_parts(input, parts);<br>
++=C2=A0 =C2=A0 =C2=A0 i_stream_unref(&amp;input);<br>
++=C2=A0 =C2=A0 =C2=A0 pool_unref(&amp;pool);<br>
++=C2=A0 =C2=A0 =C2=A0 test_end();<br>
++}<br>
++<br>
+ static void test_message_parser_continuing_mime_boundary(void)<br>
+ {<br>
+ static const char input_msg[] =3D<br>
+@@ -777,6 +822,7 @@ int main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_empty_multipart,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_duplicate_mime_boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_garbage_suffix_mime_boundary,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_message_parser_trai=
ling_dashes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_continuing_mime_boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_continuing_truncated_mime_boundary,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_message_parser=
_long_mime_boundary,<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-=
Fix-parse_too_many_nested_mime_parts.patch b/meta-networking/recipes-suppor=
t/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch<=
br>
new file mode 100644<br>
index 000000000..97068345f<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-par=
se_too_many_nested_mime_parts.patch<br>
@@ -0,0 +1,32 @@<br>
+From f77a2b6c3ffe2ea96f4a4b05ec38dc9d53266ecb Mon Sep 17 00:00:00 2001<br>
+From: Timo Sirainen &lt;<a href=3D"mailto:timo.sirainen@open-xchange.com" =
target=3D"_blank">timo.sirainen@open-xchange.com</a>&gt;<br>
+Date: Wed, 27 May 2020 11:35:55 +0300<br>
+Subject: [PATCH 13/13] lib-mail: Fix parse_too_many_nested_mime_parts()<br=
>
+<br>
+This was originally correct, until it was &quot;optimized&quot; wrong and =
got merged.<br>
+---<br>
+ src/lib-mail/message-parser.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c=
<br>
+index 175d4b488..5b11772ff 100644<br>
+--- a/src/lib-mail/message-parser.c<br>
++++ b/src/lib-mail/message-parser.c<br>
+@@ -621,7 +621,7 @@ static bool block_is_at_eoh(const struct message_block=
 *block)<br>
+ <br>
+ static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *c=
tx)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 return ctx-&gt;nested_parts_count &gt; ctx-&gt;max_n=
ested_mime_parts;<br>
++=C2=A0 =C2=A0 =C2=A0 return ctx-&gt;nested_parts_count+1 &gt;=3D ctx-&gt;=
max_nested_mime_parts;<br>
+ }<br>
+ <br>
+ #define MUTEX_FLAGS \<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fi=
x.patch b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.p=
atch<br>
new file mode 100644<br>
index 000000000..44f6564f8<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch=
<br>
@@ -0,0 +1,27 @@<br>
+From 1a6ff0beebf0ab0c71081eaff1d5d7fd26015a94 Mon Sep 17 00:00:00 2001<br>
+From: Josef &#39;Jeff&#39; Sipek &lt;<a href=3D"mailto:jeff.sipek@dovecot.=
fi" target=3D"_blank">jeff.sipek@dovecot.fi</a>&gt;<br>
+Date: Tue, 19 Sep 2017 13:26:57 +0300<br>
+Subject: [PATCH] lib: buffer_free(NULL) should be a no-op<br>
+<br>
+---<br>
+ src/lib/buffer.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
+<br>
+CVE: CVE-2020-12100<br>
+Upstream-Status: Backport [<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz" rel=3D"noreferr=
er" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/=
dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+--- a/src/lib/buffer.c<br>
++++ b/src/lib/buffer.c<br>
+@@ -148,6 +148,9 @@ void buffer_free(buffer_t **_buf)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct real_buffer *buf =3D (struct real_buffer=
 *)*_buf;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if (buf =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*_buf =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf-&gt;alloced)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p_free(buf-&gt;pool=
, buf-&gt;w_buffer);<br>
diff --git a/meta-networking/recipes-support/dovecot/<a href=3D"http://dove=
cot_2.2.36.4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2.36.4.bb</=
a> b/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.2.=
36.4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2.36.4.bb</a><br>
index e21a94ad6..407604c81 100644<br>
--- a/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.2=
.36.4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2.36.4.bb</a><br>
+++ b/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.2=
.36.4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.2.36.4.bb</a><br>
@@ -10,6 +10,20 @@ SRC_URI =3D &quot;<a href=3D"http://dovecot.org/releases=
/2.2/dovecot-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://=
dovecot.org/releases/2.2/dovecot-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dovecot.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dovecot.socket \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-doveadm-Fix-parallel-=
build.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lib-mail-message-pars=
er-Add-a-message_part_finish-he.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-lib-mail-message-pars=
er-Change-message_part_append-t.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-lib-mail-message-pars=
er-Optimize-updating-children_c.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-lib-mail-message-pars=
er-Optimize-appending-new-part-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-lib-mail-message-pars=
er-Minor-code-cleanup-to-findin.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-lib-mail-message-pars=
er-Truncate-excessively-long-MI.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-lib-mail-message-pars=
er-Optimize-boundary-lookups-wh.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-lib-mail-message-pars=
er-Add-boundary_remove_until-he.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-lib-mail-message-pars=
er-Don-t-use-memory-pool-for-pa.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-lib-mail-message-pars=
er-Support-limiting-max-number-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-lib-mail-message-pars=
er-Support-limiting-max-number-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-lib-mail-Fix-handling=
-trailing-in-MIME-boundaries.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-lib-mail-Fix-parse_to=
o_many_nested_mime_parts.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://buffer_free_fix.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;66c4d71858b214afee5b390ee602dee2&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--0000000000004bd71e05d1ea8b47--

