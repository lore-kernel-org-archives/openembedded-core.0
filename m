Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4fiw-0006kK-VF
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:45:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2012 13:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="117935576"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2012 13:36:05 -0800
Message-ID: <4F5531C5.30007@linux.intel.com>
Date: Mon, 05 Mar 2012 13:36:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
	<CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
In-Reply-To: <CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
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
X-List-Received-Date: Mon, 05 Mar 2012 21:45:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 09:05 AM, Khem Raj wrote:
> On Fri, Feb 24, 2012 at 8:21 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>> On Thu, 2012-02-23 at 19:33 -0800, Khem Raj wrote:
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   meta/conf/distro/include/default-distrovars.inc |    7 +++++++
>>>   1 files changed, 7 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
>>> index 16b3108..dba204e 100644
>>> --- a/meta/conf/distro/include/default-distrovars.inc
>>> +++ b/meta/conf/distro/include/default-distrovars.inc
>>> @@ -41,6 +41,13 @@ NO32LIBS ??= "1"
>>>
>>>   # Default to emitting logfiles if a build fails.
>>>   BBINCLUDELOGS ??= "yes"
>>> +
>>> +# dummy distro related variables
>>> +# they should be overridden by real distros
>>> +# these fallbacks only serve the purpose of
>>> +# oe-core standalone testability
>>> +
>>> +DISTRO ??= ""
>>>   SDK_VERSION ??= "oe-core.0"
>>>   DISTRO_VERSION ??= "oe-core.0"
>>
>> Why do we need this? The commit message tells me what you're doing but
>> not why. I'm really getting frustrated with one line commit messages
>> with no details.
>>
>> I don't think we should need this either, I'm not sure I like the
>> change. The whole idea was OE-Core could run "distroless".
>>
>
> There is an error case I dont remeber how I obtained that where it
> prints bogus value if DISTRO is not
> defined at all but and empty DISTRO var is distroless in essence anyway IMO
>
Khem,

Please let us know what the reproducer for this is.  Once we have a 
reproducer we can look into the issue.

Sau!

>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


