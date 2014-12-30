Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7881772651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 14:16:43 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hq11so5825506vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=k6LdEYO31JlGv/GWfM9ur9VV17tGyEVEtC3XTnLXWRc=;
	b=qp2sCIl+SrK4YQb1UbjeEyvEHhQs1x7ElVE1qyuppT/NW6oLNBMj+sO4OVw95l532C
	geoRXNxqH/gwI6lYBdwop84Iin4XpBQyfgNYip0ASR6FjRgIAEGy4q6pnmcDF1fwh307
	tl/X+/1tDUwF5u7LXYnfo1bl33HMxuKTWkFIkhBJ9EJ/AtL3p8fblCZRSi7iL6OHaBAR
	FCTWMr2DzMM4194xdvHxps9RLslwGAOsCLKnXVGLxFRhgwv9lvCc0xvjc3fVcNdWByEu
	bZpkl2RlUzADyT1ZxhOT7+NXRbt8iP8WKuwUsJ21TTJlncCFdOu8HJqOO+vLArj2HlMW
	0dBw==
X-Received: by 10.220.190.6 with SMTP id dg6mr883191vcb.9.1419949003061;
	Tue, 30 Dec 2014 06:16:43 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	l11sm11001104vdh.16.2014.12.30.06.16.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 06:16:42 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 0F2581C9F1885; Tue, 30 Dec 2014 12:16:39 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 12:16:36 -0200
Message-Id: <1419948996-14370-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] image.bbclass: Remove 'set_image_autologin' function
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
X-List-Received-Date: Tue, 30 Dec 2014 14:16:54 -0000

The set_image_autologin function is GPE Login specific and the package
is not available in OE-Core so the function should be added in the
meta-gpe layer, if necessary. Drop this from the OE-Core as it is
unused.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 34e9f4c..07e7f99 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -387,12 +387,6 @@ python write_image_manifest () {
         image_manifest.write(image_list_installed_packages(d, 'ver'))
 }
 
-# Make login manager(s) enable automatic login.
-# Useful for devices where we do not want to log in at all (e.g. phones)
-set_image_autologin () {
-        sed -i 's%^AUTOLOGIN=\"false"%AUTOLOGIN="true"%g' ${IMAGE_ROOTFS}/etc/sysconfig/gpelogin
-}
-
 # Can be use to create /etc/timestamp during image construction to give a reasonably 
 # sane default time setting
 rootfs_update_timestamp () {
-- 
2.1.4


