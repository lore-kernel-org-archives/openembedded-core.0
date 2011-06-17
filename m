Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXW55-0007B4-Rx
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 12:15:18 +0200
Received: by wwg12 with SMTP id 12so145086wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 03:11:47 -0700 (PDT)
Received: by 10.227.198.80 with SMTP id en16mr2024385wbb.58.1308305507141;
	Fri, 17 Jun 2011 03:11:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fi5sm828478wbb.22.2011.06.17.03.11.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 03:11:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
Date: Fri, 17 Jun 2011 12:11:44 +0200
Message-Id: <BA220621-C63A-4C15-9A7E-2E0B684A1A53@dominion.thruhere.net>
References: <cover.1308249837.git.scott.a.garman@intel.com>
	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic login.defs options
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
X-List-Received-Date: Fri, 17 Jun 2011 10:15:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jun 2011, om 20:50 heeft Scott Garman het volgende geschreven:

> This resolves the following runtime errors when various shadow-utils
> binaries are run:
>=20
> configuration error - unknown item 'FAILLOG_ENAB' (notify =
administrator)
> configuration error - unknown item 'LASTLOG_ENAB' (notify =
administrator)
> configuration error - unknown item 'OBSCURE_CHECKS_ENAB' (notify =
administrator)
> configuration error - unknown item 'PORTTIME_CHECKS_ENAB' (notify =
administrator)
> configuration error - unknown item 'QUOTAS_ENAB' (notify =
administrator)
> configuration error - unknown item 'MOTD_FILE' (notify administrator)
> configuration error - unknown item 'FTMP_FILE' (notify administrator)
> configuration error - unknown item 'NOLOGINS_FILE' (notify =
administrator)
> configuration error - unknown item 'ENV_HZ' (notify administrator)
> configuration error - unknown item 'PASS_MIN_LEN' (notify =
administrator)
> configuration error - unknown item 'SU_WHEEL_ONLY' (notify =
administrator)
> configuration error - unknown item 'CRACKLIB_DICTPATH' (notify =
administrator)
> configuration error - unknown item 'PASS_CHANGE_TRIES' (notify =
administrator)
> configuration error - unknown item 'PASS_ALWAYS_WARN' (notify =
administrator)
> configuration error - unknown item 'CHFN_AUTH' (notify administrator)
> configuration error - unknown item 'ENVIRON_FILE' (notify =
administrator)
>=20
> This fixes bug [YOCTO #1170]
>=20
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>

Fix confirmed:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>=


