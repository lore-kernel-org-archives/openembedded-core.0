Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EFE6D78A50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:10 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l43so18126150wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EWpFQ4tniXNiRsS0HeHKVGgRttMDISG3wZoue1ZlIPU=;
	b=FadpXyE98jJ57FljvNunRuyCs6FVTp81vLtsMvvGeTyIcrlsNda834cbpvVD3z2Fdl
	5YX955EiJm4lkUBXvZro8L7bEZqYB/T87n+iPgVZdMli9Be1fNxRSorBVJg8NxmOgQwA
	NnPHhsl913GjznWqTT055LVLlgL3wmQMfdGqnzDcsth51N2YEf+xSXDMeSUocEIm2Bwh
	vYXgmRn+vz1LctpsEsXUlpr9A5aIK+ej//28Jb4ZGmEfKNdoV6sX/7XiSwfv95+IvSse
	C9S7dE7SNRNVXfnGBZy+Yr8nB/KkluDIro/KMk73fMgvo8MElqowZfG4/0lqGjkbQRfO
	/q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EWpFQ4tniXNiRsS0HeHKVGgRttMDISG3wZoue1ZlIPU=;
	b=eQPbxx6fYFwm2IDKl1HoOgVaH7KohiOU6pzSmmWkPKQIYnd+wFCUkmYxkSvHTMou3F
	nAz0bY6jzYUDrvwU8GQmzwrKJ5wnQP6WpqbVuY9lJWXw7WtXiAPO5pdId/FYg1z4vxf3
	BtauPWzMTAR+HyeSENZ3IZgto0Wu8B/yVGWSSbLXY1zvukupNIs7pxh2w+hfJaCn23dP
	qqUrkLCSGcwsVdmKghhAECjmuS9/Tl6qX78kL+QJUbmLDcgVSmh373nbgkuyVF3ohUn+
	3iXIXEjwvt2vrpUxcFAuuyQeAs2OBLFy5N95eZFDUECu156/jXviQbFRJDW+i8Pm6f6q
	x6iA==
X-Gm-Message-State: APf1xPAjDcLBck8iDY1zQhoAZQa/Aauii6i25JabEHy5FgrKWnPlYuSg
	BKKn1un2VUV7dvvObZtDhEENU8YK
X-Google-Smtp-Source: AG47ELtWtUr+dg5z63i/gu289BVtKt72MBfqyHwhe1MuFl2DfL0GzIg7MtOBADpur2M2csfrEuonOQ==
X-Received: by 10.223.179.17 with SMTP id j17mr12952318wrd.223.1520270471905; 
	Mon, 05 Mar 2018 09:21:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:37 +0000
Message-Id: <20180305172046.21729-20-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 20/29] unzip: refresh patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 17:21:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../unzip/unzip/10-cve-2014-8140-test-compr-eb.patch         | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
index c989df18965..ca4aaadffe1 100644
--- a/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
+++ b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
@@ -9,9 +9,11 @@ CVE: CVE-2014-8140
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
---- a/extract.c
-+++ b/extract.c
-@@ -2232,10 +2232,17 @@
+Index: unzip60/extract.c
+===================================================================
+--- unzip60.orig/extract.c
++++ unzip60/extract.c
+@@ -2233,10 +2233,17 @@ static int test_compr_eb(__G__ eb, eb_si
      if (compr_offset < 4)                /* field is not compressed: */
          return PK_OK;                    /* do nothing and signal OK */
  
@@ -30,5 +32,5 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
 +     ((eb_ucsize > 0L) && (eb_size <= (compr_offset + EB_CMPRHEADLEN))))
 +        return IZ_EF_TRUNC;             /* no/bad compressed data! */
  
-     if (
- #ifdef INT_16BIT
+     method = makeword(eb + (EB_HEADSIZE + compr_offset));
+     if ((method == STORED) &&
-- 
2.11.0


