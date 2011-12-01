Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RW83A-000193-Ta
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 15:55:49 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 9F268E095
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 15:49:07 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArEcANeS105T4zgTPGdsb2JhbAAMMAirEQEBAQE3giQBAQEBAzhAEQsYCRYPCQMCAQIBMRQGDQgBAYgLuAKDbIQDgzEElFeSEw
X-IronPort-AV: E=Sophos;i="4.71,278,1320620400"; d="scan'208";a="1767235375"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb4.telenor.se with ESMTP; 01 Dec 2011 15:49:07 +0100
Message-ID: <4ED793E2.5070205@emagii.com>
Date: Thu, 01 Dec 2011 15:49:06 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED54C2B.2060505@emagii.com>
	<4ED66835.3050400@intel.com>
In-Reply-To: <4ED66835.3050400@intel.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 01 Dec 2011 14:55:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-30 18:30, Scott Garman wrote:
> On 11/29/2011 01:18 PM, Ulf Samuelsson wrote:
>>
>>>> Seen a couple of errors as well.
>>>>
>>>> 1. ERROR: Function 'useradd_sysroot' failed
>>>> Tried to access "/etc/group" but this was locked.
>>>> Problem disappeared the next time I rebuilt.
>>> Can you file a bug about this problem please. I think we need to go
>>> through the code paths in shadow and ensure its locking is sane. I took
>>> a quick look at the code and was left wondering what lckpwdf() does for
>>> example. Scott, could you take a look at this?
>>
>> Bugzilla is out of service, so bugs cannot be filed.
>
> I have filed a bug for this, and have been trying to reproduce it 
> without success:
>
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1794
>
>> Haven't seen the issue since then so it is hard to give any details.
>> I used very high BB_NUMBER_THREADS = 24.
>
> I do have access to a system with a lot of cores, and have been doing 
> builds on it.
>
> I'd just like to confirm that when you saw this, it was a build from 
> scratch (e.g, not using sstate cache from a previous build). And also, 
> you *weren't* building this from a remote filesystem (NFS), correct?
>
> Thanks,
>
> Scott
>
No NFS for sure.

I think this was the first build, but only 99% sure.
It disappered when I restarted the build.

Have not seen this problem repeated, but then, the build on this
machine has other problems

Packages tend to fail since the c++ compiler seems to ignore "--sysroot"

Machine = Ubuntu-11.10 x64.

This is with BB_NUMBER_THREADS = "4"
If I change this, then the same problem occur, but in a different package.
(Tried with "4" AND "24")

BR
Ulf



-- 
Best Regards
Ulf Samuelsson
eMagii



