Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4968F6D2C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 16:45:50 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wo20so3269933obc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z2/GMVOcqR2PWl7WxAwOzfBoSASLoa5M/7mEGpNi6is=;
	b=LXqrpqVgYnn4PyuayHvLp5k7GPdmBbZuoRbo4lpY/EYAf8UkwgUo5dF9eIGtGroa7o
	QJ+t0fCgUmM92fT88ACdv6hxWbcfjSTJXRyYMXpGHKGRJWUrCqvZSeLdCCL7SYcOO8Py
	JbAvZKLybNyG1NNOYdCAiflv1BMi7T1HdvNyODPlO3cw4og1kAa3DbpYuCANlF7Opgii
	3rvv2vo1Ujc2R+LPi4rpS4OCR4+dBPDZ+dIcYZ+oD7UMgKPCA41EM4drBN3YXJsRfvG0
	tI4KGTwnd46OZM/hgZV9pCEgPGhirD9UBthHCoacwnPcfqAwG+8PEsCRZMBAKKhjucvd
	BKyw==
X-Gm-Message-State: ALoCoQlU5PrMz9bpBxgtJVdJbI0LdcBoDis8vLb3TcKFM9PI7+oPvjh4R7iYwXQdLtmZRh4J0zmj
X-Received: by 10.182.125.161 with SMTP id mr1mr1089923obb.75.1383237951916;
	Thu, 31 Oct 2013 09:45:51 -0700 (PDT)
Received: from localhost.localdomain (sccc-66-78-236-243.smartcity.com.
	[66.78.236.243])
	by mx.google.com with ESMTPSA id nw5sm6789407obc.9.2013.10.31.09.45.49
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Oct 2013 09:45:51 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 09:45:32 -0700
Message-Id: <1383237932-13177-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] runtime package management: ipk/opk
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
X-List-Received-Date: Thu, 31 Oct 2013 16:45:51 -0000

Place the on-target feed configuration into the "base-feeds.conf" file instead
of the "opkg.conf" file.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta/classes/rootfs_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index b0805dc..1537af4 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -159,7 +159,7 @@ ipk_insert_feed_uris () {
 		echo "Added $feed_name feed with URL $feed_uri"
 
 		# insert new feed-sources
-		echo "src/gz $feed_name $feed_uri" >> ${IPKGCONF_TARGET}
+		echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/${sysconfdir}/opkg/base-feeds.conf
 	done
 
 	# Allow to use package deploy directory contents as quick devel-testing
-- 
1.8.1.2


