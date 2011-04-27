Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QF9RH-0005m4-6O
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 20:26:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 11:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,275,1301900400"; d="scan'208";a="426574036"
Received: from unknown (HELO [10.255.13.18]) ([10.255.13.18])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 11:23:42 -0700
Message-ID: <4DB85F2D.3010505@linux.intel.com>
Date: Wed, 27 Apr 2011 11:23:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Antonio Ospite <ospite@studenti.unina.it>
References: <cover.1303889119.git.sgw@linux.intel.com>	<451b67c736a7b67baf6b0bda5fee38b44b4a24cd.1303889119.git.sgw@linux.intel.com>
	<20110427101712.bd2c2d0f.ospite@studenti.unina.it>
In-Reply-To: <20110427101712.bd2c2d0f.ospite@studenti.unina.it>
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/52] gcc: Add recipes for 4.6.0
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
X-List-Received-Date: Wed, 27 Apr 2011 18:26:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2011 01:17 AM, Antonio Ospite wrote:
> On Wed, 27 Apr 2011  0:29:21 -0700
> Saul Wold<sgw@linux.intel.com>  wrote:
>
>> From: Khem Raj<raj.khem@gmail.com>
>>
>> Hi
>>
>> This is initial set of patches for testing them out
>> The patches need documentation is pending
>> Some patches especially uclibc related are not
>> needed they must be dropped.
>>
>> This is not the final version yet. But I would like
>> folks to help trying them out and report issues
>>
>
> If these changes turned to be the final ones then the commit message
> should be updated, shouldn't it?
>
Not final yet, I am pushing it now so people can set their local 
GCCVERSION and SDKGCCVERSION to test if they would like.

Sau!

>> I have tried to boot uclibc/arm on it but qemu
>> died on me. so please boot the images you build
>> and I would be interested to know the results.
>>
>> -Khem
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>
> [...]
>


