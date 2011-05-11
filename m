Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKBoQ-0006ZG-BM
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:58:58 +0200
Received: by fxm19 with SMTP id 19so520705fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=0FHzoI/LKgvvq+lCQ6M+A/mfK9we6yauOKWXUQAbFe8=;
	b=v2Vpz9BGbg1o0vMYuo6TwXHbrdKYePyuaW9BcuRR2U4YT8GD+eT/XQvSO0vT7hhVOW
	/DJCjTLxDlzIuyAST4GTSEdfQs8jDxbSWAO/vCsQdns3ugXszbiiQt/AT8nzP/D559gX
	XXlemdF62YIW9OycDlQpUKIJoHHNHa4iabhFQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Set3fwweR3V2WVFtOARkkpkyrFB1GJeLio0xdrbFIJ2I2WhfjIDQo8folQ188pGJMc
	P/LzidlrqBDia3r6TK7TUiHDE0r64BReSxIldi8LX7ZEG4zqxXVq4CO/TMkbTdH8tlNL
	jyxunsrKM+HWz2IgZqDTTzivgZa3FZ3DxxoPc=
Received: by 10.223.94.129 with SMTP id z1mr1409249fam.144.1305129371562;
	Wed, 11 May 2011 08:56:11 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id p16sm133930fax.45.2011.05.11.08.56.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 08:56:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2011 17:55:54 +0200
Message-Id: <1305129354-10365-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] tcmode-default: lock also versions for eglibc
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
X-List-Received-Date: Wed, 11 May 2011 15:58:58 -0000

* there is section for glibc but eglibc was missing

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 84d75f4..1b39ae0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,6 +20,7 @@ GCCVERSION ?= "4.5.1"
 SDKGCCVERSION ?= "4.5.1"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
+EGLIBCVERSION ?= "2.12"
 LINUXLIBCVERSION ?= "2.6.37.2"
 
 # Temporary preferred version overrides for PPC
@@ -47,6 +48,11 @@ PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-nativesdk ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial-nativesdk ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-initial-nativesdk ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_cross-localedef-native   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_elfutils ?= "0.148"
 # don't use version earlier than 1.4 for gzip-native, as it's necessary for
 # some packages using an archive format incompatible with earlier gzip
-- 
1.7.5.rc3



