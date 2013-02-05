Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2nr1-0004Aw-G6
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:06:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Feb 2013 10:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="198994099"
Received: from unknown (HELO envy.home) ([10.255.12.108])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Feb 2013 10:50:59 -0800
Message-ID: <51115493.1040504@linux.intel.com>
Date: Tue, 05 Feb 2013 10:50:59 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
	<lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<511144EC.1030704@linux.intel.com>
	<CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
In-Reply-To: <CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 19:06:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2013 10:40 AM, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 3:44 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>
>> On 02/05/2013 08:36 AM, Enrico Scholz wrote:
>>> Darren Hart <dvhart@linux.intel.com> writes:
>>>
>>>>>> +  $NC -X connect $*
>>>>>
>>>>> why '$*' but not '"$@*"'?
>>>>>
>>>> I'm not familiar with $@*
>>>
>>> sorry... I meant "$@"
>>>
>>>
>>>> As for $* versus $@, the issue is how the arguments are presented. $*
>>>> as a single word, $@ each argument is quoted separately. I believe I
>>>> ran into issues with $@. I haven't had any trouble with $*.
>>>
>>> $* is causing trouble all the time because it does not retain whitespaces
>>> or empty parameters.  There are only very few cases, where $* makes sense.
>>>
>>>
>>>> Is there a particular use case where you can see this failing as is?
>>>
>>> "$@" is just the right thing to do in this situation.  E.g. when your
>>> script is called as
>>>
>>> | oe-git-proxy.sh "${HOST}" "${PORT}"
>>>
>>> and HOST is undefined due to some reason, you will try to connect to
>>> "${PORT}" with $*.  The "$@" will cause nc to complain about the broken
>>> HOST parameter.
>>>
>>>
>>> Btw...
>>>
>>> | exec $NC $METHOD "$@"
>>>
>>> would be the school book implementation for the thing you want to do...
>>>
>>>
>>>
>>> Enrico
>>
>> That all makes sense. When I read up the difference again in the bash
>> documentation I was surprised I had used $*, but thought I had done that
>> dance already. I'll update with "$@" and do some tests.
>>
>> Thank you for the review and catching that.
> 
> Please give it a try in dash as well.

$@ also works with dash. I have been testing in bash and dash throughout
development as well.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


