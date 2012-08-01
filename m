Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYH2-0004Za-Au
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:36 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:31:59 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4631233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=SRXOGsvd5G6gIhUeyTJg2eINWsAqNXqF/SiaYqzjMWE=;
	b=nrk1NBXeS71omjhmLuXGMxydlD4XKHYREmklTfaWAhALoWssN+8rkmH2Gdof8IaS3c
	sAAr3fP8PhsUkBGnOYrxLAI37+cKNYUORI0EDEH4Ze1SbPztEyhWZlEwZU9u8+gLpDZ2
	4mU/FonckXRQAL6t3Kxvba6KOYHQz6MjthXnNL7/eeMa4tfRR1OcwkYSOlD6XrSd30Dx
	S9VU8p20+Y459Lm/TZ/sakkcnBI38bjJ2CEKLFRtIpywPrdt69vS5g1cqnKt5juJoKqr
	90mP411noaQpQdr3ebbnsRguJhOoajmlz8lMQ/6UPJOjCmA3Tc96pGjrL4sri0yYpx9c
	92eQ==
Received: by 10.180.100.131 with SMTP id ey3mr16138787wib.15.1343824319008;
	Wed, 01 Aug 2012 05:31:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:12 +0100
Message-Id: <fb976e39af08730108f6edcc8be0b5cf4e91360a.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQloNGeSo1y5HorMHd7PkuIiFehiAGjkr7BOBpnD7b2UIBQ9fMHciEv4jbZjznCbi4cMmqSB
Subject: [PATCH 06/12] mesa: Use 'require' instead of 'include'
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:36 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

These include files are really required, not optional.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb  |    6 +++---
 meta/recipes-graphics/mesa/mesa-dri_git.bb    |    6 +++---
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb |    6 +++---
 meta/recipes-graphics/mesa/mesa-xlib_git.bb   |    6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
index 219e555..bd62c98 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
@@ -1,4 +1,4 @@
-include mesa-common.inc
-include mesa-${PV}.inc
-include mesa-dri.inc
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index a0e1945..4b36f20 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -1,6 +1,6 @@
-include mesa-common.inc
-include mesa-git.inc
-include mesa-dri.inc
+require mesa-common.inc
+require mesa-git.inc
+require mesa-dri.inc
 
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
index 7547b22..a89640e 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
@@ -1,5 +1,5 @@
-include mesa-common.inc
-include mesa-${PV}.inc
-include mesa-xlib.inc
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-xlib.inc
 PR = "${INC_PR}.2"
 
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_git.bb b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
index be2f5d3..6647120 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
@@ -1,6 +1,6 @@
-include mesa-common.inc
-include mesa-git.inc
-include mesa-xlib.inc
+require mesa-common.inc
+require mesa-git.inc
+require mesa-xlib.inc
 
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
-- 
1.7.10



