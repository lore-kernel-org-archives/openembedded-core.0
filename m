Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27sB-0003YU-0u
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:44:59 +0200
Received: by weyr6 with SMTP id r6so2132406wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=bVjHeGfC+XKHM5vTxoR6JMx8eVNZ0pUbkxRnvkXLACk=;
	b=kZjfGl7A2b04zVm7AmJMQmq/eZ7gkp+08a/y4LF4FHMaH1G7gSQXhGXcWC8HXYOoDD
	bUiPwddR18PjBck5TgjB+LRPxN1M6S8UIparq49lnl51Kjo9QppWpEug0w/N73UVlgqN
	emM5bNkJIG7TGYtQd9ZHwXGeh8sxpUzO5J9HUoP46k6m1Dy12QYbf8chpjmw5vO2M8I2
	7SRMKlrp0PXK3majyeXdP+901KbdJYePrxkKZ5H9BeA9yqULsQcAuE5wLVIgHZjKbEYa
	Am8/P/VHRdL6M5PWo9wYeRCoEdaUjFtYCnELUdvfnm2oUhLsMcD2sjOV649wkTqMm8yd
	aWvA==
Received: by 10.180.78.4 with SMTP id x4mr9169162wiw.19.1345152781473;
	Thu, 16 Aug 2012 14:33:01 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.33.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:33:00 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:46 +0300
Message-Id: <139e8fa7f6f4caf8aa8496d779505d3efdcaa38b.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQluR7lf8quc5sbVIOCcDQXX64i5d5dTBdQpfQdHAFsEJTtMET2u4vbeA58ts/bFrzDUUr6A
Subject: [PATCH 3/7] bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to MACHINE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 21:44:59 -0000

This is works the way DISTRO_FEATURES_BACKFILL does.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 296ebc1..4773d50 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -724,6 +724,9 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
+MACHINE_FEATURES_BACKFILL = ""
+MACHINE_FEATURES_append = "${@oe.utils.features_backfill("MACHINE_FEATURES",d)}"
+
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} \
-- 
1.7.9.5



