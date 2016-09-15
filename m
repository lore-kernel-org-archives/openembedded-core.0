Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDE37719B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:30:39 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 094FC68A01C; Thu, 15 Sep 2016 12:30:38 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id B0DAC68A019;
	Thu, 15 Sep 2016 12:30:38 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 54E93674035A;
	Thu, 15 Sep 2016 13:30:38 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
Date: Thu, 15 Sep 2016 13:30:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: Crazy display
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
X-List-Received-Date: Thu, 15 Sep 2016 11:30:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I haven't seen this before, just thought I'd toss it out there.
I was doing a build (actually three in parallel in separate
windows on my build box) and noticed this:

Currently  3 running tasks (3282 of 5081)  64% |################################################### 
        |
0: busybox-1.24.1-r0 do_compile (pid 29425)
Currently  3 running tasks (3283 of 5081)  64% |################################################### 
        |
Currently  3 running tasks (3429 of 5081)  67% |##################################################### 
        |
0: gstreamer1.0-libav-1.8.3-r0 do_configure (pid 10393)
Currently  1 running tasks (3560 of 5081)  70% |######################################################## 
        |
0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
Currently  3 running tasks (3601 of 5081)  70% |######################################################## 
        |
0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
1: gdk-pixbuf-2.34.0-r0 do_package_write_ipk (pid 12673)
2: unifdef-native-2.11-r0 do_populate_lic (pid 24548)

Somehow the task tracker (that does a nice job of telling the user
what's going on without being overwhelming BTW) got very confused!

I doubt if I can every repeat this, just passing on the observation!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

