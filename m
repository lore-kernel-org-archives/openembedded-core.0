Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QM4lD-0002Q2-9c
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 22:51:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 13:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="643450189"
Received: from unknown (HELO [10.255.12.119]) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 13:48:33 -0700
Message-ID: <4DD18DA1.4080501@intel.com>
Date: Mon, 16 May 2011 13:48:33 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305418871.git.sgw@linux.intel.com>	<E943FF3D-A282-4E6D-8B5A-B954A678A0E1@gmail.com>	<4DD13B6F.4010009@intel.com>	<BANLkTi=0TcHgXmYpwCjX6P5h6+y9O2YQFw@mail.gmail.com>
	<1305575479.3424.102.camel@rex>
In-Reply-To: <1305575479.3424.102.camel@rex>
Subject: Re: [RFC 0/3] Move Old Recipes to meta-extras
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
X-List-Received-Date: Mon, 16 May 2011 20:51:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 12:51 PM, Richard Purdie wrote:
> On Mon, 2011-05-16 at 10:08 -0700, Khem Raj wrote:
>> On Mon, May 16, 2011 at 7:57 AM, Saul Wold<saul.wold@intel.com>  wrote:
>>> On 05/15/2011 11:19 PM, Khem Raj wrote:
>>>>
>>>>
>>>> On May 14, 2011, at 5:23 PM, Saul Wold<sgw@linux.intel.com>   wrote:
>>>>
>>>>> From: Saul Wold<sgw@linux.intel.com>
>>>>>
>>>>> This proposes to move the YAFFS2-utils, older clutter-1.4
>>>>> and older GCC version (4.3.3 and 3.4.4) as they are unused
>>>>> and currently unbuildable.
>>>>>
>>>>
>>>> Are we left with any GPLv2 version of gcc after this ?
>>>>
>>> Khem,
>>>
>>> Is not having a GPLv2 version of gcc an issue? For the non-gplv3 version, my
>>> understanding is to have an installed user-space for oe-core for a
>>> non-development system, therefore gcc is not an issue.
>>>
>>
>> there are certain parts of gcc which go onto target e.g. libgcc libstdc++
>
> These have specific license exceptions allowing non-gpl code to use them
> as system libraries though?
>
Richard is correct, there are exception for the runtime parts of GCC.
Sorry Khem, I was not catching to original gist of the question.

Sau!

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



