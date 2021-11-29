Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4993C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:02:20 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.62094.1638198139811816942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TciuKE3p;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198137; i=@fujitsu.com;
	bh=OT9K4tSBqMGBHqzR4H6nGZIxbmpcp3sBNCs2//EKlPE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TciuKE3pYiKcDamysweaRKw6kvTrzp0ExYRw/McpFD6bHcis1IOil6GMhwgajDIwr
	 P254mLikIpOKiKw2RoUMrYTZkmb3XHt52lLF/k+AXNk773Wehm6oY0YFmYZrNFrRFb
	 lTZZ8KcCRVH6tRjKAAgW+Tnsesy0l58Q6xjTBKb/pOHuhzt8IIydLK1IuvAqLWhmsY
	 WAZfmF+Ipv3XaqBKvfrnA5sQNsF/V4MdQ2MTk0jmHukLRMz0oDLqUhVRAp9fHvHOyP
	 krgMUSyPotivB4kHIPOf4Goxmrw/8TFlRUgm+In1+lSmOA+7D/1OpxqqkneaoEP9P1
	 L2Z0lPWhgW0aQ==
Received: from [100.113.7.129] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 50/11-01506-97BE4A16;
 Mon, 29 Nov 2021 15:02:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsViZ8MxSbfi9ZJ
  Eg447lhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bqU0+ZC86KVNz80szSwHhKsIuRi0NI4DGj
  xLa2a0wQznkmiUtTjzNDOCcYJTpnXmXpYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAWuJ7X9fM4OUsAioSnTM1QAJ8wo4S5ze/gKsREJAQWLKw/fMEHFBiZMzn7BAjJGQOP
  jiBTNEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYyWSUWZ6RkluYmZObq
  GBga6hobGuqa6RgaGeolVukl6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMCATClkPbmD
  cdKbD3qHGCU5mJREebOWLEkU4kvKT6nMSCzOiC8qzUktPsQow8GhJMHb/wooJ1iUmp5akZaZA
  4wOmLQEB4+SCG/xC6A0b3FBYm5xZjpE6hRjLMebtUsWMXO8BZNt9+4CyXYwOXPBwdXMHLPA5P
  32Q0DyAZhsnrR8O7MQS15+XqqUOK8oyE4BkKEZpXlwK2GJ4BKjrJQwLyMDA4MQT0FqUW5mCar
  8K0ZxDkYlYV4VkCk8mXklcJe9AjqaCejot0sXgxxdkoiQkmpgqpH5ank5e0foPtFWjdK75w8w
  nanuKVz5S7ysVmqB87r8JTNayjqiNnpsmiOwtMS6c7K3W1TJj6J56ifX5p++WPAskW3+b753Y
  Z91/rDumWDodafbM8jAaaPTGu3z2bvXlKotW2imVPG+3T/3Y+TZLIMTa9Kig/75uvdv/+e+u+
  /vxRPbH7T+ivwQyZlc5tZzRU/uWzePReJVr9KDFa5TT/+sPRH779G3rJK/oZ93cz+rT0ifm19
  b/mrPlgsuPlW7kvYvPNG881yF8Nl/57Yld8Yty2TVufL8/9q07G4t1uV8sv9nTmndubbol0mS
  c+1JV34+FTertQs9qjiEJhmcqTrReVbbiTl8z5dYyUerlViKMxINtZiLihMBpFOZxH8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-245.messagelabs.com!1638198136!28329!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3693 invoked from network); 29 Nov 2021 15:02:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:02:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 38187223C69
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:02:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2B869223C64
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:02:16 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:01:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysklogd: upgrade 2.2.3 -> 2.3.0
Date: Mon, 29 Nov 2021 23:01:45 +0800
Message-ID: <1638198105-119044-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:02:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158949

Changes:
Add support for logger -k, early log to /dev/kmsg. Useful when
logging from early system startup scripts before syslogd has started
Support for extracting non-kernel log messages from /dev/kmsg
Ignore EINVAL from kernel, caused warning message at first startup
Use journald socket on systemd systems, not /dev/log
Issue #38: add support for syslogd -C file to use file for caching
the last seen kernel sequence number, default: /run/syslogd.cache.
Note: syslogd relies on the location of this file to be wiped at
system boot. The default, /run, is a RAM disk on modern systems

Fixes
Issue #34: regression in v2.2.3, causing loss of syslogd log messages
like syslogd v2.2.3: restart.
Issue #35: man pages lists -v as verbose mode, is actually version
Issue #36: retry DNS lookup of remote syslog servers with res_init()
to ensure name resolution at bootup when a remote DNS may temporarily
be unreachable. Retry at most every five seconds, to prevent syslogd
from monopolizing the CPU when emptying the kernel ring buffer
Issue #39: update tests to use -P fn and -C fn
Issue #40: improve documentation for syslogd.cache file requirements
Issue #41: add missing documentation for -H option
Issue #42: add option (-K) to always trust kernel timestamp. By
default syslogd only trusts the kernel timestamp for the initial
emptying of the kernel ring buffer
Issue #43: avoid asserting (exiting) on and around Jan 19, 2038, when
the UNIX epoch wraps around on 32-bit time_t systems
libsyslog: handle EOVERFLOW from gettimeofday() on Jan 19, 2038
Avoid NULL pointers to internal logit() function, only triggered
when in debug mode
Replace \m with \n (missing newline) in logger usage text

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.2.3.bb => sysklogd_2.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.2.3.bb => sysklogd_2.3.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
index f4ecb7d459..0682ec1d63 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1;protocol=https \
            file://sysklogd \
            "
 
-SRCREV = "17b68ca89ab814bb623b615c4e7088d619ed8829"
+SRCREV = "03c2c9c68d5d02675326527774e7e9cba3490ba0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


