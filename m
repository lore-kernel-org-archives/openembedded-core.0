Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QNfxO-0001l6-PU
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 08:46:40 +0200
Received: by wwb17 with SMTP id 17so3833098wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 23:43:41 -0700 (PDT)
Received: by 10.227.167.132 with SMTP id q4mr351846wby.87.1305960220760;
	Fri, 20 May 2011 23:43:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k2sm2713779wby.51.2011.05.20.23.43.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 23:43:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=HYrwcpdTRFwT0X6ei+Np=uYVDnQ@mail.gmail.com>
Date: Sat, 21 May 2011 08:43:37 +0200
Message-Id: <B5B363AA-1270-4A8F-BD75-D3DF56F4A9BE@dominion.thruhere.net>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
	<1305873952.18415.249.camel@lenovo.internal.reciva.com>
	<1305903707.2525.29.camel@phil-desktop>
	<4DD69167.1010703@opendreambox.org>
	<BANLkTi=HYrwcpdTRFwT0X6ei+Np=uYVDnQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Sat, 21 May 2011 06:46:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mei 2011, om 20:35 heeft Khem Raj het volgende geschreven:

> On Fri, May 20, 2011 at 9:05 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> http://patches.openembedded.org/patch/2255/ should solve the problem. =
I
>> was waiting for a second ack.
>>=20
>> Khem, if this fixes the problem for you, please send an ack or push =
this
>> patch.
>>=20
>=20
> yes it does thanks. I meant to look for this before I butchered =
opkg-utils
> but my memory did not serve me well.

With a build from scratch I get:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-base:
|  *    kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *   kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *
|  * opkg_install_cmd: Cannot install package task-base.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-base-extended:
|  *    kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *  =
kernel-2.6.31.12-ER1 *  kernel-2.6.31.12-ER1 *
|  * opkg_install_cmd: Cannot install package task-base-extended.



