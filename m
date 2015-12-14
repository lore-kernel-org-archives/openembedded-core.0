Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1AED2606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:54:18 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 242a_4f10_21d30d3c_b6d8_4fc0_a0d8_9402dcc4204f;
	Mon, 14 Dec 2015 15:54:15 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 91E72AC0101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:54:14 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	CB08F5842DE for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:54:13 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 14 Dec 2015 15:54:12 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 15:55:20 +0900
Message-ID: <1450076120-18740-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] ltp: Upgrade 20150420 -> 20150903
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
X-List-Received-Date: Mon, 14 Dec 2015 06:54:20 -0000
Content-Type: text/plain

Since the last release 272 patches by 27 authors were merged.

Notable changes are:

    -Network namespace testcases were rewritten from scratch
    -New user namespaces testcases
    -New testcases for various virtual network interfaces
    -New umount2() testcases (for UMOUNT_NOFOLLOW, MNT_EXPIRE and MNT_DETACH flags)
    -New open() testcase (for O_PATH flag)
    -New getrandom() testcases
    -New inotify, cpuset, futex_wake() and recvmsg() regression tests
    -Plus the usual number of fixes and enhancements

https://github.com/linux-test-project/ltp/releases/tag/20150903

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/ltp/{ltp_20150420.bb => ltp_20150903.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20150420.bb => ltp_20150903.bb} (100%)

diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150903.bb
similarity index 100%
rename from meta/recipes-extended/ltp/ltp_20150420.bb
rename to meta/recipes-extended/ltp/ltp_20150903.bb
-- 
1.8.4.2


