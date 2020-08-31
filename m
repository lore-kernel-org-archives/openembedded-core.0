Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.59201.1598896845311043589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 11:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kjJdsdpP;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id i13so215155pjv.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0k9EDrxgohsS6IUb7Kgt16Z4oEoV2HmYn3ubUzwfKUs=;
        b=kjJdsdpPEi4kIEnCwg9PzEO/XenBVVTtTyjhDYhEeYq1CNUtADF7ISZoPzVLc1A/89
         YhYtrZQFO7gYxGJDoZAqxLx8kFXN1S8nz35vBhlQPlP+IycUX2LgkQhcB/I3fWpGi2HH
         RY7uKEfSrsaWgHMRtcqjaxPqa6N1qSR2X0yJu003KpKHE8svSCYjVoTi1j0xKlcUmdDV
         72be3qbaJ/I/9OZAXlp6/1ffo3WtyM4U3hduHH+LuU0o3Zk5ByPiLg2DsGCfrGbMGVEO
         GUsHw7RH+lSnRGLR9IieDYaRXHOi2+qqxX3/gXix6zrctFJbNET6oGG/YGEWaYhQnMze
         ncEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0k9EDrxgohsS6IUb7Kgt16Z4oEoV2HmYn3ubUzwfKUs=;
        b=rGbh8/j4Vo4S8CuHTci4O8tUe0qkQdhbcZrpLq65NVck9zKyAee6ro7ZKrwGOicvDc
         jelA7seFVNAabGE4+GTztyOtL5Yj56P883PWqjVdqJql67Gfys2OOa/EJBN91pHsLT9P
         RtVqarsL/4zY9a0XmmcHF3iE4PEF+yW9Iu9s28HnBhxK0nuL4oV52ZRWDB6m6bk2nKyA
         rl4z2VotlOql8YD5MflWnTnyharLlcKeVBMKUyU2KnacZ+yZQkk0T1z01whe//J5zopb
         EEhKQjA1FWplssKbEJ9kQvLi0kD8F4NrVMoZl8oIJYJb4utTzpbo3SMuIG5h8UFhCChJ
         IzBw==
X-Gm-Message-State: AOAM531z1Sm4KCE9kgslfys8mEHjpx36HEwf/gZdCxkchB+LjXFkdRn4
	B2YtO8vny/67+DNzig+r7PjzbC6YoQdTMQ==
X-Google-Smtp-Source: ABdhPJypfscQhi/QECc/Bu2DA6jiDVRWAOLmjS/ZVxbImgo2RHYtqSla/8B12aVh+BTZwImBk6UEbg==
X-Received: by 2002:a17:90a:1910:: with SMTP id 16mr488868pjg.76.1598896844477;
        Mon, 31 Aug 2020 11:00:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id o2sm248180pjh.4.2020.08.31.11.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 11:00:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] util-linux: Allow update alternatives for mcookie/prlimit
Date: Mon, 31 Aug 2020 11:00:42 -0700
Message-Id: <20200831180042.2853986-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcookie is also provided by toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also create symlink for prlimit

 meta/recipes-core/util-linux/util-linux_2.36.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 2fac9793a2..841fa25378 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -263,12 +263,14 @@ ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[mcookie] = "${bindir}/mcookie"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[prlimit] = "${bindir}/prlimit"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
-- 
2.28.0

