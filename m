Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qsygu-0002wV-Ha
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:03:00 +0200
Received: by wwe32 with SMTP id 32so4081233wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 07:58:24 -0700 (PDT)
Received: by 10.216.175.130 with SMTP id z2mr2913361wel.63.1313420304407;
	Mon, 15 Aug 2011 07:58:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x13sm2902288wec.14.2011.08.15.07.58.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 07:58:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108151542.16948.paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 16:58:20 +0200
Message-Id: <6084D666-AB13-4566-B474-970A32DFC0ED@dominion.thruhere.net>
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<201108151523.09022.paul.eggleton@linux.intel.com>
	<B0416E2E-1F00-40F5-83F3-230D341239F5@dominion.thruhere.net>
	<201108151542.16948.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 15:03:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2011, om 16:42 heeft Paul Eggleton het volgende geschreven:

> On Monday 15 August 2011 15:30:53 Koen Kooi wrote:
>>> Same way it gets installed, it looks for it in ${OPIEDIR}. It's just =
that
>>> the second time around if the machine is not the same, ${OPIEDIR} is =
not
>>> the same either.
>>=20
>> That sounds like an expanded version is getting stored somewhere =
where it
>> shouldn't
>=20
> How could that be the case? If it stayed the same I could understand =
it...
>=20
> It's pretty straightforward; OPIEDIR is set to STAGING_DIR_HOST, but=20=

> STAGING_DIR_HOST is now ${STAGING_DIR}/${MACHINE},  thus if you change =
the=20
> machine, STAGING_DIR_HOST also changes. In OE-dev (and Poky prior to =
machine-
> specific sysroots) STAGING_DIR_HOST was =
${STAGING_DIR}/${BASEPKG_HOST_SYS},=20
> thus there was no problem.

if a recipe (or upstream code) does something like

echo $OPIEDIR > foo.config

And after you stage foo.config it will point to the old sysroot when =
changing machine. In other words: something in opie isn't relocatable.=


