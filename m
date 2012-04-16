Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJjfK-0002yU-9n
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 13:00:14 +0200
Received: by wgbdr12 with SMTP id dr12so4250256wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 03:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=THUEiBBSbyvBlhr0rBIKV1m6xy/raTeIldjm4ZJ5ksQ=;
	b=QnZ5DNPDRIRkC+PIk6ebE4/FHYM8FuiHOKRBSPy0Ym6fciZ2U6utjdREYCfxqpq9fR
	mMHBDtJWX/shxZMpUYmtD7EFUHxGw7pEvnjn3znS7AS0AghtdGhnm8NJ+uB2DPoXFhjN
	tYvOk2v+PGr9NYVSBGVLCmk4zNBy1mUjyCiE5ersgYwoceb3edKWmiYCbEBSoPb/x+8h
	/f9m/KbdjDAZGmNzy/ho+XyuHBg3INDpYmcHXPsAY+yaJq7zK3PZLgMW5uWoP9ST8aFQ
	YJTSXKzOOLMuKihRV3Syfsd7lfXaVPQi1lcNa5j6eP3vlubT7QY/ULPP4T16gsQIZ1TP
	ItzA==
Received: by 10.180.88.169 with SMTP id bh9mr17760050wib.5.1334573449744;
	Mon, 16 Apr 2012 03:50:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm18880412wib.4.2012.04.16.03.50.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 03:50:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334569715.16992.68.camel@ted>
Date: Mon, 16 Apr 2012 12:50:47 +0200
Message-Id: <CA052A33-7623-4671-A276-524DE18CA921@dominion.thruhere.net>
References: <1334569715.16992.68.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmqhMW1T4XJL2+05jL540OsTQHPiyj0V8aUrPp2/oThtAaqUktbJVCegk3GDU/2x8rLrGNj
Subject: Re: [PATCH] wget: Fix re-execution issue
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
X-List-Received-Date: Mon, 16 Apr 2012 11:00:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2012, om 11:48 heeft Richard Purdie het volgende geschreven:

> The patch in this recipe patches both configure and configure.in which =
leads
> to build failures once configure has executed and regenerated =
configure.
>=20
> The fix to make patch re-executable is not to patch configure and
> only patch configure.in.
>=20
> [YOCTO #2194]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Like the python recipe: pr bump=


