Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 46D8560557
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 11:27:07 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so6155200wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 03:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ptkbYUXCtkbUuOBRQBhjHb5SDmohlSgmWayBC5YoVzw=;
	b=ki7P8+9t5GVrOhRUXcuZsrzG8SL/a22PcBqtSz/aB0ZQeO9nFC5ezQ6+f7YYuZhF20
	I4+nt80m2XtFgi5RoTmp0a6RQCHfuo0R1axxq6eF7oNe/Ak3WJZCBU6n2C2rpMMwJex6
	3X9I/sOlY37Pa3blRqAyW4su75J25QLYaI2333KRgUiD62bEf2PNP9HGN7mA8BgEjoOR
	JG2ha+ImPU9KSwdeu7xhXlvrB/zIjLK9ik9l5nZQA3yIpXA1+Ofc9Lt5UUWaSJBn8RaZ
	JsAkyw1X1I+NZHQQAMbbDXbg4VvBDPaGNafAFJzBI78Ym1pDMe0/SYF0VogDuRExD6/Y
	HZmw==
X-Gm-Message-State: ALoCoQmwjMGma2LNcIfbvPZWI5Hd8NBdBG5VAzBaXqB1MZWFEHYa52706HvfJ76P7KEtrT4J/2m2
X-Received: by 10.180.80.39 with SMTP id o7mr15058972wix.37.1415014027972;
	Mon, 03 Nov 2014 03:27:07 -0800 (PST)
Received: from ?IPv6:2001:610:612::c425:582d:3e89:67a7?
	([2001:610:612:0:c425:582d:3e89:67a7])
	by mx.google.com with ESMTPSA id n4sm8393180wiz.17.2014.11.03.03.27.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 03:27:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
Date: Mon, 3 Nov 2014 12:27:05 +0100
Message-Id: <A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 03 Nov 2014 11:27:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 nov. 2014, om 11:25 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
> On 3 November 2014 09:57, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> ping
>=20
> Last night I was looking at my "post-1.7" tag and the number of =
aarch64 patches there.   Kai, did you continue work on that staging =
branch for all of the aarch64 patches that were being posted?

What does that have to do with this patch?=

