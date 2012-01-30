Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Rrxg0-0001jJ-AR
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:18:08 +0100
Received: from ad.chargestorm.se (85.229.138.125) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Mon, 30 Jan 2012 21:09:10 +0100
Date: Mon, 30 Jan 2012 21:09:15 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120130200907.GB3244@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
	<1327943665-16402-3-git-send-email-steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <1327943665-16402-3-git-send-email-steve@sakoman.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v3 2/3] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Mon, 30 Jan 2012 20:18:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Steve Sakoman <steve@sakoman.com> [120130 20:20]:
> GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and S/MIME

> diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
> new file mode 100644
> index 0000000..c56f3d5
> --- /dev/null
> +++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "gnupg - GNU privacy guard"
> +LICENSE = "GPLv2+"

Are you sure about this?

Looking at git.gnupg.org, this ought to be GPLv3+...

You'll have to go back to gnupg 1.4.7, or at least a git checkout
between 1.4.7 and 1.4.8, to get GPLvv2+... But such an addition would
also be nice!

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


