Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RE4T4-00026s-Di
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:27:54 +0200
Received: from [192.168.2.12] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 85A08A6532;
	Wed, 12 Oct 2011 21:22:07 +0200 (CEST)
Message-ID: <4E95E8DE.50906@eukrea.com>
Date: Wed, 12 Oct 2011 21:22:06 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Simon Busch <morphis@gravedo.de>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com> <4E95D811.7090105@gravedo.de>
In-Reply-To: <4E95D811.7090105@gravedo.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
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
X-List-Received-Date: Wed, 12 Oct 2011 19:27:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 12/10/2011 20:10, Simon Busch a =E9crit :
> On 12.10.2011 10:02, Eric B=E9nard wrote:
>> Le 12/10/2011 09:45, Martin Jansa a =E9crit :
>>> From: Simon Busch<morphis@gravedo.de>
>>>
>>> In most cases we don't need tslib in std. configuration as touchscree=
n
>>> access in most
>>> devices today is done with linux input interface. If some specific
>>> machine has a need for
>>> tslib support it should add the dependency in it's machine layer agai=
n
>>> and modify the
>>> profile script accordingly.
>>>
>> When using a resistive touchscreen, tslib is a common solution to hand=
le
>> calibration and raw value processing : do you think this is a good thi=
ng
>> to remove this ?
>
> Thats up to the environment you are using qt4-embedded in. In my case
> the setup is a little bit more complicated. We're using tslib but not
> directly in qt4-embedded (we can get rid of tslib completely but time i=
s
> missing).
>
> I removed the dependency from qt4-embedded as qt4-embedded in oe-core
> should be the general thing used in all environments and therefore
> should be only a minimal setup with minimal dependencies.
>
> If someone needs tslib for qt4-embedded for his machine layer he should
> include tslib support in the machine layer itself.
>
removing tslib plugin in qt4e seems not the good solution as this plugin =
can
be built but not installed by default.
In my opinion that's only the qte.sh script which could be more generic a=
nd=20
maybe could be in its own configuration package so that several machines =
can=20
share the same qt4e packages (picking the plugins they need) and have the=
ir=20
own qte-config (for example) package.

Else, why don't you akso remove plugin-gfx-transformed which is not used =
be=20
many machines, or plugin-gfx-vnc or plugin-gfx-directfb which is only use=
d on=20
machine needing directfb or plugin-gfx-qvfb as real machine don't need a=20
virtual framebuffer or even qt-mouse-pc as you may think that pc with mou=
ses=20
don't need qtembedded ... in the end we may also notice that basic platfo=
rms=20
can use qt without a display, so why not removing graphic support at all =
to=20
make the think even more generic and reduce the number of dependencies ;-=
)

Eric


