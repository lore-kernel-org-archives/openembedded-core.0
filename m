Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UIC9x-0003HG-GQ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 07:06:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2K5nAPR025725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 22:49:10 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 19 Mar 2013 22:49:10 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 13:49:14 +0800
Message-ID: <2bece2f261afc378e8c7904d6747b61ae3a51744.1363757343.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363757343.git.Qi.Chen@windriver.com>
References: <cover.1363757343.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] meta-skeleton: specify the correct path to core-image-sato.bb
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
X-List-Received-Date: Wed, 20 Mar 2013 06:06:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

core-image-sato.bb is under recipes-sato instead of recipes-core.
Use the correct path so that it doesn't cause a parse error.

[YOCTO #4055]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../images/core-image-multilib-example.bb          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
index 7703731..f13186f 100644
--- a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
+++ b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
@@ -7,7 +7,7 @@
 #
 
 # First include a base image to base things off
-require recipes-core/images/core-image-sato.bb
+require recipes-sato/images/core-image-sato.bb
 
 # Now add the multilib packages we want to install
 IMAGE_INSTALL += "lib32-bash"
-- 
1.7.9.5



