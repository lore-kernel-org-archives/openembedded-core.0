Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 83E5B6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:02:16 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so1550326wes.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=OLWhhwAhuORdaQOETE2/YYnjpJ6UlExtnC8SPS+HuyA=;
	b=AE/YE7bkhAtIPrormKXMlpkuSIlCPR5CaZhAo5apNodeTVJDvuT3HLpGn3Xte+HAif
	rv76Feb50hL0fgHLWCsBXvI9/ZeOeK8yorbF+4YV6otvaMZqDP6+z67xiwTR0Yxf4mU/
	PUJ5HItAOtLqLbk5xk6pBR6Cug6rKzPbEFdrTPMzExwffX5ePzfndPN4qbE7AsGohQqd
	4zkpyf+Ien9O6LGbb7XHr0HeTS1gNlyppW9xMWEW568ZoeL055y99thLgZJnRz/j9ep5
	LUS2J85xzvNgaRrTXCDD76Aq1d9cwAylYFUlPojANnsMbs+r2g/CAXUDB1XanqV7kIK2
	wiqQ==
X-Gm-Message-State: ALoCoQkmi/jYGNvWl8gGbnT6z2wvm0O7x+fxyrL/9JIaoIpmPr51fck6lNb7MnYNUxp/KUdPx7vD
X-Received: by 10.180.12.70 with SMTP id w6mr1364342wib.4.1389780136510;
	Wed, 15 Jan 2014 02:02:16 -0800 (PST)
Received: from ?IPv6:2001:610:612::2076:f88f:7a13:7ab2?
	([2001:610:612:0:2076:f88f:7a13:7ab2])
	by mx.google.com with ESMTPSA id uq2sm2801065wjc.5.2014.01.15.02.02.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 Jan 2014 02:02:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1389777270-58378-1-git-send-email-fahad_arslan@mentor.com>
Date: Wed, 15 Jan 2014 11:02:16 +0100
Message-Id: <E0B0C5D8-C9DA-413D-85E1-7628F4303D84@dominion.thruhere.net>
References: <1389777270-58378-1-git-send-email-fahad_arslan@mentor.com>
To: Fahad Arslan <fahad_arslan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] speex: enable floating point support
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
X-List-Received-Date: Wed, 15 Jan 2014 10:02:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jan. 2014, om 10:14 heeft Fahad Arslan <fahad_arslan@mentor.com> =
het volgende geschreven:

> From: Fahad Arslan <Fahad_Arslan@mentor.com>
>=20
> Speex configured in fixed point mode is not able to covert flaot
> input in range of +/-1 passed by Pulseaudio. As a result streams
> that need to be resampled are not playedback (no voice). Avoid
> this situation by configuring Speex in floating point mode.

As pointed out before, this makes speex unusable on systems without an =
FPU=

