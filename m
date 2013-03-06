Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UDKzo-0002Cj-VZ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 21:31:40 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 979BBD1AD95
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2013 21:14:58 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id C3CB3A60FD;
	Wed,  6 Mar 2013 21:14:48 +0100 (CET)
Date: Wed, 6 Mar 2013 21:14:47 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130306211447.27f6b262@e6520eb>
In-Reply-To: <cover.1362545190.git.hongxu.jia@windriver.com>
References: <cover.1362545190.git.hongxu.jia@windriver.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [danny][PATCH 0/2]fix toolchain relocation issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 20:31:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Hongxu,

Le Wed, 6 Mar 2013 12:58:45 +0800,
Hongxu Jia <hongxu.jia@windriver.com> a =C3=A9crit :

> Rebase to danny.
>=20
> [YOCTO #3984]
>=20
> The following changes since commit e89f812a0af56beda951c1dce6113a61d6db8c=
da:
>=20
>   bitbake: knotty.py: fix unknown event bb.event.DiskFull (2013-03-04 10:=
17:20 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib hongxu/fix-toolchain-relocation-da=
nny
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-tool=
chain-relocation-danny
>=20
> Hongxu Jia (2):
>   perl-nativesdk:fix toolchain relocation issues
>   populate_sdk_base.bbclass:fix toolchain relocation issues
>=20
while at it, may you please also cherry-pick
e7a21cd69a326ab7e2d0e410db28f24956f61208=20
which is "toolchain-scripts.bbclass: add PYTHONHOME variable to
environment-setup"

as the problem described in [YOCTO #3839] is also present in danny.

Thanks
Eric


