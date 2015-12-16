Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 378F47318F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:59:13 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id iw8so35467757obc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KBepbcqCMvwqiCW37o0eF+xohYAZ3iCRUzX0Lz5uVjg=;
	b=D0CWik+yXrOeguBSh6K5CHhku/9fgRAzhSDCHE/h30f4OJnyvrD/iwTRbyh5KPeMKP
	Nd4YyxPZdRKGet9M9at5iB39w2C2MDkzGdtNzMXz4XyxA7j04fM8gkPjbSwyaI2k3/OC
	E2j0aCebnwfETS1FucV2m05BDGqeSu4TLSi51fEGdXlEhL/T6Si5trzGVQIDWzhCozhv
	Dm3R+i4k1i+LGFBQmjcMkOTI6USpRitK2OdomU1w28PlNpetnMsCki0nGkRi8PsMpE/T
	dBYAoIZsas+MY0IOb9Jd2eIor8qs4JdAQWrcYoCx8Anl/MUb3vUen1xFmyf77qsfCf+D
	/SdA==
X-Received: by 10.182.171.105 with SMTP id at9mr37421578obc.49.1450281554147; 
	Wed, 16 Dec 2015 07:59:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	kw1sm2476980obb.28.2015.12.16.07.59.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 07:59:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 07:59:01 -0800
Message-Id: <1450281543-9320-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
References: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] tune-cortexm3.inc: provide an _armv7m over-ride via MACHINEOVERRIDES
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
X-List-Received-Date: Wed, 16 Dec 2015 15:59:13 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-cortexm3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index bf7f89e..05362a9 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -7,6 +7,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mtune=corte
 
 TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 'armv7m:', '' ,d)}"
 
 AVAILTUNES += "cortexm3"
 ARMPKGARCH_tune-cortexm3 = "armv7m"
-- 
1.9.1


