Return-Path: <prvs=042241df72=mike.looijmans@topicproducts.com>
X-Greylist: delayed 2381 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Sep 2017 14:11:50 UTC
Received: from mx18-11.smtp.antispamcloud.com (mx18-11.smtp.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id 47F6A73097
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 14:11:50 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx26.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dpaQt-0003Dy-O2 for openembedded-core@lists.openembedded.org;
	Wed, 06 Sep 2017 15:32:09 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 6 Sep 2017 15:31:52 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1504577432-63141-1-git-send-email-mark.hatle@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <198c3d9e-8b4a-db67-3dea-4ac4f40174f9@topic.nl>
Date: Wed, 6 Sep 2017 15:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504577432-63141-1-git-send-email-mark.hatle@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzbhXiN0PMlA3PK1xYedlP40tL+u1j0uKQd6VCnQsGTsAKfOrFbfhkBTln1v
	rimszFw8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFiW9O5oNJ9
	ZkpwhuZE9OqZFvwA+90IJIPMYJHAia0fSR3fLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EjzohreEXnA6BLejlboJKBl9l1/WyLBg0
	mKuTgAEprJGyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC5p
	+2sKqJAngdktgqlrvqnp0WhGhe++/QwiUspgUEBpEmFeNu3G7DXOasUuHUJELtx8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73MBlNCXldRLkC5TILJuZrGhtP3IHr7mRRBdQ+rEKkqhnmNb6vV/9OcbV5CTm
	BwBTZU8v1DnRT2U8cfkuAuwvJls=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH] psplash: Initialize psplash only if a framebuffer exists
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
X-List-Received-Date: Wed, 06 Sep 2017 14:11:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFIsn't this a weird situation?

If you installed psplash but don't have a framebuffer, then something must =
be=20
broken. I'd rather see that error than this being silently ignored and then=
=20
wondering where the splash went.

There's the corner case (most of my boards and for example settop boxes beh=
ave=20
like this) that the framebuffer initializes some time later in the boot=20
process (e.g. after loading FPGA logic, or loading some closed-source binar=
y=20
video driver blob). For these systems, the psplash should be initialized by=
=20
the hotplug manager (mdev, udev, systemd) as soon as the device appears.


On 05-09-17 04:10, Mark Hatle wrote:
> psplash-init exits if there is no framebuffer device detected.
> This is done to avoid the following error message from
> occurring when booting up:
>=20
> "Error opening /dev/fb0: No such file or directory"
>=20
> Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/recipes-core/psplash/files/psplash-init | 6 ++++++
>   1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-=
core/psplash/files/psplash-init
> index 66c85e9..0bce1de 100755
> --- a/meta/recipes-core/psplash/files/psplash-init
> +++ b/meta/recipes-core/psplash/files/psplash-init
> @@ -7,6 +7,12 @@
>   # Default-Stop:
>   ### END INIT INFO
>  =20
> +if [ ! -e /dev/fb0 ]; then
> +    echo "Framebuffer /dev/fb0 not detected"
> +    echo "Boot splashscreen disabled"
> +    exit 0;
> +fi
> +
>   read CMDLINE < /proc/cmdline
>   for x in $CMDLINE; do
>           case $x in
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




