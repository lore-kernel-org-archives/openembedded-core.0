Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJjeu-0002V9-6U
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 12:59:48 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so4497944wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 03:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nAjFoolc3lctKUnrBvHSuGVI702ODe3Age5pt08cFcY=;
	b=AIC1T7lxCFbb1pyiQQ3isc7lmartQT93PCMWp/ewkg35vhFqcHGdf497RUYOvhhDRG
	sfrAiuWRRCbWa1xNn18RXFQeYllF5npQOdlrGxwYXWNLEZd+4cUvelIlrZS7VGtnel3z
	BJ/wQpW84lGYSzeVcXg6rkRNOCNrb2uWIxpRYgbeVFIje+6cdaqcCHxSXEus9+kaWQYm
	wqGtGKZEpr93zLiRBeGHglC8t9Gd7TaDcCXT9WtOL6koofhewmLmOCDOXyE1zuHl8ZgV
	BfMTtHmBlWsnbpjKsfO2lRsFsiojSK/tcZINcVQDBsx87GeaeJRFyya93VGoh7OLqsFU
	dsOg==
Received: by 10.180.104.65 with SMTP id gc1mr17559244wib.13.1334573425712;
	Mon, 16 Apr 2012 03:50:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm18880412wib.4.2012.04.16.03.50.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 03:50:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334569676.16992.67.camel@ted>
Date: Mon, 16 Apr 2012 12:50:21 +0200
Message-Id: <111FD132-7323-472B-8052-283E454DCB6E@dominion.thruhere.net>
References: <1334569676.16992.67.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQktCrkwd4ahc/pzPSd6ju8XpjFu0KF9Ei8cNZcnscl8H05Fh2dL5eawR+QPbl3lkPttVfJ8
Subject: Re: [PATCH] python: Fix re-execution problem due to patching configure and configure.in
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
X-List-Received-Date: Mon, 16 Apr 2012 10:59:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2012, om 11:47 heeft Richard Purdie het volgende geschreven:

> There was a patch patching both configure and configure.in. Since the =
recipes
> all autoreconf, this is pointless and means subsequent patch tasks =
fail.
>=20
> The fix is to only patch configure.in.
>=20
> [YOCTO #2194]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Since this changes the sources it needs a PR bump.

regards,

Koen=


