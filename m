Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id D33A1770CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 06:37:50 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 78D0968A01C; Fri, 19 Feb 2016 06:37:49 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id BC47568A019;
	Fri, 19 Feb 2016 06:37:48 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 6D5F36740B17;
	Fri, 19 Feb 2016 07:37:48 +0100 (CET)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56C6B83C.3040103@mlbassoc.com>
Date: Fri, 19 Feb 2016 07:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Recovering GCC 4.8
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
X-List-Received-Date: Fri, 19 Feb 2016 06:37:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I have a need for GCC 4.8 which was recently dropped from OE-core.

commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Nov 11 08:50:02 2015 -0800

     gcc: Drop 4.8

     We have 5.2 and 4.9, we don't really need 4.8 now and it can be moved
     out to other layers if anyone still wants/needs it.

     (From OE-Core rev: 6f98c39418c60b7c0b25b30983d2e5257158a6a4)

I tried to recover this by merging from the parent revision
(poky 2cb1aee04) all of the files mentioned in this change
into my local layer.  Sadly, it does not build, but fails
rather early on (I'm building for Freescale LS1 cortexa7hf)

| checking for arm-amltd-linux-gnueabi-gcc... arm-amltd-linux-gnueabi-gcc  -march=armv7ve -mfpu=neon  -mfloat-abi=hard 
-mcpu=cortex-a7 --sysroot=/local/p0381_2016-02-19/tmp/sysroots/teton-p0381
| checking for suffix of object files... configure: error: in 
`/local/p0381_2016-02-19/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libgcc-initial/4.8.4-r0/gcc-4.8.4/build.arm-amltd-linux-gnueabi.arm-amltd-linux-gnueabi/libgcc':
| configure: error: cannot compute suffix of object files: cannot compile
| See `config.log' for more details.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at 
/local/p0381_2016-02-19/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libgcc-initial/4.8.4-r0/temp/log.do_configure.9193)
ERROR: Task 1484 (/local/poky-cutting-edge/meta-amltd/recipes-devtools/gcc/libgcc-initial_4.8.bb, do_configure) failed 
with exit code '1'

Any ideas how I can get this to build?  I looked for some other
layer to which this might have been moved, but did not find any.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

