Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpDRy-0002ks-4c
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 08:00:02 +0200
Received: by wwe32 with SMTP id 32so1831343wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 22:55:38 -0700 (PDT)
Received: by 10.227.178.6 with SMTP id bk6mr1513696wbb.12.1312523737982;
	Thu, 04 Aug 2011 22:55:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fe4sm2018591wbb.45.2011.08.04.22.55.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 22:55:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
Date: Fri, 5 Aug 2011 07:55:35 +0200
Message-Id: <58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
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
X-List-Received-Date: Fri, 05 Aug 2011 06:00:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 aug. 2011, om 07:51 heeft Chris Larson het volgende geschreven:

> On Thu, Aug 4, 2011 at 10:48 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>>=20
>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>>>>=20
>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>>=20
>=20
> Can someone explain why this patch added the dependency to the global
> RDEPENDS, rather than the RDEPENDS_<pkg> for the pkg in question?

Ah, I assumed it was local to 'pkg' when iterating over packages.

So should it be:

rdepends =3D bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)

[..]

bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)

?

regards,

Koen=


