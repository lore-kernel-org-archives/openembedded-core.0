Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6E825737A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 14:16:46 +0000 (UTC)
Received: by wesx3 with SMTP id x3so20665422wes.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 06:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t8jzCSF+ipQExJj3oafvx6ckoVy3+9fI6bX5lBLyahU=;
	b=BeqKWLRzqNYRg2xTiR5O0v7IJaxTvIWjwXCBYQVOUvzV7zR4OfAwr7kVxzjJ/gJcDx
	uKPVXiMZ34p347ACwYKSbNKeKUWrdwC6mgEYLwra0kDDZPySw2bufgjzbqLdEf8ex8mg
	vPWxHER2tEwc+Ok+qPu2gqnMHlRVM5QbHZe1b/22UlDz8WanlwGttUAZAD9IsI75p36h
	zqVd+UMeFfve3OIZgEoBQGbKrn2JDZ+HBwV8TTRXcHWvUlFl+U62yZRMKjqcd17e9uC+
	0uLgrNPVbos0SrD8j2TJoqdSGy1/F9cb9MXJLvTD+pQRLVA/LCkxNixk5h12xe8TEuHI
	8E8w==
X-Gm-Message-State: ALoCoQnlu5+w+wwFguknFODL35GnmSCw90VtzpitlTuWnAo6zEBWbKiTCAXoJOjN3LC5ckE4DDah
X-Received: by 10.194.240.164 with SMTP id wb4mr27747004wjc.66.1425046607877; 
	Fri, 27 Feb 2015 06:16:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dm6sm2991830wib.22.2015.02.27.06.16.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 06:16:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 14:14:20 +0000
Message-Id: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] sato: fix typo in packagegroup
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
X-List-Received-Date: Fri, 27 Feb 2015 14:16:49 -0000

The gtk-play binary is packaged in gst-player-bin...

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index fa9a261..18d8b16 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -49,7 +49,7 @@ WEB ?= ""
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
     leafpad \
-    gtk-play \
+    gst-player-bin \
     x11vnc \
     matchbox-terminal \
     sato-screenshot \
-- 
1.7.10.4


