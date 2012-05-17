Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SVAY7-0002nD-Sr
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 01:56:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4HNk0fR026393
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 16:46:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 May 2012 16:45:59 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 18:45:58 -0500
Message-ID: <3b40004786e28acad94dbb4e059c51f792f508a3.1337298285.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337298285.git.peter.seebach@windriver.com>
References: <cover.1337298285.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: Attach the missing value to a format string.
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
X-List-Received-Date: Thu, 17 May 2012 23:56:04 -0000
Content-Type: text/plain

The tuning changes to sanity.bbclass were almost right, but one of
the messages had a %s with no % operator.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ff3c413..2bb0266 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -47,7 +47,7 @@ def check_toolchain_tune(data, tune, multilib):
             tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
                 (tune, tuneabi))
     if tune_errors:
-        return "Tuning '%s' has the following errors:\n" + '\n'.join(tune_errors)
+        return "Tuning '%s' has the following errors:\n" % tune + '\n'.join(tune_errors)
 
 def check_toolchain(data):
     tune_error_set = []
-- 
1.7.0.4



