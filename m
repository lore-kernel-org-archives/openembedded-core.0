Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id EB6266E63E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 12:06:36 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id q5so6182548wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 04:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=I8JGA/PkzG1Dl0dNHK+INNcTWpEqezei+0t1pcGvoFk=;
	b=HLNUZhzaanl35i8WoK+AGLUe4kHcCpHXhYlbo1PBJAJpw2mvrTXhgA8RU5RrtBb8fA
	BqjF7i1cFSZ7h+iNUIA+X7DPZbMWPZ+9ctrwMqWzKQcCLEdO/k7jhNNap4HBlP4G+Szt
	2y392cM8NBqUsG4zwnVtSqNr2qj9OBOxXIwemR4w0PawkA+H/dv0TntV7uehQPuhOzhu
	imMBI/5B9LsS8J+hinmNoLCRBHW20GU0n7/LYwgEUL3rgCjJ4KAzBkrk4j+8I/c+CXxU
	QTGv8DPHErrZIJrADu/hYsUTZLpfFu+ME9mSpz+RGUysBYdr42z1cLAcdI30LdBv9IRS
	kxZw==
X-Gm-Message-State: ALoCoQnyu5ju1rb8LSD+2eDfQpi+RdYjY9kUhQkz0r3bbpDvVoxRSkOHFac4WFlOXmbEyHYtgwxx
X-Received: by 10.180.74.201 with SMTP id w9mr15545479wiv.17.1415016396546;
	Mon, 03 Nov 2014 04:06:36 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id ei1sm8506575wib.20.2014.11.03.04.06.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 04:06:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
Date: Mon, 3 Nov 2014 13:06:33 +0100
Message-Id: <07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Nov 2014 12:06:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 nov. 2014, om 12:30 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
>=20
> On 3 November 2014 11:27, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> > Last night I was looking at my "post-1.7" tag and the number of =
aarch64 patches there.   Kai, did you continue work on that staging =
branch for all of the aarch64 patches that were being posted?
>=20
> What does that have to do with this patch?
>=20
> Kai was collecting patches that were sent to oe-core, and this may =
have been one of them.

Is this some new requirement for OE-core patches?=

