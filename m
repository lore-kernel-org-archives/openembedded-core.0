Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1CE7FFC1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 03:19:02 +0000 (UTC)
IronPort-SDR: iy2pfm461iFG6/LmTqzmHdVKBT3xhwpAausej95udVh6Z9EAiapWXBD4KiOp8kuK7YlW1AAiel
	TS7FXA/aTq6e+FAawY2VJn8vlXjOkARB34XzLLtSDOinBLDuC/fcINwj4lcsJCphX/m8XU/kEh
	0u+FLn4td3d6y8hxizkKsd4lTaS+MNLjnCmGQf2lVe0i6mRMzbSJsurNiUFSD3I/pPlIWvhQ3T
	/HKNSFKkHRUwoMMOPnFwvIOnvD5PrkL+989enWcxJTScv++lhm+pbHeNjgc52uzwHvkTmKSchB
	5O0=
X-IronPort-AV: E=Sophos;i="5.69,419,1571695200"; 
   d="scan'208";a="4204942"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [master][zeus][PATCHv2] cairo: Adapt license for
	cairo-dbg and cairo-src based on contents
Thread-Index: AQHVyA2g1oGtkaa+PEqcdgCNl8CCMqfkyvng
Date: Sat, 11 Jan 2020 03:19:02 +0000
Message-ID: <01cc92ebbe524f1cae23acb05e4a5d07@XBOX03.axis.com>
References: <20200110220306.13780-1-pkj@axis.com>
	<fabf0714-f1be-16a9-6b47-b065f0f7eaed@intel.com>
In-Reply-To: <fabf0714-f1be-16a9-6b47-b065f0f7eaed@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [master][zeus][PATCHv2] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Sat, 11 Jan 2020 03:19:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 11 januari 2020 00:28
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][zeus][PATCHv2] cairo: Adapt license for
> cairo-dbg and cairo-src based on contents
>=20
> On 10/01/2020 22:03, Peter Kjellerstedt wrote:
> > Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
> > part of the code licensed as GPL-3.0, and which is normally packaged
> > separately in cairo-perf-utils). By disabling this, we can adapt the
> > licenses for cairo-dbg and cairo-src so that they do not include
> > "GPLv3+" when trace is disabled and thus they can be used also when,
> > e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.
>=20
> The shortlog makes no mention of trace at all.  Can this be split into
> two commits, one for trace and one for the license mangling.

I will split it in two patches.

> The license mangling is quite ugly but I'm not sure if there's a better
> solution...
>=20
> Ross

//Peter


