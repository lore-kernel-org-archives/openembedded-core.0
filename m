Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0m4K-00030w-3W
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 04:43:40 +0100
Received: by mail-pw0-f47.google.com with SMTP id rp12so199116pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 19:35:19 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.218.161 as permitted sender) client-ip=10.68.218.161; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.218.161 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.218.161])
	by 10.68.218.161 with SMTP id ph1mr2042438pbc.107.1330054519969
	(num_hops = 1); Thu, 23 Feb 2012 19:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=F0oopb3UpWdTBvARnwVndWncJE4PcaT428o3rODWTvw=;
	b=exKh4MbbLpzrhUcpTkJf7sIBD+09ZkhjTnpbfnRxjQ7SZDTgtEVe7EIiJ/+2zG+8X3
	6MgC3fAJC/ibG56krZWPMsywpbYk8sCysfiphlGwrfc+QFaMjH1J5OwDhuR2bD0vjcaO
	qDiRX0gI/0BQaeAHGwU+WZgvvUoZXJwosCie4=
Received: by 10.68.218.161 with SMTP id ph1mr1706863pbc.107.1330054519936;
	Thu, 23 Feb 2012 19:35:19 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id x3sm3155131pbn.5.2012.02.23.19.35.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 19:35:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:33:52 -0800
Message-Id: <bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8c8ecaccdb0df61b8c734b3db79bed2cc4f05445.1330053959.git.raj.khem@gmail.com>
References: <8c8ecaccdb0df61b8c734b3db79bed2cc4f05445.1330053959.git.raj.khem@gmail.com>
In-Reply-To: <cover.1330053959.git.raj.khem@gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
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
X-List-Received-Date: Fri, 24 Feb 2012 03:43:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 16b3108..dba204e 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -41,6 +41,13 @@ NO32LIBS ??= "1"
 
 # Default to emitting logfiles if a build fails.
 BBINCLUDELOGS ??= "yes"
+
+# dummy distro related variables
+# they should be overridden by real distros
+# these fallbacks only serve the purpose of
+# oe-core standalone testability
+
+DISTRO ??= ""
 SDK_VERSION ??= "oe-core.0"
 DISTRO_VERSION ??= "oe-core.0"
 
-- 
1.7.5.4



