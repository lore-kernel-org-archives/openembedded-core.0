Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SIKqC-0007JB-Hr
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:17:40 +0200
Received: by wgbdr12 with SMTP id dr12so1706601wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 07:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ucrw4rsHk+zpkvPskdFelP0Je5g5wSr/taxmDZg39Qk=;
	b=awFvXrjNFdYe8s+c1cPyz1/PIa6ifBxUbucU/Df2WxPZHBVsjGnnHuoyTjEuhdVgld
	K2nKD0WTlGiN75jSWGCE6JSPO2KavpKqmKQMlJh0PfymiTrlbCI2gnosq59O+ktIExKc
	ZMsaWVVo2KDlxirukp35IED4nSEExfR1edEb3MTqRkgXSMwaPMgtfdTtpY5pVNYptlWG
	Gch7YKpH9G9Y4hcdHOD7M9V3hcn9czYLnpfiC88I9NX/pKZ0Kb/ummSn6BgRqVgQCpuv
	6HKO0mEy2jU3eqeCxyoJS3viw21a1dlx0hnIer5bVENlgR5c3aSpdoY/lE1bFaaBTptb
	KJKQ==
Received: by 10.180.95.34 with SMTP id dh2mr6289645wib.15.1334239700204;
	Thu, 12 Apr 2012 07:08:20 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm52531210wix.8.2012.04.12.07.08.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 07:08:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
Date: Thu, 12 Apr 2012 16:08:16 +0200
Message-Id: <2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
References: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnG4u/paGYmiKA7/TSpnz2bwB9S1TSI6qCrtdlRDXQHxnRSVQ08gExVqZqSJwaywntB5/34
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 14:17:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 15:42 heeft ml@communistcode.co.uk het volgende =
geschreven:

> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
> meta-oe/recipes-support/jansson/jansson.inc    |    8 ++++++++
> meta-oe/recipes-support/jansson/jansson_2.3.bb |    4 ++++

I'll ask the standard question: why is this needed in oe-core?

regards,

Koen=


