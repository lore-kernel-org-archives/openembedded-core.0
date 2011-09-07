Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R1IIA-0003sF-Pc
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 15:35:52 +0200
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 304BB4B00C4;
	Wed,  7 Sep 2011 15:30:45 +0200 (CEST)
Message-ID: <4E677204.8000309@eukrea.com>
Date: Wed, 07 Sep 2011 15:30:44 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1315401430-27997-1-git-send-email-eric@eukrea.com>
	<201109071423.42658.paul.eggleton@linux.intel.com>
In-Reply-To: <201109071423.42658.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4e-demo-image: improve image
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
X-List-Received-Date: Wed, 07 Sep 2011 13:35:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 07/09/2011 15:23, Paul Eggleton a =C3=A9crit :
> On Wednesday 07 September 2011 14:17:10 Eric B=C3=A9nard wrote:
>> use ${POKY_BASE_INSTALL} in order to have the base files and
>> ools in the image.
>>
>> ..
>>
>>   IMAGE_INSTALL +=3D "\
>> -	busybox \
>> +	${POKY_BASE_INSTALL} \
>>   	module-init-tools \
>>   	task-qt4e-base \
>>   "
>
> Hmm, I missed this when the original patches came in; surely it would b=
e
> better to just append to IMAGE_INSTALL after the "inherit core-image" l=
ine,
> then we start with the default value from core-image.bbclass?
>
ok I was not sure this would work this way, I'll test and send a v2.

Thanks,
Eric


