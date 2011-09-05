Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R0bsB-0006yM-4j
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 18:18:11 +0200
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 500184B00C1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 18:13:09 +0200 (CEST)
Message-ID: <4E64F514.5050203@eukrea.com>
Date: Mon, 05 Sep 2011 18:13:08 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315237881-14077-1-git-send-email-denis@eukrea.com>
	<1315238669.2519.21.camel@phil-desktop>
In-Reply-To: <1315238669.2519.21.camel@phil-desktop>
Subject: Re: [PATCH] busybox: import the configuration from openembedded.dev
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
X-List-Received-Date: Mon, 05 Sep 2011 16:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 05/09/2011 18:04, Phil Blundell a =E9crit :
> On Mon, 2011-09-05 at 17:51 +0200, Denis Carikli wrote:
>> Without that patch many applets are not build, like for instance
>>    mdev, which could be necessary for building certain images.
>
> If your distro needs mdev then you should probably supply your own
> busybox config which turns it on.  For modern kernels mdev is probably
> redundant since you will usually be better off with devtmpfs.
>
mdev is not simply a device node creator and can be used for example for=20
firmware loading, touchscreen symbolic link creation for tslib or automat=
ic=20
mount of inserted medias

> Or, conversely, if you feel that a particular change is important enoug=
h
> that it really needs to go into the global busybox config for oe-core,
> please send a patch which makes just that one change.  The patch you
> sent flips a large set of of seemingly-random switches, for example:
>
true, I think we will handle this defconfig in our layer that will be eas=
ier.

Eric


