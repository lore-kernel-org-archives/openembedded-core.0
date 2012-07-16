Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sqjbe-0002Jx-43
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 13:36:50 +0200
Received: by wibhm2 with SMTP id hm2so2127640wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 04:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nnpCAal/mK17EeXzwbb4yx9Ir3Ty+ngkfYzXz03JMPc=;
	b=nGXEL/9ql0kE8flP52uo9MfUiQl5de77xr6Z6YkqtxeBxKNAt/d+wR0+8gRI+eTAhY
	HraiEr1zFn1c01tlWZKE/xsmtwyZy8nJOxbnvSxxK4GLzuPHtezuJME9lb7liHyBMxrC
	wO4rWf0HWWx68CZjs2ND9UTLxTzyVMH4H6nj1OCus9NMextVL17qT79NbV6oNRTzPytU
	teVti+QXLO2VqY3HbSoddp6l8wFDYqQwtrC+9XP0KNsmo/dcxDUcERXW129wimbzOGuY
	FLjcFmGwfeyWxEi7yqL1OMkEmSxjxMlQYyqGztfabfxrME53FACR+PWRlbuMG0vTAho+
	0nEA==
Received: by 10.180.81.193 with SMTP id c1mr17424266wiy.12.1342437932152;
	Mon, 16 Jul 2012 04:25:32 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id b7sm31136107wiz.9.2012.07.16.04.25.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 04:25:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5766114.d2laZrfaXp@helios>
Date: Mon, 16 Jul 2012 13:25:26 +0200
Message-Id: <DF70393F-E648-48B8-98DA-ECFFDF724666@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
	<8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
	<5766114.d2laZrfaXp@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk0aP4SstChMwMByVDonx8jIOY+VDin0pTTqSRNa2G04211qXIfUOml549Hf5Y18jO0q2gX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 11:36:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jul. 2012, om 12:36 heeft Paul Eggleton het volgende geschreven:

> On Monday 16 July 2012 12:33:00 Koen Kooi wrote:
>> Op 16 jul. 2012, om 10:47 heeft Burton, Ross het volgende geschreven:
>>> On 16 July 2012 07:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>> Please add proper Upstream-Status for the patches; it is nice to =
have
>>>>> those to track the pending patches.
>>>>=20
>>>> Isn't that field only used to put in "pending" and then backslap =
each
>>>> other on doing such a good job?>=20
>>> Personally I find it incredibly useful to differentiate between
>>> patches that should be going upstream and patches that are =
OE-specific
>>> for various reasons.
>>=20
>> I'm not debating the usefulness of the U-S field, I'm debating the
>> usefulness of using 'Pending' as a catch-all. I can do:
>>=20
>> for patch in *.patch ; do
>> 	echo "Upstream-Status: Pending" >> $patch
>> done
>>=20
>> And it will get accepted, but is ultimately useless.
>=20
> No, it is not. It signifies that the patch is considered appropriate =
by the=20
> submitter for upstreaming.

That's not true according to =
http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Pat=
ch_Header_Recommendations :

  Pending
  - No determination has been made yet or not yet submitted to upstream

I've argued before that 'Pending' should be renamed to 'Unknown' (as we =
already do in the meta-openembedded layers) to avoid exactly this =
confusion.

regards,

Koen=


