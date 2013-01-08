Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TsUJj-0002Oi-Ss
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 09:13:53 +0100
Received: by mail-we0-f178.google.com with SMTP id x43so82837wey.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=PsWFv1KdMuWrUVF8Ekxw/1VO4fafWwvyhShux9GLHVA=;
	b=mWRFu5HXJkpKj9m0VoxXbCuWsDpIRDIxc1LRQ7ETtGpfP7vqy/lFis7t1yCuAtGutT
	if2M76JU4IJ8NO50Zb2Nsk9OyVPKX2H5IysOe1QqyEk2ILH2zp0mwB/F/yR8UzJrsfgL
	rxh6vm6LNc1bLXpqYC7XWbNk9HoNzfnLkDkRfjtQcMWLGZO64YHiAsW0qvu11fJIVbUA
	YFgT7GlugwWABAv/GAFjzU3oryUfjkZ1h0T9efRoYK7F4Lw14lhB0ugybmbRcPZfpSEt
	0nbr2kCXpSxMnMkKsxgtZrzpgGPnpSJbswiISwgnyNsol+b8TlVPM5AiO3pb6ZVoEBy5
	Tu7w==
X-Received: by 10.180.82.170 with SMTP id j10mr13238025wiy.2.1357631921680;
	Mon, 07 Jan 2013 23:58:41 -0800 (PST)
Received: from localhost.localdomain ([83.137.143.222])
	by mx.google.com with ESMTPS id eo10sm17267195wib.9.2013.01.07.23.58.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:58:39 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:58:15 +0100
Message-Id: <1357631895-9535-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Frans Meulenbroeks <frans.meulenbroeks@axon.tv>,
	Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH] inotify-tools: new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 08:13:55 -0000

From: Frans Meulenbroeks <frans.meulenbroeks@axon.tv>

- mostly taken from oe classic
- updated to latest version (3.14)
- adopted for new home location (project moved from sourceforge to github)

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

This patch is provided as is, in the hope that is it useful for someone.
I have no plans to become the maintainer of this recipe or so.

I was not too sure if this is something for oe-core or better suited for meta-oe
The patch is against oe-core.
I've also decided to put it in recipes-extended.

If there is a better layer than oe-core or a better dir than recipes-extended feel free
to put it in a more appropriate location.
(and if you do not like it, feel free to ignore)

Have fun!
Frans

 .../inotify-tools/inotify-tools_3.14.bb            |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/inotify-tools/inotify-tools_3.14.bb

diff --git a/meta/recipes-extended/inotify-tools/inotify-tools_3.14.bb b/meta/recipes-extended/inotify-tools/inotify-tools_3.14.bb
new file mode 100644
index 0000000..3597225
--- /dev/null
+++ b/meta/recipes-extended/inotify-tools/inotify-tools_3.14.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "command line utilities for the Linux inotify filesystem change notification system."
+AUTHOR = "Rohan McGovern"
+HOMEPAGE = "https://github.com/rvoicilas/inotify-tools/wiki"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
+
+PR = "r0"
+
+SRC_URI = "http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-${PV}.tar.gz"
+
+EXTRA_OECONF = "--disable-doxygen"
+
+inherit autotools
+
+SRC_URI[md5sum] = "b43d95a0fa8c45f8bab3aec9672cf30c"
+SRC_URI[sha256sum] = "222bcca8893d7bf8a1ce207fb39ceead5233b5015623d099392e95197676c92f"
-- 
1.7.0.4



