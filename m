Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1C-0004v2-Ik
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:30 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zxFZqbdTZUteHK9wzrtHBdQ3XtRAd7JUHmfDAecfkJU=;
	b=Ochlb7HHoers0P2ucTLve2+VAMM724zUfLu0wJsAbNqiMNZVZV3uFxkJ87LSHrvzSk
	2htL3mkuZEl4xnutpFOl6/yP9Uyl/443/zikjxxSmmZE0qmEs4uMV6MyRr+VWLAN3B33
	XDdOPEGpOUpzEzs/02EtnpsM77AT7SomH0Jck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KT+VCXqy8rf7B0J/KhZso4JCuXd384lPwJVaSuWrS4/zx9Dqxs5pJk8JWBlWlRjpbU
	aKH9AVfISEvz9yJ01L1oHfXuexV71Z8G+YpeDUArqxFHQHfjhVQYX+HpS4Jq9xxMse/4
	X4kGDJwHXX121cfL/ucglhEctorb0Dq8pxVDY=
Received: by 10.43.65.14 with SMTP id xk14mr4264016icb.401.1301632171876;
	Thu, 31 Mar 2011 21:29:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm1178522ibx.52.2011.03.31.21.29.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:23 -0700
Message-Id: <9a399396c523241be767b1928330db35da0604d2.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 23/46] flex.inc: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/flex/flex.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 54c400c..01f7571 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -5,11 +5,10 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 
 SECTION = "devel"
 LICENSE = "BSD"
-DEPENDS = "gettext"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
 
-inherit autotools
+inherit autotools gettext
 
 do_install_append_virtclass-native() {
 	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4
-- 
1.7.4.1



