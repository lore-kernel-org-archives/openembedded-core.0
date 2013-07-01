Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E739D6AD1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 09:50:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 02:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="262324763"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jul 2013 02:45:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Mon, 01 Jul 2013 10:45:12 +0100
Message-ID: <7382678.nsfBjGc6RQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <51D0E0EA.5040902@windriver.com>
References: <cover.1371802236.git.kai.kang@windriver.com>
	<5322253.NAOJVtts1F@helios> <51D0E0EA.5040902@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: add configure options libaio and acl
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
X-List-Received-Date: Mon, 01 Jul 2013 09:50:17 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 01 July 2013 09:52:42 Kang Kai wrote:
> On 2013=E5=B9=B406=E6=9C=8829=E6=97=A5 01:16, Paul Eggleton wrote:
> > Secondly, although this seems to work the use
> > of overrides, +=3D and ?=3D together is a little bit confusing. Per=
haps the
> > following would be a bit clearer:
> >=20
> > PACKAGECONFIG_class-target ?=3D "aio \
> >=20
> >                                ${@base_contains('DISTRO_FEATURES', =
'acl',
> >                                'acl', '', d)}"
>=20
> I considered this way.
> When 'acl' in distro feature, I want strace enable acl support. But
> PACKAGECONFIG could be overwritten that even 'acl' in distro feature =
but
> not in 'PACKAGECONFIG'.

I don't think this is a big issue - we have a fairly strong precedent f=
or=20
doing it this way so that PACKAGECONFIG customisation overrides=20
DISTRO_FEATURES, based on usage in other recipes.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

