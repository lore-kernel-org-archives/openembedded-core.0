Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27s9-0003YM-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:44:57 +0200
Received: by wgbdr1 with SMTP id dr1so2503820wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=LheWacoer7W5s9U/rqfi9VHki+HvTmRh+3icqdm5Icw=;
	b=aYFLwH1BidfdiwbDQwvdZugxd9+RfnFxmRCjUGovGmIfuEsztymeZm+NEYbtnm9NyJ
	I6B+NzwVUtW5vioHRdnEsPrtER7cX+M/foomUmcjPvayU5+TVLmVzcHgplg7Dlgl9qNn
	0lDkdwTfVqYl2Jd3sXqNTKyW63sooq4T5wMp5r/3nkpVdTmIYqrHflKoe2QtJNrQlx7v
	XQzLSqvl/C7Qh4jG8gi75a/trjmNY/qjhbw3G8P5DEANzIhN8ZyVWnJIJ6pOA0Z8ttCd
	gZ3osUY684Gbm/JD7ckxk1gMXj59ZJiI8ka18WrJFbhkPsBevBPAAK+ajhZfERNHc/dq
	rUtA==
Received: by 10.216.232.204 with SMTP id n54mr1384938weq.182.1345152780038;
	Thu, 16 Aug 2012 14:33:00 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.32.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:32:59 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:45 +0300
Message-Id: <bcaf5ff7d70d8ba5df9a517096c247e1b8a1ca55.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnG6aPbr9zUGhCjMiCZKo/2gznuRfSTyJNUewN819KGGFmU+19w2i4C9C4hTXy40CWDzsPi
Subject: [PATCH 2/7] bitbake.conf: Use the new form of features_backfill function
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
X-List-Received-Date: Thu, 16 Aug 2012 21:44:57 -0000

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



