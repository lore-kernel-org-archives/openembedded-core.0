Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0C55B7328A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:18:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u18BI34i024508; Mon, 8 Feb 2016 05:18:03 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020805180318-747316 ;
	Mon, 8 Feb 2016 05:18:03 -0600 
Date: Mon, 8 Feb 2016 13:17:49 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Message-ID: <20160208131749.4f99a8a1@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <1454928759.12961.3.camel@linux.intel.com>
References: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1454680824-26075-3-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0LaHHNGPTTLDnDai4ArYBkSZDQb+1tmQ18vPDpzH4ef_EQ@mail.gmail.com>
	<1454928759.12961.3.camel@linux.intel.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/08/2016 05:18:03 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/08/2016 05:18:03 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-08_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe/gpg_sign: check for python-pexpect when using local signing
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
X-List-Received-Date: Mon, 08 Feb 2016 11:18:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello

On Mon, 8 Feb 2016 12:52:39 +0200
Markus Lehtonen <markus.lehtonen@linux.intel.com> wrote:

> On Fri, 2016-02-05 at 14:31 +0000, Burton, Ross wrote:
> >=20
> > On 5 February 2016 at 14:00, Markus Lehtonen <
> > markus.lehtonen@linux.intel.com> wrote:
> > > +            msgs.append("Please install python-pexpect that is
> > > needed by lcocal gpg signing.")
> > >=20
> > Isn't this only needed if signing RPMs?  Hopefully in the future this
> > class will be used for more than RPM signing and detached signing
> > doesn't need pexpect.
> Yes, that is true. Any suggestions how to change this? Just try
> ImportError in sign=5Frpms() and fail there(?)

I'm using "from subprocess import Popen" for ipk signing. Isn't it by defau=
lt included as opposed to python-pexpect?
We could use that.

I'll try to update today or tomorrow the patches for ipk signing to use the=
 gpg backend and I'll resubmit them.

> > Also, typo in "local".
> Typo fixed (and commit message modified) in my contrib repo:
> git://git.openembedded.org/openembedded-core-contrib marquiz/rpmsign
>=20
>=20
> Thanks,
>   Markus


