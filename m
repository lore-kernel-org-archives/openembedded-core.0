Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SZU0E-0006Pp-6T
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 23:30:54 +0200
Received: by eaal1 with SMTP id l1so1496987eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 14:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uUlLIXxeBZ4UHgL0+H2bnMuo2kKYJJ63Hq62fhPMyio=;
	b=CtQS2/cRNez6gh4DsP6ieYUGkLZeXj87Uwbd7E0ZwJJyoGRGjr4cMmaa+3BNx8Qh8l
	0R5fvAsqLWv4jIDv+PJuzlr95paS2FNX1WljNMxmcGXjnpp+I/CWZPCJH7fV39cWxn47
	KNhf7cf9UoP4sFOfSIyScfB20rKMBwbjJcchyGsa7Jckx247d0gxvDAi0dbpmnGSrpxV
	pqWWguHCinqGSjzpTJ0/BrkeUdoUS7ilYydURIBXnc8iiBaXPqZZaSsZMV/58LViNySi
	j1HWI5IezlqAwqLsF9im9fqJVcf3iHDMYHQJ/LHBRMOOuA2QxzREKo27UwevG/gxDO0/
	fAWA==
Received: by 10.14.28.130 with SMTP id g2mr5087869eea.209.1338326436396;
	Tue, 29 May 2012 14:20:36 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s47sm53180533eef.4.2012.05.29.14.20.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 14:20:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LaFHe1jGQLoNkS6MkHwsM58iLJiRXpSSEKo-UqNQwjJCA@mail.gmail.com>
Date: Tue, 29 May 2012 23:20:31 +0200
Message-Id: <002D9B74-3B1E-42A8-A355-BC33847EB54F@dominion.thruhere.net>
References: <cover.1338323483.git.ross.burton@intel.com>
	<41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
	<CAJTo0LaFHe1jGQLoNkS6MkHwsM58iLJiRXpSSEKo-UqNQwjJCA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlnz0h1404SL1qQusEtt/tmfFP/U2ZKrYJgx4cyOAo9ggn3nZ+LkbZixJogu5wV5lBxy5L4
Subject: Re: [PATCH 0/4] Upgrade connman to 1.0
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
X-List-Received-Date: Tue, 29 May 2012 21:30:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 mei 2012, om 23:05 heeft Burton, Ross het volgende geschreven:

> On 29 May 2012 21:56, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> IIRC the sed was done to get around the 'atconsole' restriction, is =
that not needed anymore? E.g. can I ssh in as root and run the connman =
tests and when I log in to gdm as a simple user will connman-gnome work?
>=20
> If that was the intention then it's a very heavy-handed solution...
>=20
> Out of the box, root can access the service.  There is another patch
> to add "xuser" for systems which run a raw X session as that user.  If
> you're logging in with gdm to an arbitrary user, then the at_console
> test should work, right?

No, our PAM magic is still not strong enough :( And worse, serial =
console doesn't work with at_console either.=


