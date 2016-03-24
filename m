Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEB5606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 09:45:33 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id D9AF668A01A; Thu, 24 Mar 2016 09:45:31 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 0863D68A019;
	Thu, 24 Mar 2016 09:45:30 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 6EC946740554;
	Thu, 24 Mar 2016 10:45:30 +0100 (CET)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56F3B739.3030108@mlbassoc.com>
Date: Thu, 24 Mar 2016 10:45:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: Change in udev
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
X-List-Received-Date: Thu, 24 Mar 2016 09:45:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I know that udev is being replaced by eudev, but there's a new
behavior I don't understand.  There is a new file /etc/udev/hwdb.bin
that is created at runtime:

$ ls -l /etc/udev
total 6548
-rw-r--r-- 1 root root    1785 Jan  9  1970 cache.data
-r--r--r-- 1 root root 6660476 Mar 24 08:21 hwdb.bin
drwxr-xr-x 2 root root    4096 Mar 24 06:42 hwdb.d
-rw-r--r-- 1 root root      51 Mar 24 07:51 mount.blacklist
drwxr-xr-x 2 root root    4096 Mar 24 07:51 mount.blacklist.d
drwxr-xr-x 2 root root    4096 Mar 24 08:21 rules.d
drwxr-xr-x 2 root root    4096 Mar 24 07:51 scripts
-rw-r--r-- 1 root root      49 Mar 24 06:41 udev.conf

Is this [somehow] equivalent to the old udev device cache?
Does it really belong in /etc/udev?  What about read-only roots?

Thanks

n.b. I just noticed because a dump of /etc on my device went
from ~6MB to over 12MB...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

