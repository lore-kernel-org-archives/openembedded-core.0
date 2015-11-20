Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B705A60112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:16 +0000 (UTC)
Received: by igl9 with SMTP id 9so20478955igl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vO40+fPSyEgdLu4L6qQwt9mLuWQ20pJeaGq8VRW5Q70=;
	b=pLFFnm4BrPw9TVaIHrLtD0lC6fEnuPdbFOfAz1s8YvuESOGrllHIkAxHi3CT4+F8eL
	bdDmexDuPTnRVg09n/s6y2Rdxm/lYyERv0ypHjIbYisJ1bs1Z1f6KcAB5DpUa75LU852
	ZLpud15JNXxirI6fXioe3ReZY3sj88JPY7+2zWQJdRagDGH5xE+CEKdg2qmzQaiq/85L
	+7jLJ3J5SBR7bKkwrnkFN6lfh7NlF8KeQYTtV2XDlmKDPXh1U50rJx0s3+SFNYnXsnKj
	rXDqE7x920xzTnpgxxVdWkxPpgOKRpCA2eH086vNcJ4Fy0W2V/tvleaj/ORRNIE0r5Gu
	ejtw==
X-Received: by 10.50.155.73 with SMTP id vu9mr4292051igb.89.1448059457343;
	Fri, 20 Nov 2015 14:44:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:49 -0800
Message-Id: <1448059438-24431-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 02/11] busybox.inc: don't export EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:17 -0000

EXTRA_OEMAKE is private to OE and shouldn't be exported to
the busybox build.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index cfdea30..9e1a207 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -17,7 +17,8 @@ BUSYBOX_SPLIT_SUID ?= "1"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
-export EXTRA_OEMAKE += "'LD=${CCLD}'"
+
+EXTRA_OEMAKE += "LD='${CCLD}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
-- 
1.9.1


