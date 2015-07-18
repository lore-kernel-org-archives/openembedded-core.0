Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id C60D765CCC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:42 +0000 (UTC)
Received: by pacan13 with SMTP id an13so77389144pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qVRZ9XOQOgl8c4JJaGhSw+PfSZKbnc+DjG2B6jYM9VU=;
	b=U3GVxGMHtnOgL42xPZm7FHfx1v7KVMobMtB69k+dQrjOOefXKU8N5DXWc0KOnfF5Bj
	NppazFL8fNa03Q1B1fC+TRBFvhTbXwmMqu34ZAepFX9VeRaehY/2ThcaXU+cO+4v7qnC
	1+wfp+FAJj385ApBNYf7JWrtpzMtQp6ELDe6uzYHTfcdnWa1DhPqa9taCIKzV4puT8c0
	vZySs+cp12NPeYzYhRXuiCuAEXj3LbxPtJRsFmUSNBHHBYHmvNNihJZ2o1xCudHQqT05
	WssscUm1EnlFbU+w/89lASZDrUzIG0xhx5/OSnUJktm2O1pMR8cbX6fmOxYm3K6x1+Er
	5mvg==
X-Received: by 10.68.229.200 with SMTP id ss8mr40821856pbc.150.1437232603300; 
	Sat, 18 Jul 2015 08:16:43 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r9sm14670230pdp.5.2015.07.18.08.16.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:41 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 31D6EFC12EA; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:09 -0700
Message-Id: <75e8bfa275af411a3ef8e105cb1c6b7c80a3a1d1.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 02/25] tzcode: update to 2015d
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:45 -0000

Changes affecting code

    zic has some minor performance improvements.

(From OE-Core rev: 3ab7e247b0662a1791169f16424abec426885f80)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2015d.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015d.bb b/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
new file mode 100644
index 0000000..44a9f03
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015d.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "4008a3abc025a398697b2587c48258b9"
+SRC_URI[tzcode.sha256sum] = "221af54ec5c42eaf0101159ffe1256a883d1c14c46228d42774c656a56317128"
+SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
+SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
+
+require tzcode-native.inc
-- 
1.9.1


