Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAO-0001px-O9
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:57 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:19 -0700
Received: by wibhr14 with SMTP id hr14so3227167wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=sBsRrTidllSdqD08wyGZQQMhwl4tCmx6GmvzubJf934=;
	b=blm2Da/22h1nE0303A0XP342mOhmpW0Q0+HJKWuwfHqQz+/iB1j6IIiv3juXlIc2XG
	Fhc8ybYrPfnXkx4l9oo45fFPLJpO/lXAGixlxmIV+EsBqu5Iji19/FSrcrfPjFiqb6NY
	kv+Jo47l/ujoI9Ao+LFpH1hCulpy7bonGvQ761Ch0Wz7k6Sy476W8sQ6mtaiAUTxOMsm
	3c+ROo2sQMGa8dbFxZ8K9P/nA0qAfNxqf6RI10reVQPz9BTBbiqgLIxy2sxeFI1qJTYj
	73/3JvhT4fE508e3RjQ7gCgqoRwzMF5KPuD49rWNjd4t9TBJ0qHLW6LS0uPyQCv1mIXi
	Hnlg==
Received: by 10.216.85.130 with SMTP id u2mr2706852wee.202.1343835437606;
	Wed, 01 Aug 2012 08:37:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:38 +0100
Message-Id: <ad0d7de863e412bb757f13e2d250fcab4e19dadb.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn/lJPd/VsKwN4hbV5qwqssiuWIZuZpKlUY6Ld4PqJ3FOnBWiWWRN7oAk5/z90OscXf8I3i
Subject: [PATCH 11/11] mesa-demos: fix GLES2 build
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
index bfc62c5..1d16bfc 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=9142
 
 DEPENDS = "virtual/libx11 virtual/libgl glew"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
-	file://dso_linking_change_build_fix.patch"
+	file://dso_linking_change_build_fix.patch \
+	file://gles2-info.patch"
 
 inherit autotools pkgconfig
 
-- 
1.7.10



