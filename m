Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6NoQ-00016v-Jq
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:34:42 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1620996eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 08:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=IHspNtJ4KmoGU6Lh4vlNNzdwYki/4+F/NsWD0jnQLXU=;
	b=CSMs2+qj7MPG5zIru1GGZQaRSYKfH/E0ttGXkbzZKIrbF0h1EhPTQP8MkF6QvN6MHO
	Qe5r1TG+2FPHOyaUMJ7RGfw0W7OA1T6zMnflNC2NX4Dnp8hwRcnEeeIoF2xBFBTj5XJP
	vo2HBYWWIU3ke5FmAjSO+ZosD1ML1pHj7EX7bJnu++g5yE1xDsusPOvuIDq2QzIog47b
	DEqhPNrXzq4rJ59AtqjY9tfQsw2eNFQKbuRrIyLZNNLvCfueqnFsDxJmh1JBhldJiVLT
	ku7InvymU5gyN6K37oz7E5WhPQxobHYPDRajVWSFxct1HVBVOjDE3G0VA0kq7sZEAyWU
	1Q1g==
Received: by 10.14.4.198 with SMTP id 46mr22763082eej.11.1346167352027;
	Tue, 28 Aug 2012 08:22:32 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a139:371e:d7dd:fe4d?
	([2001:610:612:0:a139:371e:d7dd:fe4d])
	by mx.google.com with ESMTPS id z3sm62004374eel.15.2012.08.28.08.22.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Aug 2012 08:22:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3613253.MfUkZynff3@yow-masselst-d1>
Date: Tue, 28 Aug 2012 17:22:29 +0200
Message-Id: <E0720818-177C-4B8A-9C26-F9C77CFB4630@dominion.thruhere.net>
References: <1346081069-4741-1-git-send-email-mark.asselstine@windriver.com>
	<7BBED272-9097-4D7D-AA92-F371C06F4F47@dominion.thruhere.net>
	<3613253.MfUkZynff3@yow-masselst-d1>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlIPJTIv96vtia57UHu4GEnXbobeFWk9utpza5Hr0h/X/guwfWowg8VjjXIBr/BP5Viva0c
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: allow for more flexibility related to hostname
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
X-List-Received-Date: Tue, 28 Aug 2012 15:34:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 aug. 2012, om 15:45 heeft Mark Asselstine =
<mark.asselstine@windriver.com> het volgende geschreven:

> On August 28, 2012 08:47:33 Koen Kooi wrote:
>> Op 27 aug. 2012, om 17:24 heeft Mark Asselstine=20
> <mark.asselstine@windriver.com> het volgende geschreven:
>>> Current logic used to create the /etc/hostname file is fairly
>>> restrictive and doesn't allow for easy customization since the
>>> variable 'hostname' is local to the base-files recipe.
>>=20
>> hostname_pn-basefiles_someotheroverride =3D "foo"
>=20
> Point taken. Do you object to the attempt at making it less obscure =
however?

Yes, since that was the outcome of the discussion in this list not so =
long ago.=


