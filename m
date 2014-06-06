Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBB36FC05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:43:06 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so1338649wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 09:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bbKK7KL3Im0lXX0ZTQ3M1V9LPtRi222VWZ80jhnckHo=;
	b=KilfN053NgtrZQzV6o2rJwWCSdnzjNDmDHy7M2IQp+1wDl2gYppzVv/9YuRs+K/+cr
	kMgE49HmElt3C5tKBL89k7eWyqiKhcDvt2dBcaHA/3m1RMrfoo7j9fL9KmaVanRNHYe8
	vLxkVomWmzXDtP6R4x0PM7RKpy9MFuAaP3ee3j2kW8prhwSD6C24HrGVV0Vv3u5qu770
	dzsPismcLbAzmrdiagWjJuiRuqGPy58iQXf/I9UGjVi61+rFQ3ZjUA47+z0do7fi/iUH
	1/N1wcNVdIf1yVe1XUTN/bIF3qPvSl3qOPQxftqoeYw6pNsbjTWMC75rDyKmisBgcX3l
	Ai4w==
X-Gm-Message-State: ALoCoQl0N08gerGK/0wzpFhUtjS9UoL3JaU7+eldukait8mabkZB1IkPMJM4CnJHKbyq7N9pBIPn
X-Received: by 10.194.2.75 with SMTP id 11mr8886991wjs.48.1402072986859;
	Fri, 06 Jun 2014 09:43:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id l2sm22248091wix.13.2014.06.06.09.43.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 09:43:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 17:43:04 +0100
Message-Id: <1402072984-2180-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mesa: add build-dependency on libxml2-native
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
X-List-Received-Date: Fri, 06 Jun 2014 16:43:08 -0000

glapi/gen needs the libxml2 Python module, but this isn't listed as a build
dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a33b7b5..6503c2d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eac
 INC_PR = "r9"
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native udev"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
-- 
1.7.10.4


