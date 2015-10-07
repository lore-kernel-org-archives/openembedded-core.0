Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8C360125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 13:05:17 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZjoPB-000230-6L for openembedded-core@lists.openembedded.org;
	Wed, 07 Oct 2015 15:05:17 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 7 Oct 2015 15:04:18 +0200
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56151883.7000304@topic.nl>
Date: Wed, 7 Oct 2015 15:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrVRsYEhqSZm4ky4O8anRvFKadfus+qBtOnpRx
	nGEMRi08CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OTh11z/z4WnEoC
	8C13cWABWlhWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5lorygWaquS4QUc2X9/UmaFDUh
	sTbOm0n23gAH4LW5RBSd12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: [RFC] Adding machine-specific default packages to an image
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
X-List-Received-Date: Wed, 07 Oct 2015 13:05:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFSince our boards needs 'some' bitstream in the FPGA to become some=
what useful,=20
in the machine.conf I say:

MACHINE_FPGA_BITSTREAM ?=3D "fpga-image-miami-florida-gen-reference"
MACHINE_EXTRA_RRECOMMENDS =3D "${MACHINE_FPGA_BITSTREAM} ..."

This puts that into the packagegroup-base-machine RDEPENDS and hence it get=
s=20
installed on the board if you don't specify anything else.

However, I want to be able to pick alternative FPGA bitstream providers in =
the=20
image recipe. Without having to define a new machine for each and every pro=
ject...

Currently, I do this by forcing packagegroup-base-machine and=20
packagegroup-base-distro out of the IMAGE_INSTALL list (for some obscure=20
reason, building packagegroup-base-distro also results in building the=20
reference bitstream) and then add MACHINE_EXTRA_RRECOMMENDS directly to the=
=20
IMAGE_INSTALL list, so I can set MACHINE_FPGA_BITSTREAM to whichever I'd li=
ke=20
to have in this image.

I was lookign for a way to have the machine configuration inject its packag=
es=20
into the IMAGE_INSTALL (or similar) list, so it can easily be overridden in=
 an=20
image recipe.

Bluntly putting IMAGE_INSTALL+=3D"${MACHINE_FPGA_BITSTREAM}" into the=20
machine.conf might work, but doesn't "feel" quite right. But there's=20
apparently no other way to do this.

An alternative would be to introduce an IMAGE_INSTALL_MACHINE variable that=
=20
gets added to the PACKAGE_INSTALL variable in image.bbclass. That would all=
ow=20
machines to inject their desirables into the image instead. It's a simple=20
patch, I've pasted it below:

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 86a98bb..90c1c05 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -64,7 +64,8 @@ def check_image_features(d):

  IMAGE_INSTALL ?=3D ""
  IMAGE_INSTALL[type] =3D "list"
-export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}=
=20
${FEATURE_INSTALL}"
+IMAGE_INSTALL_MACHINE ?=3D ""
+export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}=
=20
${FEATURE_INSTALL} ${IMAGE_IN
  PACKAGE_INSTALL_ATTEMPTONLY ?=3D "${FEATURE_INSTALL_OPTIONAL}"

  # Images are generally built explicitly, do not need to be part of world.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






