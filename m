Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 39D5B62133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:07:46 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id v188so168661299wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QoMQ1TCx9/yH7pmADcvteS3neYaX4RObp/Vcc+F14nU=;
	b=EJr250ALW8tEM05ecEQdiWoCq9Lw+tXxhejMBP8JBuDfcMhgbt3Pn5b86qX4bXWvdG
	7CAxR7ABtIE+PDIL7KX6ErUPhQYnQ9xhnduhnJi0yi8JFiPP26JPAz15mAk+UM6QN0r/
	cAHdo2sW9AnNXvI6QyIJIOcLqHN+oC2rDHqPF8hCgiczvl7ZrFGv0S3dNi6jesSeUrlA
	9kNkZMIkspcvqiED7HWFff8JgCN0oaStE3JWdl5UimXQA/lU2ucCyK22OnKM6yIJ6Kev
	hIN34xT6qtz3GL++F6Zw7uwr42i88ndcVyWf2LZw6QL50vPL48w/a6oI4CG5bcxHh51r
	yCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QoMQ1TCx9/yH7pmADcvteS3neYaX4RObp/Vcc+F14nU=;
	b=AS/F6CHqm3N6wCln8hiQxfk0UeNsL0ewZjJvnGaE/OrUveXDPlATxGPQwJzyaTTDcz
	VezqpnZgVUCj3VIL13x4xNUkVETWCo8iKVw39cCzn75LsG8tHEyIfWSFOVfM87HjBpge
	GKlqVepVikaJ3Xonk3YCZKuk7ZqLw8NJYhwkIUq1hXOlLMa8o1Qjs8YjZ25oX/OJrUST
	YewQzNh4yFRirlVqdumrayloOtIGvCgRUrzyODyTPlgWOuHIRegxindIrGCJ4ODyoTsH
	R6XdlV/9/x5M0//fsasDX8Y2GaQprHerS/fz63nVbRPeboCPQMPY56Gcm2ms37qRy9zm
	h3uw==
X-Gm-Message-State: AOPr4FWdafOGXMwOZr1mQhOpbsd8zyeWc3qFo4vsiBoV0hGecl2Sud17+leCLjXHBdl6fQ==
X-Received: by 10.28.234.11 with SMTP id i11mr4551881wmh.76.1461082067287;
	Tue, 19 Apr 2016 09:07:47 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	a202sm20407579wme.1.2016.04.19.09.07.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 09:07:46 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 17:10:56 +0100
Message-Id: <1461082256-28654-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] packagegroup-core-tools-profile: Enable valgrind on ARMv7a and above
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
X-List-Received-Date: Tue, 19 Apr 2016 16:07:47 -0000

Fixes: e5f41c221356 ("task-core-tools-profile: fix valgrind for arm and
systemtap for mips")

Valgrind works on ARMv7a and above.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index ff2b5779a203..b6520d6779d7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -59,7 +59,7 @@ LTTNGMODULES = "lttng-modules"
 
 BABELTRACE = "babeltrace"
 
-# valgrind does not work on mips
+# valgrind does not work on the following configurations/architectures
 
 VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
@@ -68,7 +68,9 @@ VALGRIND_mips = ""
 VALGRIND_mips64 = ""
 VALGRIND_mips64n32 = ""
 VALGRIND_nios2 = ""
-VALGRIND_arm = ""
+VALGRIND_armv4 = ""
+VALGRIND_armv5 = ""
+VALGRIND_armv6 = ""
 VALGRIND_aarch64 = ""
 
 RDEPENDS_${PN} = "\
-- 
2.8.0


