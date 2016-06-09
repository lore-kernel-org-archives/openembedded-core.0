Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E4E9B607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 23:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 727F92E28B;
	Fri, 10 Jun 2016 01:27:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OgmCPz72S3KX; Fri, 10 Jun 2016 01:27:51 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 28B562E28A;
	Fri, 10 Jun 2016 01:27:51 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id DF1AD1B04;
	Fri, 10 Jun 2016 01:27:50 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id D427D196F;
	Fri, 10 Jun 2016 01:27:50 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id D240DD8A;
	Fri, 10 Jun 2016 01:27:50 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Fri, 10 Jun 2016 01:27:50 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Fri, 10 Jun 2016 01:27:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Maxin B. John" <maxin.john@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] libjpeg-turbo: update to 1.5.0
Thread-Index: AQHRwYQQUTHb4svEvkOS1MfcmJUfGZ/gwGIA///NV4CAATtLEA==
Date: Thu, 9 Jun 2016 23:27:50 +0000
Message-ID: <519239dddcce45428cd4d82b0667efe6@XBOX02.axis.com>
References: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
	<940de7d5-ba9f-cdd1-476c-9b1235b8e4b2@linux.intel.com>
	<20160609063541.GA26373@mbabyjoh-desk.ger.corp.intel.com>
In-Reply-To: <20160609063541.GA26373@mbabyjoh-desk.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.107]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: update to 1.5.0
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
X-List-Received-Date: Thu, 09 Jun 2016 23:27:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Maxin B. John
> Sent: den 9 juni 2016 08:36
> To: Alexander Kanavin
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] libjpeg-turbo: update to 1.5.0
>=20
> Hi Alex,
>=20
> On Thu, Jun 09, 2016 at 12:37:00PM +0300, Alexander Kanavin wrote:
> > On 06/08/2016 03:48 PM, Maxin B. John wrote:
> > >1. LIC_FILES_CHKSUM updates only involves changes in Copyright
> holders.
> > >   LICENSE remains the same.
> > >
> > >2. libjpeg-turbo don't have non-floating point ABI support in MIPS.
> > >   Provide a work around for that.
> > >
> > >[YOCTO #9606]
> > >
> > >Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > >---
> > > ...{libjpeg-turbo_8d+1.4.2.bb =3D> libjpeg-turbo_8d+1.5.0.bb} | 13
> ++++++++-----
> > > 1 file changed, 8 insertions(+), 5 deletions(-)
> > > rename meta/recipes-graphics/jpeg/{libjpeg-turbo_8d+1.4.2.bb =3D>
> libjpeg-turbo_8d+1.5.0.bb} (71%)
> >
> > Adding a '8d+' prefix to the version means that upstream check cannot
> be
> > automatically performed. Can we get rid of it somehow?
> >
>=20
> +1 for that. Now looking for a better way to get rid of this "version-
> going-backwards" problem:
>=20
> QA Issue: Package version for package jpeg-tools went backwards which
> would break package feeds from (0:8d+1.4.2-r0 to 0:1.5.0-r0) [version-
> going-backwards]
>=20
> > Alex
> >
> Best Regards,
> Maxin

That should only be a matter of setting the epoch of the recipe:

PE =3D "1"

//Peter


