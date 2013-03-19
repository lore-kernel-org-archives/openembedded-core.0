Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UHrjF-0007Pw-9B
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 09:17:06 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Mar 2013 09:00:15 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 90BD8288B02;
	Tue, 19 Mar 2013 09:00:15 +0100 (CET)
Date: Tue, 19 Mar 2013 09:00:15 +0100
From: "Maxin B. John" <maxin.john@enea.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Message-ID: <20130319080015.GA5212@sestofb10.enea.se>
MIME-Version: 1.0
In-Reply-To: <CAPhnLPCeX41h5f2Ha1x4J+1SYJ-xQ0Xrh71jORm0MY4fwrJGjg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] harfbuzz: update the license information
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: "."@sestofb10.enea.se
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 08:17:06 -0000
Content-Type: text/plain; charset="unknown-8bit"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

 On Mon, Mar 18, 2013 at 10:25:05AM -0700, Flanagan, Elizabeth wrote:
 > On Mon, Mar 18, 2013 at 3:24 AM,  <maxin.john@enea.com> wrote:
 > > From: "Maxin B. John" <maxin.john@enea.com>
 > >
 > > harfbuzz is using the 'Modern Variants' of MIT License:
 > > https://fedoraproject.org/wiki/Licensing:MIT?rd=3DLicensing/MIT#Modern=
_Variants
 > >
 > > So, we can update the LICENSE as 'MIT'.
 > Yes, it's a variant of MIT but...
 >=C2=B7
 > cat hb-icu-le/COPYING
 >=C2=B7
 > "The contents of this directory are licensed under the ICU license.
 > See file license.html."
 >=C2=B7
 > So, this should be:
 >=C2=B7
 > LICENSE =3D "MIT & ICU"
=20
 You are right. I will make the modification as per your suggestion.  =20

 > even though ICU is in itself an MIT variant, it should still be called
 > out as we have the ICU generic listed in files/common-licenses.
 >=C2=B7
 > >  LIC_FILES_CHKSUM =3D"file://COPYING;md5=3De021dd6dda6ff1e6b1044002fc6=
62b9b \
 > >                     file://src/hb-ucdn/COPYING;md5=3D994ba0f1295f15b4b=
da4999a5bbeddef \
 > >                     file://src/hb-icu-le/COPYING;md5=3D0ac60acf068e2cc=
9facdf86169a9c13e \
 >=C2=B7
 > This is correct. There are a lot of headers with licenses but at a
 > glance they all appear to read as MIT.
 >=C2=B7
 > > --

 Thank you very much for the comments.

 Warm Regards,
 Maxin=20


