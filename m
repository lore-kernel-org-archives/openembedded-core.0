Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUmEy-0004OR-9j
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 22:54:08 +0200
Received: by wwb17 with SMTP id 17so1765986wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 13:50:48 -0700 (PDT)
Received: by 10.216.237.73 with SMTP id x51mr2066565weq.16.1307652643836;
	Thu, 09 Jun 2011 13:50:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm1508693wbb.35.2011.06.09.13.50.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 13:50:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f9c2ad2b00c9fd52962ee7689a809b2b17e4f735.1307058256.git.scott.a.garman@intel.com>
Date: Thu, 9 Jun 2011 22:50:41 +0200
Message-Id: <5D76A268-DA2B-4F5A-BDE0-79211C403B0F@dominion.thruhere.net>
References: <cover.1307058256.git.scott.a.garman@intel.com>
	<f9c2ad2b00c9fd52962ee7689a809b2b17e4f735.1307058256.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/7] base-passwd: populate the target sysroot with passwd/group/login.defs
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
X-List-Received-Date: Thu, 09 Jun 2011 20:54:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jun 2011, om 01:50 heeft Scott Garman het volgende geschreven:

> The passwd, group, and login.defs files in the target sysroot will
> be used when recipes create custom user and group permissions in
> their packages.
>=20
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
> .../base-passwd/base-passwd-3.5.22/login.defs      |  386 =
++++++++++++++++++++

I'm now getting tons and tons of the following when using shadow:

[  900.349395] grpconv[682]: unknown configuration item `FAILLOG_ENAB'
[  900.357391] grpconv[682]: unknown configuration item `LASTLOG_ENAB'
[  900.364196] grpconv[682]: unknown configuration item =
`OBSCURE_CHECKS_ENAB'
[  900.371734] grpconv[682]: unknown configuration item =
`PORTTIME_CHECKS_ENAB'
[  900.381042] grpconv[682]: unknown configuration item `QUOTAS_ENAB'
[  900.387878] grpconv[682]: unknown configuration item `MOTD_FILE'
[  900.394256] grpconv[682]: unknown configuration item `FTMP_FILE'
[  900.400634] grpconv[682]: unknown configuration item `NOLOGINS_FILE'
[  900.407348] grpconv[682]: unknown configuration item `ENV_HZ'
[  900.413452] grpconv[682]: unknown configuration item `PASS_MIN_LEN'
[  900.420104] grpconv[682]: unknown configuration item `SU_WHEEL_ONLY'
[  900.426849] grpconv[682]: unknown configuration item =
`CRACKLIB_DICTPATH'
[  900.433929] grpconv[682]: unknown configuration item =
`PASS_CHANGE_TRIES'
[  900.441040] grpconv[682]: unknown configuration item =
`PASS_ALWAYS_WARN'
[  900.448028] grpconv[682]: unknown configuration item `CHFN_AUTH'
[  900.454376] grpconv[682]: unknown configuration item `ENVIRON_FILE'


which seems to be related to the login.defs change.

regards,

Koen=


