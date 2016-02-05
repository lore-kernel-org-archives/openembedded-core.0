Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2E2736B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 23:00:31 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id cy9so41226982pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 15:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SqgPklE5BiAHB8g0lvRurxYKyY8Nwhb1w+0g/BMhUNU=;
	b=t5wqOmqb/LpC2cyVM88Txm850g0mdM17EcHKun6iCXrucTyn45yIHoxRFMMarrLA9E
	wI0MPExWdbrThRT4k1UPf+7xWXPTkbNeJpPO0lci620hJL10UpuUv3/aBkv9DG6E427D
	Cv+QcEslyzzYlhDbU4I62Pfg+nPLK8QqgavaimtK4yyfFKs/xxLzBm4Hja5s1QuG65w9
	HkjlMvPQEZ2glwBgQp5sfIpm2sEQ8bqqyaedh+QLi3l/4enDw6I64QT7EAPvveWX5S5F
	Px8lvMEg5cPDxZdemRorjmThvwd971ghskwkoi70ylMIjaqUThhnRsevTEj7MjWXdpxD
	5mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SqgPklE5BiAHB8g0lvRurxYKyY8Nwhb1w+0g/BMhUNU=;
	b=kyi07rhoqRmpZAXHvNPXcPqg+F5oZNb8z4RqlJzld0+/3AjHrVwRDSmRoW3bDjj1U/
	VnnRpaZO/EV10ga9QxtJZTp8VZ9Th+k5LZOlxXnKbMKzg5DC2dTjfPpldhUWZ7xFQnFg
	37c2jo/FzuvA8vv1IXqQg1sOFbIKZigTa7B2+e9jFGzo9Im+HLRt5sv6Rns1vMmnb+Ut
	HdHWoa6nmqPi1IdbQ2RIhDepmsG/txJTNBnXTms4rYV1+KfA5CyX+pactOwxyiwgol0c
	mcK1jdJB+gqE+gb0ArSP56aELI2FmQsToLq5dUtA3tXntFnpL+pdbRJiaytyI/UQTVW1
	RaAg==
X-Gm-Message-State: AG10YOQA0q0rngwb5GIwmDB1IBjPcaV4eNUfeDJJH2N+u6SkfDn2qnoIfsUAb55C3/aqEA==
X-Received: by 10.66.97.39 with SMTP id dx7mr23709972pab.74.1454713232254;
	Fri, 05 Feb 2016 15:00:32 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	sm8sm26684268pac.43.2016.02.05.15.00.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 15:00:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 15:00:21 -0800
Message-Id: <1454713221-2977-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl.inc: drop obsolete mtx-1 and mtx-2 over-rides
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
X-List-Received-Date: Fri, 05 Feb 2016 23:00:33 -0000

Machine specific over-rides for mtx-1 (aka MeshCube) and
mtx-2 (aka SurfBox 2nd generation) don't belong in oe-core.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index bc4a2ec..1282115 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -25,10 +25,6 @@ TERMIO ?= "-DTERMIO"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
 	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
 
-# -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
-CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
-CFLAG_mtx-2 := "${@'${CFLAG}'.replace('-O2', '')}"
-
 export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
-- 
1.9.1


