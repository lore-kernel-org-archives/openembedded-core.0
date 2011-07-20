Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjZxF-00054D-UG
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 18:49:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 09:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="30287039"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 09:44:54 -0700
Message-ID: <4E270605.1090802@linux.intel.com>
Date: Wed, 20 Jul 2011 09:44:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311154909.30326.51.camel@phil-desktop>	<CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>	<4E26D87A.5020808@gmail.com>	<CACW_hTb=t9hMoVc-3F538xn1kTwrGT7-wk7DW8FTmi6=Txmvpg@mail.gmail.com>
	<1311172926.2344.49.camel@rex>
In-Reply-To: <1311172926.2344.49.camel@rex>
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 16:49:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 07:42 AM, Richard Purdie wrote:
> On Wed, 2011-07-20 at 16:26 +0200, Frans Meulenbroeks wrote
>>          there is already patch sent to fix it.
>>          http://patches.openembedded.org/patch/7933/
>>          libiconv is not default provider of virtual/libiconv on
>>          eglibc/glibc based systems and sometimes that can trip you
>>          over. It happens and as long as we find it and fix it quickly
>>          I don't see a problem. Do you ?
>> Some people seem to think differently about this. I still recall the
>> pile of shit Koen dumped upon me about a year ago when I accidentally
>> removed a version of openssh or so that was still used. Even though
>> the problem was fixed very quickly after it was brought to my
>> attention. Ah well. As Orwell already said "all animals are equal but
>> some animals are more equal than others".
>>
>>
>>          IMO we should not get so pedantic that people start getting
>>          scared of making changes
>>
>> It was by no means my intention to be pedantic.
>>
>> Then again I *do* think it is good practice if someone creates a new
>> recipe that (s)he tests it before submitting it.
>>
>> And my impression was that one of the goals of YP and oe-core was to
>> increase the quality level.
>> One of the ways to increase quality is to do a build after pulling
>> changes and before committing them.
>> (at least I feel that is one of the ways to increase quality, and yes
>> there are other ways too).
>>
>> And where people work, mistakes happen. One can accept that, but one
>> can also see if there are ways to improve and avoid that a problem
>> re-occurs.
>
> I think its fair to ask how this happened and it appears to be due to
> PREFERRED_VERSION and/or PROVIDER confusion. Its unfortunate but I think
> the people involved will not do it again :).
>
Yes, the lesson has been learned, I am working on adding a UCLIBC build 
into the mix, and the Autobuilder will have a vanilla oe-core build with 
both uclibc and egligc some time soon as well.

Please chalk this up to live and learn not a common practice.

Sau!

> I don't think its entirely fair to immediately bring into question the
> overall quality goals as we are continuing to work towards those and
> this is an exception, not the norm.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


