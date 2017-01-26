Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D87E71DD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:03:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d140so50502975wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Cvc/iJICWbM8m7117rYkr69tniYWIjJTzSG6AbaNSRI=;
	b=bNTAHig/fOHtWZVAQsNozaUn3qTyeL6MJqJ4a8nORI/h0tiOjBrldRRteOgNX/GNH9
	K2rjhOpyQ9R/NtLYKHwtsAEy6eh4F6+g6Yo1NK8sxx20rAKO76G6gYr5GnOPFIM3s1AV
	WIMGlTWWpj34jyn4msbt2NwpDPCLopJqTV6Dc8SMw+5BbcdbVGGoJnQUADCFUJFusFYw
	U9NCkE6/NXPE0kkfAeDpqYaqqnCM2C7GkMlkEbWSX6R7VXZ+BVm1S/kYSIy2i2QRJ/iR
	J8S9zDE1muA5NUK6DoMIIKV7Tz/Ddg6KOr6pHOsKZR4gf8sDLBfrZ2StyMTZuy5Qn+HY
	rT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cvc/iJICWbM8m7117rYkr69tniYWIjJTzSG6AbaNSRI=;
	b=un6IYRFk8f1arviE/kIDbEtG6OPfzxG81zZTaKvrSKRYwE5zcvRhh01Xaa9VW+3+MD
	wIEJv27ecDwDyPONZP4JfHwtzXhSuNNkmirKWR3I09Rs8JGbJrMa3ZseErI2onrZ+ayg
	dOhHbo3DiDOaWnihahV9GIk4dhP4Mqab2tZtTveckkb0FVEOp0LiFIfm0rxlUDTLlim3
	LToUASoB5jKKCGbF/KbSSvaG4uetxFxCdzPE4t0lpSeDrfz6UaJpGv7Jd3auvbyr4cxX
	JAhEc0KWqJqjupv1cZ2ICvwko3691H6BMTnhZq+vXauIrYbvn+Szq9izH0H/r9IZRwoG
	Buew==
X-Gm-Message-State: AIkVDXI6FiKOpNz2FXcAD+for42eI1y/PmZMGcgLvRq0hoiSYKQuifqunePXQJHqUumY8w==
X-Received: by 10.28.47.2 with SMTP id v2mr25501876wmv.138.1485435835838;
	Thu, 26 Jan 2017 05:03:55 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	y145sm36493896wmc.17.2017.01.26.05.03.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:03:55 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:03:48 +0100
Message-Id: <1485435828-1589-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] rootfs-postcommands.bbclass: drop insert_feed_uris function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 13:03:56 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The source makes no reference to insert_feed_uris any more, simply drop
the unused reference, to avoid confusing the developers.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/rootfs-postcommands.bbclass | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c8f18c6..1acda29 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -220,24 +220,6 @@ make_zimage_symlink_relative () {
 	fi
 }
 
-insert_feed_uris () {
-	
-	echo "Building feeds for [${DISTRO}].."
-
-	for line in ${FEED_URIS}
-	do
-		# strip leading and trailing spaces/tabs, then split into name and uri
-		line_clean="`echo "$line"|sed 's/^[ \t]*//;s/[ \t]*$//'`"
-		feed_name="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\1/p'`"
-		feed_uri="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\2/p'`"
-		
-		echo "Added $feed_name feed with URL $feed_uri"
-		
-		# insert new feed-sources
-		echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/etc/opkg/${feed_name}-feed.conf
-	done
-}
-
 python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
-- 
1.9.1


