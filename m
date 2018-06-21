Return-Path: <kergoth@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4F487786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:18 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id c41-v6so2305793plj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1nqErJ/6gPO5AJOl+Q0vJr4RI3gAhSuuu9unscDHSwQ=;
	b=cd6qj9AkgbSTqS3FOEDH46npchXct2fqHyYrduRuyrEcwob7ibS1dvbEzAf5QgYvR2
	YYhHin9SeCMnPPPMjM59g0FSRkb3R1B1bFE3FqFfNopY+PKjpd0lNxdfnUQ0/mwA7bWA
	MZciJippXlQ2zqeQWfuOzCQESFdpK7DdVX9nfITptSEC29IDxIj83RIRblI5wcAkTVCi
	j415AzAr9CcNZOecyoMrxcYSioF5OakK8XLQbTARVL35zzbKkbokQucdA0rwITeMVMnF
	UvbnqIhK17vGrO/b/IGwDpidyJ2iLYvi3G2eStwcrLevH/SIYv+anS93gdPG2kfIP4Ul
	KMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1nqErJ/6gPO5AJOl+Q0vJr4RI3gAhSuuu9unscDHSwQ=;
	b=kaiH+El3RUXMz2byHN5BnnE1HSdqYw4fu2f8T+DiqDsgfMN2WfB/5np/WBI+x/4Cwl
	idF9hNkgEsK8L2QsDR9jBZbG98iAqEACixC9kkCe4iNWx0AzTZhQAURN3r29iREHShhA
	fDi+im7iCXFhIsEZLC1daXT6t73gxTCXuW233SdVvzghPYXb013w43FiopHVDku+GYXA
	haGgoET0zJoS4cZVF98PwUHh0JUayniQsu2/c2W7Oo0YTEpT6SjlEdbQoH87KpsmZiiy
	sY3l/o9E49Bvr1Hc56AtvhEvsp7EsN7YtRvpqwOUCabz22UO/GeteENIsLrZKaJ1oJKx
	f5aA==
X-Gm-Message-State: APt69E2fKx+quVQtJE8kcSxRsu6U1wyIFbJYlrznl+394PfwGCMvirXw
	5b0jLMmQEQRHsGHKmzbD07Hd4/WB
X-Google-Smtp-Source: ADUXVKKttE3l+tyWfhW7pILJAD2BffE9+9xh7XX4vAAfW4gvzrNVxkJu4Flbz3gitVbN8EBjDw4EmQ==
X-Received: by 2002:a17:902:968c:: with SMTP id
	n12-v6mr8465110plp.15.1529615299200; 
	Thu, 21 Jun 2018 14:08:19 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	n85-v6sm9836546pfa.146.2018.06.21.14.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:05 +0500
Message-Id: <c161943d620cd644b09cbf185a5adb774bfcd605.1529604975.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604975.git.chris_larson@mentor.com>
References: <cover.1529604975.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] rng-tools: drop unnecessary INHIBIT_UPDATERCD_BBCLASS
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:18 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was added as the recipe didn't inherit systemd, but it does inherit
systemd now.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/rng-tools/rng-tools_5.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index b3c9fd97455..24d545dc3fa 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -16,13 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
 SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
 SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
 
-# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
-# manually to avoid unnecessary postinst/preinst generated.
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
 inherit autotools update-rc.d systemd
 
 PACKAGECONFIG = "libgcrypt"
-- 
2.11.1


