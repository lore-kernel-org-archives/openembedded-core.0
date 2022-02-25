Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819A1C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.6930.1645799299884985686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lR1wYcI/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 12so4836695pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zu2Ug7485p6yVcpFNr1vpMeeNEJD7vek6QWvEcSiRUc=;
        b=lR1wYcI/wRB5g2Gnfqv2g2vAeJ7jM6Brm+6quAQE/NvHbpeRRv/Pf8be6QWfgXgUXj
         2Mt7mdx4qte5bANABYP8jpSV1SYegrzM8iL3WwvJrnfiDTt29Jg+nh4iBvMtoBmw+YAo
         UvQA51l+h5Pjn2yy7CmUqoDkzyCgcKczkne6A7Pvpvq35QaMH24V0zHfnjzL9MCbZdcU
         80nl5eyMJP0sfM4U7iCUrPjke8kpSNpHNdge1WVr5AKY0aso5yKYuBrf44/MEDPWMVLP
         kWiqPAVNh6nfBLApK5MLBIFEzTrGj1E9rJ5+ulGx3ocqMHyQOgw5RFjbCuRor8WLfRzp
         5mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zu2Ug7485p6yVcpFNr1vpMeeNEJD7vek6QWvEcSiRUc=;
        b=q/TnVTc84/3KyL297SxgxbLs/A6KzqqyHRtDj8CqIYrypuNJqAMVo4CFblFliobTXJ
         49ClMYt0yAuW6C6ZGVwTewANUloGkeMD6H+5/TN7IYflLo0SAqhh+aXjW42n6JxAdccK
         yLKuTZsZcFe2XNYfXgkQS1sCWGVu6yEKYSnMqvVdY4F5JXQxHlchtsVYnKxJWxDLLlyX
         2vN+yvaBfJ4TDZptylmctHXmXbpaXag/M/LSVL3BitfDL7/ByO05k9I2VvqGxhggyVKa
         9PlAHDlP0AOsZPiGggTcmvxP8OnH1JoIEem+CuQOXtrBU8YpXXJ0zAAiLuuYwDrrKn7q
         Q9Tg==
X-Gm-Message-State: AOAM530EbKqW/rRDMNZeC+2O0pKWVq5JRfvFWVvW+imcoXf1Wpy8pNcg
	kKLZAEtucFqPzagHlGlnx0/IVbs1B3G91wHo
X-Google-Smtp-Source: 
 ABdhPJzdk8bjgKOf/SwLsO09nJ5X3tc98HEdl/w0qQ5Zostnp1RcriRQAK4OaRY0CvQEq03SdmBT7g==
X-Received: by 2002:a63:2b4d:0:b0:36c:7c39:b66c with SMTP id
 r74-20020a632b4d000000b0036c7c39b66cmr6377389pgr.583.1645799298952;
        Fri, 25 Feb 2022 06:28:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 40/50] grub: remove dead code
Date: Fri, 25 Feb 2022 04:26:20 -1000
Message-Id: 
 <0319465b022e211f2a98ba5cee13a68818f5cf87.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162386

From: Marta Rybczynska <rybczynska@gmail.com>

This patch removes dead code from grub's gfxmenu/gui_list. It is
a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Remove-code-that-coverity-is-flaggi.patch | 34 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch

diff --git a/meta/recipes-bsp/grub/files/0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch b/meta/recipes-bsp/grub/files/0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch
new file mode 100644
index 0000000000..61e5e5797d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch
@@ -0,0 +1,34 @@
+From 9433cb3a37c03f22c2fa769121f1f509fd031ae9 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Mon, 7 Dec 2020 14:44:47 +0000
+Subject: [PATCH] gfxmenu/gui_list: Remove code that coverity is flagging as
+ dead
+
+The test of value for NULL before calling grub_strdup() is not required,
+since the if condition prior to this has already tested for value being
+NULL and cannot reach this code if it is.
+
+Fixes: CID 73659
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=4a1aa5917595650efbd46b581368c470ebee42ab]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/gfxmenu/gui_list.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/gfxmenu/gui_list.c b/grub-core/gfxmenu/gui_list.c
+index 01477cd..df334a6 100644
+--- a/grub-core/gfxmenu/gui_list.c
++++ b/grub-core/gfxmenu/gui_list.c
+@@ -771,7 +771,7 @@ list_set_property (void *vself, const char *name, const char *value)
+         {
+           self->need_to_recreate_boxes = 1;
+           grub_free (self->selected_item_box_pattern);
+-          self->selected_item_box_pattern = value ? grub_strdup (value) : 0;
++          self->selected_item_box_pattern = grub_strdup (value);
+           self->selected_item_box_pattern_inherit = 0;
+         }
+     }
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 75782b7eb2..1a4be33fca 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -82,6 +82,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch \
            file://0034-video-fb-video_fb-Fix-possible-integer-overflow.patch \
            file://0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch \
+           file://0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


