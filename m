Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id D808378CFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 23:28:26 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b1-v6so2929404pls.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PxnpXAUvsWF+vjrg6+j2a96PdFpcLNurMgwgq3P235E=;
	b=MvjId/bxlWOJkkBn4v0Atke3QTfagyIJdlSleDuF5wpbZz0KwAQHCjjznhmcbeK2ek
	qpz+heg5VBkjnJcoieYocxX5bApJ18W1Jz/fj82fysBawcVEG9EcmOR37jw3MG+GWNmJ
	EN6E+5pOMZdw6tIq1cdrCAUWkUysKDEJNH3S0gCTmG/IxRgrKSNqdmWemxnFAKSs3A0A
	vb6QIumbNS80fnb8cXsV0qkP/+VBOxTkwf4v8hoSoY20oOlKzluWTtn0dbaz/O9strUV
	r04GSKpYGzn/s5nGccpvf63901vRNhlzhZT1gjc0/k3SlnNpooHfvkuZF3OZ79nSdHvk
	iQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PxnpXAUvsWF+vjrg6+j2a96PdFpcLNurMgwgq3P235E=;
	b=gNGq5FQXbaWdR5EAmTpdK40vhAlzJ+bdLiHkB+Ur6sCIsHO3mi9GawbNAx++PiRb+e
	L/GEoxcqgxutCA5pt5AqGLvsrrbw5b479KtO4PpsNpyDHyU421UyF1c+k05RSNsvapz0
	lBNlm/V0ubO17gMprYYaLru7A5Q0Eh+8gRIv5DJy2hy2nsaFuATQFUs+MctgXEGaf5XD
	/GG+WB+nE99b823x4uun4HJa+hCSDp0sFK8HZ/pfQ7wsZAKFUz1SXF1cnzpz/fGiBpRP
	sCiBudZCeaNUFt3yC2l0T8+vbY86sbUw+Hk9g5aYJmW4Y1h2FMrOfOHCFeHgYMPUM3nj
	+zNA==
X-Gm-Message-State: AOUpUlHvqUtgXQo8gKxS79UojjVXHaKt7B/mv6F8ufjK8/WffDL6lRfM
	ciCypw0Ia1jZRMIINAdJPh3aLEtb
X-Google-Smtp-Source: AAOMgpcsHgxqTPKCTsLz8bZ/MZVlZCMlb+RErHwOpR43TRuOqzLRUarJ6ltL4nKp1i/gqXEJMnLSPQ==
X-Received: by 2002:a17:902:8215:: with SMTP id
	x21-v6mr7672722pln.175.1532734107940; 
	Fri, 27 Jul 2018 16:28:27 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm7086923pfm.119.2018.07.27.16.28.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 16:28:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:28:01 -0700
Message-Id: <1532734081-24485-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/5] openssl_1.0: squash whitespace in CC_INFO
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
X-List-Received-Date: Fri, 27 Jul 2018 23:28:27 -0000

Squash whitespace in CC_INFO to avoid recipe whitespace changes to
CFLAG affecting the final openssl binaries (the value of CC_INFO gets
embedded in libcrypto, via buildinf.h).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 527be72..f33ca97 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -211,7 +211,7 @@ do_compile () {
 do_compile_class-target () {
 	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
 	oe_runmake depend
-	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
+	cc_sanitized=$(echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g' -e 's/[ \t]\+/ /g')
 	oe_runmake CC_INFO="$cc_sanitized"
 }
 
-- 
1.9.1


