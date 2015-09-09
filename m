Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3AC8763CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 00:14:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t890EToI006395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Sep 2015 17:14:29 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.94]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0235.001;
	Tue, 8 Sep 2015 17:14:29 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] dpkg: put start-stop-daemon in
	its own package
Thread-Index: AQHQ6lI6uR24gDK3yUea602pxQVVNJ4zZvcA///tN4A=
Date: Wed, 9 Sep 2015 00:14:28 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF848240D639@ALA-MBA.corp.ad.wrs.com>
References: <1441729207-22458-1-git-send-email-jslater@windriver.com>
	<1441729207-22458-2-git-send-email-jslater@windriver.com>
	<55EF2714.1090801@opendreambox.org>
In-Reply-To: <55EF2714.1090801@opendreambox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] dpkg: put start-stop-daemon in its own package
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
X-List-Received-Date: Wed, 09 Sep 2015 00:14:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That's fine with me.  I'll rename the package and eliminate the comment.   =
Joe

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Andreas Oberritter
> Sent: Tuesday, September 08, 2015 11:21 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCH 1/1] dpkg: put start-stop-daemon i=
n its own package
>=20
> Hello Joe,
>=20
> On 08.09.2015 18:20, Joe Slater wrote:
> > @@ -67,6 +73,18 @@ PROV_class-native =3D ""
> >
> >  PROVIDES +=3D "${PROV}"
> >
> > +# split out start-stop-daemon to its own package
> > +#
> > +PACKAGES =3D+ "${PN}-start-stop"
> > +FILES_${PN}-start-stop =3D "${base_sbindir}/start-stop-daemon.dpkg"
> > +
> > +ALTERNATIVE_PRIORITY=3D"100"
> > +ALTERNATIVE_${PN}-start-stop =3D "start-stop-daemon"
> > +ALTERNATIVE_LINK_NAME[start-stop-daemon]=3D"${base_sbindir}/start-stop=
-daemon"
> > +
> > +RDEPENDS_${PN} +=3D "${PN}-start-stop"
> > +#
> > +
>=20
> I think you should omit the comment, because it only describes the obviou=
s.
>=20
> How about using ${PN}-start-stop-daemon?
>=20
> Regards,
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

