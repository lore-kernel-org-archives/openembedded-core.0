Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1RYK0n-0001wQ-FJ
	for openembedded-core@openembedded.org; Wed, 07 Dec 2011 17:06:25 +0100
Received: by qabg14 with SMTP id g14so573541qab.6
	for <openembedded-core@openembedded.org>;
	Wed, 07 Dec 2011 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=GaQJrm8n15HK4VHQg14FRb5XJV8luN+yJICmE/FUIpk=;
	b=xQap4mQnQNtaV5y44S1Yk5uJ7siG4hSSRBETpZyJaPB2IQVIKFXFnrb9Q0AlVFdstG
	9p3wA1iu63xCQUvb1c2g8SPwzqG8GRtLSpNlA1U2i5j1WhynNHGxT14aV4qO/UTnHEO+
	OCMhoDxube1ai70sD0OWU0OCmQ4cWiuu1J1Wc=
Received: by 10.224.220.14 with SMTP id hw14mr17024294qab.42.1323273576484;
	Wed, 07 Dec 2011 07:59:36 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-172-5.ronkva.east.verizon.net. [96.240.172.5])
	by mx.google.com with ESMTPS id h9sm4117054qac.13.2011.12.07.07.59.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 07:59:35 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Wed,  7 Dec 2011 10:59:27 -0500
Message-Id: <1323273568-31152-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/2] boost : Add icu to DEPENDS to fix a build failure.
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
X-List-Received-Date: Wed, 07 Dec 2011 16:06:25 -0000

Part of boost needs libraries from icu. Without this, either the build or
image construction fails. (I forget exactly which)

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-support/boost/boost.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index fecdb97..a1499f6 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -6,7 +6,7 @@
 DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
 HOMEPAGE = "http://www.boost.org/"
 SECTION = "libs"
-DEPENDS = "boost-native zlib"
+DEPENDS = "boost-native zlib icu"
 DEPENDS_virtclass-native = ""
 LICENSE = "Boost"
 
-- 
1.7.3.4



