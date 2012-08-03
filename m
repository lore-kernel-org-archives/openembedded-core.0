Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SxFCk-0002z3-Tl
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 12:34:02 +0200
Received: by eekb57 with SMTP id b57so132374eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 03:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=FB5YP2snBYA7E1kTCBVYAHjpmsczZrZgOth0SgyL44I=;
	b=mj5Rlh4xc2lU+gYiInCCnYBwQwccOCYBrXqQSNwQfNwptBya6BEcCFo1/WUfjZNRLz
	2KYMsqg+pGGzSpkqH4r8UndlkH4ntuYDHvy/v80ZK1mURIMEx8o8xeLikrW4myZOrD4V
	+cXp3M2O0PPZ9G6QYa3C9AollOCnoS0I+GGOzheSzffDlR13eW/Qe5+QV/EnXv4yRiL4
	zb56aerHFMLvp6M9o1qLDKEn/Dar7d53X/teIjn4v6nO/amt0aySgz0p0y1OANU43LUC
	VKnp5EOl9ZtoeeWchKRMfETrigXjHn/ixiXj+gu0Twu0o1SjAYG06VF/ht76yPFnNAzY
	cXDg==
Received: by 10.14.198.200 with SMTP id v48mr1551041een.3.1343989342428;
	Fri, 03 Aug 2012 03:22:22 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id o47sm24550347eem.0.2012.08.03.03.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 03:22:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5252580.R5epMZ2pSF@helios>
Date: Fri, 3 Aug 2012 12:22:27 +0200
Message-Id: <035B49BA-8F91-46A3-BB04-6BB22532E915@dominion.thruhere.net>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LakdrRqVVx+jAeUK7Upx570=jLo=PYONZ63=xDNiwD5jA@mail.gmail.com>
	<0AF90D68-14FE-4555-9293-75450B061A51@dominion.thruhere.net>
	<5252580.R5epMZ2pSF@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQn2koJjfhk92uh/WJJwfmrgJtPXK4wLqwoGiW05Qo2E+fF76thapn3OfdN2NdxyRUldFVbM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Fri, 03 Aug 2012 10:34:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2012, om 17:28 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Thursday 02 August 2012 16:14:07 Koen Kooi wrote:
>> Op 2 aug. 2012, om 15:55 heeft "Burton, Ross" <ross.burton@intel.com> =
het=20
> volgende geschreven:
>>> On 2 August 2012 14:50, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>> That's the default value, so you can drop this hunk
>>>=20
>>> Can we settle this once and for all?  Sure, it's the default, but =
it's
>>> also going to be added back in again the moment there's a change...
>>> I'm a fan of leaving a PR in there, even at r0, so its not =
constantly
>>> being added and removed.
>>=20
>> The complete PR field is scheduled to get removed, so the more =
recipes
>> without it being said to that stupid default value, the better.
>=20
> Since such a removal will just be a blanket search and replace, what =
difference=20
> does it make?

It allows a more gradual change, which is good for upgrade paths. =
Insisting on adding default values will just artificially bloat the =
removal patch.=


