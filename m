Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhFWG-0003OC-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 08:35:32 +0200
Received: by iym10 with SMTP id 10so6347191iym.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eTPfZZbyIueUuQvwwRDqsdtyr9q0cu0nAcBc4vJKLRk=;
	b=SKqOTYIMIut60MopsMJoJApJhY+y60+52mk1Av3HZj9qvo6p9T+1gpXsY9Taz6yrum
	LvKEdJ/zPcUtbfNQtSDFdVU+BgK/g9SL87sRJW09b8BQwZ63X/RObL+vJHRV5ut8NGbM
	HZcqSGwJNhPxiCkZ0OJQXqBeg2gLsYeP+p/8k=
Received: by 10.42.130.65 with SMTP id u1mr2343818ics.173.1310625092615;
	Wed, 13 Jul 2011 23:31:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h6sm1508400icy.1.2011.07.13.23.31.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 23:31:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 23:31:19 -0700
Message-Id: <1310625080-30964-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Khem Raj <raj.khem@gmail.org>, Koen Kooi <koen@openembedded.org>
Subject: [PATCH 1/2] package_ipk: add License field to control file
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
X-List-Received-Date: Thu, 14 Jul 2011 06:35:32 -0000

From: Koen Kooi <koen@openembedded.org>

Port of oe.dev Revision e35d1ffad1553f259b084578992f15d10f590f98

Signed-off-by: Koen Kooi <koen@openembedded.org>
Signed-off-by: Khem Raj <raj.khem@gmail.org>
---
 meta/classes/package_ipk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4317028..0c0f00d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -263,6 +263,7 @@ python do_package_ipk () {
 		fields.append(["Section: %s\n", ['SECTION']])
 		fields.append(["Priority: %s\n", ['PRIORITY']])
 		fields.append(["Maintainer: %s\n", ['MAINTAINER']])
+		fields.append(["License: %s\n", ['LICENSE']])
 		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
 		fields.append(["OE: %s\n", ['PN']])
 		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
-- 
1.7.4.1



