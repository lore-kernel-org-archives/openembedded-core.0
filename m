Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S8PvY-0002m0-Vf
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 06:42:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Mar 2012 22:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121538094"
Received: from unknown (HELO envy.home) ([10.255.15.211])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 22:33:24 -0700
Message-ID: <4F62D078.1090902@linux.intel.com>
Date: Thu, 15 Mar 2012 22:32:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<4F62B50C.5030008@linux.intel.com>
In-Reply-To: <4F62B50C.5030008@linux.intel.com>
X-Enigmail-Version: 1.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] rt-tests: Add src/backfire to FILES_${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 05:42:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/15/2012 08:35 PM, Saul Wold wrote:
> On 03/15/2012 03:00 PM, Darren Hart wrote:
>> The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:
>>
>>    qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)
>>
>> are available in the git repository at:
>>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/updates
>>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/updates
>>
> Not sure what's going on here, but this is always harder for me to get 
> to then the standard contrib branches.
> 
> It turns out it really dvhart/dvhart/updates, not dvhart/updates

No, the branch is dvhart/updates:

$ git clone git://git.yoctoproject.org/user-contrib/dvhart/oe-core -b dvhart/updates
$ cd oe-core
$ git show HEAD
commit 5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b
Author: Darren Hart <dvhart@linux.intel.com>
Date:   Thu Mar 15 14:51:22 2012 -0700

    rt-tests: Add src/backfire to FILES_${PN}
...


So I wonder what you are seeing? Maybe you call the new remote "dvhart" ?
If so, then yes, you would refer to the commit as remote/branch which would
be dvhart/dvhart/updates. So yeah, I don't need the dvhart in the branch
name since this is a personal repo... just an old habit.

I also see that I haven't got this made public yet. I'll fix that.

--
Darren

> 
> Sau!
> 
>> Darren Hart (1):
>>    rt-tests: Add src/backfire to FILES_${PN}
>>
>>   meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


