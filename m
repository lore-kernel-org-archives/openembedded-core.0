Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUq6J-0000ag-Od
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 03:01:29 +0200
Received: by pwj9 with SMTP id 9so1060841pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 17:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=DCTGUYwLRCMmEaG5fLlupDSWBRuYd2tOgR9aSN1ci1c=;
	b=RvpsIg1WbqoW9fjp1gC73HQZqMh7ryB1GUOdx8LNWdP+AkseM52/cSbkbTqKMurZbw
	VnY3RfDWRPqdmK4QoiHQ6WPYsWdYDPt7/L4h3hpg9LuL/R6OY+l/u5laXe955+116Eot
	AbwF5MECdfCJmKgJlrilrv8nIFReSkiwucdeo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WlfXQ1eB7yrmvHNjsJh4ITt4stjLzhqjKsyKhY1dFAAgD5Y6UFLATcs1dRc0ZawH2s
	X+dKFMzcwHXLHcLeijpMCFpthHwuSIEkUTHC1pW0oHo+gpey1/kKsncMa+217LrNypRi
	+xLN1NCYu+ztiNPSzl/FAIjgOvTvWe6qgMZMM=
Received: by 10.68.25.201 with SMTP id e9mr731436pbg.22.1307667486616;
	Thu, 09 Jun 2011 17:58:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i7sm1841710pbj.90.2011.06.09.17.58.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 17:58:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 17:57:46 -0700
Message-Id: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] openssh_5.8p2.bb: Update SRC_URI checksums
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
X-List-Received-Date: Fri, 10 Jun 2011 01:01:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
index 04d99d9..d5c9e49 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -26,8 +26,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
           "
-SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
-SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
+SRC_URI[md5sum] = "88a4a83b0e0e60cd545430d4e4bd7e0c"
+SRC_URI[sha256sum] = "e5a1c821dd8dc33a94c445290956d52e03b3c450f9cd448b96d92317fd4cce42"
 
 inherit autotools
 
-- 
1.7.4.1



