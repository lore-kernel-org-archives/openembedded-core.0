Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULgzB-0004XD-IK
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 22:37:21 +0100
Received: by mail-ee0-f53.google.com with SMTP id c13so361006eek.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=6OonTnGKLRE3elwDr32e6Gmw3cR1UgdOplXwv4TnQDk=;
	b=yc1ptKGjjx/6pL5L0P/aNK917HHE/BVXhL8bevWlm/1BTMbfMAKFTqPeT89cI6vQBv
	R+2JqrJo5kYUBVGJZ1zathn/HCLFDiX5VobErAf0rkSJe1hQcRNggdmoTBYdLY1IBkRc
	3sVGsIzyN85KzOAaI2SExuHAa/eXKB1IR19Kri7qpPXXdGVFbLLPTSND85HvgBUwbfKP
	tnQ1tMaRC54Y87skpTmqwrODiy5ft3tcK1+D9ITBPhoqkPO6n9a66fLINdToFJGiQNgu
	gmq36iP2EkXlO3K9ALhH1Lrl5j+HjUtAy+8k/RomlLcByBP8THS8lEt2adyGFNyIAMfs
	mVBQ==
X-Received: by 10.15.111.202 with SMTP id cj50mr11694957eeb.6.1364592017349;
	Fri, 29 Mar 2013 14:20:17 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id f47sm6366494eep.13.2013.03.29.14.20.16
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 14:20:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 22:19:59 +0100
Message-Id: <1364592001-3562-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] packagegroup-toolset-native: replace gtk+-native by gtk-update-icon-cache-native
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
X-List-Received-Date: Fri, 29 Mar 2013 21:37:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index 5c544ec..82ee820 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -84,7 +84,7 @@ DEPENDS = "\
     gperf-native \
     groff-native \
     gtk-doc-stub-native \
-    gtk+-native \
+    gtk-update-icon-cache-native \
     guile-native \
     guilt-native \
     gzip-native \
-- 
1.7.4.4



