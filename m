Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qh5km-0007ZA-KV
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 22:09:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6DK5rJj008774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 13:05:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 13 Jul 2011 13:05:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 15:09:15 -0500
Message-ID: <b9a1119e3bcda45e83325f054bd75376dc864dc3.1310587697.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310587697.git.mark.hatle@windriver.com>
References: <cover.1310587697.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] ncurses: Fix site_config
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
X-List-Received-Date: Wed, 13 Jul 2011 20:09:53 -0000
Content-Type: text/plain

The site_config directory should have been attached to ncurses.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-core/{ => ncurses}/site_config/headers |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/{ => ncurses}/site_config/headers (100%)

diff --git a/meta/recipes-core/site_config/headers b/meta/recipes-core/ncurses/site_config/headers
similarity index 100%
rename from meta/recipes-core/site_config/headers
rename to meta/recipes-core/ncurses/site_config/headers
-- 
1.7.3.4



