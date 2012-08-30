Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T74jX-0006z6-6K
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 15:24:31 +0200
Received: by eekb57 with SMTP id b57so607127eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 06:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=b8QS7a6Xvio1KQeDDv1pJKxZkVJnEWQnqgtB13vE6q8=;
	b=j/pUeU1fIOPQ5+gGHfUmXUfVIenKj3b/ElXkmUkneUhCo2s90n5DqUBeC7Un9Cq0Ie
	Q8rOtyKfRiwk+NJ/DOGDC7TP7fSUpV/nN2pwOraLRfXYQBZqHuBSQZ26PMkYE37NnzYj
	RPHq+0dcFkpu1HASjwSTSg2DVswwpTLd0rVbdWA1jGQOI/Yci3mONrrD5aPm4MaWZTDm
	PS4mBO6wNG5I1Z5GbRPCN9S79fyT8tE4kfLZEbnHjs2AZnQQv8Q68Lnhey5Ke0IpYphA
	KsOkikROmoXX0nnZO3/hVaoycc6d4ZRcI7mMsNDez3ro+K2SrQgGsGPl58KwedfQxZnL
	DvHQ==
Received: by 10.14.212.72 with SMTP id x48mr6455015eeo.40.1346332335793;
	Thu, 30 Aug 2012 06:12:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dc13:ace3:2d40:4ac6?
	([2001:610:612:0:dc13:ace3:2d40:4ac6])
	by mx.google.com with ESMTPS id e7sm4883693eep.2.2012.08.30.06.12.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 06:12:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZtnp+CRBrz2GcMsGuGRYzDkCgS46hxGe34v_p47BeMRQ@mail.gmail.com>
Date: Thu, 30 Aug 2012 15:12:12 +0200
Message-Id: <A9F5B8AC-9CD5-4BE4-B8BB-BE54D5340069@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
	<CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
	<F37371D0-84A6-4E9C-9455-72409B92E29C@dominion.thruhere.net>
	<CAJTo0LZtnp+CRBrz2GcMsGuGRYzDkCgS46hxGe34v_p47BeMRQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlSEg4vYVikxNEb1GQJQ/aUUKdUk5Lnn+qXpKiylQvgx/b3mG4igXQDb6Y7HB8XmiNLKtt8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 13:24:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2012, om 14:24 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 30 August 2012 13:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Indeed. In the past I had every device using full Xorg in OE on my =
desk, but with the demise of kdrive and the adoption rate of OE it has =
become impossible to have access to each device :)
>=20
> Speaking of hardware I'd like to test the touchscreen calibration code
> in Xorg and purge the bits that are kdrive-specific.  Any
> recommendations for hardware with a touchscreen?

I'm biased of course, but this is what I use: =
http://beagleboardtoys.com/products/#LCD7 in combination with a =
beaglebone. Meta-ti has the needed drivers for it.



