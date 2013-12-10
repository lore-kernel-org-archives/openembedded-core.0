Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id 07B9D6DF2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 18:48:14 +0000 (UTC)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 8BF3CEAB32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:48:12 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjkdAPVgp1JT4zlmPGdsb2JhbAANTIM/g1K1UU6BNAMBAQEBOIJaAQEBAQIBAQEBIEsLBQsLGgImAgInARsUBhOHfAsIsEx2j1YXgSmNGg8zB4JsNYETAQOUMYEUgk+BMJQNgWk
X-IronPort-AV: E=Sophos;i="4.93,866,1378850400"; d="scan'208";a="481445570"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.117]) ([83.227.57.102])
	by ipb5.telenor.se with ESMTP; 10 Dec 2013 19:48:12 +0100
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>
Mime-Version: 1.0 (1.0)
Message-Id: <6C5A628A-9BF6-4067-AD8F-FD324B6A90A3@emagii.com>
X-Mailer: iPad Mail (9B176)
From: Ulf Samuelsson <openembedded-core@emagii.com>
Date: Tue, 10 Dec 2013 19:48:12 +0100
To: =?utf-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can OE build it's own make?
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
X-List-Received-Date: Tue, 10 Dec 2013 18:48:15 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

You need to do a number of things anyway to prepare a machine for building o=
penembedded.
I have a git repository containing a script which will install all the packa=
ges I want to have on my machine. It will also build new versions of some ap=
plications.

When I install a new Ubuntu machine, i manually add synaptic, then add gnome=
 + git + ssh keys.
Then I download the script and let it run.
Suggest you adopt a similar approach.

Best Regards
Ulf Samuelsson
ulf@emagii.com
+46  (722) 427 437


10 dec 2013 kl. 17:36 skrev Mats K=C3=A4rrman <Mats.Karrman@tritech.se>:

> Hi,
>=20
> I have run into problems with make.
>=20
> Most things works fine with make v3.81 but when building a kernel recipe (=
meta-fsl-arm linux-imx-3.10.9)
> I consistently get:
>=20
> make: INTERNAL: Exiting with 5 jobserver tokens available; should be 4!
>=20
> To solve this I "manually" upgraded make on my machine to v3.82 which soon=
 brought new problems.
> I then realized that OE-core got a recipe for make v3.82 with a number of p=
atches. After rebuilding
> make using those patches, everything now seems to work fine :-D.
>=20
> It would be nice, however, if I didn't have to write detailed instructions=
 for everyone on how to patch
> their machines in order to get their builds to work. Is it possible that O=
E could build it's own make
> to use the same way it compiles a new compiler using the existing one? (bu=
ilding make v3.82 using
> make v3.81 works fine;)
>=20
> BR // Mats
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

