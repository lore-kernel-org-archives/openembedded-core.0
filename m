Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0524EF99349
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:36:29 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14457.1776929780372752448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JCYOtH8R;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso3114494f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776929779; x=1777534579; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pujdc0HFow9kZ8BjnrNeqqUTFECrBnuvvQXRWoKe+5Q=;
        b=JCYOtH8RF6/86NMj8bxMwjYvxaRp4G1WhSNGjMTU3TBChKyBodOE886DnvYjDyti/H
         f/eBfvxcKaxnqXAUV+UfDhwr9V1qWPzIdDx7w+nkKHNBrtGZPTLDL7nQPG19rP4ioGfN
         5mJycU+UIHtdLFTFwVbQWb9If+y+4+khgQ/Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776929779; x=1777534579;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pujdc0HFow9kZ8BjnrNeqqUTFECrBnuvvQXRWoKe+5Q=;
        b=A4hOAN+NXiBw9ZpHT0QsCvVjL3GwsAA6OnLw+khobL1cMll42taVeYrLsg5O7qXkX2
         /AVyNh2unk8uvTdoLGokH7F0f/CCiKrnMBlpl2xbYSXd8s9cVuLz0USCXAyzJk2ifmn6
         sR6AiN8Lgx/TRzjrGspIoFv7IZ8YlFZQVAc2UWKSk2SmOER8C1R2nwTtqOKeQpog+iuO
         qmCXJ5pm/dmVduPkiJsBqXukl+f1dyNCDvTjQxO9IIMhDXt7NEts7xvr/1D3e1a6tdpb
         nOSYGxexmQs6u18IJSHLxAD+dk4jHB2hbeohYj/GehimBydusu9vwlJIv+cq7xVukt3w
         tksQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EnhrzSrUih8dRGAVcKbWsPuWGuJ6d5ZUOrXL8RRq0eFZ4pE9ybfw/RXhoYA09nu5uJCB2JLT7qdc/zZJLJfjIVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdwG7Izgwt7XZAjDZlTznyPVbbXq9RTcdujeZp04wMYpssmam3
	H9andnKfLaclGAqngL+AxT9O45KgENlYzTVkodWCdcaIf7ZMsCXdYGzAXwl+3HUGRds=
X-Gm-Gg: AeBDieu9fvb5/Hh4DpuJ/BhkTub5Oj0ntk9Gb0d/Q18d3rGs1kU1onD8xRh2Vmzwdot
	9Z2EUISFvWQ4ekRWTwQis6pRYsbaL/uB6CbqUs01CPBCxjUQlqrbBeKNDUZ2tSE4EqT/C39Fz4u
	s9BkviKBwzIuIbrL0URRfuHd1usf5xL8sJCfrqhmy6Ut6FtPBGbXbuwe1QjI9wLXRlZZ/zq+Own
	z/GiSrd9KSZYHROUmQKv6jgnvlD03JE1h0Lv/sBXCbUvW+xYtzl/pxk5UWp8jzoksuXHBqi0aSG
	/gsXfMqGyHQ60bg/1eSFXeHmVbgwH+SLJBrAutxK9zE0QViRJ4t/mlb0meBqBBEGP7+ORjB5tVi
	m5SUgTLvXBg/qmA/xZIXXigGpIum2M8hXubyNiL2dnJ9a7mdrb/86wcX3229LTPcnsuamCg/8up
	q476n0qEJEKDza/dRrMG1yaKJelubdvnmBt4lEeY733y2wbCihJkUrk6TyXYiAYfwC9moXLQXbs
	6RL64uE5OElowKAbw+ScPWNBQ==
X-Received: by 2002:a05:6000:18a3:b0:43c:f247:4792 with SMTP id ffacd0b85a97d-43fe3dc5c98mr38740829f8f.12.1776929778503;
        Thu, 23 Apr 2026 00:36:18 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm48830341f8f.31.2026.04.23.00.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:36:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 09:36:17 +0200
Message-Id: <DI0D1AFMURTB.318ISRG49BOEQ@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] systemd: backport patch to fix
 journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "sureshha" <suresh.ha@bmwtechworks.in>
To: <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260330110508.1013370-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260330110508.1013370-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235748

On Mon Mar 30, 2026 at 1:05 PM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: sureshha <suresh.ha@bmwtechworks.in>
>
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files
>
> Extracted from systemd MR:
> https://github.com/systemd/systemd/pull/40378
>
> Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> ---

Hello,

Looks to me that this patch is still needed on master. Can you send it
there?
Or, alternatively, wait for master to have systemd upgraded above
v260 and then, resend this backport request.

Thanks!

>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-t=
rigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0=
023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
> new file mode 100644
> index 0000000000..ad8f31261e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-=
assertion-on-removed-or-.patch
> @@ -0,0 +1,65 @@
> +From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Sun, 18 Jan 2026 19:15:31 +0900
> +Subject: [PATCH] journal-file: do not trigger assertion on removed or
> + corrupted journal file
> +
> +When a journal file is removed or corrupted, then the value `p`, which i=
s
> +read from Object.data.entry_offset, may be zero.
> +
> +Note, journal_file_move_to_object() checks the passed offset and return
> +-EBADMSG if it is invalid.
> +
> +Fixes the issue reported at
> +https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/112=
cbc37906fb97afe0ad04164262cf62d0af5e9]
> +
> +Comment: Patch is refreshed as per codebase of v255
> +
> +Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/s=
d-journal/journal-file.c
> +index 08f3b82..633de5b 100644
> +--- a/src/libsystemd/sd-journal/journal-file.c
> ++++ b/src/libsystemd/sd-journal/journal-file.c
> +@@ -3305,7 +3305,9 @@ use_extra:
> +
> + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t need=
le) {
> +         assert(f);
> +-        assert(p > 0);
> ++
> ++        if (p <=3D 0)
> ++                return -EBADMSG;
> +
> +         if (p =3D=3D needle)
> +                 return TEST_FOUND;
> +@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint=
64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, ui=
nt64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, u=
int64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +--
> +2.34.1
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 87e186bbfa..504d6cbef6 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.Se=
tNT.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://0023-journal-file-do-not-trigger-assertion-on-removed-=
or-.patch \
>             "
> =20
>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


