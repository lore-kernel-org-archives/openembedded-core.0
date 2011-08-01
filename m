Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qo12z-0003S6-Cj
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 00:33:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2011 15:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,302,1309762800"; d="scan'208";a="33050484"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2011 15:28:55 -0700
Message-ID: <4E3728A7.1050707@linux.intel.com>
Date: Mon, 01 Aug 2011 15:28:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311758282.git.kai.kang@windriver.com>	<d5e06516ed6656364b8127740700d1403b72d567.1311758282.git.kai.kang@windriver.com>
	<2070961.C8JsuWrOh5@perseus>
In-Reply-To: <2070961.C8JsuWrOh5@perseus>
Subject: Re: [PATCH 1/1] ghostscript: fix parallel build issue
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
X-List-Received-Date: Mon, 01 Aug 2011 22:33:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2011 11:20 AM, Khem Raj wrote:
> On Wednesday, July 27, 2011 05:34:45 PM Kang Kai wrote:
>> From: Kang Kai<kai.kang@windriver.com>
>>
>> ghostscript fails some time on autobuilder, it seems a parallel build issue.
>> Add patch to fix it.
>>
>> Fixes [Yocto #1202]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   .../ghostscript-9.02-parallel-make.patch           |   17 +++++++++++++++++
>> .../ghostscript/ghostscript_9.02.bb                |    3 ++-
>>   2 files changed, 19 insertions(+), 1 deletions(-)
>>   create mode 100644
>> meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-mak
>> e.patch
>>
>> diff --git
>> a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
>> ake.patch
>> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
>> ake.patch new file mode 100644
>> index 0000000..76d1676
>> --- /dev/null
>> +++
>> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
>> ake.patch @@ -0,0 +1,17 @@
>> +When parallel make it will fail with multi copy, see
>> +http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> +--- ghostscript-9.02/base/unixhead.mak.orig	2011-07-27 17:06:17.749456100
>> +0800 ++++ ghostscript-9.02/base/unixhead.mak	2011-07-27 17:06:37.449456100
>> +0800 +@@ -54,7 +54,7 @@
>> +
>> + # Define generic commands.
>> +
>> +-CP_=cp
>> ++CP_=cp -f
>
> It means it will first delete the target if it exists. Did you check if this
> is correct behavior ?
>
Khem,

As far as I know the file is that is being copied to is the same file 
and the CP is only used in that case, the 2 files are copied to the same 
location due to the Parallel make.

Sau!


