Received: from smtp12.smtpout.orange.fr ([80.12.242.134]
	helo=smtp.smtpout.orange.fr) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UV8Fd-0002pO-Ui
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 00:33:22 +0200
Received: from localhost.localdomain ([10.163.22.217]) by mwinf5d35 with ME
	id Ty831l00D4h1lPN03y84tE; Thu, 25 Apr 2013 00:08:05 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 00:08:02 +0200
Message-Id: <1366841282-9445-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1366841282-9445-1-git-send-email-eric@eukrea.com>
References: <1366841282-9445-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dpkg: update to 1.16.10
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
X-List-Received-Date: Wed, 24 Apr 2013 22:33:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.16.9.bb => dpkg_1.16.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.16.9.bb => dpkg_1.16.10.bb} (71%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
similarity index 71%
rename from meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
index 9ae4042..309c17c 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://noman.patch \
             file://fix-timestamps.patch \
             file://remove-tar-no-timestamp.patch"
 
-SRC_URI[md5sum] = "4df9319b2d17e19cdb6fe94dacee44da"
-SRC_URI[sha256sum] = "73cd7fba4e54acddd645346b4bc517030b9c35938e82215d3eeb8b4e7af26b7a"
+SRC_URI[md5sum] = "a20a06a5272717274a8b009368f237da"
+SRC_URI[sha256sum] = "aeaacf0884039940d9463901102194f9a42eb5702157b9e7a23f43e0d9f65cf2"
 
 PR = "${INC_PR}.0"
-- 
1.7.11.7



