Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qe7E9-0007Wk-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:07:53 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:99c4:3913:164.170.217.90]) by
	stoexhubfe01.domain01.net
	([10.12.10.6]) with mapi; Tue, 5 Jul 2011 17:04:04 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 17:04:25 +0200
Thread-Topic: [OE-core] [PATCH 1/1] kernel.bbclass: make external module
	compile
Thread-Index: Acw7JMeMMmxIW0q6S9CHrtzZBadg9A==
Message-ID: <ECF13383-E711-4CE2-8E50-222852DC392D@chargestorm.se>
References: <cover.1309867242.git.anders@chargestorm.se>
	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
	<1309869846.2410.3.camel@phil-desktop>
	<201107051454.04409.anders@chargestorm.se>
	<1309871340.20015.700.camel@rex>
In-Reply-To: <1309871340.20015.700.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module compile
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
X-List-Received-Date: Tue, 05 Jul 2011 15:07:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 5 jul 2011, at 15:09, "Richard Purdie" <richard.purdie@linuxfoundation.o=
rg> wrote:

> On Tue, 2011-07-05 at 14:54 +0200, Anders Darander wrote:
>> * Phil Blundell Phil Blundell <pb@pbcl.net> [07/05/11 02:44 PM]:
>>> On Tue, 2011-07-05 at 14:01 +0200, Anders Darander wrote:
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index 943252a..26ee416 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -149,7 +149,6 @@ kernel_do_install() {
>>>=20
>>>        #
>>>        # We don't want to leave host-arch binaries in /sysroots, so
>>>        # we clean the scripts dir while leaving the generated config
>>>=20
>>>>    # and include files.
>>>>    #
>>>>    oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" cl=
ean
>>>>=20
>>>> -    make -C $kerneldir _mrproper_scripts
>>>>=20
>>>>    find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]"
>>>>    -exec rm '{}' \; find $kerneldir/Documentation -name "*.txt" -exec =
rm
>>>>    '{}' \;
>>>=20
>>> Did you verify that this doesn't introduce any new QA warnings during
>>> packaging?  Presumably that line was originally added for a reason and
>>> it seems a bit surprising that just deleting it without any replacement
>>> is the right thing to do.
>>=20
>> No, I didn't really verify that. Do I need to run with any specific opti=
ons=20
>> enabled, or should it be enough to just bitbake my modules recipe? (I ca=
n't=20
>> test for the moment, as the latest pull from oe-core forces a rebuild of=
 gcc=20
>> etc).
>>=20
>>> Also, if the scripts dir isn't being cleaned anymore, I guess the
>>> preceding comment should be adjusted to match the new reality.
>>=20
>> That's true.
>>=20
>> I'll wait to see if someone else has any comments, or if I find some QA=
=20
>> warnings before I produce a version 2.
>=20
> I'm cc'ing Darren as this is one of his favourite subjects :/.
>=20
> Summary is that this works well in some kernel versions and not in
> others. We might have to start doing this conditionally based upon
> kernel version I guess...

Ah, well then it is worse than I thought. ( On the other hand, that would e=
xplain why no one has noticed the problem, until I tried using the wrong ke=
rnel version).

Do we have any idea at what point the kernel breaks? I guess that might be =
a question for Darren.

Cheers,
Anders=


