Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.20280.1607112471989632131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AZYHls29;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id x16so10435552ejj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/j37pJ+Hbq8BMY8sAU3nDfGvdTvFDfhGKdaDQlv575M=;
        b=AZYHls29ZCVAL6Ci8Z1OlDfdImAwq2uGbtdYd+tHVvGy0JhMQnWg6H8+7JWh1vxPb9
         BosWef7t72eFl483yg4EtFeJo5amyImhtQKzBcYeHE+lu/N+DR0Ze9g0nHJIDHrEN6ei
         oOXvsUoEr8CbQPddzbnAWE2/fnPHFvMDM3S4ltAkrnvWSdnQCEorYXJyYZ9zFyRQcutZ
         uwedmCG8tUBveN/uaKd6RMqXwNDFd57Zy+ztvkCQHlHaOJt76S/aqnV9ff0SBjCt4gWa
         05IvTTgpXAnZgjLxneuxMOQ9ku2Lk6NoPS7NNL/lXeaa7UCIgIs9urobwT4PZF18NO/Y
         9F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/j37pJ+Hbq8BMY8sAU3nDfGvdTvFDfhGKdaDQlv575M=;
        b=tqnLwu+yc3hVEP4m22d/mhTCpBTp6vXfkR6yx2kLD3Qw33yhigS8vhaCwAI1d9yGFH
         MhvdhIhxkGekJfhn92AYbU8nIybdBF8PLdZz5uxyPvK7WMYH+w9YPHGN4b0xHWuMUDrq
         wZmA7wWV8Pm8Q9IQJNcXhTig4VXMPjH0Xia+ldpeSBTJtOmUJcqw6/DzIj3cvGLpOdJ5
         pUG93HHZ/ZTeud4PgZ5sE9JGhXqWw058ZJJKULUO1bZo75qs85FIsduUSlsp1VffZbkJ
         P7mmlEoLvxzqpamQZnmWDjtsBqfcOZr8kwRvwBfzwPST9BRQwgnXTIppwpBzEy+PVHu5
         JTpg==
X-Gm-Message-State: AOAM531+aAuKFThcZ/7vNXxnlO7Mgj41KBIlyTnTi/5+NeUY32/aVTK0
	Wlw3fwekADyslZ24ceT6WnmlHAQqtAdvdA==
X-Google-Smtp-Source: ABdhPJzgTAYS1dKIoiEPr0hizUnp14pYFZOqo1zVRIYjcW9R7inbQ8p2XNoKSfB4uNN1AcEzonbryg==
X-Received: by 2002:a17:906:3ad5:: with SMTP id z21mr8525675ejd.35.1607112470265;
        Fri, 04 Dec 2020 12:07:50 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/23] quota: upgrade 4.05 -> 4.06
Date: Fri,  4 Dec 2020 21:07:19 +0100
Message-Id: <20201204200737.7072-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-realloc-3-instead-of-reallocarray-3.patch | 34 +++++++++++++++++++
 .../quota/{quota_4.05.bb => quota_4.06.bb}    |  4 +--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
 rename meta/recipes-extended/quota/{quota_4.05.bb => quota_4.06.bb} (89%)

diff --git a/meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch b/meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
new file mode 100644
index 0000000000..34ded2d857
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
@@ -0,0 +1,34 @@
+From 02b222a335527f1031cc9495d8c5ebc1bc5b1d4e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 11 Nov 2020 15:00:47 +0100
+Subject: [PATCH] quota: Use realloc(3) instead of reallocarray(3)
+
+reallocarray(3) has been added to glibc relatively recently (version
+2.26, from 2017) and apparently not all users run new enough glibc. Just
+use realloc(3) for now since in this case there's no real risk of
+overflow.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ quota.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/quota.c b/quota.c
+index a6ed61f..a60de12 100644
+--- a/quota.c
++++ b/quota.c
+@@ -385,7 +385,7 @@ int main(int argc, char **argv)
+ 			  break;
+ 		  case 259:
+ 			  fscount++;
+-			  fsnames = reallocarray(fsnames, fscount, sizeof(char *));
++			  fsnames = realloc(fsnames, fscount * sizeof(char *));
+ 			  if (!fsnames)
+ 				die(1, _("Not enough memory for filesystem names"));
+ 			  fsnames[fscount - 1] = optarg;
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/quota/quota_4.05.bb b/meta/recipes-extended/quota/quota_4.06.bb
similarity index 89%
rename from meta/recipes-extended/quota/quota_4.05.bb
rename to meta/recipes-extended/quota/quota_4.06.bb
index c5da1e71ed..19ccbd588a 100644
--- a/meta/recipes-extended/quota/quota_4.05.bb
+++ b/meta/recipes-extended/quota/quota_4.06.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
            file://fcntl.patch \
+           file://0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch \
           "
-SRC_URI[md5sum] = "1c1dbd2cd3d680ccac661239b067e147"
-SRC_URI[sha256sum] = "ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9"
+SRC_URI[sha256sum] = "2f3e03039f378d4f0d97acdb49daf581dcaad64d2e1ddf129495fd579fbd268d"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.29.2

