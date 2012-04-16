Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJkEr-0003Sd-0G
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 13:36:57 +0200
Received: by wera1 with SMTP id a1so3272577wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 04:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=SJTdymvvIetd9BNeomb54WPFbujA2ZjwZ2OFFIBzWiw=;
	b=VRbhR884V+p9csOdBiTsj3h7psCQtP/iH2NBB1vqc3HsN4CHe3DcLgLgd0BmYMoBuZ
	oBVLPjdW5Iwjc20QogHg5+GpBCkLLF41bYLvgWFWmxzrT6mvWvOZcyuXp70+Zi/8+fl8
	EdbYVZqU2TdD0uRLj0W2FnzGnTt466WNVQbJ8LV1cYYu4lMzy5FLUvKCq5JxabtFMp1S
	/QBv6Z48WOFDNVZc1RlusMvM0g6sth5ocdOSn1vYpl697hdyOPM9x7z27u3bVbifEgU1
	6QdmnZWmiX4/fuR0RcZS4kGwYRIG31iJZa0koCpBXp4rqtSS4G3phI0f3GQVvtrxgkLz
	tcyg==
Received: by 10.216.137.97 with SMTP id x75mr6907729wei.25.1334575652218;
	Mon, 16 Apr 2012 04:27:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ev10sm19054803wid.10.2012.04.16.04.27.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 04:27:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334574653.16992.74.camel@ted>
Date: Mon, 16 Apr 2012 13:27:29 +0200
Message-Id: <ED413D36-93A5-4400-B9E9-F86B6EE04CFA@dominion.thruhere.net>
References: <1334569676.16992.67.camel@ted>
	<111FD132-7323-472B-8052-283E454DCB6E@dominion.thruhere.net>
	<1334574653.16992.74.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlgSXLOyTkVP2AoxIsaIum1ucuIcCSbTXXgcgHNZ5+C8OpNm9CDp/x0xv0+v7QOzWBNh7iI
Subject: Re: [PATCH] python: Fix re-execution problem due to patching configure and configure.in
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
X-List-Received-Date: Mon, 16 Apr 2012 11:36:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2012, om 13:10 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-04-16 at 12:50 +0200, Koen Kooi wrote:
>> Op 16 apr. 2012, om 11:47 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> There was a patch patching both configure and configure.in. Since =
the recipes
>>> all autoreconf, this is pointless and means subsequent patch tasks =
fail.
>>>=20
>>> The fix is to only patch configure.in.
>>>=20
>>> [YOCTO #2194]
>>>=20
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>=20
>> Since this changes the sources it needs a PR bump.
>=20
> It has no effect on the packaged output which was always the criteria
> for PR bumps as I understood things.

But there's the exception for fixing failures like this so people don't =
have to -c clean(sstate) things.

regards,

Koen=


