Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from 92m-galaxy.eurogiciel.fr (mailhost2.eurogiciel.fr [93.17.39.83])
	by mail.openembedded.org (Postfix) with SMTP id BAA336CC88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:08:49 +0000 (UTC)
Received: from 31l-syracuse.eurogiciel.fr ([172.16.88.4]) by
	92m-galaxy.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Oct 2013 16:08:47 +0200
Received: from intel13.vannes ([172.16.100.253]) by 31l-syracuse.eurogiciel.fr
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Oct 2013 16:08:46 +0200
From: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2013 16:08:38 +0200
Message-Id: <1381759718-11554-3-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-OriginalArrivalTime: 14 Oct 2013 14:08:46.0837 (UTC)
	FILETIME=[E6132250:01CEC8E6]
Subject: [PATCH v4 3/3] Weston-init : changes for 1.3.0 version
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
X-List-Received-Date: Mon, 14 Oct 2013 14:08:50 -0000

added "weston-launch -u root" instead of weston due to new weston 1.3.0 version behavior
Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
---
 meta/recipes-graphics/wayland/weston-init/init |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index daa7f23..ca6cce5 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -34,7 +34,7 @@ case "$1" in
                 chmod 0700 $XDG_RUNTIME_DIR
         fi
 
-        weston
+        weston-launch -u root
   ;;
 
   stop)
-- 
1.7.10.4


