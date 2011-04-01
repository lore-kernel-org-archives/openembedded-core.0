Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W22-0005B8-CI
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:22 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so849885pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NHfj3ShlaMYvd6FSv+FIvk6X/ETk1BDqb/evh8pku/4=;
	b=mz2Q7qcnrThQYCbAhomiUxVOWc/talTgaozB6iDhb/kcGlwEekgf/pty5XU0WjZyry
	UlA2iU/1ozWlqFl/melHDD4sC2WgyTvk2Chg+YywuhudsvHi4/r07O8N1qoBfGgr9gUR
	fGZPGHwHoQP0ZsQTENylSoPKue4SIJl+NzOWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=m9sl21Lti/iOPBZn3dim/ObTcglUUpWc89SkhF641MaJdwN29P6KrUoV1MTiTfyIji
	s3+z9KSRje8CweZlHHCIhfWb9tQXKMrR4Anwi5mxSdbEd3rrk+uH2EgQd6t9AgBPup/c
	GVMsFaQ+emf5WzTaTtfMURaVkL+KnWz/sVbwc=
Received: by 10.142.177.14 with SMTP id z14mr2662911wfe.234.1301632222386;
	Thu, 31 Mar 2011 21:30:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d35sm2389636wfj.9.2011.03.31.21.30.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:13 -0700
Message-Id: <e0a83173f45dee64e76478dd559b83f65246bee6.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 37/46] popt_1.16.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/popt/popt_1.16.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 4d9e518..fa6c326 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "The popt library for parsing command line options."
 HOMEPAGE = "http://rpm5.org/"
 SECTION = "libs"
-DEPENDS = "gettext"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
@@ -12,6 +11,6 @@ SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz"
 SRC_URI[md5sum] = "3743beefa3dd6247a73f8f7a32c14c33"
 SRC_URI[sha256sum] = "e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8"
 
-inherit autotools
+inherit autotools gettext
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



