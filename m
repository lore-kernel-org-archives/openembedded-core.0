Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CCFFD6F2A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 22:46:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Mar 2014 14:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,569,1389772800"; d="scan'208";a="464870170"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.253])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2014 14:46:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>,
	Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 01 Mar 2014 22:46:48 +0000
Message-ID: <5576624.UZiIhs6Pth@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CANyK_8ejpbY1VTZkfmFFcnvtFTZgH9B288vzmaH9iWf9Q-nAhQ@mail.gmail.com>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKpqMHG239UczMVLhiGEhvz_X6ppuiV_yD2pEvjzP510sw@mail.gmail.com>
	<CANyK_8ejpbY1VTZkfmFFcnvtFTZgH9B288vzmaH9iWf9Q-nAhQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Sat, 01 Mar 2014 22:46:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Saturday 01 March 2014 18:21:59 Paul Barker wrote:
> On 1 March 2014 18:10, Otavio Salvador <otavio@ossystems.com.br> wrot=
e:
> > Hello David,
> >=20
> > On Thu, Feb 27, 2014 at 4:59 PM, David Nystr=F6m <david.c.nystrom@g=
mail.com>
> >=20
> > wrote:
> >> On 2014-02-27 16:18, Laurentiu Palcu wrote:
> >>> On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nystr=F6m wrote:
> >>>> On 2014-02-27 15:24, Laurentiu Palcu wrote:
> >>>>> Hi David,
> >>>>>=20
> >>>>> My comments/questions below.
> >>>>=20
> >>>> Thank you for your detailed comments on the RFC.
> >>>> I will return with V2, where your comments are addressed when th=
e
> >>>> general approach is Acked.
> >>>>=20
> >>>> What do you think about the general approach ?
> >>>=20
> >>> I think the approach is ok. I don't know a simpler way than this =
to add
> >>> package feeds into the image.
> >>=20
> >> OK, there seems to be no screaming objections from other parties e=
ither.
> >>=20
> >> I'll resend v2
> >=20
> > I understand why you are adding this here but I think it'd be good =
to the
> > settings to be put in a package so in a product we may add extra
> > repositories updating the package.
> >=20
> > I am trying to think now how this could be done (or optionally done=
).
> >=20
> > What you think?
>=20
> +1
>=20
> I'd rather have '/etc/opkg/base-feeds.conf' (for example) generated
> and placed into a package which is then installed on the rootfs. That=

> would make it easy to distribute an update to that in the future. I'm=

> not sure how difficult/easy that would be.

The only problem with this is you then can't have your feeds different =
per=20
image.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

