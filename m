Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UNHGY-0007rW-RK
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 08:33:51 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r336Gcx8003313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2013 23:16:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 2 Apr 2013 23:16:38 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Apr 2013 14:16:48 +0800
Message-ID: <c8760a76b19e232aac96b8679ab905b9b54bf9c1.1364969701.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364969701.git.Qi.Chen@windriver.com>
References: <cover.1364969701.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/2] bitbake.conf: use weaker assignment for IMAGE_OVERHEAD_FACTOR
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
X-List-Received-Date: Wed, 03 Apr 2013 06:33:51 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This allows image recipes to set a default value and still provides
an option for users to override it.

For example, we set a default value in core-image-sato.bb.
    IMAGE_OVERHEAD_FACTOR ?= "2.0"
And users who build sato image could still override it in their distro
conf files or local.conf.

[YOCTO #4109]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cd5d61e..6d947d8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -412,7 +412,7 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
-IMAGE_OVERHEAD_FACTOR ?= "1.3"
+IMAGE_OVERHEAD_FACTOR ??= "1.3"
 # This option allows for adding additional space in K above and beyond what the 
 # IMAGE_OVERHEAD_FACTOR might add. This space is for additional packages, user data, ...
 # To set a fixed size then overriding IMAGE_ROOTFS_SIZE with the max size one wants
-- 
1.7.9.5



