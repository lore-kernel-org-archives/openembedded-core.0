Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB5tn-00058A-Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 15:55:28 +0100
Received: by wibhj13 with SMTP id hj13so1878059wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 07:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=XCEYcLs1UHfGAbYJ7jOtoiwu5KopdzqeUWK86kOj+RI=;
	b=VotFpma2+8TRMn/AG0DLGbbJ4M9GSC55qnht6Cttq8dF6kQalKkI6fnEyrh/T5Azxt
	0mPPPu1kIKM3Bt3kyHwkCW0jq4UEPiLK2Eb1MwdjQutBS/YLtdQDXgIODFH56Nd+v6xk
	K2ND6rwhL5LwV77KQLfliNquw7EUUENd63x26kcbUn5eJhVH7yUPmcDPkfOhlBdndsWL
	dBFNlJmGa1obrrbpARxbX4BbOBpWqvHf9HukWzZBad+ClLFiRYMDScloRJ/zayLQlHxu
	WN5p+nijxtgthOee8wySB8CxCA7lqoF0SA/idPaXQIM31hqfKC8Uum02MsQ0rA7pkcc7
	bS6g==
Received: by 10.180.73.143 with SMTP id l15mr7161317wiv.11.1332513991921;
	Fri, 23 Mar 2012 07:46:31 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n15sm14350405wiw.6.2012.03.23.07.46.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 07:46:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <37018070.ge2LN5YNq8@helios>
Date: Fri, 23 Mar 2012 15:46:23 +0100
Message-Id: <28CB7011-540E-4875-86E8-ABBF0E66DE18@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
	<1332429941-19621-2-git-send-email-koen@dominion.thruhere.net>
	<37018070.ge2LN5YNq8@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmMYD3UCxEI9CRDbBzzeZj9ePSpU9jrFGYxWMj+j41J6SAQcAdz0xkTtqeonN/3q3CCFdfP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 2/3] buildhistory: record all builds
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
X-List-Received-Date: Fri, 23 Mar 2012 14:55:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 15:33 heeft Paul Eggleton het volgende geschreven:

> On Thursday 22 March 2012 16:25:40 Koen Kooi wrote:
>> When nothing has changed an empty commit prefixed with "No changes" =
will get
>> generated
>=20
> So I guess what's missing from this commit message is an explanation =
of why=20
> you want this.

Drat, I had assumed the commit title would be enough for that :)



