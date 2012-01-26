Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RqDya-0006DS-EA
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 02:18:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2012 17:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100616039"
Received: from unknown (HELO [10.255.14.130]) ([10.255.14.130])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2012 17:10:20 -0800
Message-ID: <4F20A7FC.2090603@linux.intel.com>
Date: Wed, 25 Jan 2012 17:10:20 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1327532550.git.josh@linux.intel.com>
	<f00a625276ad52a6a80e9b23e4cefa382c83f306.1327532550.git.josh@linux.intel.com>
	<CAMKF1sropDJF5Su71dHZ=NGsQMOmcU=iXezwXYuJA=NX_6=c1g@mail.gmail.com>
In-Reply-To: <CAMKF1sropDJF5Su71dHZ=NGsQMOmcU=iXezwXYuJA=NX_6=c1g@mail.gmail.com>
Subject: Re: [PATCH 1/1] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Thu, 26 Jan 2012 01:18:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/01/12 15:55, Khem Raj wrote:
> On Wed, Jan 25, 2012 at 3:05 PM, Joshua Lock<josh@linux.intel.com>  wrote:
>> -PERFDEPENDS_libc-uclibc = ""
>>   PERFRDEPENDS = "python perl elfutils"
>> -PERFRDEPENDS_libc-uclibc = ""
>
> now how will PERFDEPENDS be cleared for uclibc ?

Whoops, little over zealous there... Updated patch in the same place.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


