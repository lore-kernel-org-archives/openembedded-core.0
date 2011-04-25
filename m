Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyA-0003ks-PM
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:14 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so1933578pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GI+Zz9lQ3Mc/42RZKOgNzPm5xHBMk6lwFeQZMoIpWOo=;
	b=NfUwmcxE/E8b9XsYYet0zweebm8mKIkxJ15rz0I7cTCAngK8qY6cueOK/D/caoTt/u
	E7XYuECjmPB+oNxdxJQi2wmU+7DxrWAvLy9SAm1VdO5JrwMtt+piG7hGCRpH4Cvo6UmG
	1WngDlGGPVILyiii9JAivCRioVEAqYVxbTAok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TOJTCEUU7Swk5fNRR6LcaZCIIxtSKg0ywtmOk3kXp4P768y6wkfeDQuizsn4FIFRPg
	zlDmn7GLmVQj8CwJwqWqfbHY6Ia1mytqwl373FqTQh2lilFWOiSldYhCR2VY0Njg6Ixy
	plXdskNYOA+tEgzFVe577y4+ZAJanyMzElyB8=
Received: by 10.143.157.1 with SMTP id j1mr2570617wfo.407.1303757687694;
	Mon, 25 Apr 2011 11:54:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm7236347wfh.8.2011.04.25.11.54.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:41 -0700
Message-Id: <5ef797b38b6ea202b06e3226c2e3cc21a2ea24c4.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 05/17] sstate.bbclass: Reduce SSTATE_MANIFESTS assignment to be weak
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:15 -0000

Distributions can then override this variable if needed
useful e.g. when building uclibc/eglibc both using
same tmpdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index be650c4..553c6a2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,6 +1,6 @@
 SSTATE_VERSION = "2"
 
-SSTATE_MANIFESTS = "${TMPDIR}/sstate-control"
+SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
 
-- 
1.7.4.1



