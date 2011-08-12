Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Qrmaa-000572-Eg
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:32 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QrmWD-000744-BY from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 00:51:01 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 12 Aug 2011 09:50:58 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A4EB3@eu2-mail.mgc.mentorg.com>
In-Reply-To: <20110812072950.GH2214@jama.jama.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [PATCH] bluez4: Added new recipe version 4.96
Thread-Index: AcxYwa4xXh3KBAM7SFWBEnjTUmfOcAAAsKFg
References: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com><1313078529.6733.138.camel@phil-desktop><4E443ADB.7010103@linux.intel.com><989A078976CDAD4CB2DC976EEF70E2A5068A4EA5@eu2-mail.mgc.mentorg.com>
	<20110812072950.GH2214@jama.jama.net>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez4: Added new recipe version 4.96
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 07:55:32 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Friday, August 12, 2011 12:30 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] bluez4: Added new recipe version 4.96
>=20
> On Fri, Aug 12, 2011 at 09:18:29AM +0200, Ahsan, Noor wrote:
> > Hi,
> >
> > I noticed that meta-oe version of bluez was using Bluetooth.conf
file
> > from 4.82's directory
> >
> > FILESPATH =3D. "${COREBASE}/meta/recipes-connectivity/bluez/bluez4-
> 4.82/:"
> >
> > and meta-oe bluez 4.95 version recipe did not have Bluetooth.conf
> file in its dir. So that is why I did not touch that recipe otherwise
> meta-oe recipe will start complaining.
>=20
> I think that's expected with layers.. and someone will update it in
> meta-oe as soon as it starts complaining..
>=20
> otherwise you cannot upgrade any recipe where we have .bbappend for it
> in meta-oe
>=20
> Regards,
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


OK .. I'll send out version 2.

Regards,
Noor


