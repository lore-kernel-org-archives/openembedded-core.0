Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTjuQ-0002nr-JK
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 02:12:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5709K3Z009000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 17:09:20 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 6 Jun 2011 17:09:20 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jun 2011 19:19:14 -0500
Message-ID: <0d899ea302e9c441bc9748c71c57b5517526a49a.1307405937.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307405937.git.mark.hatle@windriver.com>
References: <cover.1307405937.git.mark.hatle@windriver.com>
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
X-List-Received-Date: Tue, 07 Jun 2011 00:12:39 -0000
Content-Type: text/plain

Add pseudo to tracking, with me as the maintainer.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 73e6782..3452bcc 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5734,4 +5734,8 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
 RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 
-
+RECIPE_STATUS_pn-pseudo = "green"
+RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
+RECIPE_LAST_UPDATE_pn-pseudo = "June 06, 2011"
+RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
+RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
-- 
1.7.3.4



