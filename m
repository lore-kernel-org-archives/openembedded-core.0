Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5F47714D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:19:54 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0REJtLI005258; Wed, 27 Jan 2016 08:19:55 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012708195520-344421 ;
	Wed, 27 Jan 2016 08:19:55 -0600 
Date: Wed, 27 Jan 2016 16:19:41 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160127161941.72dbae8f@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CAJTo0LZFPbdaapbQ5n+O9W5nbYkLQWiEP=f4LnoFMcrt3=V62w@mail.gmail.com>
References: <1453903646-1919-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LZFPbdaapbQ5n+O9W5nbYkLQWiEP=f4LnoFMcrt3=V62w@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/27/2016 08:19:55 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/27/2016 08:19:55 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-27_03:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: Add 'opkg-collateral' to PROVIDES variable
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
X-List-Received-Date: Wed, 27 Jan 2016 14:19:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Jan 2016 14:11:45 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 27 January 2016 at 14:07, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrot=
e:
>=20
> >  RPROVIDES=5F${PN} =3D "opkg-collateral"
> > +PROVIDES +=3D "opkg-collateral"
> >
>=20
> Why does this also need a PROVIDES?  There's a RPROVIDES already for
> on-target migration, and at least nothing in oe-core refers to
> opkg-collateral directly.
>=20
> Ross

Ignore this. Sorry.

Adrian

