Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 186E760D2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 10:21:06 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so6681429eek.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=UN107p287iMUtyRvMcm85gR3HJBhvh510MXo09gT6d0=;
	b=HaPK8do5eOxNU3XGxvO5512N03uWwvsg+Z20KkgC2KnTxEPq31krc6/c1OveU3Jjk3
	UId5kzgTmzdAEouZKzhaU+xe3ieMsITq5VrsreA+tsPWrmh4o1O6hDx18vvV0R1+SiZ5
	1G4fo1488ELGs9J1lgfE75GsYpg9Lc7cJFzC9v4XLHeypY+9XBEwvxYzcgZTEzxeYT3o
	AYEt4eOESHbI32yY1JVnsZeWsVxpgk3uaZnnxiGZkSEkwN0o3E2QIy/gjmC8nYz0UKn4
	1VDnfJxJU4WsxK5MympTTtuHE1PP9XhyBo4nlXeo9phZj4oli6gjVq3A948ez2qzloCh
	3w7Q==
X-Received: by 10.14.182.199 with SMTP id o47mr86830808eem.7.1389003667141;
	Mon, 06 Jan 2014 02:21:07 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm169633459eem.21.2014.01.06.02.21.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jan 2014 02:21:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 11:21:11 +0100
Message-Id: <cover.1389003637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [dora][PATCH 0/2] Dora backports
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
X-List-Received-Date: Mon, 06 Jan 2014 10:21:09 -0000

The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c27353d8:

  libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/dora-backports2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dora-backports2

Martin Jansa (1):
  ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script

Richard Purdie (1):
  eglibc-initial.inc: Drop duplicate include

 meta/conf/distro/include/default-providers.inc     |   2 +
 meta/recipes-core/eglibc/eglibc-initial.inc        |   2 -
 ...tests_noltp.sh-script-so-have-unique-name.patch | 202 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130503.bb          |   4 +-
 4 files changed, 207 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch

-- 
1.8.5.2


