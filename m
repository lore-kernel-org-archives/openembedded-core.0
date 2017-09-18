Return-Path: <prvs=0434129fea=mike.looijmans@topicproducts.com>
X-Greylist: delayed 2256 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Sep 2017 13:24:45 UTC
Received: from mx5-out4.antispamcloud.com (mx5-out4.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id 4437878285
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:24:45 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx16.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dtw2S-0000wU-9q; Mon, 18 Sep 2017 15:24:44 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 Sep 2017 15:24:29 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
Date: Mon, 18 Sep 2017 15:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzYAC07bcqdmKWroRWvQzC6ZQrRtPasNJ97MJuP91xDXrDNUIZA1oQYxy+az
	RaYfaII8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFiVhrO1IL/
	BRIwE9qFcHpvcx816y5YQ/8R4coKOQ/5mNbfLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EE+rDN/FnSl88wIa35p4FFV9l1/WyLBg0
	mKuTgAEprJGyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC6H
	3owsO4DAdUlQv6V75QMSQrAqZTkENn3hzVQGtqpfy4Ar4mPq3jQmCl8CexcQM5N8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73NkW0hXdwXAcFMPC3HLevdDEVCx/NXteNl5w3OcW/WnJ5stpWvUU2z84KulN
	93N/tpcZZABrv9C3rtLpekNsFAVpX3S8nfKMgp2uxqIhgQr0J7xMKUdII3UOYa+YuRxhYlMYFlwk
	Afgcoh+I6fgaS/FQgekuNmkYNaWzl/I120Xp
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Mon, 18 Sep 2017 13:24:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 18-09-17 15:08, Burton, Ross wrote:
> On 18 September 2017 at 12:31, Mike Looijmans <mike.looijmans@topic.nl=20
> <mailto:mike.looijmans@topic.nl>> wrote:
>=20
>         This is basically the same change as I first sent a patch for in
>         April, and
>         last pinged this Friday... The only real difference is that this =
one
>         misses
>         passing error output from resize to /dev/null (which it should do=
 to
>         handle
>         the case where tty exists, but resize does not).
>=20
>=20
>     Yeah, indeed.
>=20
>=20
> Apologies for missing that patch!
>=20
>     Other problem is that "resize" outputs shell script on stdout to be
>     executed, so the proper "total" invokation would be:
>=20
>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
>=20
>     The "eval" part is missing in your version...
>=20
>=20
> Who is going to submit the One True patch with all the fixes in?  I promi=
se to=20
> merge it.

I'll send the one ring, eh, patch, in a few minutes. I'll merge the two int=
o a=20
single as well.



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




