Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSJW-0005XZ-87
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:40:50 +0200
Received: by yia28 with SMTP id 28so333929yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yz/u5Knj0WXtQJkUiu+Ch3L9+9C3pZqrBwxQUkPF57o=;
	b=CehuFurAemrlzvTeKTFYSjiYheWwbSjF0sOdcufgby009RXRgaRIJPDU93d7GL+NFJ
	UbR1tVruqS2XSWwrbkC8mrsLICkCuDSLwdJm7zvFwqznhTzfSKn/O0pcVfN74XWut3PO
	r4x+3wy8GeNCKDkRtdlgCwoF8RKLrJCCuIMs8=
Received: by 10.236.136.137 with SMTP id w9mr992253yhi.112.1313534172305;
	Tue, 16 Aug 2011 15:36:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c63sm581513yhe.18.2011.08.16.15.36.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 15:36:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:35:52 -0700
Message-Id: <ded8261127515a76b256d6c8dcbcbae156a19cff.1313533911.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
References: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
In-Reply-To: <cover.1313533911.git.raj.khem@gmail.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] tcf-agent: Add openssl to DEPENDS
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
X-List-Received-Date: Tue, 16 Aug 2011 22:40:50 -0000

It ends in errors like below otherwise

| framework/channel_tcp.c:34:27: fatal error: openssl/ssl.h: No such
file or directory
| compilation terminated.
| make: *** [obj/GNU/Linux/arm/Debug/framework/channel_tcp.o] Error 1
| make: *** Waiting for unfinished jobs....
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index 3f97f69..37591c2 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f
 
 SRCREV = "1855"
 PV = "0.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=agent;proto=http \
            http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.html;name=epl \
@@ -19,7 +19,7 @@ SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=ag
 SRC_URI[epl.md5sum] = "7aa4215a330a0a4f6a1cbf8da1a0879f"
 SRC_URI[epl.sha256sum] = "4fd64aeed340d62a64a8da4b371efe0f6d0d745f4d2dbefacba86c646d36bc72"
 
-DEPENDS = "util-linux"
+DEPENDS = "util-linux openssl"
 RDEPENDS_${PN} = "bash"
 
 S = "${WORKDIR}/agent"
-- 
1.7.5.4



