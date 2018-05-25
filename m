Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4A474CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:12:30 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id ay10-v6so3676579plb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7U5qolTKKIuBbd7Qvzc9/GoWwzg/9euuXZErnzi+jLk=;
	b=T3zDcSTOIhnWC1iVy8JDXri0R3AOgtBMbgciHu1rbAwHlKkPFv0OMvhhpjy9uUU3OZ
	uv6Vspc8BRNHZvctcgsoj3/Vv3yG+PC89O3tQxCibt6WAw16Wc7stHqTWAWexKQ6u6cf
	RAWxjwOU/aVKfjy59AhSW+lNopmRQS70tGL4RUIsMjh1FnNE+5odqORIfGI8UmWC/qJf
	T9L1STOaE+vfHbfoEoTTKv24fT50dCjKqr9zfdzxAAQqAK0VI4XbQujRwDETeFRItE9z
	0mXKVT3U10lv0Ikd91mt8CZB/Wn9AOZibrsmUiMyRZ2Hd+nP3IVHP9hNxrsfqx45TJJA
	mwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7U5qolTKKIuBbd7Qvzc9/GoWwzg/9euuXZErnzi+jLk=;
	b=gxycfht+F4fkwTnzY9cnSePY5iNuyaTng5WySRygHX+H6Ryyn/gskPTHD9PtawmO54
	hr4qN/FUKHg0vIcUw+klWfMN4KMV9/Gm9xNKYLtsKRp3Jr9742AXf7BmwRkpgsur8snj
	UYUlbR3EfZtGRUVNW39ueTSIbdPUV0j8hJWOxs+OVKlVWir+A5n+seww1PbneO1fZlpm
	FfpSjQkZj0N72O3i5GqsRBfeQBBrTZQcT0N2rvaSzNsX+KZjM26Ua1Fln+1dMWtyVRpD
	AdXs/A2dTSxf2V9jeMFCeRymHU/IQkd22p0i2DZPVwnEnvLgixoctQz4si3UMOXAj3tM
	Qo0w==
X-Gm-Message-State: ALKqPweXfZf+KaZuMLHz6Zhy+9hx+KXSHggkwCMX+GyrZ9vV1rX+N5Gq
	8iYtexUGDu1TXe50izlMSsLPXw==
X-Google-Smtp-Source: AB8JxZrTR7qrci4tRg2QmUtd+H3qZXtOTPbLlfM3jDi86OgcHL/u1V72OMFAMimy0JpOatyDmvelSA==
X-Received: by 2002:a17:902:581:: with SMTP id
	f1-v6mr3895053plf.48.1527275551202; 
	Fri, 25 May 2018 12:12:31 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a4-v6sm54447252pfj.19.2018.05.25.12.12.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 12:12:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:12:21 -0700
Message-Id: <1527275541-6450-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527275541-6450-1-git-send-email-armccurdy@gmail.com>
References: <1527275541-6450-1-git-send-email-armccurdy@gmail.com>
Subject: [pyro][PATCH 3/3] staging.bbclass: use single quotes for path passed to file in is_elf()
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
X-List-Received-Date: Fri, 25 May 2018 19:12:31 -0000

Align staging.bbclass is_elf() with recent changes in package.bbclass
isELF():

  http://git.openembedded.org/openembedded-core/commit/?id=7877761534b0c2492da6289e9f2269d41b6ed464

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ab056c7f6065f310be4dd256ceb45f85ff981f69)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index bff0437..9230140 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -84,7 +84,7 @@ python sysroot_strip () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


