Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web08.597.1613772745283463872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 14:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=08D5gqa+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id r23so29601984ljh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 14:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=exezjWJGk4LPlZPQ3sE7U5Iy7Ni1wRsYpDoKr3w2fdk=;
        b=08D5gqa+sOFaH8gulqrXBngn5NdQVUTj7e/zrmqDxclMMSJw1kGo7T5cnYn0modYpM
         XwWEemAXxQpmVTNL+CaB8yKGE87XS1va1/11zSieo06yTszA8aEPTY9uQnbK53pl9qpD
         abCGAWrl/eGN6/bOMs6j1wXihqr50PQ+neQtGZDMCbCD1gTaAT+UraYUd7kMG9N2OHc5
         sMCgKpHnZKgt42BSrFQxgHNqNR6K4GHGpr7KdBPpdt4F3NdDf89wnCS+vPusezspvv0N
         SR7T3gALpDV1o9cywnvEsr4/p0I5oncAeCo0cUDX3wSGcBUQ9PxZ8lwyAlDg92mTagqA
         HF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=exezjWJGk4LPlZPQ3sE7U5Iy7Ni1wRsYpDoKr3w2fdk=;
        b=bn2iCjdDdqN2K8uPcUKKkAsLnTjsrSOsL906EmWeNTbemSyVXX+G0SnnTFeXnZMKIY
         URfQEyVjVItK44ZI0+URDUXJ/6hdWQoQ1lR8GAfTQrs1YsOwVrY69sdHE7CXEzLHyJdv
         RQG7ERk7aqpGFEmlmb6nVBK+g1mIxUB5/FyOa6yz7Qfm4BPxuEKulTh5UkGVjldYeE5l
         b0/lWplx+FHGl7YLeXkYxm50r6w4H8fq6lAHCk5oI0SA9GDvCjejldgiuFcdNbv/y2mo
         UCm3YFwzfOMbBfJeuZf6sOdRadv5/7hi3AhtxH5EwOnSQr3PaIB7biZiyrfgnyr9bFfr
         cq8A==
X-Gm-Message-State: AOAM5329WJ0FRfj+nNB1cHVz7BVCx6OhEZujKehvZmjVkz7V4w4vxckz
	Gl0rfcvT/7yq9qUtsnlDszDB12seTuRKNzIE
X-Google-Smtp-Source: ABdhPJwDG+GZYeG0PlOT1jS2g0IZ8rgCHtt+/zQh+SaP1S3/bEVRF0uJyDr1HYbv1HdH89Vs/eflVA==
X-Received: by 2002:a19:2344:: with SMTP id j65mr7053727lfj.38.1613772742878;
        Fri, 19 Feb 2021 14:12:22 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id g9sm336296ljl.57.2021.02.19.14.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 14:12:22 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] net-tools: update to 2.10
Date: Fri, 19 Feb 2021 23:12:20 +0100
Message-Id: <20210219221220.2392609-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed upstreamed patches.

Added new package configs.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...075-ifconfig.c-pointtopoint_spelling.patch | 26 -------------------
 .../Bug_541172-netstat.c-exit-codes.patch     | 22 ----------------
 ...ols_1.60-20181103.bb => net-tools_2.10.bb} |  9 +++----
 3 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
 rename meta/recipes-extended/net-tools/{net-tools_1.60-20181103.bb => net-tools_2.10.bb} (94%)

diff --git a/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch b/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
deleted file mode 100644
index 74d74668ce..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Description: Accept "pointtopoint" as a synonym for "pointopoint"
-Bug-Debian: https://bugs.debian.org/443075
-Author: Justin Pryzby <pryzbyj@libra>
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/ifconfig.c
-+++ b/ifconfig.c
-@@ -644,14 +644,14 @@
- 	    spp++;
- 	    continue;
- 	}
--	if (!strcmp(*spp, "-pointopoint")) {
-+	if (!strcmp(*spp, "-pointopoint") || !strcmp(*spp, "-pointtopoint")) {
- 	    goterr |= clr_flag(ifr.ifr_name, IFF_POINTOPOINT);
- 	    spp++;
- 	    if (test_flag(ifr.ifr_name, IFF_POINTOPOINT) > 0)
- 	    	fprintf(stderr, _("Warning: Interface %s still in POINTOPOINT mode.\n"), ifr.ifr_name);
- 	    continue;
- 	}
--	if (!strcmp(*spp, "pointopoint")) {
-+	if (!strcmp(*spp, "pointopoint") || !strcmp(*spp, "pointtopoint")) {
- 	    if (*(spp + 1) != NULL) {
- 		spp++;
- 		safe_strncpy(host, *spp, (sizeof host));
diff --git a/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch b/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
deleted file mode 100644
index 782b94bc61..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Description: Bug#541172: netstat.c exit codes
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/netstat.c
-+++ b/netstat.c
-@@ -2237,12 +2237,14 @@
-             parsesnmp(flag_raw, flag_tcp, flag_udp, flag_sctp);
- #else
-             ENOSUPP("netstat", "AF INET");
-+            exit(1);
- #endif
-         } else if(!strcmp(afname, "inet6")) {
- #if HAVE_AFINET6
-             parsesnmp6(flag_raw, flag_tcp, flag_udp);
- #else
-             ENOSUPP("netstat", "AF INET6");
-+            exit(1);
- #endif
-         } else {
-           printf(_("netstat: No statistics support for specified address family: %s\n"), afname);
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
similarity index 94%
rename from meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
rename to meta/recipes-extended/net-tools/net-tools_2.10.bb
index e163a6948a..de4a715971 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -6,14 +6,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
-PV = "1.60-20181103+git${SRCPV}"
-SRCREV = "0eebece8c964e3cfa8a018f42b2e7e751a7009a0"
+SRCREV = "80d7b95067f1f22fece9537dea6dff53081f4886"
 SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
-    file://Bug_443075-ifconfig.c-pointtopoint_spelling.patch \
-    file://Bug_541172-netstat.c-exit-codes.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -28,6 +25,8 @@ PACKAGECONFIG[hostname] = ""
 PACKAGECONFIG[arp] = ""
 PACKAGECONFIG[serial] = ""
 PACKAGECONFIG[plip] = ""
+PACKAGECONFIG[slattach] = ""
+PACKAGECONFIG[plipconfig] = ""
 
 do_configure() {
 	# net-tools has its own config mechanism requiring "make config"
@@ -119,4 +118,4 @@ ALTERNATIVE_${PN}-mii-tool = "mii-tool"
 ALTERNATIVE_TARGET[mii-tool] = "${base_sbindir}/mii-tool"
 ALTERNATIVE_LINK_NAME[mii-tool] = "${base_sbindir}/mii-tool"
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

