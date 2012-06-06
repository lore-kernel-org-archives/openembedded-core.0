Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ScIPQ-0008Fy-Dd
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:44:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jun 2012 08:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="152394106"
Received: from unknown (HELO [10.255.12.144]) ([10.255.12.144])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2012 08:34:03 -0700
Message-ID: <4FCF786A.4060306@linux.intel.com>
Date: Wed, 06 Jun 2012 08:34:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FCF09D9.4030109@linux.intel.com>
	<6C766040-06EA-449C-A006-E3990B8A5A6D@dominion.thruhere.net>
In-Reply-To: <6C766040-06EA-449C-A006-E3990B8A5A6D@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: curl-native history questions
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
X-List-Received-Date: Wed, 06 Jun 2012 15:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2012 12:57 AM, Koen Kooi wrote:
>
> Op 6 jun. 2012, om 09:42 heeft Saul Wold het volgende geschreven:
>
>>
>> Folks,
>>
>> I am looking into a bug someone files about not being able to access https git repos, and I looked into it and found that curl has the ssl bits disabled. We do use openssl-native in other dependencies of git.
>>
>> The question: Is there a reason not to enable ssl for curl?
>
> I'm not sure, but I'd really like https support in the target version of git.
>
Ok, unless I hear otherwise I am going to enable https support for both 
the native and target side of git, no reason not to at this point, just 
wanted to verify with the historians.

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


