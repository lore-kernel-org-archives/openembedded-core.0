Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RsUCI-0005Mo-Dn
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 08:01:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jan 2012 22:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="104862217"
Received: from unknown (HELO envy.home) ([10.255.14.180])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2012 22:53:42 -0800
Message-ID: <4F28E159.1020905@linux.intel.com>
Date: Tue, 31 Jan 2012 22:53:13 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Steve Sakoman <steve@sakoman.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
	<CAOSpxdbF6t5z+GYirR4u3oa41Pd=UrFyQRKT1QSw1dLBRPBeEg@mail.gmail.com>
	<4F2840F5.9080908@linux.intel.com>
	<CAOSpxdYr19UF+P-hUAVMe0Q6=UrMujSmLWS4QV3xMkPCP17SNA@mail.gmail.com>
In-Reply-To: <CAOSpxdYr19UF+P-hUAVMe0Q6=UrMujSmLWS4QV3xMkPCP17SNA@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/3] *** SUBJECT HERE ***
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
X-List-Received-Date: Wed, 01 Feb 2012 07:01:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/31/2012 08:16 PM, Steve Sakoman wrote:
> On Tue, Jan 31, 2012 at 11:28 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>> Did you send this using the send-pull-request script? I assume not as
>> this was to oe-core and not yocto, but if you did, I want to know as it
>> should protect against -ENOCOFFEEYET errors such as these.
> 
> No, I used git send-email.
> 
> I'm not familiar with the send-pull-request script.  I wouldn't have
> guessed from the name that it is a mailing list patch submission
> script.  Is it hardwired to the yocto list?

They are not hardwired for yocto. The name is a bit odd I admit. The
Yocto Project maintainers prefer to receive patches as pull requests as
well as a series of patches to the list. This makes review easy and
facilitates merging for them as well. The scripts create and send such
patches series.

> 
>> For whatever it's worth, I use this script for all my projects now to
>> help avoid situations like this which I have fallen into more times than
>> I care to admit :-)
> 
> Indeed, I very often catch myself forgetting to add the subject to the
> cover letter!  I'll have to investigate using the send-pull-request
> script.

The scripts are in the poky repository under the scripts directory:
$ ls scripts/*pull-request
scripts/create-pull-request  scripts/send-pull-request

--
Darren

> 
> Steve
> 
>> On 01/30/2012 09:17 AM, Steve Sakoman wrote:
>>> Sigh, my morning for screw-ups.  Time for another cup of coffee . . .
>>>
>>> The subject should be: 'zypper: support signed repositories' rather
>>> than '***SUBJECT HERE***' :-)
>>>
>>> Steve
>>>
>>> On Mon, Jan 30, 2012 at 9:14 AM, Steve Sakoman <steve@sakoman.com> wrote:
>>>> The current zypper implementation does not work with signed repositories.
>>>> This patch series adds recipes for the required packages as well as the
>>>> necessary runtime dependencies to zypper.
>>>>
>>>> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
>>>> a systemd based console image.
>>>>
>>>> Version 3 incorporates feedback from Koen Kooi and Saul Wold
>>>>  - adds runtime dependencies to existing RDEPENDS_${PN}
>>>>  - removes duplicate recipe for libassuan
>>>>  - moves recipes for gnupg and libksba to recipes-support
>>>>
>>>> Steve Sakoman (3):
>>>>  libksba: add recipe for 1.2.0
>>>>  gnupg: add recipe for 2.0.18
>>>>  zypper: add missing runtime dependences on gzip and gnupg
>>>>
>>>>  meta/recipes-extended/zypper/zypper_git.bb    |    4 ++--
>>>>  meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   24 ++++++++++++++++++++++++
>>>>  meta/recipes-support/libksba/libksba_1.2.0.bb |   10 ++++++++++
>>>>  3 files changed, 36 insertions(+), 2 deletions(-)
>>>>  create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
>>>>  create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>> Yocto Project - Linux Kernel

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


