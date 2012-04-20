Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLKJo-0003Ai-TA
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 22:20:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Apr 2012 13:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134944311"
Received: from unknown (HELO [10.255.12.163]) ([10.255.12.163])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2012 13:10:47 -0700
Message-ID: <4F91C2C7.5040509@linux.intel.com>
Date: Fri, 20 Apr 2012 13:10:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<d2330607b1757ad68add6ab2b37c6182b4f28d00.1334940120.git.sgw@linux.intel.com>
	<20120420200415.GE8228@denix.org>
In-Reply-To: <20120420200415.GE8228@denix.org>
Subject: Re: [CONSOLIDATED PULL 02/43] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Fri, 20 Apr 2012 20:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2012 01:04 PM, Denys Dmytriyenko wrote:
> On Fri, Apr 20, 2012 at 09:44:53AM -0700, Saul Wold wrote:
>> From: Denys Dmytriyenko<denys@ti.com>
>>
>> Replace dependency on eglibc with virtual/libc
>> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
>>
>> Signed-off-by: Denys Dmytriyenko<denys@ti.com>
>
> That's already been fixed differently:
> http://cgit.openembedded.org/openembedded-core/commit/?id=fb89e4585644db0958a633a637fc70f0459af26a
>
Thanks, I had it in my holding bin and must have just not matched up 
with this patch.

I will update my branch with this removed.

Sau!


