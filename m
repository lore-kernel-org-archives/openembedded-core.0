Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpEm3-0005EG-9e
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 09:24:51 +0200
Received: by fxg11 with SMTP id 11so1722290fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 00:20:27 -0700 (PDT)
Received: by 10.223.91.147 with SMTP id n19mr1543273fam.53.1312528826882;
	Fri, 05 Aug 2011 00:20:26 -0700 (PDT)
Received: from [178.231.145.45] ([178.231.145.45])
	by mx.google.com with ESMTPS id o7sm793425fah.12.2011.08.05.00.20.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 00:20:25 -0700 (PDT)
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
	<58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
	<CABcZANng3sQzeLdBrk47a9O-8EzWVkAN0W8EUKLXvMinLNRUVw@mail.gmail.com>
In-Reply-To: <CABcZANng3sQzeLdBrk47a9O-8EzWVkAN0W8EUKLXvMinLNRUVw@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <B3D3959D-96B0-475A-94AC-71A26378CAFA@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 5 Aug 2011 09:16:43 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 07:24:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 aug. 2011 om 09:00 heeft Chris Larson <clarson@kergoth.com> het volgend=
e geschreven:

> On Thu, Aug 4, 2011 at 10:55 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>> Op 5 aug. 2011, om 07:51 heeft Chris Larson het volgende geschreven:
>>=20
>>> On Thu, Aug 4, 2011 at 10:48 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>>>=20
>>>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>>>>=20
>>>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>>>>=20
>>>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>>>>>>=20
>>>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>>>>=20
>>>=20
>>> Can someone explain why this patch added the dependency to the global
>>> RDEPENDS, rather than the RDEPENDS_<pkg> for the pkg in question?
>>=20
>> Ah, I assumed it was local to 'pkg' when iterating over packages.
>>=20
>> So should it be:
>>=20
>> rdepends =3D bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
>>=20
>> [..]
>>=20
>> bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
>=20
> Perhaps it is, I haven't read the code that closely. I just noticed
> that the pkg_postinst below did use the pkg suffix, and assumed.

I'll test when I get back home later today


> --=20
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


