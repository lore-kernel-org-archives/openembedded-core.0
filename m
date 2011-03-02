Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pub30-0005YN-Ac
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:40:14 +0100
Received: by mail-iw0-f175.google.com with SMTP id 10so5049771iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 17:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=F5z4v6iBl2d6OHs99J36JezDQta5p3HSBUU+wy22VWw=;
	b=tFi4S+7BPQ7loaHeJXJFyuGFru19Suji6AI22LE812sADZNiboyibaPdOGj486aT3w
	omO1UOMq7arOBLngyGcLzMy+0ZWUc2i5BLHNUMTGnbIlz4rTDYXSVL5HvTKkGTPSnMQC
	UG0oVPuGRr3hLTFTaYYMo3EP++O5Fnwn9S2zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SGqetkd9zQRBUfi4NcU6Ec0sumz95RZOD08TN98Ff98ClGCzI2pzW3B77IiGo/58Y0
	TWQgPAl+JdHWmlUQ67p/RaglxKSI7k4lomN7RJnNGksYBreG83CsxlW1HplKFGkgcGgh
	adCDgAxMQ9Q3i24U2yo3Y0bYNb6/bM1BvfK8s=
Received: by 10.231.20.13 with SMTP id d13mr1103711ibb.57.1299029929717;
	Tue, 01 Mar 2011 17:38:49 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm6206023ibg.9.2011.03.01.17.38.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 17:38:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2011 17:38:29 -0800
Message-Id: <1299029911-3973-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/6] distro_tracking_fields.inc: Use 2.6.37.2 instead of 2.6.36 for linux-libc-headers
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
X-List-Received-Date: Wed, 02 Mar 2011 01:40:14 -0000

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



