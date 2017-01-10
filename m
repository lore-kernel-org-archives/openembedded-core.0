Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B298971AEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:38:50 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id ey1so9014005wjd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=asRhg0QkZTeyDqz9vwudegxgkS7xuSR6/cUVDCA4dtc=;
	b=Uu1gxKYtoBUiaGNFoYoYgzJf8nWB4uSfdqV0Vl9nI2tswjQpTFLqail9RLKPM9w0wK
	OzXVsS0uhV3jdTp5Rqy92TFNlBX90keFWSnQ368M2pvuV6f+4Zact+T0HpCr3Hrbi/Uh
	IxnI2b1zw6KI2XQ8vP3HEdyQRz6rKyfTNSFZu7ArS+eoah2JI5YP1FqkGltmdcR7ATHV
	0uGRQ7yOf7xvm/l9Nnc7M7qKtAVavjQ26CvByyAxS9mBYZpgWNFJ4mZbVhNXErG5JF7A
	/jJGW1fIQbfiQDRxUQzzP0i1yaRIe8uoleOmxW2qhOu6rjo13rFsASwxSJ3vrEs7CQ32
	HlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=asRhg0QkZTeyDqz9vwudegxgkS7xuSR6/cUVDCA4dtc=;
	b=lJu0Fjc3Mma+q1MGjjaCLTFGn42SJYFecazoGCtDURuSkILAffQku13xyAm1Igkq1e
	gmhypNOAl1+69rb5dK9dOfvpZAJrYGwWiYmyHcITAJz+xSUyrv2leI349HZobBXGRE8h
	7X0hZ3WBMbr/WhevFuPcGvtA8QGVzZlatI90JEWaBXX+2bHZirbhWJD4Jx0eNwOIjOtE
	8Dkd1s07hiPWdNnwE5h5vWXV4FUqcUuC1aVklmMDhC3wxRln+fM8fT8C7nGkTjxz38QW
	HjRUGboyHq6+ZfYDXy87NIC6uerXY0L4uvZcpMghG/fAMg9XQBTwt7fL2C40li1p4Wui
	0UWQ==
X-Gm-Message-State: AIkVDXIKMdqP5ZAu8YSyxGl7//gI+rf4t49+9nOTW3cKc5YeBWRaZo9FCMwFkWcg+ok/kw==
X-Received: by 10.194.205.73 with SMTP id le9mr2327414wjc.31.1484066329896;
	Tue, 10 Jan 2017 08:38:49 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	a13sm25605776wma.18.2017.01.10.08.38.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 08:38:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:38:34 +0100
Message-Id: <1484066314-31508-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
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
X-List-Received-Date: Tue, 10 Jan 2017 16:38:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have onboard (onscreen-keyboard) in the pipe for meta-oe. For that working
properly we need python3-pygobject build with cairo support.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.22.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
index 1c8dc20..b6a7e98 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
@@ -18,8 +18,11 @@ SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-cairo"
+PACKAGECONFIG ??= "cairo"
+PACKAGECONFIG[cairo] = "--enable-cairo,--disable-cairo,cairo,python3-pycairo"
 
 RDEPENDS_${PN} += "python3-setuptools python3-importlib"
+
+BBCLASSEXTEND = "native"
+PACKAGECONFIG_class-native = ""
-- 
2.7.4


