Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rq6Cq-0002aH-3e
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 18:00:20 +0100
Received: by werc1 with SMTP id c1so2989341wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 08:52:33 -0800 (PST)
Received: by 10.180.101.101 with SMTP id ff5mr12446612wib.14.1327510353453;
	Wed, 25 Jan 2012 08:52:33 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fr8sm3201040wib.10.2012.01.25.08.52.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 08:52:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120125162620.33c601f1@eb-e6520>
Date: Wed, 25 Jan 2012 17:52:25 +0100
Message-Id: <77750FFE-A5A1-426D-A92E-775A8C95FF9A@dominion.thruhere.net>
References: <1327488436-28526-1-git-send-email-eric@eukrea.com>
	<A1F13823-5353-4D31-9614-C5C2317D122E@dominion.thruhere.net>
	<20120125162620.33c601f1@eb-e6520>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQmV339gsqZSJOhGEzf1bxSQ+jPza3MiWDJWHzaD3IcNQ/5aNS+jYxuh0y+dte24uXc8pKy5
Subject: Re: [PATCH] qt4-tools-nativesdk-4.8.0: fix build
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
X-List-Received-Date: Wed, 25 Jan 2012 17:00:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jan. 2012, om 16:26 heeft Eric B=E9nard het volgende geschreven:

> Hi Koen,
>=20
> Le Wed, 25 Jan 2012 13:01:26 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>=20
>>=20
>> Op 25 jan. 2012, om 11:47 heeft Eric B=E9nard het volgende =
geschreven:
>>=20
>>> the build is actually failing because host g++ and ld are used to
>>> compile and link
>>=20
>> This is missing a PR bump in the affected recipes.
>>=20
> as the recipes don't actually build do you think the PR bump in
> necessary ?

It would avoid the need to tell people to do 'bitbake -c cleansstate =
<foo>'

regards,

Koen=


