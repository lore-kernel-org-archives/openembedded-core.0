Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qri02-0001N6-NL
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 05:01:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2011 19:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,360,1309762800"; d="scan'208";a="40736267"
Received: from unknown (HELO envy.home) ([10.255.14.213])
	by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2011 19:56:57 -0700
Message-ID: <4E449679.40300@linux.intel.com>
Date: Thu, 11 Aug 2011 19:56:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
	<21924dcdc775dde5b7144cf26367663dbc0cfaeb.1313092152.git.dvhart@linux.intel.com>
	<4E44766F.6090201@windriver.com>
In-Reply-To: <4E44766F.6090201@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] meta-rt: add linux-yocto-rt_3.0 recipe
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
X-List-Received-Date: Fri, 12 Aug 2011 03:01:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/11/2011 05:40 PM, Bruce Ashfield wrote:
> On 11-08-11 7:08 PM, Darren Hart wrote:
>> Add the initial linux-yocto-rt_3.0 recipe.
>>
>> TODO: replace the AUTOREV with real commit ids.
> 
> I think you did this!
> 
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb |   55 ++++++++++++++++++++
>>   1 files changed, 55 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>>
>> diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>> new file mode 100644
>> index 0000000..7eaeb0f
>> --- /dev/null
>> +++ b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>> @@ -0,0 +1,55 @@
>> +inherit kernel
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +KMACHINE = "yocto/standard/preempt-rt/base"
> 
> I just noticed this on the way through, this could likely just
> be set to "common-pc", all it really is supposed to be
> is a fallback if a machine specific override doesn't work.
> 
> (I see that you actually do this in patch 8/10 for 2.6.34 anyway).
> 
>> +KMACHINE_qemux86  = "common-pc"
>> +KMACHINE_qemux86-64  = "common-pc-64"
>> +KMACHINE_qemuarm  = "arm-versatile-926ejs"
>> +# qemuppc hangs at boot
>> +#KMACHINE_qemuppc  = "qemu-ppc32"
>> +# qemumips panics at boot
>> +#KMACHINE_qemumips = "mti-malta32-be"
>> +
>> +KBRANCH = ${KMACHINE}
> 
> And instead of the above, you could just say:
> 
> KBRANCH = "yocto/standard/preempt-rt/base"
> 
> to have a fallback in place that keeps the fetcher chugging along.
> That's all that the KMACHINE default was doing in the end anyway.
> 
> Sorry I didn't see this earlier, but seeing it in front of me
> here, it jumped out.
> 
> The rest looks good.

All good points, I'll respin and send out V2.

--
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


