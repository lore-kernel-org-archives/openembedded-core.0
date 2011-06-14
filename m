Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWMBj-0000Eg-Kf
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 07:29:22 +0200
Received: by pvc30 with SMTP id 30so2575441pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=6BgkTpKQWkYqey3CX1+gZYdLYbV75CrFCJpJifiCffo=;
	b=SU2gLKjGRzIX80zVcGowM3SYq9VG+9bDX5IOV2xF5iFH2i6CV0Hz8X+bpGiiSbo4x7
	51qIrlm/6o1mgkEfRyb0uGPlAPyU/gaJAgmCrlfPTmwcZUJnqfwP+lNlQDX2UZaj95jx
	C1hgm8X3R+KkDvVXUgv1ozeqYo1warbfYAP64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ij8vCbidqDUrWU5rJku6A6EaqdRZbAuA8w/+swUeiVoIMbpUsAjdJT6Qu+t+FVnwC3
	+yrs8H2/dmoBPC0+xhPfo9F/Fvg0W+Dj56IV+UGrxl73BiDXnQmP0ZvCgR8fYOJwLdTR
	KGGURLIyusrO538wBmURxS15Kdnv79RaawqR0=
Received: by 10.68.69.101 with SMTP id d5mr2814330pbu.139.1308029153881;
	Mon, 13 Jun 2011 22:25:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm5260864pbk.36.2011.06.13.22.25.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 22:25:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jun 2011 22:25:30 -0700
Message-Id: <1308029130-29774-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] allarch.bbclass: Set FEED_ARCH to 'allarch'
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
X-List-Received-Date: Tue, 14 Jun 2011 05:29:22 -0000

PACKAGE_ARCH is set to BASE_PACKAGE_ARCH so we do not
need to define it here since we already define BASE_PACKAGE_ARCH

Additionally set FEED_ARCH to 'allarch' some distros e.g.
angstrom sets FEED_ARCH like

FEED_ARCH ?= "${BASE_PACKAGE_ARCH}"

and 'all' doesnt go well for FEED_ARCH as it ends up with
parsing error for x86 machines.

This might be a latent bug in bitbake but allarch.bbclass
excavated it and we burry it in the same class.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/allarch.bbclass |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index e3ac392..971cb92 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -2,9 +2,8 @@
 # This class is used for architecture independent recipes/data files (usally scripts)
 #
 
-BASE_PACKAGE_ARCH = "all"
-PACKAGE_ARCH = "all"
-
+BASE_PACKAGE_ARCH = "allarch"
+FEED_ARCH = "allarch"
 # No need for virtual/libc or a cross compiler
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.4.1



