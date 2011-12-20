Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RcudR-0003T3-Fk
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 09:01:17 +0100
Received: from mail97.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id F14171064735
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 07:36:47 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Dec 2011 08:36:12 +0200
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO ?192.168.0.2?)
	(ebenard%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 20 Dec 2011 08:36:11 +0200
Message-ID: <4EF02CDA.8070707@eukrea.com>
Date: Tue, 20 Dec 2011 07:36:10 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted> <4EE8E607.5080207@emagii.com>
	<CAMKF1sqgzc=RK4G2yMahvFrTAGSwH40fxjCy=tifrMU=isdO+w@mail.gmail.com>
In-Reply-To: <CAMKF1sqgzc=RK4G2yMahvFrTAGSwH40fxjCy=tifrMU=isdO+w@mail.gmail.com>
X-Ovh-Tracer-Id: 3232177158678359490
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefkedrtdefucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffhfgfggfvufhfjggtgfesthekrgdttdefudenucfhrhhomhepgfhrihgtpgeurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepne
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefjedruddvucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffhfgfggfvufhfjggtgfesthekrgdttdefudenucfhrhhomhepgfhrihgtpgeurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepne
Cc: ulf@emagii.com
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
X-List-Received-Date: Tue, 20 Dec 2011 08:01:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi, Khem,

Le 14/12/2011 19:38, Khem Raj a =E9crit :
> On Wed, Dec 14, 2011 at 10:08 AM, Ulf Samuelsson
> <openembedded-core@emagii.com>  wrote:
>>>
>>>
>> Not familiar with gcc internals, but just want to reiterate the point
>> that the problem occured (the one I saw) only when I had
>> BB_NUMBER_THREADS at a high value, so WHEN things are done seems to be
>> important.
>
Seems more complicated than this. A customeer reproduced it with BB_THREA=
D=3D2
and PARALLEL=3Dj3 ... (I never reproduced in with BB_THREAD < 5)

> could you test out this patch in your configuration and see if you stil=
l
> see the problem ?
>
I reproduced the problem with this patch and BB_THREAD=3D8 so this patch =
doesn't
improve the current behaviour.

Eric


