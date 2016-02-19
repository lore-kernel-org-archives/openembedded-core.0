Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5FB606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:34:10 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4A9FA68A01A; Fri, 19 Feb 2016 08:34:11 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id CE0D568A019;
	Fri, 19 Feb 2016 08:34:10 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 759286741E0B;
	Fri, 19 Feb 2016 09:34:10 +0100 (CET)
To: Phil Blundell <pb@pbcl.net>
References: <56C6B83C.3040103@mlbassoc.com> <1455868969.2039.44.camel@pbcl.net>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56C6D382.9090900@mlbassoc.com>
Date: Fri, 19 Feb 2016 09:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455868969.2039.44.camel@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recovering GCC 4.8
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
X-List-Received-Date: Fri, 19 Feb 2016 08:34:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-19 09:02, Phil Blundell wrote:
> On Fri, 2016-02-19 at 07:37 +0100, Gary Thomas wrote:
>> | checking for suffix of object files... configure: error: in
>> `/local/p0381_2016-02-19/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libgcc-initial/4.8.4-r0/gcc-4.8.4/build.arm-amltd-linux-gnueabi.arm-amltd-linux-gnueabi/libgcc':
>> | configure: error: cannot compute suffix of object files: cannot compile
>> | See `config.log' for more details.
>
> I suspect you probably have some or other option set in CC or CFLAGS
> that gcc-4.8 doesn't support.  What does it say in config.log?

It's complaining about an illegal -march=armv7ve, which seems to have
been added since I last built for this machine with GCC 4.8:

commit c6a19917ec5350cdfc4053d14462609782613bbc
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Oct 6 17:08:59 2015 +0200

     arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15

I'll see what I can do with this.  Duh, I should have looked at
the config.log before raising flags!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

