Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sj4pN-00072Z-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 10:39:21 +0200
Received: by eekd49 with SMTP id d49so1179824eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 01:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=viF5KaZfqSOz2uSpm5pKJAFPRYQHZL5Hxq3QIwgb/C8=;
	b=DiYBqIn2580y1q92oiWkNdAKG87ULrSHW8Vpd9HAVkrGmNxdq225w9DiegLWMbxjW1
	KNq2bzy6kavzvAJYFGfLpi8qz1TLRNNV6MI7emVZowKEmYKgQ0MRIra9u/g5c/NnW1LV
	hJzc00qYf7bUyeCRWfEG5Y4BJrMzXs9QIonGXCOwGNCUaZx5YcydsiJdnhyazUP0hZfR
	N1S38AzOMYUzXE1U+KREIm+otpMPahvcBeVNSqg7V4yedSgeToMm+wJjSAtXiGrAJIBK
	9wW3IWJooEz6rlcVTVyNZvShYRhBsz7bKGVufmaSUpDXlWgT3m9aNpq0Lg3JwZ9ENUv9
	RYbw==
Received: by 10.14.48.71 with SMTP id u47mr2113229eeb.205.1340612910758;
	Mon, 25 Jun 2012 01:28:30 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	x52sm136267847eea.11.2012.06.25.01.28.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jun 2012 01:28:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FE81705.1030703@linux.intel.com>
Date: Mon, 25 Jun 2012 10:28:23 +0200
Message-Id: <3FFAD085-176E-448A-A096-CF113CD2CA41@dominion.thruhere.net>
References: <cover.1340560914.git.sgw@linux.intel.com>
	<B0A816B5-77AF-4371-AAC8-FF4A4D78D0A9@dominion.thruhere.net>
	<4FE81705.1030703@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmjzgyNWkUSA0C8aV960/F4ec6Z6OFEkQAG6ffU847Rct6PDag65yHyfjjcPWs/zO0MOmBL
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Package Updating
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
X-List-Received-Date: Mon, 25 Jun 2012 08:39:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jun. 2012, om 09:45 heeft Saul Wold het volgende geschreven:

> On 06/24/2012 12:27 PM, Koen Kooi wrote:
>>=20
>> Op 24 jun. 2012, om 20:03 heeft Saul Wold het volgende geschreven:
>>=20
>>> Richard,
>>>=20
>>> Here is a patch of updates.
>>=20
>> How were those tested?
>>=20
> Koen:
>=20
>=20
> I tested these in a variety of ways, depending on the usage in the =
overall environment.  Obviously I built them both from within a clean =
build area and a build env that contained shared state from prior =
builds. As seen earlier today, I found an issue with a couple of patches =
that built on my initial testing, but then failed later.
>=20
> Then I checked what the target dependencies might be for the libraries =
and built a target image that included those, such as webkit for libidn.
> Most of these packages are in the core-image-lsb, so I built that and =
ran the target binaries with --help and -V (or --version) to ensure they =
at least start up.


Did you install them as upgrades into an existing image as well?

regards,

Koen=


