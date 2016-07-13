Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id BB97573185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 03:40:54 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 90E5168A01A; Wed, 13 Jul 2016 04:40:54 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2F6FD68A019;
	Wed, 13 Jul 2016 04:40:52 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id DDE90674034E;
	Wed, 13 Jul 2016 05:40:51 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5785B842.9030804@mlbassoc.com>
Date: Wed, 13 Jul 2016 05:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: GCC recipe using git?
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
X-List-Received-Date: Wed, 13 Jul 2016 03:40:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I see that the gcc-6.x recipe is using git instead of a tarball.
Is there any way to go back to using tar?  I ship mirrored sources
to my customers (many are behind corporate firewalls and have limited
network access).  The file sizes are so vastly different and it's
quite the burden to have to carry around a 2.5GB file...

-rw-rw-r-- 1 gthomas gthomas   95661481 Jun  3 15:54 sources/gcc-5.4.0.tar.bz2
-rw-rw-r-- 1 gthomas gthomas 2525826872 Jul 12 16:42 sources/git2_github.com.gcc-mirror.gcc.tar.gz

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

