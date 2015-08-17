Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A99B2606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 13:12:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 17 Aug 2015 06:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="770306950"
Received: from jwanrooi-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.216])
	by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2015 06:12:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 17 Aug 2015 14:12:48 +0100
Message-ID: <1996666.8cjXHH8UEW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55D1DD2D.8040402@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSbR5fzUUs7F+s_NqesaQa=XG5E8j4gEew845-tVpE3AA@mail.gmail.com>
	<55D1DD2D.8040402@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/22] libwnck3: add a recipe from meta-gnome
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
X-List-Received-Date: Mon, 17 Aug 2015 13:12:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Alex,

On Monday 17 August 2015 16:10:05 Alexander Kanavin wrote:
> On 08/14/2015 02:04 PM, Andreas M=FCller wrote:
> >> +PR =3D "r1"
> >=20
> > ^ Please skip
>=20
> Thanks, I also dropped unnecessary PRs from other recipes involved in=

> the patchset.

Not sure if it's applicable here, but if any of these PR values were pr=
esent=20
in the original recipes and we're not upgrading as part of the move (i.=
e. PV=20
is not changing) we need to keep the PR value, otherwise people current=
ly=20
using them will see PR go backwards.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

