Return-Path: <amery@hanoverdisplays.com>
X-Greylist: delayed 314 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Aug 2017 22:42:33 UTC
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 21E08606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 22:42:33 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Thu, 3 Aug 2017 23:37:20 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Thu, 3 Aug 2017 23:37:01 +0100
Message-ID: <20170803223702.83936-1-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [poky][pyro][PATCH 0/1] backport IFF_LOWER_UP fix for 4.10+musl
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
X-List-Received-Date: Thu, 03 Aug 2017 22:42:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Alejandro Mery <amery@geeks.cl>

This commit cherry-picks a fix already applied to master and accepted upstream

commit: 868486c238780ce4a11d9ec9a38e40cb6c1cfc01

https://patchwork.openembedded.org/patch/141193/

André Draszik (1):
  linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl

 ....h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch | 46 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.10.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch

-- 
2.13.0



