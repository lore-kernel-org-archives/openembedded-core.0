Return-Path: <prvs=0434129fea=mike.looijmans@topicproducts.com>
Received: from mx5-out4.antispamcloud.com (mx5-out4.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id 425317826A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:37:32 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dtvS9-0003z4-Oj for openembedded-core@lists.openembedded.org;
	Mon, 18 Sep 2017 14:47:10 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 Sep 2017 14:47:09 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1505738586-28217-1-git-send-email-liu.ming50@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <b29b9784-57af-089a-35b1-4b339ca84fd9@topic.nl>
Date: Mon, 18 Sep 2017 14:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505738586-28217-1-git-send-email-liu.ming50@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzYiq+0wYGZdefzR0+W8KzQ0igiJvxWWKEIlYnFiAZSdFrOhfeHmBwy2o1JP
	knV6CWo8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFiGW3TTiBM
	RAeigT23dPUKnFt5eAffxiiyNVHqNvRf6sHfLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EE+rDN/FnSl88wIa35p4FFXznVNpEBSRM
	35KuCE6M5jOyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC4K
	XP3vTB7AsR5+kaiIjlO6Iw9C0PQ5NLyrXuzfSqvsyUSmRIvnd4oOhu3bkDJSOVN8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73MBlNCXldRLkC5TILJuZrGhtP3IHr7mRRBdQ+rEKkqhnmNb6vV/9OcbV5CTm
	BwBTZU8v1DnRT2U8cfkuAuwvJls=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH] init-ifupdown: RDEPENDS on procps
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
X-List-Received-Date: Mon, 18 Sep 2017 14:37:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFBusybox can also provide sysctl so there's no hard dependency on p=
rocps.


On 18-09-17 14:43, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>=20
> sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS
> on procps.
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>   meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/=
recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> index 733ae41..8774386 100644
> --- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -35,7 +35,7 @@ do_install_append_qemuall () {
>   }
>  =20
>   PACKAGE_ARCH_qemuall =3D "${MACHINE_ARCH}"
> -RDEPENDS_${PN} =3D "netbase"
> +RDEPENDS_${PN} =3D "netbase procps"
>   RCONFLICTS_${PN} =3D "netbase (< 1:5.0)"
>  =20
>   CONFFILES_${PN} =3D "${sysconfdir}/network/interfaces"
>=20



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




