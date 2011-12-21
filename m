Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdNC2-0002tC-0m
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 15:30:54 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6B7AE4B051E;
	Wed, 21 Dec 2011 15:23:46 +0100 (CET)
Message-ID: <4EF1EBF1.4090509@eukrea.com>
Date: Wed, 21 Dec 2011 15:23:45 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted> <4EE8E607.5080207@emagii.com>
	<CAMKF1sqgzc=RK4G2yMahvFrTAGSwH40fxjCy=tifrMU=isdO+w@mail.gmail.com>
	<4EF02CDA.8070707@eukrea.com>
	<CAMKF1soiqXt3dcJea5o=54bTaJNGUxRDHBoHe6TWa-hEx=AgHw@mail.gmail.com>
In-Reply-To: <CAMKF1soiqXt3dcJea5o=54bTaJNGUxRDHBoHe6TWa-hEx=AgHw@mail.gmail.com>
Cc: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Wed, 21 Dec 2011 14:30:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le 20/12/2011 20:59, Khem Raj a =C3=A9crit :
> On Mon, Dec 19, 2011 at 10:36 PM, Eric B=C3=A9nard<eric@eukrea.com>  wr=
ote:
>> Hi, Khem,
>>
>> Le 14/12/2011 19:38, Khem Raj a =C3=A9crit :
>>
>>> On Wed, Dec 14, 2011 at 10:08 AM, Ulf Samuelsson
>>> <openembedded-core@emagii.com>    wrote:
>>>>>
>>>>>
>>>>>
>>>> Not familiar with gcc internals, but just want to reiterate the
>>>> point that the problem occured (the one I saw) only when I had
>>>> BB_NUMBER_THREADS at a high value, so WHEN things are done seems to
>>>> be important.
>>>
>>>
>> Seems more complicated than this. A customeer reproduced it with
>> BB_THREAD=3D2 and PARALLEL=3Dj3 ... (I never reproduced in with BB_THR=
EAD<
>> 5)
>>
>
> Can you see when gcc-runtime was finished building and staging w.r.t to=
 the
> failing app
>
rm_work on gcc-runtime was done far before do_configure on the failing ap=
p
(mysql in the present case).

Eric


