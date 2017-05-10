Return-Path: <prvs=93033f9ec8=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id E1FD760107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:53:18 +0000 (UTC)
X-AuditID: 0a00029b-70bff70000003f55-b7-59136faba74f
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	89.43.16213.BAF63195; Wed, 10 May 2017 14:53:18 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 May 2017 14:53:15 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Gary Thomas
	<gary@mlbassoc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC PATCH 00/10] Add openssl 1.1
Thread-Index: AQHSyZefJriOROMie0iYjBQbJx3PdaHtqNpwgABYZID//6zXUIAAWV4AgAA3UgCAAAqrgP//sHTw
Date: Wed, 10 May 2017 19:53:15 +0000
Message-ID: <655290B7709079438B7932553958E60D16D2C96C@ESS-EX01.essvote.corp.local>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
In-Reply-To: <abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsWyRiBPQ3ddvnCkwa8bRhb/H29js7jUO4Hd
	4s7Pd+wOzB7zTgZ6nNu4gtHj6+ZJLAHMUdw2SYklZcGZ6Xn6dgncGf+XdzAWnOSvWPVjNWMD
	4zOeLkZODgkBE4k/G86xdzFycQgJHGWU+NbczQjhzGKUuPDwHDNIFZuAkcS565vAEiICWxkl
	/r3/yQKSEBawkDg2/xU7iC0iYCnxYvshoCIOIDtK4th6LZAwi4CqxOrZH1lBbF6BIImbc/4y
	gthCAtuZJd5PlgaxOQWcJfY96gMbwyggJvH91BomEJtZQFzi1pP5TBCXCkgs2XOeGcIWlXj5
	+B8rhC0n8a6pjRWiXkdiwe5PbBC2tsSyha+ZIfYKSpyc+YRlAqPILCRjZyFpmYWkZRaSlgWM
	LKsY+XKN9FKLi8vyS1L1kvNzNzEC44KLgWn2DsY9ExwOMQpwMCrx8F7gE44UYk0sK67MPcQo
	zcGiJM77bCVzpJBAemJJanZqakFqUXxRaU5q8SFGJg7OQ4wSHFxSIsWpeSmpRYmlJRnxoLiK
	LwZGllQD40Zbkya3j7JBczbZOvu+MFlRpK0yK7d5r3i4yN3WtedfeRn+WnlY+4IV5/LMHZvC
	hWemOf4NmhxzL4vT3Et03f7qszL/HIQcM5/02P+eqqxUy1h456PF301pJupebl3bJWOTTy0X
	e+QZEyDA1/D64OLHMln/WP5o8eZuiy7yFXpq/m/uvSlySizFGYmGWsxFxYkAqMDldYcCAAA=
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 May 2017 19:53:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could we offload the 1.0.2 supported recipes to something similar to meta-g=
plv2?
Then the rest of the Yocto world can move on and those that need 1.0.x can =
seek it out.



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Alexander Kanavin
Sent: Wednesday, May 10, 2017 2:34 PM
To: Gary Thomas; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 00/10] Add openssl 1.1

On 05/10/2017 09:56 PM, Gary Thomas wrote:
> Why not do this in a "softer" way - make the new 1.1 package have the
> obscured name (and not be preferred by default)?  That way existing
> uses of the older 1.0 package can continue but users can migrate to
> 1.1 as they see fit?

I have an answer which you might not particularly like. But here goes:

What will actually happen is that no one will do anything to port their=20
stuff until it's time to remove 1.0 because upstream has EOLd it. And=20
then there'll still be complaints that more time is needed for the=20
transition. I'd like to gently push people to plan this transition=20
already now - and it's as gentle as it can be: if you pull from master=20
and your things no longer build, make one simple change and they will.=20
It's part and parcel of being on the bleeding edge, or rebasing to the=20
new yocto release: not everything works exactly as before, and most=20
components are newer and different and not always fully compatible.

The other reason is that it's more work for me: I would have to update=20
everything in oe-core to use the new recipe, instead of fixing just a=20
few recipes that need to stay with 1.0. And then again the same thing=20
will happen when 1.2 is out.

Alex
--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

