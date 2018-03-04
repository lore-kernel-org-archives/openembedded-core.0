Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id EAC8E78ABD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:10:02 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v9-v6so8528248plp.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2Hx0ezCDqiaZ5nzhoyK5cZcSFJZrXiba49t+hgjjnNI=;
	b=W8z0D7C8Aja36FUWbjfQr1h+hRTXp1gxRpTIt2phUmKvagOvblTUuxmYpRT3EFl2yM
	QAyyM8FJOAJHpKfMDGaPKcfnc2gM60LxIMxRE6aUmTbWYD+ySeNCaIlpZQpFiQBK4SrD
	GSxtsfKfUZ0wvoZXq65NKEbCsXMA4xFAL23uvXREuad9WDtSN1EYrfH2vHvJ6DVjtV+0
	vhCFwR3zNqaReDfV7A+/D0MM9cD084qpL/0Db8Ci9dRU2qq5Tr1R3D8cV4b2X5kq4bHU
	eVoTQkcZaJo9tdUeavagqiNCuxlkGV2fy3W91IMK8JDP6OfoGWGfBssfKB/HUcghMYHQ
	u9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2Hx0ezCDqiaZ5nzhoyK5cZcSFJZrXiba49t+hgjjnNI=;
	b=i+3lxb/GvMSXeSVpQSaARYBbq1xdnEowM2rc1j5pWPrRu8oxQjMMlCCjYjvv+92bly
	d1F84mTehItnpozUwOXCEIW6KqUUthO+tta3tPpdtRv6obJNqYgT67468OeBOIuPHZlv
	EcQ39PZZ07i+3+BU8gPczBLnFMdyzm4DoW2Td1FTiGGdxup2kR/D1cJDBuhQX1W5guMQ
	7qKzIj+fNuA26hRB1PY38bcKI527qkA5QxnCynh0IPGYy+zC6oJZnykgmMQ5syh4ktle
	/Fs2b1qpw6VEo3wh4twU+BayM469+W/TskczRdwY+oRqsjbZFIs2UrgROpRFybwkRWyi
	FatA==
X-Gm-Message-State: APf1xPAhWvKbw+W9sXc6LZsB4G5/SeJFbVLBMwzw60nlvJjm9mzcvhRz
	61NRsuUi0fU3srjLSQ1vnia0uElL
X-Google-Smtp-Source: AG47ELu2/sZi9mpBOqyRYkYQGoZ8sZIbVYD10vyS7l/DVngSY/qj0jcKJnAyGDp5kL02nOCIMEhS+g==
X-Received: by 2002:a17:902:b482:: with SMTP id
	y2-v6mr11104338plr.49.1520197804174; 
	Sun, 04 Mar 2018 13:10:04 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:10:03 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:37 -0800
Message-Id: <20180304210937.29727-14-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 13/13] tcmode-default.inc: add settings for go
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
X-List-Received-Date: Sun, 04 Mar 2018 21:10:03 -0000

to allow GOVERSION to be set for using an older
go toolchain.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/conf/distro/include/tcmode-default.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 87a5920cad..5c6681fb9d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -67,3 +67,13 @@ PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 # Setup suitable toolchain flags
 require conf/distro/include/as-needed.inc
 
+GOVERSION ?= "1.10%"
+PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
+PREFERRED_VERSION_go-cross-${TARGET_ARCH} ?= "${GOVERSION}"
+PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
+PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
+PREFERRED_VERSION_go ?= "${GOVERSION}"
+PREFERRED_VERSION_go-native ?= "${GOVERSION}"
+PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
+PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
+PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
-- 
2.14.1


