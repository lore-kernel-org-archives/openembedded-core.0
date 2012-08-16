Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28kN-00055x-VR
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:41:00 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so2159868wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=bVjHeGfC+XKHM5vTxoR6JMx8eVNZ0pUbkxRnvkXLACk=;
	b=FPEq1L+Gzo3tuwgIXPnsTvAGII3fmGg8L636OabNvFfEZykyP/xgBTXuCAkPx9WyBp
	1mSol2Bd8wVIjgksTD8MrDKMViTVw+ibqwZdezE6GiKLzdeh1HD9M9gPoyccdNixu6r5
	cMhSRr22ZXP9v/g0Cj4sooLZG1wGNrnDS0O8ipbqVJAenc2tnVpJ+q84yOrZ3Cus3RBE
	eMuunWEEQ9+yywAf7iJ70+NKBu5jHpvO0JtCwMFQDCQV2fFwoqJMErNBre7QYvK6vivs
	2ml/wo+TkcQgn5TpqhNnOpJOzPjceYJRISQIxzPHxrjR0ZttybMgcdlRmW4fq/RxVd8D
	ScCg==
Received: by 10.180.81.165 with SMTP id b5mr9515320wiy.17.1345156144460;
	Thu, 16 Aug 2012 15:29:04 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id cu1sm6321240wib.6.2012.08.16.15.29.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:29:03 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:49 +0300
Message-Id: <139e8fa7f6f4caf8aa8496d779505d3efdcaa38b.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
References: <cover.1345155936.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnLV7CS0W/80XDP532ZuPZWEK1bH9AmgGFFuTbedijzBqYYYZXNSHUHhEZomx3D9x7vmFYt
Subject: [V2 PATCH 3/6] bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to MACHINE_FEATURES
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
X-List-Received-Date: Thu, 16 Aug 2012 22:41:00 -0000

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



