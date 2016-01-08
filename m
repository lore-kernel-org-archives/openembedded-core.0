Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C9F16760AA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:41 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id b35so218712420qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Np3J9HpxDzY17eL0JjICl6dhBYIRcxlKNyZEaH+1OvU=;
	b=bIIwH5bOesh1W2+Z0bIOfwokFLbUxa95LnDY+Y0sReezRSnyoVULQlAFjDTLNPJ4oQ
	BFIrnB/o23iziQumUdAuoqo+z8U9WEbwjKHLlpKD7qPCZZMeWsABzhOdQ7UU3NT4/p2D
	BQPv6ly4RD/YzBgiGYNURLCm6yRSV6TQ4Li4wgrYUOSmt2SwQB1yo227flmfoWeGkCO6
	T67VO9Zoaitf++P1y0MndUPi77wlwZ34yIp3QEIhBdbCJPGTwrugv6u+fhbGKheoWavm
	LL11u+8b62ufTdG3ehr4/NPrZ51t1PM+Lv9z3yUaXcWYDjSzxoh90odWzeVrq276Ngsm
	5IzA==
X-Received: by 10.140.137.199 with SMTP id 190mr149381791qhj.91.1452248382294; 
	Fri, 08 Jan 2016 02:19:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:50 +0000
Message-Id: <c9b1b8a305244831ca263c615b87382e2f0b13a8.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 22/53] net-tools: Link with libintl on uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:42 -0000

libintl is needed explicitly on linker cmdline on uclibc since the APIs
are not in libc itelf.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 923d048..04ea76f 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -30,7 +30,7 @@ SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e4
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
 
 inherit gettext
-
+LDFLAGS_append_libc-uclibc = " -lintl "
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
 
-- 
2.7.0


