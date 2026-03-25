Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A9103A999
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:19 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13736.1774405213369439780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OaMBWJOD;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82a62714fe6so236082b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405212; x=1775010012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTBAga1YLw8pxrefzHKXmJQwkOQh+mROx71/k7UTpHo=;
        b=OaMBWJODSX+fS6+i9vO5CSdWvFzR0RdW7Roz5DVXkn5UDvwjj79kOf8klO8FFGfNbz
         U/F2Xg74V6y2Ny5m+qiCbnQNmq6VkhQGlHwH4hiw59z3x5XCtVKthDeEYZ6KT1VBqp5R
         9GUEvHmPtsu0vAGk3Imraz6mpYU2hg2cnZuVo3TvRgFuEvrBJetiZ+ApTHKfJb6o+3dJ
         Sbpcn02PwDO3jx2ZlbJWE2LrnGredr+khriXyAJMn4ESWqis4SSb3osLZHriUCeMew3H
         ZcLIymLICAY4KxPqAOvymwyTD00WWTZrA5rrrBazbttS8DFFi2RuOGe1twhvC8DA3eMv
         9OSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405212; x=1775010012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTBAga1YLw8pxrefzHKXmJQwkOQh+mROx71/k7UTpHo=;
        b=KcKG839Pz3Byh+Qy1wsGpZUmyQ/ypajMexPmk7P0JMbmfFqRl0bU+oBDampOt4jJTJ
         KFNcaa/jLYmpGkd4aDRHRyKAKi3wtnfYiJ+YrfaXZ7opIOcmjv7tH56ZgLG0d5D4iL44
         jsVu/HiytSoQ6JPeXs5ORm3kQOBX0hIwCUCFo+pkrw9EaSCppkHt2BNB7Wvk/ZhdKvY7
         iTOFIpcd1J6rV8euPJjtX2I3/MA/zQE2OnmIHNyGCfQeDsiSmYiUK9vEYoBj5szjaNRQ
         wCGgyWgQ4c8ne8zwjvzM2BeB1GeUs/EbNZEyCkHgEl0wt0Xreb4XT2tBTlK3JSP+6KYY
         hBeQ==
X-Gm-Message-State: AOJu0YzoqEH81C7CAKpr4yKo/qKx+XYRy/pD4pOne1ViLJ3EW5dsDcmr
	jIdvu+d81o8R/Tv0u+tTVmt3NlgCfetjoM33xaGv3ulR0/JSZhep3cUsR+hCWLdg
X-Gm-Gg: ATEYQzxCH5QjisSBU3GR1USyB2Np6GrAsr0f+Z83ZrcwbTgu5BPq24nak4FB4JRlV+Y
	4IC3LgZxLbG3P4+MITSbanl1f6Bc53qcxQZaceU/X+9kuHfq/YK0EIE/+c0fE7OFOFINaW3T2+N
	sf6gTFu53sSPN+VKVrp/J4oc15uLnddBIyALdDPH4cCWS2KALTh4mzXWAJSthp8VzZHRTgh2HSq
	ILdFhZKs+TiZT0tEjqe/6I5b0UxvAMdgli8QL0g2bsQr7XeQPRU4CUxYHAatnbqBR3uwwz2vI82
	AC+cbD8zZBdzO0PjFY53MoV4BuCDgpraUyStT8crmaoSG3vbjyBWjvYf3Q/NOhG5KxbcDfdWnSU
	Sb9aVRqx1clBN3qIUUNtpkkbd03PM+8LsIJEG6I16kwJVLmxs3I++BHD7ik1R6+OpYCplFHv5rr
	zsAYDB0xsl4yea755iACQMUPNCM2/Ak2klmzk=
X-Received: by 2002:a05:6a00:1c99:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82c5bee0632mr4715367b3a.23.1774405212548;
        Tue, 24 Mar 2026 19:20:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:20:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH 12/12] libinput: upgrade 1.29.1 -> 1.29.2
Date: Wed, 25 Mar 2026 15:18:56 +1300
Message-ID: <20260325021856.4053666-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233850

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.29.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4cd78e63cbf4edaeac1fc9f46fb737e1356e3f1b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.29.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.2.bb
index 809c291e23..f771085388 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
+SRCREV = "917783150a5bab7d55eedc5714f1b49b192426ac"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 

