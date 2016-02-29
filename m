Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5354F771E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:05:09 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1TE58HA032431; Mon, 29 Feb 2016 08:05:08 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016022908050924-824288 ;
	Mon, 29 Feb 2016 08:05:09 -0600 
Date: Mon, 29 Feb 2016 16:04:41 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160229160441.05fbb19c@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
References: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/29/2016 08:05:09 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/29/2016 08:05:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-29_04:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Mon, 29 Feb 2016 14:05:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Feb 2016 13:50:54 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 29 February 2016 at 13:42, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wro=
te:
>=20
> >   apr=5Fcv=5Fprocess=5Fshared=5Fworks=3Dno: several platforms already s=
et this
> >   option, which conservatively disables support for PROCESS=5FSHARED
> >   mutexes.
> >
>=20
> Which is interesting as building apr-native (so the site files don't get
> used) for x86-64 gives:
>=20
> apr=5Fcv=5Fprocess=5Fshared=5Fworks=3Dyes
>=20
> Can we not go around disabling stuff when it actually does work?

Yes, of course. It was just sloppy patch editing on my part. Sorry.
I'll remove that and resubmit v2.

>=20
> Ross


