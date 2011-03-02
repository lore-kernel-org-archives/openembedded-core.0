Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuhhX-0002RU-Nc
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 09:46:31 +0100
Received: by pvc30 with SMTP id 30so911758pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=F5z4v6iBl2d6OHs99J36JezDQta5p3HSBUU+wy22VWw=;
	b=wC86HnxF5xdnfrlXNWdeX74apEnxNoKLtINmjY9abnG0T9JQhPX+aI5JgUsTEeiA7z
	UJlayOcHnHPyS8RYbqSB50QPWGG5DOt3S1E0n/MKv2Ma8o0F1bK197d0atHjyYGwH/ln
	obzYmEsaXGpU8ijUpRT+bNVqR2N1y5QwB9EnQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OnJZrNiJ1B2eRxNN2aJLPL8aEORS8OCBhKHljqhJPnlzQud7/Kd/d0AcCsb9d27X20
	9+FwX+2QxxGE6ZO82rysNPi1cmmEpmRs2m3VNbeO4Qlhe0vk9VqW0IcnzaOsHi/6BKfF
	F5A1h7Dz8waUGTNj+r4jJINLU8p0OgbKboOro=
Received: by 10.142.246.18 with SMTP id t18mr6258172wfh.422.1299055062816;
	Wed, 02 Mar 2011 00:37:42 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8708546wfl.14.2011.03.02.00.37.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:37:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 00:37:22 -0800
Message-Id: <1299055045-8096-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH v2 4/7] distro_tracking_fields.inc: Use 2.6.37.2 instead of 2.6.36 for linux-libc-headers
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
X-List-Received-Date: Wed, 02 Mar 2011 08:46:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1dab90a..beb18e2 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2884,9 +2884,9 @@ RECIPE_LAST_UPDATE_pn-libtool = "Nov 8, 2010"
 RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-linux-libc-headers="green" 
-RECIPE_LATEST_VERSION_pn-linux-libc-headers="2.6.36"
-RECIPE_LAST_UPDATE_pn-linux-libc-headers = "Nov 8, 2010"
-RECIPE_MAINTAINER_pn-linux-libc-headers = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+RECIPE_LATEST_VERSION_pn-linux-libc-headers="2.6.37.2"
+RECIPE_LAST_UPDATE_pn-linux-libc-headers = "Mar 1, 2011"
+RECIPE_MAINTAINER_pn-linux-libc-headers = "Khem Raj <raj.khem@gmail.com>"
 
 RECIPE_STATUS_pn-lsof="green" 
 RECIPE_LATEST_VERSION_pn-lsof="4.84"
-- 
1.7.4.1



