Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C864760797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 12:29:30 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 205AE68A019; Tue, 23 Aug 2016 13:29:29 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id A098C68A019;
	Tue, 23 Aug 2016 13:29:27 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 55E61674024E;
	Tue, 23 Aug 2016 14:29:27 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20160823012731.22993-1-raj.khem@gmail.com>
	<39624d78-d684-3ab5-7287-8e1f526d37d5@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <0b221b07-9c5f-c28c-c082-7eb7510c5e17@mlbassoc.com>
Date: Tue, 23 Aug 2016 14:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <39624d78-d684-3ab5-7287-8e1f526d37d5@linux.intel.com>
Subject: Re: [PATCH] gcc: Update to final 6.2.0 release
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
X-List-Received-Date: Tue, 23 Aug 2016 12:29:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-23 14:13, Alexander Kanavin wrote:
> On 08/23/2016 04:27 AM, Khem Raj wrote:
>> -#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
>> +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
>>  #SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
>>  #BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
>> -BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
>> +#BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
>> -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}${SNAP}"
>> +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
>>  B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>
> The commented out lines should be dropped, they're just clutter.

Also, how "final" is it when the URL points to a "xxx-RC-yyy"?  Seems
a bit premature...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

