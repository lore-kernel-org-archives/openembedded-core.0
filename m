Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T75r3-0004pd-LZ
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 16:36:21 +0200
Received: by eekb57 with SMTP id b57so641130eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 07:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Zm78nVPr3L94DhDM07ecnDEVd2djXNZyDAEftoIaUx8=;
	b=LDraD/S6kaTgVbbgY5MRuqRY4pXX7EbMCvzbC8qs1z46Vl68oSvGT2iRHhpzPT5iZk
	G/XTPVgwqlaip1HjUEr0NNwMUgYoVhoVyrYr3YN4ZmjLEUvqgD2wospW1lqCmIleH2aO
	6rMKW6xuWmLuFzhY7M3jpt0cY1p2sZPKXRiJ4FQGG8F3VWXYeMRYOjbuAs3T3DT+eayP
	BKrabuD5tmFhoeCcohzsC24vFtjqEzbUAr04LhJr2t94131tZFQRFAVqoElHTZuVAWVb
	1VdKN/HaGe4PdSlNxKouYVGdwOnIXXk93ojkfGTjA5TiDCcQqHaYmofsAMCdXMLgQ6W0
	Sxxg==
Received: by 10.14.182.134 with SMTP id o6mr6773540eem.26.1346336646289;
	Thu, 30 Aug 2012 07:24:06 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dc13:ace3:2d40:4ac6?
	([2001:610:612:0:dc13:ace3:2d40:4ac6])
	by mx.google.com with ESMTPS id 9sm5343646eei.12.2012.08.30.07.24.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 07:24:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LaimcQO6umbsMO2YpKSCMKWnhkR+t5EO-nMgtZK3=PU9g@mail.gmail.com>
Date: Thu, 30 Aug 2012 16:24:05 +0200
Message-Id: <59FE1FB5-0591-4334-BD94-FC0BB6EDAC93@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
	<CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
	<F37371D0-84A6-4E9C-9455-72409B92E29C@dominion.thruhere.net>
	<CAJTo0LZtnp+CRBrz2GcMsGuGRYzDkCgS46hxGe34v_p47BeMRQ@mail.gmail.com>
	<A9F5B8AC-9CD5-4BE4-B8BB-BE54D5340069@dominion.thruhere.net>
	<CAJTo0LaimcQO6umbsMO2YpKSCMKWnhkR+t5EO-nMgtZK3=PU9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkpXY85i/7yBvGa25cqndBbyRX/1srh+Q5fJMa3mulmHWv/cRJ3yRqRBdMlnNBz0fBUWJRf
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
X-List-Received-Date: Thu, 30 Aug 2012 14:36:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2012, om 16:04 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 30 August 2012 14:12, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> I'm biased of course, but this is what I use: =
http://beagleboardtoys.com/products/#LCD7 in combination with a =
beaglebone. Meta-ti has the needed drivers for it.
>=20
> I presume the same applies for the ULCD7 for the -xM?

Yes, but you'd still need meta-ti for the support. The uLCD7 for xM is =
in need of some driver love, which is on my TODO for next week.=


