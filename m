Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97A206A53D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 02:15:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r552FjkW015455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 19:15:45 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 19:15:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 10:14:03 +0800
Message-ID: <d44bff7891864f66f10641aa7c79522683320b10.1370398286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1370398286.git.liezhi.yang@windriver.com>
References: <cover.1370398286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] defaultsetup.conf: remove INHERIT_INSANE
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
X-List-Received-Date: Wed, 05 Jun 2013 02:15:42 -0000
Content-Type: text/plain

The insane has been inherited by package.bbclass and becomes a
requirement, so we can remove it from defaultsetup.conf.

Note:
You can decide whether to take this patch or not.

[YOCTO #3190]
[YOCTO #4396]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/defaultsetup.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index be28510..5557350 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -17,7 +17,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_INSANE ?= "insane"
 INHERIT_DISTRO ?= "debian devshell sstate license"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_INSANE} ${INHERIT_DISTRO}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
-- 
1.8.1.2


