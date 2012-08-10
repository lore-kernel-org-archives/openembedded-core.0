Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Szlbe-00051E-Cp
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:34:10 +0200
Received: by eaad12 with SMTP id d12so292155eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=F15MVkOqIuHbsLSyxnPWcH/uAA5qmaU3aIFp0lIIX0A=;
	b=KxhHKrsEJbBwvz9aFcUQdREUAZ3lfb62z6LQ2sWHXjuGnX8xb74J0ii++H8SMgzM+0
	WwZa8hYiBIn3/NfTIwdl1HT9HCapNt+x2pCIvxwbOG7KhdcA6QWJif91Dkt4xafad9vq
	aNBGN5ZGGbIf2OgNR8hqX2jVcG8Y/HLqAKeUaArs+ZxoJWBRJQwKUUuKMpnfeyS4A8NN
	V41inJeAXCN3VfvmhpEOumSl05qlHzURg6pCthI0c+yeDXUP4HPSByOBdLbjfKeYCck/
	aN6yH0qczLFUZ1I40Me2DTQJqrn64DQM6aMj0sjJbUrx3HKV3t0/KwQazCbywTaZZ/Yg
	gIUg==
Received: by 10.14.203.73 with SMTP id e49mr2375509eeo.27.1344590541095;
	Fri, 10 Aug 2012 02:22:21 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 9sm9868859eei.12.2012.08.10.02.22.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 02:22:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1344589634.23275.284.camel@phil-desktop>
Date: Fri, 10 Aug 2012 11:22:35 +0200
Message-Id: <660D912D-3A89-418B-B091-145567C25656@dominion.thruhere.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
	<1384904.B8yRp5DXBX@helios>
	<1344589634.23275.284.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQl0UFDmwEdNNvwd5QtxPnYAj84wdGpuGCxOLq3eV24KedTqtytYRqFyM0HBxsOYozwxkn5z
Subject: Re: [PATCH 01/12] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Fri, 10 Aug 2012 09:34:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 aug. 2012, om 11:07 heeft Phil Blundell <philb@gnu.org> het =
volgende geschreven:

> On Fri, 2012-08-10 at 09:47 +0100, Paul Eggleton wrote:
>> On Friday 10 August 2012 10:03:06 Koen Kooi wrote:
>>> Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het =
volgende=20
>> geschreven:
>>>> svn tar balls are 96M as compared to 1.3G git tars
>>>> its unnessary to suck in that much of data.
>>>=20
>>> That's indeed a big difference and also expected, with svn you only =
get
>>> revision N and N-1, with git you get everything. But even so, I can =
fetch
>>> that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the =
wrong side
>>> of the ocean, but that gcc svn server is sloooooooooooooooooooooow.
>>=20
>> FWIW the git option was much, much, much slower for us here in the =
UK.
>=20
> Maybe we should just go back to using the released tarballs for gcc
> rather than any sort of SCM checkout.  That would be an 80MB download
> for the tar.bz2 and of course you can get it from your local mirror.
>=20
> I think the original reason we switched to using the SCM checkout was
> that, at the time, we were carrying around a huge number of backported
> patches that hadn't quite made it into any released version yet.

We pointed it at the release branch, so updating from x.y.0 to x.y.4 was =
just a srcrev change. But the same can be done by exporting the patches =
with git-format-patch and importing them into the OE tree.

regards,

Koen=


