Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvQ9X-0002VD-IU
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:51:11 +0200
Received: by weyr6 with SMTP id r6so2718317wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6WqPGazLfzWsT5GrGV3pEsf25d5e0C63AL5vU37FItQ=;
	b=j5wpKjbzSsI5mun8KEvaAaM2eK1nlY1UbjizeHFBjHegemFa/SIp1fY12Fx5OrAq0q
	sMW4tXJX2qt8uaHBml6MHPC7CYsQYDQfd3w2EQME4KFlOwwCSyONTEoPHHlxygo+iXo9
	9pVopUjQFglS535d/AR35b0yu1909jlUb0fGk2QDTW9ZXEVX6vpeRJANjHJ4hN/Zrbk/
	f8rEgK/mA8ByHLPOj5pDSkh4j3Zv5hzsYUNnd8PasJRJIYP7fByvQ6lv0qvqJI1F4JmY
	JwdlpplcwAH1UdGE2WFN4yuAJpgdSaO8s5R4BKsLqk3MY6LFXFeHaHrNnkjEW/g/qCBl
	unhA==
Received: by 10.180.79.69 with SMTP id h5mr18425392wix.6.1343554777316;
	Sun, 29 Jul 2012 02:39:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm9414416wib.5.2012.07.29.02.39.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 02:39:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Jul 2012 11:39:29 +0200
Message-Id: <1343554769-22112-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cae0f7ba7693529116ae5e21cdddc35bf96aa8fe.1343389943.git.ross.burton@intel.com>
References: <cae0f7ba7693529116ae5e21cdddc35bf96aa8fe.1343389943.git.ross.burton@intel.com>
Subject: [PATCH] libdrm: add DEFAULT_PREFERENCE = -1 to git recipe
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
X-List-Received-Date: Sun, 29 Jul 2012 09:51:11 -0000

* recipe from tarball should be default version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/drm/libdrm_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index 2b3ef47..4f4d4f7 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -4,6 +4,8 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm;protocol=git"
 
 S = "${WORKDIR}/git"
 
+DEFAULT_PREFERENCE = "-1"
+
 SRCREV = "1b1a4f0a779f7ab2ba5673b9c9fe2a37047fe765"
 PV = "2.4.37+git${SRCPV}"
 PR = "${INC_PR}.0"
-- 
1.7.8.6



