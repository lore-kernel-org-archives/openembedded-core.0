Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 52C0565D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 15:24:39 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so6343193wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 07:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=PQqUhJ4ee50oP2Od1q9ORTJpziJhCdwtM2aFNSIai8U=;
	b=Fm2ZMp1xdEbiWToPXkjL/nEnwxMuR5j2UXBb7CqwFKNIMq7XW4PAj2ygdTrJkOAnkl
	SMNPXOVx7Er+KoqkZ3YcjrUE2na6kuZ4ETICQFqqzVZhYGhZERzuV7QV/sadzylh5qz5
	Hn6EqlGrssDL36NxtvwyudO7PfQca1svnAFHTvtgPA9dZyH5xyZonhY5N+dgBdT2CwDE
	+8xfrD2LA6gc9chW7AOcKpOSXu2uLnCjpYe5gHQ4Ozwp4A3HJiTkpp7nx+NCTc7HDNLo
	OI2fhIPmiSBf2mxeaeJA7d7Sa8bXwa5R2o9YbfuRyWNzx7JuPbjx0ayIeylanVTm0q9S
	2uxg==
X-Gm-Message-State: ALoCoQnU1tzxH9q3mHbCinZrGhPgeuoEUKQpTznaJuvAuSMMiTaJYkJ3c1XNPMsihRaDK+MJyruV
X-Received: by 10.194.60.198 with SMTP id j6mr49217141wjr.30.1415028279953;
	Mon, 03 Nov 2014 07:24:39 -0800 (PST)
Received: from ?IPv6:2001:610:612::6984:550e:6577:8ac9?
	([2001:610:612:0:6984:550e:6577:8ac9])
	by mx.google.com with ESMTPSA id
	q10sm22509828wjq.35.2014.11.03.07.24.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 07:24:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <1415016627.5111.9.camel@ted>
Date: Mon, 3 Nov 2014 16:24:38 +0100
Message-Id: <9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
	<1415016627.5111.9.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Nov 2014 15:24:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 nov. 2014, om 13:10 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Mon, 2014-11-03 at 13:06 +0100, Koen Kooi wrote:
>>> Op 3 nov. 2014, om 12:30 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>>>=20
>>>=20
>>> On 3 November 2014 11:27, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>> Last night I was looking at my "post-1.7" tag and the number of =
aarch64 patches there.   Kai, did you continue work on that staging =
branch for all of the aarch64 patches that were being posted?
>>>=20
>>> What does that have to do with this patch?
>>>=20
>>> Kai was collecting patches that were sent to oe-core, and this may =
have been one of them.
>>=20
>> Is this some new requirement for OE-core patches?
>=20
> Its someone being helpful and trying to consolidate a topic branch and
> test things before it gets merged.
>=20
> So its not a new requirement but it is helpful and appreciated.

It's been over a month and libpng is still broken, so I refuse to =
classify this new process as 'helpful' or as 'appreciated' at this =
point.=20

If this continues can the person doing such a branch reply to patches =
intended for it saying they will or won't be queued? And please run the =
patches without such a reply through the regular process. That would be =
both helpful and appreciated.

--
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs




