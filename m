Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB6rw-0006wx-Jj
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:57:36 +0100
Received: by wibhj13 with SMTP id hj13so2013261wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to:x-mailer:x-gm-message-state:content-type
	:content-transfer-encoding;
	bh=W9SrfD9MJ8Espg4LHo+o+kxu1ACqHVf8IodE5FB8q1I=;
	b=NhfZYwhUervtoYtEXoyW9lHNFmMz6I+ifAp69VB7QAaj++fQ/XZbSM9OFvSUa7Vlmg
	HGVIAspbgYpRE4ZoPHklLl1Xci7hrNGBI9Zwziknt9lyDU/jBI1DMJPnn3DV4hrW0Bem
	TRH8xHvkOiHgHTW7lhZhkcDIZa8VLxf6bN5z/fbduxL5aCK58bxgGh1JptKiRib+Pd6+
	iaMjFtjFcHW5ZNcPJ3ZX11HheFu/lgJtic8zHU7QJAiwocqGYyZuwLS1NtTs2TIBQOcX
	QSwyUoAOAkjIDuH0iMkVYCkR8480WLPephPuUquLjUtHmLt69HBz/qa4WKeVS2BEgc2P
	Rmzg==
Received: by 10.180.100.196 with SMTP id fa4mr8925830wib.0.1332517720192;
	Fri, 23 Mar 2012 08:48:40 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 9sm24483464wid.2.2012.03.23.08.48.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 08:48:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4330166.INQO86P9ch@helios>
Date: Fri, 23 Mar 2012 16:48:35 +0100
Message-Id: <DB5813F2-48CD-4353-BE92-A090AEA00FBC@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
	<37018070.ge2LN5YNq8@helios>
	<28CB7011-540E-4875-86E8-ABBF0E66DE18@dominion.thruhere.net>
	<4330166.INQO86P9ch@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmE/kjxKBBY3o8I/FemcDxw9lCMuBTUzaXRx8xg3aufqUl2QMANBO8WoT41ixtUZJXZXxEK
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
X-List-Received-Date: Fri, 23 Mar 2012 15:57:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 16:24 heeft Paul Eggleton het volgende geschreven:

> On Friday 23 March 2012 15:46:23 Koen Kooi wrote:
>> Op 23 mrt. 2012, om 15:33 heeft Paul Eggleton het volgende =
geschreven:
>>> On Thursday 22 March 2012 16:25:40 Koen Kooi wrote:
>>>> When nothing has changed an empty commit prefixed with "No changes" =
will
>>>> get generated
>>>=20
>>> So I guess what's missing from this commit message is an explanation =
of
>>> why
>>> you want this.
>>=20
>> Drat, I had assumed the commit title would be enough for that :)
>=20
> My personal opinion (probably backed up by the commit policy, I =
haven't=20
> refreshed my memory on it recently) is that commit messages should =
explain the=20
> reasoning behind a change and not just be a restatement of the change =
in=20
> human-readable form - although that is often useful in addition.

I get that, but I'm having trouble coming up with something that isn't =
already covered but the "record all builds" statement :(

regards,

Koen=


