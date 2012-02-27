Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S1yvb-000715-T6
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 12:39:39 +0100
Received: by wera1 with SMTP id a1so551698wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 03:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.83.70 as permitted sender)
	client-ip=10.180.83.70; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.83.70 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.83.70])
	by 10.180.83.70 with SMTP id o6mr17541014wiy.19.1330342274077 (num_hops
	= 1); Mon, 27 Feb 2012 03:31:14 -0800 (PST)
Received: by 10.180.83.70 with SMTP id o6mr13819640wiy.19.1330342273999;
	Mon, 27 Feb 2012 03:31:13 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm53920767wib.0.2012.02.27.03.31.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 03:31:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120227103306.GG3859@jama.jama.net>
Date: Mon, 27 Feb 2012 12:31:08 +0100
Message-Id: <06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnG44bTUUcxOIb+v5gQDZe3x/Z8iGQFVh3Kkpp0+sEcuRfHolWMlc1ij44jmRvfQU/o9sw5
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 11:39:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 11:33 heeft Martin Jansa het volgende geschreven:

> On Wed, Feb 22, 2012 at 10:13:09PM +0000, git@git.openembedded.org =
wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: c3d5800d2850a186f91b5a0db642aa5d1c20156b
>> URL:    =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3Dc3d5=
800d2850a186f91b5a0db642aa5d1c20156b
>>=20
>> Author: Joshua Lock <josh@linux.intel.com>
>> Date:   Tue Feb 21 17:46:44 2012 -0800
>>=20
>> netbase: remove redundant assignments
>>=20
>> There's no need to explicitly set PACKAGE_ARCH =3D MACHINE_ARCH, =
base.bbclass
>> takes care of setting this value for us based on the interfaces for =
those
>> machines being an OVERRIDE.
>=20
> do_install () {
> ...
>        # Disable network manager on machines that commonly do NFS =
booting
>        case "${MACHINE}" in
>                "qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | =
"qemuppc" )
>=20
> This causes do_install hash to depend on MACHINE variable for all =
MACHINEs,=20
> so making whole recipe MACHINE_ARCH would be more effective then =
rebuilding=20
> TARGET_ARCH package after every MACHINE switch.

That whole bit needs to go into the specific nfs image recipe, not into =
the recipe. Unless we decide nfs is the one and only way to boot qemu =
machines.

regards,

Koen=


