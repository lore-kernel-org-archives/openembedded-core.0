Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEC661485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:10:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1UuNkx-00063L-G5 for openembedded-core@lists.openembedded.org;
	Wed, 03 Jul 2013 16:10:03 +0200
Received: from 2-227-90-218.ip185.fastwebnet.it ([2.227.90.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 16:10:03 +0200
Received: from f.deldegan by 2-227-90-218.ip185.fastwebnet.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 16:10:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Francesco Del Degan <f.deldegan@endian.com>
Date: Wed, 03 Jul 2013 16:09:04 +0200
Message-ID: <87r4ffenwf.fsf@endian.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 2-227-90-218.ip185.fastwebnet.it
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
Cancel-Lock: sha1:cmBTUm4eE3s8N/1cNEHViythYUo=
Subject: [PATCH] openssl: fix init.d restart function
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
X-List-Received-Date: Wed, 03 Jul 2013 14:10:05 -0000
Content-Type: text/plain


Adds a missing dash in the oknodo option function.

Signed-off-by: Francesco Del Degan <f.deldegan@endian.com>
---
 meta/recipes-connectivity/openssh/openssh-6.1p1/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.1p1/init
b/meta/recipes-connectivity/openssh/openssh-6.1p1/init
index cde52ef..6beec84 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.1p1/init
+++ b/meta/recipes-connectivity/openssh/openssh-6.1p1/init
@@ -76,7 +76,7 @@ case "$1" in
         check_keys
         check_config
         echo -n "Restarting OpenBSD Secure Shell server: sshd"
-        start-stop-daemon -K -oknodo -x /usr/sbin/sshd
+        start-stop-daemon -K --oknodo -x /usr/sbin/sshd
         check_for_no_start
         check_privsep_dir
         sleep 2
-- 
1.8.1.2



