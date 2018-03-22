Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 8C38D71C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1591; q=dns/txt; s=iport;
	t=1521741219; x=1522950819;
	h=from:to:cc:subject:date:message-id;
	bh=mHiV8EfKu72bUZ5Kj9+1tRJyMX60JZFPpZ0p3wb2xTk=;
	b=iNG5MXkP0z8NcAgdK004FO01SANEcVEzRIAx6k/TEURw4Zo1ZI3tcTg/
	PYrqWDHgzL7ZC1VAa2s9xbkx6D5GEZzf5AKKHnRiyNld3m9cdnqnZrJSH
	2BKa3Bg8lSh85ixf+3EsGsPS3VcJvrB9xaIhVHuzGhfVH/P7xtcOU76a0 c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAwBv7bNa/5NdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYM9YXAomGeDBJRnCxgNhGCDZSE4FAECAQEBAQEBAmsohSgFZxG?=
	=?us-ascii?q?BCYVWD6xuiD+CDoUvghGCFINegX+BSAMCgieFCQONAop8CIVehRyDeAKBNj+DN?=
	=?us-ascii?q?YdVAYkehkcCERMBgSUzIYFSTSMVRxCCJgmCGBiONh8wAZBZAQE?=
X-IronPort-AV: E=Sophos;i="5.48,345,1517875200"; d="scan'208";a="371250014"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 17:53:38 +0000
Received: from kamensky-w541.cisco.com ([10.24.9.3]) (authenticated bits=0)
	by rcdn-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id w2MHrQEX001227
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Thu, 22 Mar 2018 17:53:37 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 10:53:25 -0700
Message-Id: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH] systemtap runtime test, ping for outstanding systemtap fixes
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
X-List-Received-Date: Thu, 22 Mar 2018 17:53:37 -0000

Hi Folks,

Based on my conversation with Richard during conference please find
patch that does native SystemTap stap basic test. Note it is for native
stap use. It is not SystemTap cross compilation test that Ee Peng
is trying to cover in [1]. Actually, I wrote this small test before
I saw message from Ee Peng for crosstap test, but I did not have
time to post it.

Note native SystemTap stap run on qemu machine only feasible on x86
qemu. IMO it would run too long on qemu target with other CPU types.
Test should be executed against something like core-image-lsb-sdk
image, otherwise it would be skipped.

Also, could someone, if possible, please merge outstanding fixes for
systemtap [2] and [3]. Khem did ack on both a while back. Currently
with 4.15 kernel in openembedded-core systemtap in native or cross
mode is broken. Test I am posting would catch current breakage. When
[3] is applied test would pass.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148972.html

[2] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148348.html

[3] http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148349.html

Thanks,
Victor

Victor Kamensky (1):
  oeqa/runtime/stap.py: add runtime test for systemtap

 meta/lib/oeqa/runtime/cases/stap.py   | 33 +++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/files/hello.stp |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/stap.py
 create mode 100644 meta/lib/oeqa/runtime/files/hello.stp

-- 
2.7.4


