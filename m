Return-Path: <ulf@emagii.com>
Received: from smtprelay-h31.telenor.se (smtprelay-h31.telenor.se
	[213.150.131.4])
	by mail.openembedded.org (Postfix) with ESMTP id 08AA66D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 17:00:44 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 3CE98C038
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 18:00:42 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ai4iAGUNnlJT4zlmPGdsb2JhbAANTYM/iAexM4ExAwEBAQE4gloBAQEBAgEnExEBLQULCxUDLkMUBhOHewuwJYVWAYtVF45LMweDIIETA5gUlT0
X-IronPort-AV: E=Sophos;i="4.93,818,1378850400"; d="scan'208";a="688864522"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.117]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 03 Dec 2013 18:00:12 +0100
References: <1386009374-29047-1-git-send-email-ulf@emagii.com>
	<1546307.bObJ7pByZf@helios>
In-Reply-To: <1546307.bObJ7pByZf@helios>
Mime-Version: 1.0 (1.0)
Message-Id: <91FA4361-FD84-4163-BA0B-0E7535B7FF49@emagii.com>
X-Mailer: iPad Mail (9B176)
From: Ulf Samuelsson <ulf@emagii.com>
Date: Tue, 3 Dec 2013 18:00:11 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curlpp: add curl c++ bindings
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
X-List-Received-Date: Tue, 03 Dec 2013 17:00:45 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Just thought it fit nicely besides curl...

I use it for a proprietary customer application.
The application sends out debug messages over UDP
This will reside in private layers.

Have also written a small utility, which receives the UDP packets and=20
simply writes them out on a terminal.
It is quite useful when you dont have a screen connected.
Thinking of checking that in somewhere.

Would meta-openembedded/meta-networking/recipes-support be OK?

Best Regards
Ulf Samuelsson
ulf@emagii.com


3 dec 2013 kl. 13:24 skrev Paul Eggleton <paul.eggleton@linux.intel.com>:

> Hi Ulf,
>=20
> On Monday 02 December 2013 19:36:14 ulf@emagii.com wrote:
>> From: Ulf Samuelsson <ulf@emagii.com>
>>=20
>> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
>> ---
>> .../curlpp/curlpp/pkgconfig_fix.patch              |   38 +++++++++
>> meta/recipes-support/curlpp/curlpp_0.7.3.bb        |   89
>> ++++++++++++++++++++ 2 files changed, 127 insertions(+)
>> create mode 100644 meta/recipes-support/curlpp/curlpp/pkgconfig_fix.patch=

>> create mode 100644 meta/recipes-support/curlpp/curlpp_0.7.3.bb
>=20
> You sent v1 of this to openembedded-devel so I had assumed it was for meta=
-oe.=20
> To be honest I don't think this belongs in OE-Core, unless we actually nee=
d it=20
> for something else that is in OE-Core (or something that needs to be added=
 to=20
> OE-Core).
>=20
> Also, you didn't fix DESCRIPTION -> SUMMARY or drop PR in this version.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

