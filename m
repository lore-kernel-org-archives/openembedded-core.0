Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SHN3R-0003V5-IW
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 00:27:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2012 15:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130452282"
Received: from unknown (HELO envy.home) ([10.7.199.62])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2012 15:18:03 -0700
Message-ID: <4F835FF6.600@linux.intel.com>
Date: Mon, 09 Apr 2012 15:17:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1333993801.git.dvhart@linux.intel.com>
	<4F835F2D.7010304@linux.intel.com>
In-Reply-To: <4F835F2D.7010304@linux.intel.com>
X-Enigmail-Version: 1.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] hello-mod: Remove hello-mod example external kernel module recipe
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
X-List-Received-Date: Mon, 09 Apr 2012 22:27:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/09/2012 03:14 PM, Saul Wold wrote:
> On 04/09/2012 10:53 AM, Darren Hart wrote:
>> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>>
>>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
>>
>> are available in the git repository at:
>>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core hello-mod
>>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=hello-mod
>>
>> Darren Hart (1):
>>    hello-mod: Remove hello-mod example external kernel module recipe
>>
>>   meta/recipes-kernel/hello-mod/files/COPYING    |  340 ------------------------
>>   meta/recipes-kernel/hello-mod/files/Makefile   |   14 -
>>   meta/recipes-kernel/hello-mod/files/hello.c    |   33 ---
>>   meta/recipes-kernel/hello-mod/hello-mod_0.1.bb |   15 -
>>   4 files changed, 0 insertions(+), 402 deletions(-)
>>   delete mode 100644 meta/recipes-kernel/hello-mod/files/COPYING
>>   delete mode 100644 meta/recipes-kernel/hello-mod/files/Makefile
>>   delete mode 100644 meta/recipes-kernel/hello-mod/files/hello.c
>>   delete mode 100644 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb
>>
> 
> Can you do this as a move (git mv) instead of as a delete and re-create? 
>   meta-skeleton is part of OE-Core if I have my git foo correct.


bwahaha. facepalm. for some reason I thought it was a poky thing and
didn't even look. duh. will resend.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


