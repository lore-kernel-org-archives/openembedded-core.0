Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 62CDD734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:24:55 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so36892622pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q4W0pFmS25DZj8WfsDHRVnAKHOIgUyvFLUIL6MLQ8sY=;
	b=I2JlMsX/Pme1kp3DVwk8KluJPLXqbYiEqemYHOw/0yUYmV0i8OxPr9VZSzMi5tbMmf
	LNkrFPkocZkJ+w4yXbSReqZOOQ5SARWGWv84x2JusLlIePCaEVGnSsEEpj/E3jHAxtiR
	pN7L0s3jUd6n4LCg+l7v/umM5hS4sVMx3EzvC+tgg05KsdLiGi5alRk892JQ8ciCxEOr
	9JHx33NCwm36c9/lmE6T0OME4uZ10IFPIDtwjG2362IWx5OiHxgrmznD+OmAon+B5hrt
	vi0Bvy+Nc8lsWbXMGeLWgSJz5mj5qnSWNGUPVTlvbDW/eTPEZd80num7wroJjKaYwD9F
	2I1Q==
X-Received: by 10.66.231.42 with SMTP id td10mr70442479pac.98.1433445896635;
	Thu, 04 Jun 2015 12:24:56 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id nm6sm4493240pbc.75.2015.06.04.12.24.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:24:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:24:46 -0700
Message-Id: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/4] python-numpy: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:24:55 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/python/python-numpy/{i586 => x86}/config.h      | 0
 meta/recipes-devtools/python/python-numpy/{i586 => x86}/numpyconfig.h | 0
 meta/recipes-devtools/python/python-numpy_1.7.0.bb                    | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/python-numpy/{i586 => x86}/config.h (100%)
 rename meta/recipes-devtools/python/python-numpy/{i586 => x86}/numpyconfig.h (100%)

diff --git a/meta/recipes-devtools/python/python-numpy/i586/config.h b/meta/recipes-devtools/python/python-numpy/x86/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/i586/config.h
rename to meta/recipes-devtools/python/python-numpy/x86/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h b/meta/recipes-devtools/python/python-numpy/x86/numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h
rename to meta/recipes-devtools/python/python-numpy/x86/numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
index d4fd279..81cdfde 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -26,7 +26,7 @@ CONFIGFILESURI_mipsel = " \
     file://config.h \
     file://numpyconfig.h \
 "
-CONFIGFILESURI_i586 = " \
+CONFIGFILESURI_x86 = " \
     file://config.h \
     file://numpyconfig.h \
 "
-- 
1.9.1


