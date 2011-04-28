Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QFMeL-0006Do-KK
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 10:32:37 +0200
Received: by wye20 with SMTP id 20so2126949wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 01:30:04 -0700 (PDT)
Received: by 10.227.196.135 with SMTP id eg7mr355552wbb.142.1303979404471;
	Thu, 28 Apr 2011 01:30:04 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id x1sm452178wbh.2.2011.04.28.01.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 01:30:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DB5AB17.2060806@linux.intel.com>
Date: Thu, 28 Apr 2011 10:30:01 +0200
Message-Id: <D13D255E-BAA6-4F92-94CB-CF0706779365@dominion.thruhere.net>
References: <73DFD7AC-9837-4C27-BB34-2B2AC7D1DD8B@dominion.thruhere.net>
	<4DB5AB17.2060806@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Bruce Ashfield <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] don't run make clean on kernel_do_install
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
X-List-Received-Date: Thu, 28 Apr 2011 08:32:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 apr 2011, om 19:10 heeft Darren Hart het volgende geschreven:

> Hi Koen,
>=20
> On 04/23/2011 07:47 AM, Koen Kooi wrote:
>> Hi,
>>=20
>> Over the holidays I was trying to build some externel kernel modules
>> and they failed to build because linux/bounds.h wasn't in sysroots.
>>=20
>=20
>=20
> According the the linux Makefile:
>=20
> ###
> # Cleaning is done on three levels.
> # make clean     Delete most generated files
> #                Leave enough to build external modules
>=20
> The kernel Makefile should not be deleting it.
>=20
> And indeed:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D11475
>=20
> This was addressed by the following in 2.6.27:
> 7d3cc8b6d899e53222c22a78d98bb53a695f7962
> Don't clean bounds.h and asm-offsets.h
>=20
> Later, bounds.h moved as well in 2.6.33:
> 01fc0ac198eabcbf460e1ed058860a935b6c2c9a
> kbuild: move bounds.h to include/generated
>=20
>=20
> Which kernel version are you attempting to build?
>=20
> We shouldn't add code to address a bug in a specific kernel version in =
a
> kernel base class. That belongs in the specific recipe. I suggest =
trying
> to add the 7d3cc8b6d899e53222c22a78d98bb53a695f7962 patch to your =
kernel
> recipe and see if that resolves the issue for you without resorting to
> recreating the clean process in the base class.

I went with this option: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/commit/?id=3D7bcba149f05cc9c5d8ce956ee40e2c6849601470

regards,

Koen=


