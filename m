Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Qd-0007vO-1U
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:54:27 +0100
Received: by gxk1 with SMTP id 1so286120gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=F5z4v6iBl2d6OHs99J36JezDQta5p3HSBUU+wy22VWw=;
	b=ri6GcHN+r8Rrmauw/C/Famp3gis55DB/CykTZ+vbQQmDXZuH7Xlx2F8TQ/HI+eJPlA
	kwlQq4cOU9Q+GqEAn+CzYf9RQvH1pKLnGdk1HT9/4bSYgh78JoAf2vmSuQajsXtk7GRO
	uTDxXYUwcxOMsvOzMI+WJMBQTw+uwdXsgL8dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jFBEpcodFodie2xyqBJp8XttqHUND2ePVsBifqjXgFZuwEaATAjrjhecq++acJ/OBH
	drCFxCtecTGUHmzy5+K1vs0+b2UTTTiaeahH+1lXTiynHqNAow6F8GfYrZOldfmYpSTF
	NvxCVly+uu4T2RNRvGrJdlf+2c6eb3DvzAxVg=
Received: by 10.150.32.3 with SMTP id f3mr1351235ybf.300.1299135178073;
	Wed, 02 Mar 2011 22:52:58 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.52.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:52:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:43 -0800
Message-Id: <1299135167-18330-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 2/6] distro_tracking_fields.inc: Use 2.6.37.2 instead of 2.6.36 for linux-libc-headers
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
X-List-Received-Date: Thu, 03 Mar 2011 06:54:27 -0000

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



