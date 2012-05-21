Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWT5N-0003oK-43
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 15:55:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2012 06:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155169647"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2012 06:45:35 -0700
Message-ID: <4FBA46FF.8050700@linux.intel.com>
Date: Mon, 21 May 2012 06:45:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<cd6ae3da72e2e0052b409d73bb9533f63070e4e9.1337581961.git.sgw@linux.intel.com>
	<20120521065305.GB3166@jama.jama.net>
	<CAP9ODKqF=gnm9O7wA+7qDmXpesBO3qNS8QtnGVQmM=srL=4Qfg@mail.gmail.com>
	<34ED02DB-EE8A-4F76-BD6B-2CE2456B1EB7@dominion.thruhere.net>
In-Reply-To: <34ED02DB-EE8A-4F76-BD6B-2CE2456B1EB7@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC v1 1/1] Reorder and -dev
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
X-List-Received-Date: Mon, 21 May 2012 13:55:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2012 03:57 AM, Koen Kooi wrote:
>
> Op 21 mei 2012, om 12:48 heeft Otavio Salvador het volgende geschreven:
>
>> On Mon, May 21, 2012 at 3:53 AM, Martin Jansa<martin.jansa@gmail.com>  wrote:
>>> the rest looks ok, but I'm pretty scared from such changes, does your
>>> buildhistory diffs show just *-config file moves or something else too?
>>
>> It would be nice if some images could be build before and after the
>> patch and check before proposing this for merging.
>
> Indeed, run the buildhistory output through Pauls analysis tool and share the results.
>
Yes, I plan too once I get closer to done, I know it will move more than 
the -config files, biggest issue I have seen so far are extensions and 
modules that might live in ${libdir}/${BPN}/...*.so vs *.so.*  I believe 
that most of these .so libraries live in the standard base package, not 
the -dev package.

Sau!

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


