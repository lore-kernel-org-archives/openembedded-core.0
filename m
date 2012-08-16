Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28kM-00055x-C2
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:40:58 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so2159868wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=LheWacoer7W5s9U/rqfi9VHki+HvTmRh+3icqdm5Icw=;
	b=Dhnfb/+H2UPHE1lQjqNHt9Uscmc5rqmgnu/sRgUftLTdvwdGUQ9472fXp/C4hftpI7
	8k5hslaz6xvLWvsY011D6FUAoQFeXTZewL9Pl6eQpwxq3/UCguhoG6dHhEDjPiEPX4VP
	5qHKZkyjgIYQpRDFNRO0ukbziHemsWpXSKz7OZI6sTwCk7Dp414U8pyDidigxosbA8rx
	9NaeMo1zJgXGs1H7Vdk+SY2ePd+VEvzXx+Ye4atUp33n3hHnTs7SjYyYzVhBOfWWK4Na
	dKD4PG1eNE/QjQGmeVBmIWlnwB9Rc6uuo2BDCoDrN3LNi0F4lqLKAIu50HhLr7FeX0lK
	DI2w==
Received: by 10.216.132.156 with SMTP id o28mr1298613wei.141.1345156142802;
	Thu, 16 Aug 2012 15:29:02 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id cu1sm6321240wib.6.2012.08.16.15.29.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:29:01 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:48 +0300
Message-Id: <bcaf5ff7d70d8ba5df9a517096c247e1b8a1ca55.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
References: <cover.1345155936.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmqAKpuuSdX48+zT2G/PgNYcZZx5sT0E+eWGRTephLQbhtODrBI6nZ58zctyrbYY1JZ0D/M
Subject: [V2 PATCH 2/6] bitbake.conf: Use the new form of features_backfill function
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
X-List-Received-Date: Thu, 16 Aug 2012 22:40:58 -0000

This function was modified in order to be used with other
variables then DISTRO_FEATURES. Use this new function name and
add the parameter needed.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8074684..296ebc1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -722,7 +722,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
-DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"
+DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
-- 
1.7.9.5



