Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QfBCm-0007Cm-8v
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:34:52 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:99c4:3913:164.170.217.90]) by
	stoexhub02.domain01.net
	([10.12.10.2]) with mapi; Fri, 8 Jul 2011 15:30:58 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 15:31:35 +0200
Thread-Topic: [OE-core] [PATCH 1/1] kernel.bbclass: make external module
	compile
Thread-Index: Acw9c0VHDw3zEodFQMOmxm4utQQMgA==
Message-ID: <41FA4BAA-39A6-4F15-9CCA-102CF3503300@chargestorm.se>
References: <cover.1309867242.git.anders@chargestorm.se>
	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
	<1309869846.2410.3.camel@phil-desktop>
	<201107051454.04409.anders@chargestorm.se>
	<1309871340.20015.700.camel@rex>
	<ECF13383-E711-4CE2-8E50-222852DC392D@chargestorm.se>
	<4E148F5C.4020902@linux.intel.com>
	<CADF341D-7B4B-416D-BAEE-38A5FC373788@chargestorm.se>
	<4E14A7EB.4030104@linux.intel.com>
In-Reply-To: <4E14A7EB.4030104@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module	compile
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
X-List-Received-Date: Fri, 08 Jul 2011 13:34:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 6 jul 2011, at 20:32, "Darren Hart" <dvhart@linux.intel.com> wrote:
>=20
> On 07/06/2011 10:31 AM, Anders Darander wrote:
>> Hi Darren,
>>=20
>> On 6 jul 2011, at 18:37, "Darren Hart" <dvhart@linux.intel.com>
>> wrote:
>>> The scripts are recreated during the build of module.bbclass
>>> derived recipes. Are you trying to build modules independently of
>>> this method? Richard expressed concerns about not including host
>>> specific binaries in the sstate, which was part of the reason this
>>> approach was taken.
>>=20
>> Thanks for pointing out this, especially the first sentence in this
>> paragraph. No matter how many times I've looked at both the recipes
>> in question, as well as the meta/classes directory, I haven't noticed
>> that the old, inherited recipes were not using module.bbclass, but
>> rather inherited module-base.bbclass directly. I'll assume that once
>> I change that, and fix the recipes properly all my issues will go
>> away.
>>=20
>> Once more, thanks for pointing me to the real problem.
>=20
> Excellent, please keep us posted!

Fixing the module recipes as hinted above, solved my problems. Thus, I've b=
ack ported the fixes to our current build system, based on oe-dev.

Thanks again!

Cheers,
Anders=


