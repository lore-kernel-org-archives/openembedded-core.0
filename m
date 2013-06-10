Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F96C6A66B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:37:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2013 09:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,838,1363158000"; d="scan'208";a="351175627"
Received: from unknown (HELO helios.localnet) ([10.252.122.12])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2013 09:37:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 10 Jun 2013 17:37:48 +0100
Message-ID: <3535914.EF08dTn6M4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <20130610151356.16549ecd@e6520eb>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<CAP71WjxNCrqyvu03V+qQY15y=2X7y_2m4Z9HOXFOJiH_VfbaJg@mail.gmail.com>
	<20130610151356.16549ecd@e6520eb>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 16:37:59 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 10 June 2013 15:13:56 Eric B=E9nard wrote:
> Le Mon, 10 Jun 2013 15:07:01 +0200,
> Nicolas Dechesne <nicolas.dechesne@linaro.org> a =E9crit :
> > thanks for your answer. so, yes I kind of figured out I could do th=
at. But
> > in fact I was hoping that re-using the existing packagegroup from o=
e-core
> > *should* be the right thing to do, instead of re-implementing anoth=
er one.
> > and perhaps the packagegroup being called core-qt4e should be restr=
icted
> > to 'core' components, and we could have 1 (or more) additional
> > packagegroups that could be pulled into images, instead? otherwise =
what's
> > the point of having a 'core QT4e packagegroup' if it's not suitable=
 for
> > any real usage?
>=20
> true, I'll cook & test a split of the packagegroup to make the exampl=
es
> & demos optional

This sounds like a good idea.=20

FWIW, the contents of this packagegroup came up on IRC a week or two ag=
o and=20
it was pointed out that the main package includes qt4-embedded which pu=
lls in=20
everything, but also includes a subset of the qt4-embedded-* packages a=
nd=20
having both seems a bit pointless. I did test removing qt4-embedded fro=
m the=20
packagegroup to see what would be removed from a qt4e-demo-image;=20
unfortunately I don't seem to have the buildhistory output to hand, but=
 IIRC=20
it didn't seem to me that anything we would have needed was being remov=
ed.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

