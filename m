Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 656A16B54B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:29:52 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so1571636eaf.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bMvJi+ipbOczZ+J3LOqIUg5LGIkkVzTrr3zeZjBGAzg=;
	b=ivGY+m5Vd6fwHBvuzelC+abybMxMh4O6eDRopTG7IElwVBPe1AKCWUW0j3ZW95d5P6
	Z82amGnhvCofIjh8qA7DyUYfwvh6lS7PruF7BQEVt1M0e1IIlsQS8+EvoMKKV+0E0Pro
	tQ39HQFWQOV+jXRllGrMQak6ahxe0ZRsj2/PoPzjxBl1vwXFPLXpgr4MMd+hQv+mxpQC
	p8R4jIFRn8hqVAszKEA/mcCALmA5ykkAkdqbjDUsEXaQ+ig1gQJBNLIIw3rqijI6glWS
	k99uQmoTKIEBbEK8it5dFupvibB3yI9ondnhpGHWhQxVcfwIJ7l+g+92N1c6I2Ibuhe1
	4m/w==
X-Gm-Message-State: ALoCoQmbZ/7GLDNwjp4cWVnIQtuV+awajkRaRXRU3nO0tBues52R0u7aM7JtxT74tMIJQOdwwEuv
X-Received: by 10.15.77.132 with SMTP id p4mr9091995eey.75.1375979392613;
	Thu, 08 Aug 2013 09:29:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d8sm7293471eeh.8.2013.08.08.09.29.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 09:29:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 17:29:45 +0100
Message-Id: <1375979385-2063-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375979385-2063-1-git-send-email-ross.burton@intel.com>
References: <1375979385-2063-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] seperatebuilddir: mesa now builds out of tree
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
X-List-Received-Date: Thu, 08 Aug 2013 16:29:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 979f44b..eb19e0f 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -440,7 +440,7 @@ B_pn-mc = "${SEPB}"
 B_pn-menu-cache = "${SEPB}"
 B_pn-mesa-demos = "${SEPB}"
 # src/mapi/mapi/stub.c:51:39: error: 'MAPI_TABLE_NUM_DYNAMIC' undeclared here (not in a function)
-#B_pn-mesa-dri = "${SEPB}"
+B_pn-mesa = "${SEPB}"
 B_pn-minicom = "${SEPB}"
 # Not automake, no external tree support
 #B_pn-mkelfimage = "${SEPB}"
-- 
1.7.10.4


