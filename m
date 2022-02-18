Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA44C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.8980.1645178816400828413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NL2UF8US;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso5697334wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3qgG2TJbz4+zRjJ/q2pcnwCRKNp1mcqdJ7n8NXjmdZU=;
        b=NL2UF8USCfvhw7SUprhvYcjNiawfItll3PCKnW+LOLzuojVIaNKjhN44w+erDBtAFt
         tFpIhNMT3fM0/yGu+ASeWtdeblizJz4XILda4vn8W1LPX13tCgpdB49d93ylbBE3HowW
         26hm2HLIqzhxXHDKmd8Ja7nH6Ylzb6on5kFVELpzda5EODHtSNbLgMSOUij5I7TJHGi7
         +DyzSB8HdXUoRdZyuylS4QEAdU7H2yJrtqlxGMzSH7klWtbVX8ZtoeP4R4D81k72oYU2
         46/OMZl4gmtUeIstylgTO5Lk+5gpXVFn6RRMNbHCEhb3IdJMTej7AQwVe0p9PIqmvOWN
         ZEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3qgG2TJbz4+zRjJ/q2pcnwCRKNp1mcqdJ7n8NXjmdZU=;
        b=2bUHlTG3dQp8ANOWheIrGYNKu/ZuAQR+Be4Jq3YzPwL2gyQn9lDr3f7uplHOlCIBVz
         F6KHHP+JIdiLY6hd0gPYzLzwUxMGn+NY12nIbPtZCll59gQIN6teF4S55//2EhAI+E2o
         OP58k3mU940VYbsclymtMTIe1+olGXLEu0QSLrTs3OztipFc/1mVlDyp1Y9kjtbG7fSC
         Ci00Pcjw0bcJ+RxjI0xNGdEl4ny7NH4bypdQAshE+GfA/ds/FxQa0Z8JwyXjUo7//wy+
         ROMP27hjo30M/MyW1AcOUnb691/l0xIdwg1H+Pweo6Ve9NF1ULAAjV+tiat8cHAqL00/
         dJ9w==
X-Gm-Message-State: AOAM530PqO0zTMYRwfzMMRWXIWufeJ6SFrBEvp94oIguU10T13YILV8R
	6IJMvOB31FG2YxIJQmhQpDE=
X-Google-Smtp-Source: 
 ABdhPJxx/NjvLANP2nOXMMWOez0RTUYpjImQTnCOSJl+oYqdsH7iQaclpndZyJxbPnFQViUUrBBNmA==
X-Received: by 2002:a1c:7918:0:b0:37b:fab4:9b1 with SMTP id
 l24-20020a1c7918000000b0037bfab409b1mr9852648wme.40.1645178814984;
        Fri, 18 Feb 2022 02:06:54 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:54 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 36/46][dunfell] grub: remove dead code
Date: Fri, 18 Feb 2022 11:05:44 +0100
Message-Id: <20220218100554.1315511-37-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161924

This patch removes dead code from grub's gfxmenu/gui_list. It is
a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


