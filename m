Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7F5C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2947.1742372186310096473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCOq1Su7;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22580c9ee0aso113634085ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372185; x=1742976985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXbSqvhVSsKvj7vj8l9HWrGMl70WPnCT0uvZi2+V6L4=;
        b=RCOq1Su7/YjCnTY8ZiKiMaOjB+k2gkF/OqPnteKkXqN/yMza/66TQnAx5Sq+9RoI/O
         +wZMcv9L3cgXC/rh+IyYBeTekcBBohzAFPte0yUHNJZn1XfO1YHb+PsicRiHtxUUEgDJ
         NSGRYIx5CvD2jjjcza75PFXzciVMyFd1yeKb/dW/QD4t7YjVOLW0lBBnb52apEzevdLg
         FDlON88njwjJ2JJWG5vhAV97i85ijL0Q7l2OX6sf5EHsk+A+W6iRQyDJuAhimNcO81ib
         rzjwpg1O5oguOShogzuCeNEeFKq55SAcz9X6wkNbwwFE75t9jhiS7NP0WfwrJ96alhMw
         uMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372185; x=1742976985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXbSqvhVSsKvj7vj8l9HWrGMl70WPnCT0uvZi2+V6L4=;
        b=g8mc+zzJk1fEQ9PqZgc2U6ediA7XXbp5GlHqLclZDUFb1Ss5u0SUQ8w+9ditsbRHGx
         jXLinEd1lgbV7wK8jRFSDroH5+G8n0ZZAkIgJvndXPbbHC4duqJrPfYDfPe4Z2DIX5P7
         bvM+lOl8NDhgVxI1FaMtIYsmJqdM0SJibsqxocZpdFD53rlj0Y0KxztHyWPx2gDQc4wW
         Rg2QAmsHv/mE633Rz/ZRJnP9clNWOwAZHF1uy/cWTuXsJZ/qEsyPxy+qGd9mbwtlVrAD
         7PxVilP1KdcCc5CGdFRvjm7rM74322hEW7QmiDgkQv4RlGxSYcB9mcFmYbZv+Iv2PcIW
         0VgA==
X-Gm-Message-State: AOJu0YwE4ifiOX+i2Qq6zPSRL/DgXCoOVv0UK1WJo2kwCEzT3iLXNfXn
	1Jl3NpQiJd0uRoHOJRnNxE/dHojKH5YdTgOTwDSfeifZpj6e1Zv2M1INPPXu
X-Gm-Gg: ASbGncto6GO6HvwEFDw7+LG1/wEC89NgILTPtNLIx40VX1j5pR//9TYy2/CcTf9Vxh4
	7Xp6SKEmjjRuSyG3PgOcdTcjBMNLj8hV70eqKoj+6/IZsc0wLkwbbhtWZjRIV+bHwz31W8ZXThd
	tAvPqtJO4hKoULzZdQ0LFAuvG3gJYx8N+vEIufWnBLdAdNvYHSzAqXPjrWtdY+V9ISb65cehmHM
	HAMjp8HQsX0aI5jg1PnLQaw8bNycfsK2FFIfUy0MDHbnR4URVVNCckbWMM+bM3zeMdzT2s+1Tbg
	c1ZDaNnEu9NzTW9OY/LrqYDGrKlt909i6jA3fXD078uQ5zc=
X-Google-Smtp-Source: AGHT+IGCjnje/a+SwDiamRbw18L2ARNAWTW+ADzVlNuriaxLZ7t/ZFKi+hZ+3DnhbnyLO10nDAAMtQ==
X-Received: by 2002:a17:902:ea07:b0:220:fb23:48df with SMTP id d9443c01a7336-22649caa9ebmr24588825ad.36.1742372185473;
        Wed, 19 Mar 2025 01:16:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 13/25] dbus-glib: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:42 -0700
Message-ID: <20250319081610.3536475-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213280

GCC 15 defaults to C23, it can not handle it
latest release is from 2021, and this seems to be
deprecated upstream and no longer actively
developed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib_0.112.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 4753997d3d2..33675f50fd8 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF:class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 
+CFLAGS += "-std=gnu17"
+
 PACKAGES += "${PN}-tests"
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS}"

