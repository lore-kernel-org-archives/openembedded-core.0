Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Sep 2016 16:57:48 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1C460191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 16:57:48 +0000 (UTC)
Received: from samweis.auenland.lan ([12.163.75.107]) by mail.gmx.com
	(mrgmx102) with ESMTPSA (Nemesis) id 0M5a9E-1b2SdJ3e5Q-00xe5Z;
	Wed, 21 Sep 2016 18:52:30 +0200
From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 18:52:25 +0200
Message-ID: <3969829.Efy2bVBXZ3@samweis.auenland.lan>
User-Agent: KMail/4.14.10 (Linux/4.8.0-rc4-jsm5-20160830-0842; KDE/4.14.24;
	x86_64; ; )
In-Reply-To: <20160919105730.GC27969@mbabyjoh-desk.ger.corp.intel.com>
References: <1474274390-36100-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1474274390-36100-2-git-send-email-leimaohui@cn.fujitsu.com>
	<20160919105730.GC27969@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
X-Provags-ID: V03:K0:5pg/JGkblFWCt5w1b3czOSG/oPEruzt8tFXnOTpchglbL0spKpX
	hgqcQh8f8oNJdl0mKYWRkBuOhCI9d346E2Mv+LQr9Wbj7kuJYvX2SpfLA3k/MPuAbAOnn6j
	y3e6h0gJHPMHGtEd1xSk8xpd5PzmC+mEQRMyKNpzHL8vuFHN3BVn6YXH0muOFwPBahvNXZX
	7IRBdDdNSrZAR063WFLsA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:BMnFii1ultY=:mZdTVlRaML4t+kq8N68THE
	X2w7LV0Pfpv463leckvmQhz7/XOj31L8koCwYPWb26dXSBms1NBxDcAEcf+CtPyRG5sDHUiHn
	A07c24oC24YctEzlDGlaMpRvE/3et6v7mo33/NJJ6tMI12qvjyDB7IYeY3c1HhkdjEryOsEmQ
	Y2l8dRnMHhGsVSuR+oNq2Zfh5FOfq2GERcnl+jqoi3GiJHZbDpw3nMjL3rHJ5mg/kOs9U0NJp
	v2KcQptB1+7V58S9yB5VuFHIV7luoeUuXm1ojPBIqhcjLw2cBIpjLtguRjUqyPer0uRubzQRQ
	FUqVdsiNKipLqzxDifcCwRU7AYGhWzxu+6jwCzsZl0qmmyQ1lHt/pxpfSRwHx2KVCqErb8Yyg
	Fuzd2pc/YIGKftCLJRYyIuW6eO+gK7Jgyrc/hYIgy7/0/nibPm8dZHPkofYGcPmaw8ho5q3vn
	hjTQ+LlYb9ZVIcTfO2mlzgVVcy9qVF2qeLLes7cqaeQUHwF9EULV8vwGJU632aytLFdsN5ajH
	sAG4nijmCZ9BvSCIDPsBy9Tk2ft928XAJuAK16r8qnjXptiE/lAboSFzNzLI6B0etlDpnRZK9
	UBcWVJrQHgiF8S7VjxbB2A9dIlqCIOa+cvmZcSstRHboKO4HO/qs71auCvBxVLQzsIgUbMnJg
	WAlASqvD2Ad8Xv6JvTz66ludsHVLrsKz33s8Xsn1gXQOxPreeyGsLMCafwv4QcxdlUC9H3dgG
	WfOyVmt2+QtSKYegy/0vsNvFyTqRNMzkNmA10VLqeiB+31FWh+6sN097h+rfC33Boq3zC//5p
	wy47ElK
Cc: jsmoeller@linuxfoundation.org
Subject: Re: [PATCH v2 1/1] Make yocto-spdx support spdx2.0 SPEC
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
X-List-Received-Date: Wed, 21 Sep 2016 16:57:49 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Lei, Maxin, * !

I think this patch is very useful and should be considered for inclusio=
n in=20
OE-core.

Maxin's comment on making the class depend on a "dosocs-native" recipe =
is=20
good.

@Lei: Could you follow-up with a v2 applying this enhancement as propos=
ed by=20
Maxin?

--=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de

> Instead of requesting the user to install the DoSOCSv2 from github or=
 other
> repos, can we make the spdx.bbclass depend on "dosocs-native" or simi=
lar
> and make that "DoSOCSv2" recipe available in oe-core ?
>=20
> That might make it easy to use this class.


