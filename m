Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vl3-0001Fx-Ku
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:58:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 20:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="15065853"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 20:53:28 -0700
Message-ID: <4E683C38.20506@linux.intel.com>
Date: Wed, 07 Sep 2011 20:53:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <201108261047.10782.paul.eggleton@linux.intel.com>
	<4E57C747.2020104@linux.intel.com>
	<201108261739.10025.paul.eggleton@linux.intel.com>
	<201109071418.10285.paul.eggleton@linux.intel.com>
In-Reply-To: <201109071418.10285.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Core image recipes
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
X-List-Received-Date: Thu, 08 Sep 2011 03:58:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2011 06:18 AM, Paul Eggleton wrote:
> On Friday 26 August 2011 17:39:09 Paul Eggleton wrote:
>> On Friday 26 August 2011 17:18:15 Saul Wold wrote:
>>> On 08/26/2011 02:47 AM, Paul Eggleton wrote:
>>>> meta/recipes-extended/images/core-image-basic.bb
>>>
>>> This image should NOT contain any X11, this is supposed to be an
>>> extention of core-image-minimal with many of the busybox related
>>> commands substituted for the real command set.  The intention of this
>>> image is two fold, first it's the largest image that we test against
>>> non-GPLv3 and it's the non-graphical LSB image (I am not sure if there
>>> is a spec test defined for that.
>>
>> Hmm, I'm not sure what I was thinking earlier, you're right it doesn't
>> appear to have X.
>
> Now I know why I thought this. Because task-core.bb defines task packages that
> depend on X applications, any recipe that inherits from core-image will force
> a build of all of the X apps even if it doesn't intend to use them - so both
> core-image-basic and core-image-base suffer from this.  This is not really very
> good and I think we ought to be splitting up task-core to avoid this. FYI
> whilst core-image-minimal inherits from core-image it overrides IMAGE_INSTALL
> and thus doesn't use anything from task-core and therefore does not have this
> issue.
>
Now I understand what you are talking about, it might best to split this 
into 2 tasks a task-core moved to recipes-core/tasks and a 
task-core-x11, what about that?

>> I can't access the LSB specs website right now
>> unfortunately but does this have an official name within LSB? It's not
>> "LSB-Core" is it?
>
> Yep, it's LSB-Core (yet another meaning of "core", sigh...)
>
We could rename basic to task-lsb-core if that's what your thinking, but 
as you point out yet another "core".


>>>> Then, we have core-image-base, which whilst it doesn't remove package
>>>> management files, does not have "package-management" in its features,
>>>> so it's not a whole lot different to core-image-minimal AFAICT.
>>>
>>> On this one I might agree, I know that we have not built that image, nor
>>> does it seem to be used by anything else.
>>
>> If there's demand for a minimal image with package management (someone
>> asked for this on IRC just the other day, and it makes sense to me at
>> least) then that's what I'd suggest turning this into. In which case it
>> ought to be called core-image-minimal-pkgmgmt or something similar.
>
> Any opinions on this one?
>
I think this is one that they can create themselves it's would be distro 
specific and would require additional space allocated to the rootfs, 
best for the distro do.  Remember we are trying to provide foundations 
and examples. core-image-minimal is supposed to be the smallest possible 
image with login and shell. It can be used by someone to build on.

Sau!


> Cheers,
> Paul
>


