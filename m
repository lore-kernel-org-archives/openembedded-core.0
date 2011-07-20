Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/yeJ7ESa3QvrxeegkmxyaqkM+/neNVoIc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjWnH-0001ZR-0O
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 15:26:31 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6KDMO0P013893
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 08:22:25 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311166533.30326.69.camel@phil-desktop>
Date: Wed, 20 Jul 2011 08:22:24 -0500
Message-Id: <DC646D4C-BD60-47B8-A310-57C5FDF55FC7@kernel.crashing.org>
References: <611DBEB9-A901-4A01-AEB0-EAC2724FBED1@kernel.crashing.org>
	<1311165818.30326.67.camel@phil-desktop>
	<202EE89F-DBDC-444E-B95F-01DD7DC36201@kernel.crashing.org>
	<1311166533.30326.69.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: lzo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 13:26:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 20, 2011, at 7:55 AM, Phil Blundell wrote:

> On Wed, 2011-07-20 at 07:51 -0500, Kumar Gala wrote:
>> On Jul 20, 2011, at 7:43 AM, Phil Blundell wrote:
>>=20
>>> On Wed, 2011-07-20 at 07:31 -0500, Kumar Gala wrote:
>>>> configure:=20
>>>> configure: Your compiler failed the ACC conformance test - for =
details see=20
>>>> configure: `config.log'. Please check that log file and consider =
sending
>>>> configure: a patch or bug-report to <markus@oberhumer.com>.
>>>> configure: Thanks for your support.
>>>> configure:=20
>>>> configure: error: ACC conformance test failed. Stop.
>>>=20
>>> Did you check config.log as it suggests?  If yes, what did you find
>>> there?
>=20
>> Here's what config.log looks like:
>>=20
>> http://pastebin.com/y9KzkQ5M
>>=20
>> Can't see anything obvious in there.
>=20
> Well, if you search for "ACC conformance test" in that pastebin, you
> will see:
>=20
> configure:13578: checking whether your compiler passes the ACC
> conformance test
> configure:13623: ccache powerpc64-poky-linux-gcc -mcpu=3De5500 -m64
> =
--sysroot=3D/local/home/galak/git/poky64/build-p5020/tmp/sysroots/p5020-ds=

> -c -O2 -pipe -g -feliminate-unused-debug-types -I.  conftest.c >&5
> In file included from conftest.c:118:0:
> src/miniacc.h:4348:16: error: size of array '__acc_cta' is negative
> [...]
> configure:13631: result: FAILED
>=20
> So I think you need to inspect that part of the code and figure out =
what
> exactly it's upset about.
>=20
> p.

Thanks, missed that in the log.

- k=


