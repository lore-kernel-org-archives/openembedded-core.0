Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD0360097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 06:07:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M67snt022343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Oct 2014 23:07:55 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 21 Oct 2014 23:07:54 -0700
Message-ID: <54474949.7090504@windriver.com>
Date: Wed, 22 Oct 2014 14:06:01 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Paul Barker <paul@paulbarker.me.uk>
References: <5444D400.90702@windriver.com>
	<CANyK_8dYLsNqhOcE6ip1_wz1L4XNvun7TdoCtQW9dtgDcDaF+A@mail.gmail.com>
	<CAJTo0Lat7Hz4MXC_8O-BjybiKjbp37k=jpjT2U3sAMDyic4mHg@mail.gmail.com>
In-Reply-To: <CAJTo0Lat7Hz4MXC_8O-BjybiKjbp37k=jpjT2U3sAMDyic4mHg@mail.gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg_svn: update-alternatives fails for "[" and "[[" in busybox
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
X-List-Received-Date: Wed, 22 Oct 2014 06:07:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross and Barker,

You are right and I make a mistake.

Sorry.

Liu Jian


于 2014年10月20日 23:04, Burton, Ross 写道:
> On 20 October 2014 10:40, Paul Barker <paul@paulbarker.me.uk> wrote:
>> This patch looks to be corrupted, opkg_svn.bb no longer exists in
>> oe-core (it's now opkg_0.2.2.bb) and your commit message is very
>> confusing as it references a log file and a path which only exists on
>> your system.
>>
>> What version of poky or oe-core are you sending a patch against? And
>> have you read the contribution guidelines in
>> http://openembedded.org/wiki/Commit_Patch_Message_Guidelines and
>> http://openembedded.org/wiki/Styleguide?
> Specifically the patch is missing an Upstream-Status tag, and as opkg
> is part of the Yocto Project this should be Backport as obviously we'd
> fix our own software instead of patching it.
>
> Ross
>

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


