Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1927B6D385
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 07:39:26 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id x18so419977lbi.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=r08TLeRhm7VSqzSa+1uznK1YcdkBO9624Vhglw5SWOA=;
	b=lE8nY+47aayOXQAQgrU7VPIVIbFkXR8aLtQk8IHhDfHG0Zj6TI/1LfVu2hqmz5SSaT
	cWMVbDXd/QGW0pwdS44rdjpvOXJqF/r6/nfYIjsI9zM+51Wb4BFxZA2LJpb6ztZ3eW1k
	xBobE8cxgNNbabIGUG11qP7gNkz9qdJXgMY95uFkTx74MYfAT42VgJOZO86Qpl+3RqPN
	cqaEoI6yF1U5XzPp7k6vw4MsOjwrkGtpdONaK0WHMDLEeTWc2RW5JZ/3gg9riKk1S+4W
	syqfPB8IOvvG4vQe379TBUlZKWfFPri0nfCNkMsQG96rsEDHGeCqljoyVKLTLzM5WXhM
	XG/g==
X-Received: by 10.152.235.8 with SMTP id ui8mr226131lac.55.1382686768261;
	Fri, 25 Oct 2013 00:39:28 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id vx8sm1608726lbb.8.2013.10.25.00.39.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 00:39:27 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZbzR-00083w-IK; Fri, 25 Oct 2013 10:39:25 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2013 10:39:22 +0300
Message-Id: <8ede265b3c8bf399d62482693bc458da694d9aae.1382686685.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
References: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
In-Reply-To: <cover.1382686685.git.cazfi74@gmail.com>
References: <cover.1382686685.git.cazfi74@gmail.com>
Subject: [PATCH 2/4] libcheck: allow build with automake-1.14
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
X-List-Received-Date: Fri, 25 Oct 2013 07:39:27 -0000

Do not consider automake warnings about future incompatibility
errors.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libcheck/libcheck/ignore_automake_warning.patch       | 15 +++++++++++++++
 meta/recipes-support/libcheck/libcheck_0.9.10.bb          |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-support/libcheck/libcheck/ignore_automake_warning.patch

diff --git a/meta/recipes-support/libcheck/libcheck/ignore_automake_warning.patch b/meta/recipes-support/libcheck/libcheck/ignore_automake_warning.patch
new file mode 100644
index 0000000..51c5863
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/ignore_automake_warning.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd check-0.9.10/configure.ac check-0.9.10/configure.ac
+--- check-0.9.10/configure.ac	2013-04-18 13:19:02.000000000 +0300
++++ check-0.9.10/configure.ac	2013-10-25 00:26:43.102413363 +0300
+@@ -26,7 +26,7 @@
+ AC_USE_SYSTEM_EXTENSIONS
+
+ # really severe build strictness
+-AM_INIT_AUTOMAKE([-Wall -Werror gnits 1.9.6])
++AM_INIT_AUTOMAKE([-Wall gnits 1.9.6])
+
+ # From patch 2803433, request system extensions to generate 64-bit safe code
+ AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-support/libcheck/libcheck_0.9.10.bb b/meta/recipes-support/libcheck/libcheck_0.9.10.bb
index a22271a..294b23e 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.10.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.10.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
            file://libcheck_fix_for_automake-1.12.patch \
+           file://ignore_automake_warning.patch \
           "
 
 SRC_URI[md5sum] = "6d10a8efb9a683467b92b3bce97aeb30"
-- 
1.8.4.rc3


