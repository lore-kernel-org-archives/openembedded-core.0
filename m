Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA47D6C15F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 18:41:35 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id k206-v6so25483767ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 10:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FeJIot9+M4mkiO4qXgvFt6qlwkGOz5CbzTYZl258Nrw=;
	b=izdI8qk63QlUwKmMn4AzKQCcp9ZdQ7ClhBCOdg7WVxw/qNeu9qNGLaBan3f5pwhseM
	tzqJ4ZgFcy0Oc2efEOzC3LtRtdMbMwYktk/zZEkY7coCwhqqq8VHnntKyDXZXw/dhG4z
	oZWOa6cG4kY+QccTZ1AeVz7IBBF/kvVmduOdnjQbVuazu4PZ3shtBiuW2QGlnyqijD8K
	f7Jv3kkywPFbIYX3gF/6Nn0naaE51hW/AZzomrY8gGvKcLXagQcMS94diOMhfu7P/Yi2
	Szr3b9cSMAvA2H2QtqjPXOzBtDwe7rZ1VDciqi2fQbh2iwuTxRBN04ITVAPKdmR0pHMe
	G5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FeJIot9+M4mkiO4qXgvFt6qlwkGOz5CbzTYZl258Nrw=;
	b=gBBZ7rgpDhYdNLuWjqSAo0/TsAynzE25f8nL0ZFl0aLk3VfXwYvp5Evnc9LvFOeX8I
	ONpQbe6caJjhdoHaA5vYaMaVIrxzhhOlc/4+Uk4RUxjAdidPjaRVFdkOYWgoi/AmfNJ5
	td1NGzK0CKc7dWu+FKXmq3RJSE78/dOm0333O/sX5+W8yMoGyvfNKYNKF1xQU3Xx2aet
	UUjWuz+gwL/1KRcEd/1v3GdhkAvSvbx/oO0ML1rOe6USFLSK23RHu01MH/QIgDfnASk6
	okybz4j61idZNsG5fHHQ3xDe0iVo3TRqi4fMXa0wLmmYThXw8r5+Y9/cFJhEfubS520/
	Pltw==
X-Gm-Message-State: AGRZ1gI8ooSZBnnKFZpfbMzUxFw7qsH6q79QWrr+xTLoRaOdlwF2aV1B
	b/w3iH479F0zG9OtlLUS1/x6aiTe
X-Google-Smtp-Source: AJdET5ecg4R/3gnYSFWwcyo8+fgKKH+wpXAIrtg/r0rRCHVvQyLuEHCX5s81BDL9bKvqp+UbYd59pw==
X-Received: by 2002:a24:4247:: with SMTP id
	i68-v6mr3113822itb.139.1542220896522; 
	Wed, 14 Nov 2018 10:41:36 -0800 (PST)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	r85sm2972401iod.13.2018.11.14.10.41.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Nov 2018 10:41:35 -0800 (PST)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 13:40:56 -0500
Message-Id: <20181114184056.5013-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
Subject: [PATCH] module.bbclass: Add INSTALL_FW_PATH for out-of-tree modules
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
X-List-Received-Date: Wed, 14 Nov 2018 18:41:35 -0000

This same variable was added to the make line in kernel.bbclass in
0decf1cc1c35dd70f3b822e3b4291a810a319ba0. With the addition of the
usrmerge feature, out-of-tree modules could use this same variable.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 meta/classes/module.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index e344960244..c0dfa35061 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -48,6 +48,7 @@ module_do_compile() {
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
+	           INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 	           ${MODULES_INSTALL_TARGET}
-- 
2.14.5


