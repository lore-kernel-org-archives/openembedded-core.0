Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QULfm-0005kh-Me
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 18:32:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p58GShFf001814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jun 2011 09:28:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 8 Jun 2011 09:28:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jun 2011 11:38:46 -0500
Message-ID: <994e815e7306b77e7c84cc9692e757fad8549ea2.1307551015.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307551015.git.mark.hatle@windriver.com>
References: <cover.1307551015.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] distro_tracking_fields.inc: add pseudo
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
X-List-Received-Date: Wed, 08 Jun 2011 16:32:07 -0000
Content-Type: text/plain

Add pseudo to tracking, with me as the maintainer.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 38e0c4d..53dad27 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5754,3 +5754,9 @@ RECIPE_STATUS_pn-gettext = "red"
 RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
 RECIPE_LAST_UPDATE_pn-gettext = "Jun 6, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Jun 7, 2011" 
+
+RECIPE_STATUS_pn-pseudo = "green"
+RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
+RECIPE_LAST_UPDATE_pn-pseudo = "June 06, 2011"
+RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
-- 
1.7.3.4



