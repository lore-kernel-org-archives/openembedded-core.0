Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.1248.1604335813603771682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nnnX5yNP;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id o18so15058061edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lOBRyADbU35y6fnNbV/CcPglijNW4/6INYyf8PgFglg=;
        b=nnnX5yNPvcVEmoAgwKCegK70M+/qu6YanUn1Pt+oLF/1ANmi1nP3lKybmj/GhLsWHn
         6pz7hLzAsvQHbM2KUUOV1AFI99Zt6xil2Q09ITRrQTBpP4L8PLX0r7QSAkJzaRuL5Oka
         kzpOFih4tNTzHOpvGk9reWB2JJAgKxcMCd7Je9ObkDRAXhy77gKc2Bk8zLoJaXhAfDJp
         LnBTk+1VlpRpMoQ29k1QEu884flDfkKr5T/zfkhuPAvMYLuT6R8ffWDZkRF0f4lM61gf
         UlZzqy5HMyEzi4zX/o8opOoHMFnSHEU9SGzTVHkVFCCK+3EK9qpd0psJR5CqBW6nensI
         m+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lOBRyADbU35y6fnNbV/CcPglijNW4/6INYyf8PgFglg=;
        b=Yf4YDBvhUWlWv8jNppsZaKTm7JtthOon421EN5lm+nsjC9fJz9w2s7bBZocwE55LXD
         ggHRY4LTQRviz13LnYYgAlVldbO5ThwiLX7fhpSC/7TYxbNQx9zyiG/wSoqLC09zRnCE
         2OxNlE30VshQ0UPayM1gnhSdiNwl3sstoBEay6k/xrLO3XlDK+qU7u3MUhs2gpG6Xw69
         GOAvsF+4yMDUyLIO9oM1u3luCqO9Rp+KkV8xYeg+tH25u2FOw3h/MNI1+M64MFSCkreR
         9kicL1Un8fdlYxvxui4kwu4Mu/zcYYgHSRTu2NJYE3Bz9zhQasPYMftDa6lrqYKg+Fof
         OpIg==
X-Gm-Message-State: AOAM5314Z9e5oUspUg2O1OV34wtICRWsaVm0BPeZ2GQOa8qrPacjTpLx
	9gtK/qe4Qd6V9lMICD2l8lDAios4VdgzRg==
X-Google-Smtp-Source: ABdhPJwq9p8SxkKw4ul+HlYj1lqn5NfOpnbgsU7ocOzB9NuvEOC6WqC8LQ4YVe3AOLDOiNi/Kup1IQ==
X-Received: by 2002:a50:baea:: with SMTP id x97mr17561350ede.81.1604335811842;
        Mon, 02 Nov 2020 08:50:11 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:11 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 61/80] iptables: upgrade 1.8.5 -> 1.8.6
Date: Mon,  2 Nov 2020 17:48:48 +0100
Message-Id: <20201102164907.27572-61-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...iptables-apply-not-getting-installed.patch | 45 -------------------
 .../{iptables_1.8.5.bb => iptables_1.8.6.bb}  |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0001-build-resolve-iptables-apply-not-getting-installed.patch
 rename meta/recipes-extended/iptables/{iptables_1.8.5.bb => iptables_1.8.6.bb} (95%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-build-resolve-iptables-apply-not-getting-installed.patch b/meta/recipes-extended/iptables/iptables/0001-build-resolve-iptables-apply-not-getting-installed.patch
deleted file mode 100644
index 51ed66ed24..0000000000
--- a/meta/recipes-extended/iptables/iptables/0001-build-resolve-iptables-apply-not-getting-installed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d4ed0c741fc789bb09d977d74d30875fdd50d08b Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Wed, 3 Jun 2020 15:38:48 +0200
-Subject: [PATCH] build: resolve iptables-apply not getting installed
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-ip6tables-apply gets installed but iptables-apply does not.
-That is wrong.
-
-» make install DESTDIR=$PWD/r
-» find r -name "*app*"
-r/usr/local/sbin/ip6tables-apply
-r/usr/local/share/man/man8/iptables-apply.8
-r/usr/local/share/man/man8/ip6tables-apply.8
-
-Fixes: v1.8.5~87
-Signed-off-by: Jan Engelhardt <jengelh@inai.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
-[https://git.netfilter.org/iptables/commit/?id=d4ed0c741fc789bb09d977d74d30875fdd50d08b]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- iptables/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iptables/Makefile.am b/iptables/Makefile.am
-index dc66b3cc..2024dbf5 100644
---- a/iptables/Makefile.am
-+++ b/iptables/Makefile.am
-@@ -56,7 +56,7 @@ man_MANS         = iptables.8 iptables-restore.8 iptables-save.8 \
-                    ip6tables-save.8 iptables-extensions.8 \
-                    iptables-apply.8 ip6tables-apply.8
- 
--sbin_SCRIPT      = iptables-apply
-+sbin_SCRIPTS     = iptables-apply
- 
- if ENABLE_NFTABLES
- man_MANS	+= xtables-nft.8 xtables-translate.8 xtables-legacy.8 \
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/iptables/iptables_1.8.5.bb b/meta/recipes-extended/iptables/iptables_1.8.6.bb
similarity index 95%
rename from meta/recipes-extended/iptables/iptables_1.8.5.bb
rename to meta/recipes-extended/iptables/iptables_1.8.6.bb
index 5976128807..9c15b0bc9d 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.5.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.6.bb
@@ -11,13 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
-           file://0001-build-resolve-iptables-apply-not-getting-installed.patch \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
            file://ip6tables.rules \
-"
-SRC_URI[sha256sum] = "d457d74512e63aa3f50336e0597d4023c0e3c6845594d38532efb6ebcb294309"
+           "
+SRC_URI[sha256sum] = "a0f4fe0c3eb8faa5bd9c8376d132f340b9558e750c91deb2d5028aa3d0047767"
 
 SYSTEMD_SERVICE_${PN} = "\
     iptables.service \
-- 
2.29.0

