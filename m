Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7804D6D011
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 18:36:29 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so993628eaj.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 10:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Ym+NqvDrvbHCIe13SYsBIyjXz/7qMcFUjgXK0TPml/c=;
	b=nfCs3yz8+t1ryCswAJ6bWQ73g3TKVyF1k81cZm6wgFpKKbTTVKXGWHHLZ6Yd04KxgP
	/Z+kMzJfyRd4QVlvpPOPhFMHzzkBkAx2EM73ZzWTiQpjf3JfvyR8GWPkKk+35QyaMW29
	05M5yWN7WQgnu8W+S2Qbqm4WKuHfn7/60TW7o1al43l8jIt9JAdfE6AqCEp236tz0G5D
	KVHOCMTMbBwYgFn7IFJCVSbhEWkaesyGnS+xXtxh5nZ8XlMyB28AwvkiteO5rC3wnIsF
	+ilh25xERqCpZlNRElRa4UVBXVBK16eNURNJikdTOEdo2f+6SaL2r3DTx1dbs0T7Ngb1
	0S0A==
X-Received: by 10.14.110.134 with SMTP id u6mr27838505eeg.87.1389206189867;
	Wed, 08 Jan 2014 10:36:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm10748038eex.19.2014.01.08.10.36.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 10:36:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 19:36:33 +0100
Message-Id: <cover.1389206129.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [dora][PATCH 0/4] Dora backports
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
X-List-Received-Date: Wed, 08 Jan 2014 18:36:30 -0000

The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c27353d8:

  libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/dora-backports2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dora-backports2

Martin Jansa (1):
  ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script

Mike Crowe (2):
  Revert "kernel.bbclass: move bundle_initramfs after
    kernel_link_vmlinux"
  kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and fix
    race

Richard Purdie (1):
  eglibc-initial.inc: Drop duplicate include

 meta/classes/kernel.bbclass                        |  24 +--
 meta/conf/distro/include/default-providers.inc     |   2 +
 meta/recipes-core/eglibc/eglibc-initial.inc        |   2 -
 ...tests_noltp.sh-script-so-have-unique-name.patch | 202 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130503.bb          |   4 +-
 5 files changed, 219 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch

-- 
1.8.5.2


