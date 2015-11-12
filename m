Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1641977259;
	Thu, 12 Nov 2015 19:09:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 Nov 2015 11:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,283,1444719600"; d="scan'208";a="818489890"
Received: from avanloen-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Nov 2015 11:08:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 12 Nov 2015 19:08:55 +0000
Message-ID: <4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Thu, 12 Nov 2015 19:09:01 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 12 November 2015 18:03:27 Andreas M=FCller wrote:
> On Thu, Nov 12, 2015 at 5:45 PM,  <alexander.kanavin@linux.intel.com>=
 wrote:
> > Hello,
> >=20
> > now that 2.0 is out, it's time to move the Qt4 recipes out of oe-co=
re.
> > This has been discussed previously here:
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-June=
/106355
> > .html
> >=20
> > I'm not sure where the recipes should land, and want to ask your op=
inion.
> > The options are:
> > 1) Make a new layer, meta-qt4, under meta-openembedded tree. Move a=
lso
> > everything in meta-oe/recipes-qt (and possibly other spots) to that=
 layer.
> > This is somewhat more disruptive to people's layer configurations, =
but
> > would clearly separate qt4, and slim down meta-oe.
> >=20
> > 2) Simply move the qt4 recipes from oe-core to meta-oe/recipes-qt, =
so they
> > will be next to all the qt4-based software. This is less disruptive=
, but
> > adds bloat to meta-oe.
> >=20
> > Preferences?
>=20
> 1) or even better in a separate repo

To be honest, I had anticipated this being a separate meta-qt4 repo mys=
elf. It=20
would be consistent with what has been done with Qt 5 and much earlier =
with=20
Qt 3.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

