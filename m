Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJa3-0005c2-An
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:47 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IQ2B4yAFRrGss/znDo3Y9XEGL2g36YmOynXXjBaKgFc=;
	b=rIdUZb6eFvgKww6JumXZQ0mEKppPdx5Tntlj+IxK8yo6F+NWmGSpEHctjoVyKYEqoF
	ZDf2hQhngjOjreF7C9x4yEyD6OoFJAVoTErsP6XLqC6kcd8SH40t52bZqqxl3ENQDJt6
	bGj2MzOmV5RbdG8AqeJ3Ben6q4Z9/RtAAqwS1IqPf1H5xD1/aAFuzdQNkJZGJlnIPAgQ
	JsEQ6oS9GKgtpQqSiEdFL3fnm24jLLg6Tlt3B3weSS1p1lCr2IVhdYALyteMHruO9HKR
	rQcWHMoWiNGgqxhX/mjjO/KQ074A4xYCjYOyyWcswlxyzYT9oZq0kuMA6OtEiLOxF5dy
	j9nw==
Received: by 10.68.242.162 with SMTP id wr2mr17970102pbc.125.1337571402282;
	Sun, 20 May 2012 20:36:42 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:47 -0700
Message-Id: <e6333825c3482a559a0c0499e17f8f48d3042ddf.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 12/14] tune-mips64.inc: Add new tune file for mips64 big-endian
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
X-List-Received-Date: Mon, 21 May 2012 03:46:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-mips64.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-mips64.inc

diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
new file mode 100644
index 0000000..ba79e2b
--- /dev/null
+++ b/meta/conf/machine/include/tune-mips64.inc
@@ -0,0 +1,3 @@
+DEFAULTTUNE ?= "mips64"
+
+require conf/machine/include/mips/arch-mips.inc
-- 
1.7.5.4



