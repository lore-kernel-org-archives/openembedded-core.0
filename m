Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF7E6057B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:27:49 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1FFRnPo009716; Mon, 15 Feb 2016 09:27:49 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021509274948-998790 ;
	Mon, 15 Feb 2016 09:27:49 -0600 
Date: Mon, 15 Feb 2016 17:27:25 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160215172725.31722fde@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CAJTo0Lb0_2aArdo6BQ+ouGKzcsqqa+foaPHZsNDED1X3OUUcCA@mail.gmail.com>
References: <1455544180-29872-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0Lb0_2aArdo6BQ+ouGKzcsqqa+foaPHZsNDED1X3OUUcCA@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/15/2016 09:27:49 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/15/2016 09:27:49 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-15_07:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ruby: break out ri-docs and rdoc into separate packages
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
X-List-Received-Date: Mon, 15 Feb 2016 15:27:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Feb 2016 14:19:43 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 15 February 2016 at 13:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wro=
te:
>=20
> > +SUMMARY=5F${PN}-rdoc =3D "RDoc documentation generator from Ruby sourc=
e"
> > +RDEPENDS=5F${PN}-rdoc =3D "${PN}"
> > +FILES=5F${PN}-rdoc +=3D "${libdir}/ruby/rdoc"
> >
>=20
> Did you mean $libdir/ruby/*/rdoc/?  This package doesn't get created.

Yes, sorry. It was a mistype on my part, I'll resubmit.

>=20
> Ross


