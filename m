Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E634B78447
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 06:47:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v716lbtR029418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 31 Jul 2017 23:47:37 -0700
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 23:47:36 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<10079809.XLRr4MJIOn@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <353affee-f839-686a-57e8-789cdbb47c73@windriver.com>
Date: Tue, 1 Aug 2017 14:47:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <10079809.XLRr4MJIOn@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Revive ptest and add result to buildhistory
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
X-List-Received-Date: Tue, 01 Aug 2017 06:47:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/31/2017 09:41 PM, Paul Eggleton wrote:
> On Monday, 31 July 2017 11:50:00 AM CEST Robert Yang wrote:
>> We can get the regression result by:
>> $ git show HEAD ptest_log/pass.fail.skip.*
>>
>> Can we add ptest to default TEST_SUITES, please ?
>
> Is it possible to get an idea of the time impact if we did so?

The ptest cost about 18 minutes (qemux86 +QEMU_USE_KVM) when test
core-image-sato. My host is 32 core * 2.6GHz, and 128G MEM. I didn't
customize qemu settings, just used the default.


I fixed all your comments and put them into the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/ptest
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ptest

Robert Yang (10):
   oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
   runtime/cases/_ptest.py: revive it
   oeqa/utils/logparser.py: add skip status
   runtime/cases/_ptest.py: add skip status
   runtime/cases/_ptest.py: rename it to ptest.py
   utils/logparser.py: fix section check
   core/target/ssh.py: replace decode errors
   buildhistory.bbclass: print message when no commit
   buildhistory.bbclass: add ptest
   testimage.bbclass: update comments

>
> Cheers,
> Paul
>

