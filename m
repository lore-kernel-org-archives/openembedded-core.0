Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1RSo1h-0005pQ-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:56:34 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAMAifl2006813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 04:44:44 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAMAieAP027280
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 16:14:41 +0530 (IST)
Received: from DBDE01.ent.ti.com ([fe80::d5df:c4b5:9919:4e10]) by
	DBDE70.ent.ti.com ([fe80::2141:513f:409:315a%21]) with mapi id
	14.01.0323.003; Tue, 22 Nov 2011 16:14:39 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 1/1] kernel.bbclass: stage additional
	directories
Thread-Index: AQHMqQKUIeDfgkAdJ0KYSyhoTLjQ05W4s/iA
Date: Tue, 22 Nov 2011 10:44:38 +0000
Message-ID: <C2C4AB609E1BCF4689C1782E8F42E30A02886F@DBDE01.ent.ti.com>
References: <1321941210-4344-1-git-send-email-msprathap@ti.com>
	<7E669427-959C-4D0B-961D-92D77C776143@dominion.thruhere.net>
In-Reply-To: <7E669427-959C-4D0B-961D-92D77C776143@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] kernel.bbclass: stage additional	directories
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
X-List-Received-Date: Tue, 22 Nov 2011 10:56:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK. For building the graphics SDK 04.04.0.02 we require kernel to have and =
built with drivers/video, drivers/gpu and drivers/base folder.
I thought this kernel.bbclass takes care of it .=20
If not, let me know which is the recipe that will take care of this.


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Tuesday, November 22, 2011 1:11 PM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH v2 1/1] kernel.bbclass: stage additional dire=
ctories


Op 22 nov. 2011, om 06:53 heeft Prathap M S het volgende geschreven:

> * The graphics SDK requires additional directories to be staged
>  for compilation.
>=20
> Signed-off-by: Prathap M S <msprathap@ti.com>
> ---
> meta/classes/kernel.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 12e0b83..b00461b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -243,7 +243,7 @@ FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/confi=
g*"
> FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> # misc is a package to contain files we need in staging
> -FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts /kernel/dr=
ivers/crypto /kernel/drivers/media"
> +FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts /kernel/dr=
ivers/crypto /kernel/drivers/media /kernel/drivers/video /kernel/drivers/gp=
u /kernel/drivers/base"

This doesn't make it stage anything, it just adds a few dirs to the kernel-=
misc package.




