Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 445EE60110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 21:42:59 +0000 (UTC)
Received: by oiww189 with SMTP id w189so16729331oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 13:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pI/3teut7K9t5GNOG/cW3km/lefygLUxmlq1UNx/4o4=;
	b=VVLWB8vcn9FZbrrbsu9gdVj9QIe4eqm8o00BO8QoDFzP8QWgC89xZNB/YSz27atECs
	ivuYufV2KTZ/nt+CeqHPXahE/HkOUXMn6w34pv64Cwvu3oAFGLmZ83PFKvh1wFwY/nxJ
	q/N6W1Al2LZ1C6v7wr44mT9l0/PjaOoQFUQI7XGUfuNW+ny0EVos8qkcBRBSYCFDb412
	fU4yAxZneezKQreXWPI1UnViPzdmK4Q/y4des9p99JsAvB7PLU6k0Ku8JKTpiysoamRI
	4JuWCU+UHaP8e9DL/sSKKnXfCepN2Z2l1CPI/NyTFq3I2/SQp8mv3x5uV7cX8TMSZvAD
	vLOg==
X-Received: by 10.202.79.1 with SMTP id d1mr1516169oib.20.1449610980617;
	Tue, 08 Dec 2015 13:43:00 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	e202sm2140533oic.23.2015.12.08.13.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 13:42:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 13:42:50 -0800
Message-Id: <1449610970-23073-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449610970-23073-1-git-send-email-armccurdy@gmail.com>
References: <1449610970-23073-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] dropbear.inc: drop legacy CFLAGS and LD tweaks
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
X-List-Received-Date: Tue, 08 Dec 2015 21:43:01 -0000

The CFLAGS and LD tweaks in dropbear.inc date back to 2005/2006 and
whatever issue they worked around back then seems to have been fixed
in the latest versions of dropbear.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index a2c736e..1dce2a5 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -41,9 +41,6 @@ INITSCRIPT_PARAMS = "defaults 10"
 
 SYSTEMD_SERVICE_${PN} = "dropbear.socket"
 
-CFLAGS_prepend = " -I. "
-LD = "${CC}"
-
 SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
-- 
1.9.1


