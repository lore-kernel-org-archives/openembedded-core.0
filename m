Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm6P5-00018N-DB
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 18:56:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 09:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161021060"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2012 09:45:40 -0700
Message-ID: <4FF321B3.1030807@linux.intel.com>
Date: Tue, 03 Jul 2012 09:45:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341257063.git.mark.hatle@windriver.com>
	<ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
	<1341259602.2886.27.camel@x121e.pbcl.net>
	<CAMKF1sp2RfBJEggBUzkR9xdQ9L5Q_ik3Za2hCFf=3cJDCkqrEg@mail.gmail.com>
	<4FF30F93.6030706@balister.org> <4FF31E1D.2030606@windriver.com>
In-Reply-To: <4FF31E1D.2030606@windriver.com>
Subject: Re: [PATCH 1/1] oprofile: Change /root to /home/root
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
X-List-Received-Date: Tue, 03 Jul 2012 16:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 09:30 AM, Mark Hatle wrote:
> On 7/3/12 10:28 AM, Philip Balister wrote:
>> On 07/02/2012 07:44 PM, Khem Raj wrote:
>>> On Mon, Jul 2, 2012 at 1:06 PM, Phil Blundell <philb@gnu.org> wrote:
>>>>
>>>> Why is it putting "daemon setup information" in /root in the first
>>>> place? Surely that should go in /etc or some such place.
>>>>
>>>> Also, the choice of where root's home directory goes is a distro
>>>> decision and, in the general case, it is not correct to say that "OE
>>>> uses /home/root". Changing the hardcoded value from one thing to
>>>> another is probably not that much of an improvement overall.
>>>
>>> yes having ROOTHOME configurable is desirable but probably nothing as
>>> such
>>> exists AFAICT
>>
>> Why do we use /home/root instead of /root? If we are having to patch
>> multiple recipes to account for this, maybe we should default to /root?
>
> I attempted to figure this out yesterday... I probably have some details
> wrong, so anyone who knows should correct this...
>
> The original Zaurus (commercial release) used /home/root, because the
> main / filesystem was read-only, and there was a need for all user data
> to reside on rw space (SD card?)
>
> When OpenZaurus came about, it copied this behavior and it was
> eventually adopted by handhelds.org, nslu2, OpenEmbedded etc.. this is
> around 2004 time frame and later.
>
> The first reference to this I find in the logs is around January of
> 2004, and it's been that way ever since.
>
>  From what I can tell, there used to be a symlink from /root ->
> /home/root... but I don't see that symlink in OE anymore.
>
>
> This who /home/root vs /root certainly caught me by surprise.. but
> frankly I don't care either way. oprofile is not matching the system, so
> it needs to match -- or the system needs to change.
>
> Most of the developers I work with are partial to /root vs /home/root.
> I'm open to either changing it back to /root, allowing for a more
> dynamic option, or keeping it the way it is..
>
Mark,

For the sack of expediency, maybe we take your change now, can you file 
a bug to make it dynamic and we can get that fixed overall?

Making it dynamic will require a bit more work, would you take that RFE 
on for 1.3 or future?

Sau!

> --Mark
>
>> Philip
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


