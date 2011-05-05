Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtjL-0003hP-7g
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:16:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2011 01:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="638344860"
Received: from unknown (HELO [10.255.13.11]) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2011 01:13:33 -0700
Message-ID: <4DC25C2C.40904@linux.intel.com>
Date: Thu, 05 May 2011 01:13:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<70f1d28d6c05982c3b06abe5ce069705dfd1fee9.1304581769.git.sgw@linux.intel.com>
	<35853380-9ABD-432A-BAE2-239E0536B654@dominion.thruhere.net>
In-Reply-To: <35853380-9ABD-432A-BAE2-239E0536B654@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/26] setuptools: Make options for setup.py more flexible
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
X-List-Received-Date: Thu, 05 May 2011 08:16:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2011 01:09 AM, Koen Kooi wrote:
> I NAK'ed this before, and will NAK it again.
>
Sorry, this one slipped in with a load of others, I meant to delete it, 
but it got missed.

RP, Please remove this one

Sau!

> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/001265.html
>
> Op 5 mei 2011, om 09:55 heeft Saul Wold het volgende geschreven:
>
>> From: Gary Thomas<gary@mlbassoc.com>
>>
>> The setuptools class uses hard-wired options for 'setup.py' during
>> the install step.  In particular, not all versions of setup.py
>> support the "--single-version-externally-managed" option.  This
>> patch allows for a recipe to easily override these options, while
>> leaving the majority (important) setup options intact.
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>>
>>>  From 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 2001
>> From: Gary Thomas<gary@mlbassoc.com>
>> Date: Wed, 13 Apr 2011 15:12:57 -0600
>> Subject: [PATCH] setuptools: Make options for setup.py more flexible
>>
>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/classes/setuptools.bbclass |    3 ++-
>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
>> index ced9509..cf1c224 100644
>> --- a/meta/classes/setuptools.bbclass
>> +++ b/meta/classes/setuptools.bbclass
>> @@ -2,7 +2,8 @@ inherit distutils
>>
>> DEPENDS += "python-setuptools-native"
>>
>> +DISTUTILS_INSTALL_OPTS ?= "--single-version-externally-managed "
>> DISTUTILS_INSTALL_ARGS = "--root=${D} \
>> -    --single-version-externally-managed \
>> +    ${DISTUTILS_INSTALL_OPTS} \
>>      --prefix=${prefix} \
>>      --install-data=${datadir}"
>> --
>> 1.7.1.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


