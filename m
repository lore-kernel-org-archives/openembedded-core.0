Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyM-0003op-2e
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:26 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1388561pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FrgW1LEJkjxIo/TIruVrLmAYBOld7kTGOiXt45R9K3E=;
	b=V1uBmXbpswfdsVigp85rEVUhkNI6dWe3LaX52sW+kBbQKSo4fDXGwCHGXecFhqgncd
	bdZ1alYuSth0mfn3hhwwW35WuY7ByIzYwvw4AgRnrm13xFRDE1t9Nz9UDWf3PaDLjYGc
	gq2/EkA/QJTdKz0To36wffipAH4uWAeL8Cr30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vvbYeYXmv+q/vOXGCUb0zpILQBs7KtZV83oLGsHjmb0RlLJC48KyIefyXkqwFa8V8v
	40ikI0pq+RuS4NTJMlRJrLzjcOEvtXRM6FIJbD8bw6CfMLYJwq+/D48f79r6tuj31/jd
	GsNGvKogtRsc8SOT6S6zA49pNkfQKKbQ9vnRg=
Received: by 10.68.20.131 with SMTP id n3mr6784996pbe.445.1303757698735;
	Mon, 25 Apr 2011 11:54:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h7sm4055789pbg.74.2011.04.25.11.54.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:53 -0700
Message-Id: <109a960d839b8caf823e1a098aef8ef61aa5ba13.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 08/17] poky-default.inc: Weakly assign gettext to provide virtual/gettext
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/poky-default.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/poky-default.inc b/meta/conf/distro/include/poky-default.inc
index 3ec5e1d..91985b3 100644
--- a/meta/conf/distro/include/poky-default.inc
+++ b/meta/conf/distro/include/poky-default.inc
@@ -14,6 +14,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${POKYLIBC}-initial"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?= "${POKYLIBC}-nativesdk"
 
+PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.5.1"
 SDKGCCVERSION ?= "4.5.1"
-- 
1.7.4.1



