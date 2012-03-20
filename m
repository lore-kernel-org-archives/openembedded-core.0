Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SA0OY-000362-4N
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 15:50:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2012 07:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141907494"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 07:41:29 -0700
Message-ID: <4F689719.6090100@linux.intel.com>
Date: Tue, 20 Mar 2012 07:41:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>
	<22ff60ec34d2c54393d4ceb2a81394c6512baa17.1331877464.git.xiaofeng.yan@windriver.com>
	<4F679F53.40302@linux.intel.com> <4F681A97.4020201@windriver.com>
	<665F9083-9747-4972-BCDE-BCE209266221@dominion.thruhere.net>
	<4F685087.6080303@windriver.com> <4F6852C0.4050409@windriver.com>
	<CAE4k23-U8gr0_B9jyZb8qXhwQQZLFA6O20PdG7j1SohpdQdx6Q@mail.gmail.com>
In-Reply-To: <CAE4k23-U8gr0_B9jyZb8qXhwQQZLFA6O20PdG7j1SohpdQdx6Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Tue, 20 Mar 2012 14:50:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/20/2012 03:00 AM, Anders Darander wrote:
> On Tue, Mar 20, 2012 at 10:49, Xiaofeng Yan<xiaofeng.yan@windriver.com>  wrote:
>> On 2012年03月20日 17:40, Xiaofeng Yan wrote:
>>>
>>> On 2012年03月20日 16:07, Koen Kooi wrote:
>>>>
>>>> Op 20 mrt. 2012, om 06:50 heeft Xiaofeng Yan het volgende geschreven:
>>>>
>>>>> On 2012年03月20日 05:04, Saul Wold wrote:
>>>>>>
>>>>>> On 03/15/2012 11:23 PM, Xiaofeng Yan wrote:
>>>>>>>
>>>>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>>>>
>>>>>> Why do you rebuild the tarball here are rename it instead of just
>>>>>> copying the original tarball?
>>>>>>
>>>>> because many packages come from non-tarball and they could be git
>>>>> sources , So I archive these sources after do_unpack.
>>>>
>>>> But if you have the original tarball and reuse it, you'll get the warm
>>>> fuzzy feeling of matching checksums.
>>>
>>> So How about  renaming archive-original-source to
>>> archive-prepatched-source?
>>
>> Hi Saul,
>>
>> Or I can add a new functions to get tarball from downloads if have tarball
>> and archive source codes directory if have directory without tarball.
>> Do you think it is necessary for us to add this function?
>
> I'd say that this is a change that should be made. If nothing else,
> just to get the assurance that the archived tarball's are the same as
> the ones that was used to build the system. (This is beneficial both
> when it comes to using the archived tarballs for rebuilding the
> system, as well as for ensuring licence compliance).
>
I agree here, as Koen also pointed out, it will have matching checksums.

As to the name of the tarball, again best to keep it named the same as 
the original tarball.

Sau!

> /Anders
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


