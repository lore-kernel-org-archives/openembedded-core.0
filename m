Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-05.clustermail.de (good-out-05.clustermail.de
	[212.223.36.3])
	by mail.openembedded.org (Postfix) with ESMTP id A8F3B606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 15:43:27 +0000 (UTC)
Received: from frontend-01 ([10.0.0.1] helo=frontend.clustermail.de)
	by smtpout-01.clustermail.de with esmtps
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1bAfdZ-0004a0-LQ; Wed, 08 Jun 2016 17:43:26 +0200
Received: from [217.6.33.234] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpa (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1bAfdZ-00061U-EY; Wed, 08 Jun 2016 17:43:21 +0200
Received: from Win2012-02.gin-domain.local (192.168.1.12) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Wed, 8 Jun 2016 17:43:20 +0200
Received: from Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90]) by
	Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90%12]) with mapi
	id 15.00.1130.005; Wed, 8 Jun 2016 17:43:20 +0200
From: "Klauer, Daniel" <Daniel.Klauer@gin.de>
To: Herve Jourdain <herve.jourdain@neuf.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] smartpm: Don't ignore error if RPM transaction
	fails without problems
Thread-Index: AQHRsDtANli+hgUYC0ONri+JdCfiKp+89YIAgCEGQ4CAAXiob4AAErOAgABIKAM=
Date: Wed, 8 Jun 2016 15:43:20 +0000
Message-ID: <1465400599707.30401@gin.de>
References: <1465381435600.39214@gin.de>,
	<02b101d1c184$93336d80$b99a4880$@neuf.fr>
In-Reply-To: <02b101d1c184$93336d80$b99a4880$@neuf.fr>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.1.219]
x-brightmail-tracker: H4sIAAAAAAAAC+NgFvrEqsTGxXJgBSOPrqRtRLjBsuOnL/JbHF44hdHi55qnbA5MAQxRrJl5SfkVCawZJ/78YC347lox+8tS5gbGBqcuRi4OIYHdjBILt7xngXBOMEr87trC2sXIycEsYCpx5WsjC4StKHHhXgOYzSagK3Gu/T0rSIOIQBujxKolDcwgCWGBNInPe56AFYkIpEtc+LueDcL2k+hbdQ1sqISAjsTfRY1gNouAisSV53MZQWxeAQ2J+8ffgc0REgiSuPbwPjuIzSlgJvHywGewOKOArERnwzsmiIPEJW49mc8EMVNAYsme88wQtpJE7+13UHEjiZfTr7BAzBeUODkT4jYJoJl7HywBquEAsnUlLh3kgAgHSryf1soOETaVuPo+GCJsIPFu7WeoTmOJlRv/M0LYthJ7ZkyEmuIsMe9GPUTYSeJNx1uoZ7Ultr/aB/f4pmuroMbIS/y/d59lAqPGLKSAnoUU0LOQ/DgLyf0LGFlWMUqHZ+YZGRga6RoY6aVn5umm5OcmZubp5eQnJ+ZsYoSmhx2Mjz67HmKU5GBSEuVVdA8PF+JLyk+pzEgszogvKs1JLT7EKMHBoyTCa2IdES7EW1yQmFucmQ6TkuHgUJLg/WwFlBIsSk1PrUjLzClJLYJIn2KUlBLnLQFJCoD0ZZTmweUuMYpKCfPesgDK8RSkFuVmlkDEbzEKczxkEmLJy89LlQI6kQEINBhfMYpzMCoJ83KB3MCTmVcCd8IroOuYgK5bfiQc5LqSRISUVAOj66eWO2/vMv53dnjFopAvPtOCy6Swg+nczkXJIRbtEyXyj35f0KscrNPaH2n1dvEOfWZf75C7q5gyRNwSF6tNfz774bcv9fHdZ/N0/Oacara5kdgm0fh5vfa5W0/yrJ6axC2p0zI/xTD3JdO7yavEAsUljdp3Jh+akpZc6BFZqsVzetXMpxuUWIozEg21mIuKEwH5ApgOhQMAAA==
MIME-Version: 1.0
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A0C0207.57583D19.00A9, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Wed, 08 Jun 2016 15:43:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,=0A=
=0A=
> You also need to add another check just before raising the error, or you=
=0A=
> would end up getting an "unknown error" raised there.=0A=
> I basically replaced:=0A=
> -        if (probs is not None) and (not retry):=0A=
> +       if (probs is not None) and ((len(probs) !=3D 0) or not=0A=
> sysconf.has("attempt-install", soft=3DTrue)) and (not retry):=0A=
=0A=
Hmm, it sounds like the attempt mode wants to ignore installation failures=
=0A=
(empty problems list) like before the patch, which makes sense to me. After=
all,=0A=
attempt mode wants to try installation and ignore failures. So it seems goo=
d to=0A=
fix this regression too.=0A=
=0A=
However, I wonder why it never ignored a non-empty problems list, which wou=
ld=0A=
also trigger an error. Maybe that case just never happens in practice, beca=
use=0A=
it's always just file conflicts. Those trigger a retry, which prevents the =
error=0A=
from being raised.=0A=
=0A=
> BUT reflecting on the whole scheme, I'm wondering how it will work in cas=
e=0A=
> of file found conflict, since the problem package gets removed from the=
=0A=
> list, but the list is committed again, with most packages already=0A=
> installed...=0A=
> I therefore wonder that there could be the same error that I got in the e=
nd,=0A=
> i.e failing with package already installed - which should not fail for=0A=
> attempt only.=0A=
=0A=
Indeed, I'm curious about that too...=0A=
=0A=
If you could put together the patch, that would be great and fine with me.=
=0A=
=0A=
Thanks,=0A=
Daniel=0A=

