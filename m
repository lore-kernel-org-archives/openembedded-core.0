Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id DD4056B0EB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jul 2013 02:07:13 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so4283782obb.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 19:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=FGwfeZe8quj2DGDmcajqX2Km5GQTfofMxBPxl+JFMpM=;
	b=H7uHdIcV3AXgTa9efGaAwHCBUAyZ9hrdlSjYpWB7derGdWhAngfQgpJh041QOsRQ1Z
	bW8UihCh0rTS9Vp+hOSxeQSXoQL2FMTXmwR8p1gHaxlta4gzvoR6bL7x8tIPTrvEXaOL
	YmIYSLzaNDvvZ0NmM++Vmot8YcgYI9wAUMXrXwfZBwJ/LFvf+n8fiZns6E7Im3xPoku3
	JdIDbatCP24L9tNuyzUJRelEaQ1N12Ke7CJFW3JCvM/7s4r0PWGnjRQGvp50j4tZ7Vnf
	FC34tJqYGQmB6UUGaPQcUBJal/N3DIQNa8R6YZIVqRrak8VRrIBPJLAb74iSbJh9qDEf
	0tfA==
X-Received: by 10.60.155.169 with SMTP id vx9mr16192994oeb.93.1373162834437;
	Sat, 06 Jul 2013 19:07:14 -0700 (PDT)
Received: from localhost.localdomain ([96.44.77.72])
	by mx.google.com with ESMTPSA id
	mq1sm25398536obb.14.2013.07.06.19.07.11 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 19:07:12 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Jul 2013 22:07:05 -0400
Message-Id: <cover.1373162626.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto: update 3.4 to latest -stable
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
X-List-Received-Date: Sun, 07 Jul 2013 02:07:15 -0000

Saul/<patch collectors>,

Here's an update of the 3.4 SRCREVs for the latest 3.4.52 -stable
version. Build and boot tested here for linux-yocto and linux-yocto-rt.

Cheers,

Bruce 

The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

  bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (1):
  linux-yocto/3.4: update to v3.4.52

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.10.4


