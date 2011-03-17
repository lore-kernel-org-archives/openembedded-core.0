Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0FtX-000226-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:17:51 +0100
Received: by gyf1 with SMTP id 1so1169567gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=8HZlbjpvfC+5JXG3LY2CiDQuRzYyGnrxp25Ztiz9bEY=;
	b=peotQJCJe0JOiJdoC66iheIvMDiUh56tn+3dJK5mMgZXVBD8uGwuP+kdcuozxz7xLN
	rOfCm0JUs5EGMIrLeom83UxVm4vLPY3C6hb1RuHEOmvWPlDEVfGa5E3v98Q4tqO9S+8B
	lYe/O/UyWDbXzam9+iXcteabC/Xz78tapea78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XsDO89EaB/YMxFf+6He/EHBU/kQC+FXQxaiO9BkB3yEJkUM4oLrgQLFsPdNRkA/Pck
	2l171EP0+rtJiW0ZZODyoXLsMW/BpPdnQfA8YPxes7sQ5v0I49FG9L9yHBIbPwLtWwwL
	VP1Li5ncF25ALY404YAnsV8qyKmvHeLCdHD7c=
Received: by 10.150.93.4 with SMTP id q4mr25677ybb.261.1300378566466;
	Thu, 17 Mar 2011 09:16:06 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q29sm67146yba.2.2011.03.17.09.16.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:16:06 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:15:56 -0700
Message-Id: <02544c5e3162ecf73ffb4a7cbd1039cc0b80b347.1300378309.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] native: empty PACKAGES_DYNAMIC the way we do PACKAGES
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
X-List-Received-Date: Thu, 17 Mar 2011 16:17:51 -0000

From: Chris Larson <chris_larson@mentor.com>

Without this, as a specific example, one has both gtk+-native and gtk+ runtime
providing gdk-pixbuf-loader-*, and you can get bitbake preference conflicts as
a result if you have preferences specified for both gtk+ and gtk+-native for
other things.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/native.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 545a73e..cc32cf5 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -7,6 +7,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = ""
 PACKAGES_virtclass-native = ""
+PACKAGES_DYNAMIC = ""
+PACKAGES_DYNAMIC_virtclass-native = ""
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
 BASE_PACKAGE_ARCH = "${BUILD_ARCH}"
-- 
1.7.2.3



