Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.3347.1594933695383546844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WxO2rjPd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id f18so8634779wrs.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AU5fqMENg5wLOHtuvUmGSCuUxz/jHxqXBRwN2j/I4Tw=;
        b=WxO2rjPdn9TPu0igzA2Ufz/TOB7lpHhHcykwtyFwEvSpu3gweA1QuynPNqlWXuu6X0
         Dx53G0vfzvoGbWFvybsWOTWXxOWXqp46IXQpUHmvVKHqq2szbPoZe5vWT0bmfyepIynM
         7CBWBKVB6sXU5d6BZt/G7eIwGGy3nRWH3ht2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AU5fqMENg5wLOHtuvUmGSCuUxz/jHxqXBRwN2j/I4Tw=;
        b=nDLYwLi+/cUwQv3sT8X6pCOaKhJ6ghbbVv2Fi68ybxI3p6xUNZOET8skf5omN8QNux
         bYTd+w/Btf18rlCwQVOt9HhgNn/+HMNPP2JpprQI5pMRwo75qsW0d5gTanBeZM9bwvVv
         mhMExx06Gocej/Zng5ouzFfyY2gYgGrkiT0/mY9Gp2V8kiqT8c3OBMEeAGQ5NC5Je0S7
         Q1lx4RP5KEQjXt7pdV2gjwqujbXXebFdYvVBn6NXqChLAJcsbILHpFFylX5a0A2ogyE4
         YfJ5493WFR9x0DoEKpxzm0Hd+ehhbwG4q+UHAN4YzXgQ8MeFA1/TFesu+BBPlwuxAzMP
         pH5w==
X-Gm-Message-State: AOAM531uexNKWW6K1VnA336BmzlWa7teaTL1AAaQpSHpanNB0/kQU9a4
	+LBsOU2HcW8BF5U4YpzssFxR4K4PnTJwkQ==
X-Google-Smtp-Source: ABdhPJzmgYnq5VaFGrcvxH/xJwEUJNl+f6tvQ4whR/GQRbNHMLZHJlDcVBvAq/SNgy/red1NPyEp6A==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr7111293wrq.357.1594933693556;
        Thu, 16 Jul 2020 14:08:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/20] mtd-utils: upgrade 2.1.1 -> 2.1.2
Date: Thu, 16 Jul 2020 22:07:53 +0100
Message-Id: <20200716210808.7438-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backported patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-utils-Fix-return-value-of-ubiformat.patch | 62 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  7 +--
 2 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
deleted file mode 100644
index d43f7e1a7a0..00000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4d19bffcfd66e25d3ee74536ae2d2da7ad52e8e2 Mon Sep 17 00:00:00 2001
-From: Barry Grussling <barry@grussling.com>
-Date: Sun, 12 Jan 2020 12:33:32 -0800
-Subject: [PATCH] mtd-utils: Fix return value of ubiformat
-Organization: O.S. Systems Software LTDA.
-
-This changeset fixes a feature regression in ubiformat.  Older versions of
-ubiformat, when invoked with a flash-image, would return 0 in the case no error
-was encountered.  Upon upgrading to latest, it was discovered that ubiformat
-returned 255 even without encountering an error condition.
-
-This changeset corrects the above issue and causes ubiformat, when given an
-image file, to return 0 when no errors are detected.
-
-Tested by running through my loading scripts and verifying ubiformat returned
-0.
-
-Upstream-Status: Backport [2.1.2]
-
-Signed-off-by: Barry Grussling <barry@grussling.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- ubi-utils/ubiformat.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
-index a90627c..5377b12 100644
---- a/ubi-utils/ubiformat.c
-+++ b/ubi-utils/ubiformat.c
-@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	struct ubi_vtbl_record *vtbl;
- 	int eb1 = -1, eb2 = -1;
- 	long long ec1 = -1, ec2 = -1;
-+	int ret = -1;
- 
- 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
- 	write_size /= mtd->subpage_size;
-@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	if (!args.quiet && !args.verbose)
- 		printf("\n");
- 
--	if (novtbl)
-+	if (novtbl) {
-+		ret = 0;
- 		goto out_free;
-+	}
- 
- 	if (eb1 == -1 || eb2 == -1) {
- 		errmsg("no eraseblocks for volume table");
-@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 
- out_free:
- 	free(hdr);
--	return -1;
-+	return ret;
- }
- 
- int main(int argc, char * const argv[])
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d1658a739b4..91814134275 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -10,13 +10,12 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.1.1"
+PV = "2.1.2"
 
-SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
+SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://0001-mtd-utils-Fix-return-value-of-ubiformat.patch \
-"
+           "
 
 S = "${WORKDIR}/git/"
 
-- 
2.25.1

