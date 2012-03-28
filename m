Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SCtNu-0007Ho-Mr
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 15:57:58 +0200
Received: by pbcum15 with SMTP id um15so1658752pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 06:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UYcAItXrLnb8aeaDuy4V46lcj0PYaHZ4nXcti7IlTtA=;
	b=G5P2sX9JFv2zwZt9YJADTIevXgcDFCa+281CtjPSLjaEhmZD9+YdXvNgIwUYVuawoD
	NXh3FK+LA32950vAE6NsXE69+1XgQl+rkD4Ya1kY8mFymw5ohlyiMw6xWXLAUwVZ8Xl4
	ItFbTPi0X5fSlatdrmH4kC/epxvZdy4FKvnpZvzjJRUls1PXaFMutLjqjp+Ap3X8/Q+P
	L98E7zrZ+sDqe2xUwTX1e630WsyvYb95PdkUm/yedk3BBW32Ru7a6gNie6GZYaIcIOt3
	waGcnQfpyCrSYeAK5SWyd7ZnQy7R7RusOG4rAWR0KisEH3mLBPGSMqVsVavWwApy1Yu0
	G+wQ==
Received: by 10.68.201.98 with SMTP id jz2mr71529226pbc.97.1332942535840;
	Wed, 28 Mar 2012 06:48:55 -0700 (PDT)
Received: from [192.168.1.50] (adsl-63-193-31-6.dsl.snfc21.pacbell.net.
	[63.193.31.6])
	by mx.google.com with ESMTPS id d6sm2747156pbi.23.2012.03.28.06.48.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 06:48:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <alpine.DEB.2.02.1203270815010.3125@oneiric>
Date: Wed, 28 Mar 2012 06:48:31 -0700
Message-Id: <67D24706-0CFE-4BE0-90C9-325BC9BDE18A@dominion.thruhere.net>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmycDSUEiNCr55IHYlUXLwb0GPJarfRKAx7rStPmBwNXbk/qhfI9C+5YjeD5lZEC8NR+hCy
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 13:57:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 mrt. 2012, om 05:20 heeft Robert P. J. Day het volgende =
geschreven:

>=20
>  i'm currently poring over the OE docs (including the ones at the
> yocto site), and i'm trying to figure out how to simply add a package
> to an image through one's local.conf file.

Why throught local.conf. Image recipes are really small and easy to =
understand. Just make a copy of the recipe you want to change and change =
that, no need to go poke at it from non obvious places.
I really don't understand why people are so against creating their own =
image recipe since foo-image.bb is not really foo-image anymore if you =
add 'bar' to it thru e.g. local.conf.





