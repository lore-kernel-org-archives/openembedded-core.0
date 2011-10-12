Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1RE3Ld-0008WU-Ev
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 20:16:09 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id AFAB2799088; Wed, 12 Oct 2011 20:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-249-031.pools.arcor-ip.net
	[88.71.249.31]) by gravedo.de (Postfix) with ESMTPSA id 466ED799086;
	Wed, 12 Oct 2011 20:10:27 +0200 (CEST)
Message-ID: <4E95D811.7090105@gravedo.de>
Date: Wed, 12 Oct 2011 20:10:25 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com>
In-Reply-To: <4E954984.7020202@eukrea.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 1/4] qt4-embedded: remove dependency on tslib and use std. linux input
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
X-List-Received-Date: Wed, 12 Oct 2011 18:16:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12.10.2011 10:02, Eric B=E9nard wrote:
> Hi,
>=20
> Le 12/10/2011 09:45, Martin Jansa a =E9crit :
>> From: Simon Busch<morphis@gravedo.de>
>>
>> In most cases we don't need tslib in std. configuration as touchscreen
>> access in most
>> devices today is done with linux input interface. If some specific
>> machine has a need for
>> tslib support it should add the dependency in it's machine layer again
>> and modify the
>> profile script accordingly.
>>
> When using a resistive touchscreen, tslib is a common solution to handl=
e
> calibration and raw value processing : do you think this is a good thin=
g
> to remove this ?

Thats up to the environment you are using qt4-embedded in. In my case
the setup is a little bit more complicated. We're using tslib but not
directly in qt4-embedded (we can get rid of tslib completely but time is
missing).

I removed the dependency from qt4-embedded as qt4-embedded in oe-core
should be the general thing used in all environments and therefore
should be only a minimal setup with minimal dependencies.

If someone needs tslib for qt4-embedded for his machine layer he should
include tslib support in the machine layer itself.

regards,
Simon

--=20
Simon Busch - http://mm.gravedo.de/blog/


