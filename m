Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SNlPU-0007IE-Tc
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 15:40:33 +0200
Received: from mail27.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id E4F08DC2C0E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 14:54:25 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 27 Apr 2012 14:44:56 +0200
Received: from unknown (HELO eb-e6520) (eric%eukrea.com@92.90.21.8)
	by ns0.ovh.net with SMTP; 27 Apr 2012 14:44:53 +0200
Date: Fri, 27 Apr 2012 14:53:04 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: ken.werner@linaro.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20120427145304.04e483d3@eb-e6520>
In-Reply-To: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
References: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 10719974489290419650
X-Ovh-Remote: 92.90.21.8 ()
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeggedrtdekucetufdoteggodetrfdofgetucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeggedrtdekucetufdoteggodetrfdofgetucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Qt 4.8 GCC 4.7 fixes
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
X-List-Received-Date: Fri, 27 Apr 2012 13:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ken,

Le Fri, 27 Apr 2012 12:59:17 +0200,
Ken Werner <ken.werner@linaro.org> a =E9crit :

> This change introduces two new patches to Qt 4.8. One prevents the build
> system from using the -fuse-ld=3Dgold GCC flag as this isn't upstream and
> therefore not supported by many toolchains out there. The second patch

ld-is-gold is a DISTRO_FEATURES wich enables gold (and thus reduce link
time especially in qt's build) : has this patch an effect on the
possibility to still use gold ?

Eric


