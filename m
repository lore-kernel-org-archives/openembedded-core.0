Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48E0960030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 14:07:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8JE7U3l001550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Sep 2014 07:07:30 -0700 (PDT)
Received: from [128.224.20.234] (128.224.20.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Sep 2014 07:07:26 -0700
Message-ID: <541C389C.90202@windriver.com>
Date: Fri, 19 Sep 2014 10:07:24 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, harsh jain
	<harshjain32@gmail.com>, Kang Kai <kai.kang@windriver.com>
References: <CAKuL1XT+=AYT_LVveVWOO2qqoiLwCbi6fP0j_b+xq3aMN7jdSQ@mail.gmail.com>
	<CAJTo0LZZQMBBKRcxpfbOMC2KUWw5ffp=RdBOyymi-wfaq2UL3g@mail.gmail.com>
In-Reply-To: <CAJTo0LZZQMBBKRcxpfbOMC2KUWw5ffp=RdBOyymi-wfaq2UL3g@mail.gmail.com>
X-Originating-IP: [128.224.20.234]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipe file of Python 2.7.4 of later version
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
X-List-Received-Date: Fri, 19 Sep 2014 14:07:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-19 07:37 AM, Burton, Ross wrote:
> On 19 September 2014 12:31, harsh jain <harshjain32@gmail.com> wrote:
>> Python version 2.7.3 is not compatible with AARCH64
>> architecture.Support for AARCH64 is added in 2.7.4 onwards._ctypes.so
>> is not compiled by  2.7.3 python version for AARCH64.
>>
>> 1 ) Can we have recipe file of  2.7.4 or later version. If yes from
>> where i can download.
>> 2 ) There are several other python package which have build dependancy
>> on 2.7.3 version.When I try to install 2.7.4 using custom build recipe
>> file these dependencies give warning message.Is there any global
>> setting in configuration file to solve this issue.
>
> It's past the feature freeze which means we won't merge upgrades, but
> I imagine its fairly simple to identify the patches in 2.7.4 which
> enable aarch64.

Also Kai (CCed) is going to maintain an aarch64 branch on:
   http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-contrib
Kai, let us know when your branch is available; hopefully that
will be early next week.

This branch will be continually rebased on master over the next
month or so and then merged to master after 1.7 is branched.
Patches welcome. They should be submitted here on the oe-core
list with an aarch64 tag in the subject line and CCing Kai please.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

