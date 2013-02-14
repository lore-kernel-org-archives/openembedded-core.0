Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U63Q1-0006mK-Pa
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:20:26 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so218374wib.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 10:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=vLKR/sQLJHboAXjWJXkWOIHGNdgUIPrKFo5BODtt2Uw=;
	b=YkmFIUQES1AEmj5aWOUHnnT1eLeZD1iLPy30mIvoLboDpERZghaJkbJX95C8D0q/vX
	Vxyw3/TK28yrSIypuPb3toC0RZk4JRB4y797hvwSKVtiY3SxIYNtauQ34thL/Z+ztTgk
	Ub53alia3uLDO7vdtv8DNntkzutiwGkVsqMRTOrlEsVkufA4bWrd14oCSm88Q2lELryw
	D5jpgMk7H7GaGxbf5iavTk/iEEZpbyaaSPuAJZTPCezyrQoO3JHa1g/6v8uiA/oEYb5r
	BRpPHF4EXssn4aMl2Nk+3U5Jk8K5MHEpxiXcK3i6m+fEDTi1n8ffGrC0x+LPpf5gRUXA
	gb8g==
X-Received: by 10.180.77.9 with SMTP id o9mr1099843wiw.16.1360865054864;
	Thu, 14 Feb 2013 10:04:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hb9sm777740wib.3.2013.02.14.10.04.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 10:04:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 18:02:02 +0000
Message-Id: <1360864922-24537-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnq7/zvnWngi8/3yzRLg64y+khxe8ItDMVVGGDVGTmhUStGaLb5CgY9iZVKXQvvys9Oc7Ry
Subject: [PATCH] insane: remove unused variable
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
X-List-Received-Date: Thu, 14 Feb 2013 18:20:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d285e56..f52fcea 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -165,7 +165,6 @@ def package_qa_check_rpath(file,name, d, elf, messages):
         return
 
     bad_dirs = [d.getVar('TMPDIR', True) + "/work", d.getVar('STAGING_DIR_TARGET', True)]
-    bad_dir_test = d.getVar('TMPDIR', True)
 
     if not bad_dirs[0] in d.getVar('WORKDIR', True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
-- 
1.7.10.4



