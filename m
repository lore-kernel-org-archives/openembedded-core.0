Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpOM6-0007dn-VD
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 19:38:43 +0200
Received: by wyf19 with SMTP id 19so427359wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 10:34:18 -0700 (PDT)
Received: by 10.216.171.149 with SMTP id r21mr770334wel.85.1312565658133;
	Fri, 05 Aug 2011 10:34:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a14sm1977696wed.9.2011.08.05.10.34.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 10:34:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312561654.14274.136.camel@rex>
Date: Fri, 5 Aug 2011 19:34:11 +0200
Message-Id: <4918F139-8FB2-436C-91DB-E487D7F979A9@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
	<58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
	<1312561654.14274.136.camel@rex>
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
X-List-Received-Date: Fri, 05 Aug 2011 17:38:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 aug. 2011, om 18:27 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-08-05 at 07:55 +0200, Koen Kooi wrote:
>> Op 5 aug. 2011, om 07:51 heeft Chris Larson het volgende geschreven:
>>=20
>>> On Thu, Aug 4, 2011 at 10:48 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
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
>>> Can someone explain why this patch added the dependency to the =
global
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
>>=20
>> ?
>=20
> Yes, it should.

patch on its way :)=


