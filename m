Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QHKcs-0002jh-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 20:47:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2011 11:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,310,1301900400"; d="scan'208";a="687538198"
Received: from unknown (HELO [10.255.13.82]) ([10.255.13.82])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2011 11:43:28 -0700
Message-ID: <4DC04CCA.2030100@intel.com>
Date: Tue, 03 May 2011 11:43:22 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>	<4DBF4F26.90404@intel.com>	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
	<4DC03C43.8080507@windriver.com>
In-Reply-To: <4DC03C43.8080507@windriver.com>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Tue, 03 May 2011 18:47:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2011 10:32 AM, Mark Hatle wrote:
> On 5/3/11 12:27 PM, Khem Raj wrote:
>> On Mon, May 2, 2011 at 5:41 PM, Zhai, Edwin<edwin.zhai@intel.com>  wrote:
>>> Did you installed Nvidia proprietary driver? Any error mesg from the runqemu
>>> script?
>>
>> yes I did and I think that could be a culprit but then why would it
>> work with nfs boot.
>> there is no useful message from script it just collapses
>
> The script tries to detect the nvidia drivers.  If it finds them is supposed to
> issue a warning.  Sounds like your system might not have a version that it knows
> how to detect.

The Nvidia libGL bug caused a segfault in qemu when booting images, so 
it should be pretty obvious if that's what's causing it.

Given that Khem is booting the nfs version successfully, and not seeing 
any error message, I think this might be a new error.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


