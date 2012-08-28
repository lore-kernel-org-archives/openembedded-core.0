Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6Fgu-0006Ki-7d
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:24 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1416465eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=oqczKiYhVkxWpgqh1479ycAhPBIlgA/vfZKTPnl2Qfk=;
	b=nveVYWs3JxSLpHrECPa2ixW7KWYgAGh3B/H6cMvM82mXz5KPB1M86WShyAksndEkuS
	BIxKFBi3knpGs2PqTJSrpy/Go4CNiYQ6TIgGTGPn0eicjevXQjOySTUuIcIu5tGWRqhi
	nCIuzRlAYirn2o2I7QKynRIQx0FQtffJ4GFGWOc0bjS276tVbkpj/LswiyHKeP83EC3X
	urD6FgaK5S0up5N9WF6jJfIMdHiEvh6LtV/BFVW/qinv6k5kr+ECNGapq6S2s/Nzhguv
	kMvud1ACBlZPfnZH1ZDfcMactiueqqlaR60B52l/JJo+oCbi2s4mHbkIBVlwijAbyihR
	G7ug==
Received: by 10.14.207.9 with SMTP id m9mr20589701eeo.5.1346136134129;
	Mon, 27 Aug 2012 23:42:14 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id k41sm58207695eep.13.2012.08.27.23.42.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:40 +0200
Message-Id: <1346136108-13062-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlrGEROwLmekyyGYoL2PeY12wQ+LJZfv0zMBKiRdAm7/t5O3/ENU2E6rZ06Ud67X4lsBuhv
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 03/11] opkg-utils: bump SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 06:54:24 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* there are 2 small fixes
  python-2.6 compatibility
  missing C option for opkg-build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 1996c75..b193ba4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+SRCREV = "423ecd36b4782327c16f516885d1248249c7724a"
 PV = "0.1.8+git${SRCPV}"
 PR = "r1"
 
-- 
1.7.7.6



