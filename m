Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZn-0005c2-9z
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:31 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=u41WdAXNEc87Bhv22hOCjXZSsar5t31QuszWOTxGvgA=;
	b=Zh3qAZ8GAjGHXtStGKkw7DM4sUg5026S4AxmSu/IgC+/Me16j9zUB+YGdSUXuJTbGS
	+S44fQsPvQz+0PkgZWlazbjPcA3ehcyCbh8VSPvU8+arhVG8NJ5l1JIOhScYfD5NLyfo
	G3po3aOGfmm88XZrhLxGQTq8cpY2mQ0C2c7/2h2LiWZRlkdpTfflDAbx95a3W9F9aeCU
	y6h955BVWuf2MjaSlSK4Ykwy294CMezLcS1P3RTx4TnMpyQYHay5i5qoqgAQ4oUZX+25
	GcCy2YkVcHVZD8lcOU4o69zXUnVwthCYW/M2CEzmN2zgSMOo//nCIYPXHDy3bhP9DtJS
	My2g==
Received: by 10.68.213.101 with SMTP id nr5mr63192278pbc.131.1337571386067;
	Sun, 20 May 2012 20:36:26 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:36 -0700
Message-Id: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 01/14] insane.bbclass: Add mips64{el} to known machines
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
X-List-Received-Date: Mon, 21 May 2012 03:46:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8c4a83a..49e904a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -59,6 +59,8 @@ def package_qa_get_machine_dict():
                         "m68k":       ( 4,     0,    0,          False,         32),
                         "mips":       ( 8,     0,    0,          False,         32),
                         "mipsel":     ( 8,     0,    0,          True,          32),
+                        "mips64":     ( 8,     0,    0,          False,         64),
+                        "mips64el":   ( 8,     0,    0,          True,          64),
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
                         "sparc":      ( 2,     0,    0,          False,         32),
@@ -74,6 +76,8 @@ def package_qa_get_machine_dict():
                         "x86_64":     (  62,     0,    0,          True,          64),
                         "mips":       (   8,     0,    0,          False,         32),
                         "mipsel":     (   8,     0,    0,          True,          32),
+                        "mips64":     (   8,     0,    0,          False,         64),
+                        "mips64el":   (   8,     0,    0,          True,          64),
                         "avr32":      (6317,     0,    0,          False,         32),
 			"sh4":        (42,	 0,    0,          True,          32),
 
-- 
1.7.5.4



