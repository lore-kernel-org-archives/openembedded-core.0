Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDB2771AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 22:34:36 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id x125so72646772pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 14:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Y2tacCLQg0lZ0TPPTInjnTCVxxY4ADUPm+Iw5nwvokk=;
	b=0QxVmdrvcDiSDqYnlPcp5tYh77yC/nINodNr9whFZc65UM1iKKy8tSn7vW+Zwz+euy
	VHkWPULOS1ZmVrmSpZqm6jAh5IVWrQjW8RlZEV42ggv5yev5oKLb/0K6FvthkSGz9HGf
	8XvnP0HPqaV5V+94xvVjf3ZjT7SdHXiML3OcXhjb2uyc4RrzvrEeFjSVEuRp0R/Co3YI
	+e1EZtbNAQq6tZfD5U98fBIf/XVGvcLkY8wIhnUZ4rHC+rxvuK9zw8ZXtzNb0LL8BfnW
	WpBjDhiXigehh8UDLG3vZih/croiJrIydNoXsWHczHUQFR6gfS32ozZPpOn8zIyo90Sn
	s5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y2tacCLQg0lZ0TPPTInjnTCVxxY4ADUPm+Iw5nwvokk=;
	b=EJoDVXno3fmfvrqspgBWLJg0dbj1R9Ehpq4MVRSqNO/bdwfMRb4vteG6bqa1HTbnot
	h299JKBl8bTW5cwd0WFibE4T0womrbCmSTQvdOpxwMw5RkpjTRThARAUWLprDPggROeI
	iOXrLQiydSAe7szRuCBjuAMtvh0YVBKaACY6VUYDoF3kQny7FqWnIZJnvYh4YtOw8LaK
	F2QJtP9dlwEgVUZOrwRr1iQ8LOg8b4QBH9Ofa6LhGR32903LxqnzY9vz6BK1W/928QtK
	Q/U6Z7OhvW8pDWh47XDWIpE3pqwkxRcc4Sh5PgJ3pSaOc6SdGvaO4uMNM08yONl5TZab
	uFGw==
X-Gm-Message-State: AG10YOSC7Sn6omlkY5H+ZUMK4XPjREBcpLWKaCqZ47hlwhvdLniDJVMUnoUIR0kohEagqA==
X-Received: by 10.98.73.205 with SMTP id r74mr33325545pfi.118.1454279677121;
	Sun, 31 Jan 2016 14:34:37 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	16sm38097871pfh.48.2016.01.31.14.34.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 14:34:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 14:34:28 -0800
Message-Id: <cover.1454279467.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [jethro-next 0/1] Pull request for git fixes
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
X-List-Received-Date: Sun, 31 Jan 2016 22:34:36 -0000

From: Armin Kuster <akuster@mvista.com>

This appears to be more of an issue on the server side.

The following changes since commit e3b1402971e6aaff7ba3dd864f786f1c32745bf1:

  glibc-locale: fix QA warning (2016-01-31 11:54:21 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes

Armin Kuster (1):
  git: Security fix CVE-2015-7545

 .../git/git-2.5.0/0008-CVE-2015-7545-1.patch       | 446 +++++++++++++++++++++
 .../git/git-2.5.0/0009-CVE-2015-7545-2.patch       | 112 ++++++
 .../git/git-2.5.0/0010-CVE-2015-7545-3.patch       | 112 ++++++
 .../git/git-2.5.0/0011-CVE-2015-7545-4.patch       | 150 +++++++
 .../git/git-2.5.0/0012-CVE-2015-7545-5.patch       |  69 ++++
 meta/recipes-devtools/git/git_2.5.0.bb             |   8 +
 6 files changed, 897 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch

-- 
2.3.5


