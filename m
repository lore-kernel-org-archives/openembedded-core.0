Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2O-0005B8-Jq
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:46 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so849885pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8sfq4sGIgvyHQEzBgvEGieFkKrCRXP+HM3g4i10uIpQ=;
	b=swM6RlE0wtuCjwIJy0AEFDiDxUX5qQpv3JVHf73KZzRPYfCQiwEEo4l6U30yXifylC
	W4IKIAZoeAlIArWbQBJIwwfFoRBleogHZmIbbTO7qQOxAcoJ9R2x2FL9pCYJPu034VVO
	quASVY5vmcH4jWqPshJGfwgS/m+/M6vGRS9bY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=du7/wPSOy8spIMwTdBm/SslcBjINFcV29zo5DiDsv+F3n/Y2vfHI76zmKdcvixNKtw
	Z5F+jYrtpvCpvGd/2Bv7aiWYv2fG9tJSneqWOxWUexYN3jLtpftdwtR4JBouHm8RZRKg
	Y+9Ghls4tjjIrLdun+1MJ8R30kwDTxfS/LFZo=
Received: by 10.143.137.5 with SMTP id p5mr2780385wfn.403.1301632245756;
	Thu, 31 Mar 2011 21:30:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm2388900wfl.11.2011.03.31.21.30.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:37 -0700
Message-Id: <912a80a22f5e966e03f5205d605e646587726846.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 44/46] libcap.inc: Pass SYSTEM_HEADERS to make
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:46 -0000

Libpcap reports faulures in finding headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libcap/libcap.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 66730b8..a1c93f1 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -18,7 +18,7 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= lib=lib"
+EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= lib=lib SYSTEM_HEADERS=${STAGING_INCDIR}"
 EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= lib=lib"
 
 do_compile() {
-- 
1.7.4.1



