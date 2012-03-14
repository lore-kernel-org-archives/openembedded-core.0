Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S7jcF-00042w-CW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:31:27 +0100
Received: by wibhj13 with SMTP id hj13so5819934wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=qWWV2I0PmT0kUXfV4AzqFUQJ5j7hcyea4dBUy9CkxME=;
	b=ZsMMWc/I2y2EvQV/7R+cqt7LQdchfcv2/2D45bick6Ra6sgux1mQJrNi0IFC591q3V
	pTR6xnP9qv0QZplX7LRA8DMPZUVZj5f24AwKspIYogzM+/FZoChTnDPxU55wKsbX9Jlc
	JqdyGqO6u8ELD/xXI3xq9oWAq+Hm2AAZq340iCtn/RkUHBCF61uGKrN2143Ef5tmzfUI
	o1eS7rqY4UekK8tsI+My5K7lrNFinnJGaxMAVUOheVErbw72i6tS7Rqp7j8c9xOd9321
	8fg1Cu67IZ1e4BDZA2PyZh8ThaLJzpVUrhnezBDmXlZcB88VOCdHK5FKgB2VANxnA5a2
	JADA==
Received: by 10.216.136.13 with SMTP id v13mr1009437wei.32.1331713362466;
	Wed, 14 Mar 2012 01:22:42 -0700 (PDT)
Received: from [10.68.37.11] ([87.111.147.121])
	by mx.google.com with ESMTPS id df3sm50104341wib.1.2012.03.14.01.22.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 01:22:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1331684953.git.scott.a.garman@intel.com>
Date: Wed, 14 Mar 2012 09:22:50 +0100
Message-Id: <D98E48A1-026D-4995-B63D-C3B422207B9A@dominion.thruhere.net>
References: <cover.1331684953.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQltl7q55tT/g6JcgcDN8T+U8S9oog3oyOFmIAhm+5LwQOMIAJxYP9baGB1aOkPUubH3ipQv
Subject: Re: [PATCH 0/1] ncurses packaging fix
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
X-List-Received-Date: Wed, 14 Mar 2012 08:31:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mrt. 2012, om 01:31 heeft Scott Garman het volgende geschreven:

> Hello,
>=20
> This fixes the ncurses library packaging. Thanks to Andreas Oberritter
> for pointing it out.
>=20
> Scott
>=20
> The following changes since commit =
81379dc141e245307ca391a02b7490b199128991:
>=20
>  dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib sgarman/ncurses-pkg-fix-oe
>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dsgarman/ncurses-pk=
g-fix-oe
>=20
> Scott Garman (1):
>  ncurses: fix packaging of moved libraries

You're missing a PR bump for the affected packages.

regards,

Koen=


