Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1S4zeZ-0006mU-3d
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 20:02:31 +0100
Received: by yhjj56 with SMTP id j56so2376184yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 10:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jefflance01@gmail.com designates
	10.236.201.233 as permitted sender) client-ip=10.236.201.233; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jefflance01@gmail.com
	designates 10.236.201.233 as permitted sender)
	smtp.mail=jefflance01@gmail.com;
	dkim=pass header.i=jefflance01@gmail.com
Received: from mr.google.com ([10.236.201.233])
	by 10.236.201.233 with SMTP id b69mr36130813yho.71.1331060034735
	(num_hops = 1); Tue, 06 Mar 2012 10:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D87zzIDWr+KIKFiJsUw3dsDqnfUUPpzF1QKbTXhew10=;
	b=zWhv4VPCOrP+rzSil0vRpzGOSEio3CUa5BDbTwPGjX2+Hp3d6xT7wL+xWxfIrCFT9V
	ego4fxKz3xK9JrofQhKtKsHlu7SzVjAfwnzRtBL9NPp716HF/5+Qg5cy0aiYoL1GZrHn
	qwoIPfvPw2MgUJSLRlOaBPQmGsJ/8U4JrjXuNANzEJ8CIxdi7XxRGJHRevH5fskqY4js
	DYRZwFqD7OutJp6+W1+V9KkDLpk+N4CaDETw4NBEGogjh1px5XZrbxH65zpSCR3J/i0v
	LYppYmv5mS0BC4IzM27nQMInM7IXWUK2lB0KRaQ9mpEZTx4DlKsZgZxZ+kM4lhw/8G3Y
	gzYA==
Received: by 10.236.201.233 with SMTP id b69mr28630407yho.71.1331060034213;
	Tue, 06 Mar 2012 10:53:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id h30sm51224065yhk.4.2012.03.06.10.53.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 10:53:53 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 12:53:49 -0600
Message-Id: <1331060029-6748-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1 v2] trace-cmd: modifying License information
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
X-List-Received-Date: Tue, 06 Mar 2012 19:02:31 -0000

* Adding "GPLv2 & LGPLv2.1" to create a dual license to cover the libraries.
* Bump up PR

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Updated in version 2:
  Added '&' to indicate both licenses apply
---
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index d40dc6e..7f6f6cf 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -1,10 +1,12 @@
 DESCRIPTION = "User interface to Ftrace"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
+                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
+                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://trace-input.c;beginline=5;endine=8;md5=c9c405aaf5cfc09582ec83cf6e83a020"
 
 SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
-PR = "r1"
+PR = "r2"
 PV = "1.2+git${SRCPV}"
 
 inherit pkgconfig
-- 
1.7.0.4



