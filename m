Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PvBi5-0003rS-O8
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 17:49:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p23GlaxW000114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 08:47:36 -0800 (PST)
Received: from localhost.localdomain (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 3 Mar 2011 08:47:36 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Mar 2011 10:47:30 -0600
Message-ID: <a7caf253c8fbd01cdb69ab7f32d41714947073cc.1299170758.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1299170758.git.mark.hatle@windriver.com>
References: <cover.1299170758.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.36.229]
Subject: [PATCH 1/2] poky-env-internal: Add FETCH2 enablement
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
X-List-Received-Date: Thu, 03 Mar 2011 16:49:06 -0000
Content-Type: text/plain

We need to enable the new fetch2 implementation out of bitbake.  Otherwise
we get various errors about SRCPV issues.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/poky-env-internal |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/poky-env-internal b/scripts/poky-env-internal
index 80b7a12..724a6e4 100755
--- a/scripts/poky-env-internal
+++ b/scripts/poky-env-internal
@@ -56,3 +56,5 @@ export BUILDDIR
 export PATH
 
 export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED"
+
+export BBFETCH2=True
-- 
1.7.4



