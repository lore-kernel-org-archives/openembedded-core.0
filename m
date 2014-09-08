Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id DB0937130F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:09 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id w62so2362972wes.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KP5novPiWaNIsLWVaa8upQjlhTSilPev0C8AosEHpdk=;
	b=N7JY24uW9vVwcJ4U8jyiDNtaEk7lA+Qw227hZb87zycoUqAGfu9uDgKAF89Ni8b518
	vMSSM+vLGw2f8teEod4lOHYo7IJLtfkbInzoG/dUuuu7q+wJ2tz54c06zbJyOpxR6qpT
	wcd8NJ34Qlr84vLuV0DvWzos5OnA6gFM3sTFYDbAQVTjTWElgDO8VmgC41XS4PVJB29d
	QWRsiH/6UmjZtGriSpK1P8d8B9uPEdc6v9WA4PoMSZM7MrshzplNa5jA7iu9p4mef42G
	ovLTl1cgBc3Ckpf/qCmITjmzUY47ekF8z2/tWf1QblkfagOLym5fUntrLEOxzubGbxNG
	CKbA==
X-Gm-Message-State: ALoCoQmHS7A+ljCJuyUizykbmZ3N2hggFkUFTN+HcpToIuoQ5ZRJf3+vkLkd8ZF2T8BCjJ3Xnk28
X-Received: by 10.194.222.138 with SMTP id qm10mr33515585wjc.25.1410177550674; 
	Mon, 08 Sep 2014 04:59:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:33 +0100
Message-Id: <0dcd3b9a41b9449b24fb95fb76709d8565f8484c.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 15/27] pango: update to 1.36.6
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:10 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} (56%)

diff --git a/meta/recipes-graphics/pango/pango_1.36.5.bb b/meta/recipes-graphics/pango/pango_1.36.6.bb
similarity index 56%
rename from meta/recipes-graphics/pango/pango_1.36.5.bb
rename to meta/recipes-graphics/pango/pango_1.36.6.bb
index 5c20497..61ae359 100644
--- a/meta/recipes-graphics/pango/pango_1.36.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.6.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://run-ptest \
             file://multilib-fix-clean.patch \
 "
 
-SRC_URI[archive.md5sum] = "2500930093c3ed38acb40e4255bce2f1"
-SRC_URI[archive.sha256sum] = "be0e94b2e5c7459f0b6db21efab6253556c8f443837200b8736d697071276ac8"
\ No newline at end of file
+SRC_URI[archive.md5sum] = "1c27523c3f3a4efe4d9d303d0d240320"
+SRC_URI[archive.sha256sum] = "4c53c752823723875078b91340f32136aadb99e91c0f6483f024f978a02c8624"
\ No newline at end of file
-- 
1.7.10.4


