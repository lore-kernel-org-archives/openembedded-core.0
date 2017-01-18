Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1C371A6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 22:40:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2017 14:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,250,1477983600"; 
	d="asc'?scan'208";a="1095920361"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.142])
	([10.219.5.142])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2017 14:40:48 -0800
References: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>
To: openembedded-core@lists.openembedded.org
From: Jose Lamego <jose.a.lamego@linux.intel.com>
X-Forwarded-Message-Id: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>
Message-ID: <ce28562f-28dd-3b65-8b72-5626e429091e@linux.intel.com>
Date: Wed, 18 Jan 2017 16:40:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>
Subject: Re: [yocto] [Openembedded-architecture] Patchwork and incoming patch testing
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
X-List-Received-Date: Wed, 18 Jan 2017 22:40:53 -0000
X-Groupsio-MsgNum: 91880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="VNESiqkuHJl91F45v22FVb6XSh2lMqFUH"

--VNESiqkuHJl91F45v22FVb6XSh2lMqFUH
Content-Type: multipart/mixed; boundary="UvO950SCDJ0mptnOTjkdqmKWeheCxoIdn";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <ce28562f-28dd-3b65-8b72-5626e429091e@linux.intel.com>
Subject: Re: [OE-core] [yocto] [Openembedded-architecture] Patchwork and
 incoming patch testing
References: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>
In-Reply-To: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>

--UvO950SCDJ0mptnOTjkdqmKWeheCxoIdn
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On 01/18/2017 08:52 AM, Leonardo Sandoval wrote:
> + Jose Lamego
>=20
>=20
> Jose is doing recent work on the patchwork UI, perhaps there are alread=
y
> bugs for the items you are asking.
>=20
>=20
> On 01/18/2017 02:40 AM, Jussi Kukkonen wrote:
>> This looks great, thanks.
>>
>> On 17 January 2017 at 20:05, Paul Eggleton
>> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>>=

>> wrote:
>>
>>     In any event we are now finally in the
>>     position where our patchwork instance can be relied upon to
>>     collect emails,
>>     and the UI is much improved. This should give us a bit more
>>     visibility into
>>     where patches are at in the process, although we are still working=

>>     on a few
>>     places where patch series status needs to be updated (e.g. when a
>>     patch goes
>>     into testing).
>>
>>
>> What's the plan for these status updates -- is the idea that you go to=

>> patchwork UI to see the state of a specific patch set?
>> Or maybe a reply to either patch sender or even the ML?
>>
There is a request to enable email notifications to submitter for patch
status changes in the future:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7684

The idea is that users should have the option to use what they prefer:
either the email notifications, or the patchwork web interface.

>>     On top of patchwork we have built a simple smoke-testing framework=

>>     called
>>     "patchtest" [5] along with a suite of corresponding tests for OE
>>     [6]. These
>>     tests are fairly simplistic at this point but check the basics
>>     such as whether
>>     a patch has been properly signed off, etc. We should soon start
>>     seeing replies
>>     sent to the mailing list and to submitters with results if there
>>     are any
>>     failures, saving us from noticing and pointing out some of the
>>     more obvious
>>     classes of mistakes.
>>
>>
>>  Is there a reason for patchwork only showing "success" or "failure"
>> in the web ui, instead of linking to test results at least in in the
>> failure case?
>=20
> Jussi, that is a good idea. Right now we need to click into the series,=

> then into the patches and then one can see the patch test results,
> obviously, not the best way.
>=20
>>
>>
>>
>>  - Jussi
>>
>>
--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC




--UvO950SCDJ0mptnOTjkdqmKWeheCxoIdn--

--VNESiqkuHJl91F45v22FVb6XSh2lMqFUH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYf+70AAoJEFJAtowlSEbnlOIH/RNQmHmTu0x2QANpw9Spthbz
KGXiMjuXQXTqCrtdWAdXofCCKa2i6tKJxPVlTQ0vG/SRMFP2M5xyCc1BSpgUrMME
HtJEBDq4tlZ2hEBGNvYMkYMUmUqPccW61DZRj0CS5Ko6AD1LWF5vaoCguQMn/z+d
R+i9A+NDJxDi3FJPpMfPgqercnb8hZVm3yFk2qWimQFVOnyDxMzXo90WY/B11MIn
89JASta5BYTtl+trh9yc9dmOp+wPZivwRHUIPmW4zQ1R6hEKQJOvo4anJK+M8aw1
7ZnMsO/Ap2ggpiKr5oHBNFchzPhOxI5L2Zj74XbP06wjVSZzP7BMEkMj9t13dDo=
=YJ42
-----END PGP SIGNATURE-----

--VNESiqkuHJl91F45v22FVb6XSh2lMqFUH--
