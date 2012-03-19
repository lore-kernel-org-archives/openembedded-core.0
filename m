Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9gxH-0008Vk-VM
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 19:05:16 +0100
Received: by wgbdr12 with SMTP id dr12so879088wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 10:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=f3C7FJ+uBjlC5DwFqaoO8YENuqPRWjT7rH/UofIV0Wc=;
	b=Gic58WZuifEyulVQp4MJx9GIL5Ibjcm0vAHtLd19KDpQinm9icF8sa/5ElyCnJDUWR
	ADcjtnb9Em4Ej4WGI10flisGwJny2T7LnvJooIqSD392vsCn+mJLyADcNtMP4HJcZI7Q
	IWq5Iob92IJmUz7+C0+w99POHyMqH5IA9lIZWj+FvXQ9OxQpVeYfiqIjKuL5Ifm15M0g
	xYnHOGoLZG9IhUYC+fUzRqe2rKpanuEqH0sgARa+wmMv6WNTOxB6+xOA5Mb0SbiQf6ry
	S4fmPGEWFgL57kWQ79Yy5LA7uNSO65/yovsOgzlD0UkZqpeWlka29t/10iWIgKcvvRMr
	BBiA==
Received: by 10.180.76.74 with SMTP id i10mr22031323wiw.2.1332179784515;
	Mon, 19 Mar 2012 10:56:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm43845793wib.9.2012.03.19.10.56.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 10:56:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120319155803.GF9911@giant>
Date: Mon, 19 Mar 2012 18:56:22 +0100
Message-Id: <99D97950-0951-4127-BA84-D6D6A3C8D596@dominion.thruhere.net>
References: <22576197.WV0krj9sgO@helios>
	<1331799945-14172-1-git-send-email-bjst@enea.com>
	<20671C9C-1AC1-482A-9B4A-C40EE9087BD7@dominion.thruhere.net>
	<20120319155803.GF9911@giant>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmM7ciLMsDEP8jWcAEIFELt3eEopIcPwMGalfmsTX3t47yYjIxnqiqX6egQBemm3Jd0Myik
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Mon, 19 Mar 2012 18:05:16 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2012, om 16:58 heeft Bj=F6rn Stenberg het volgende =
geschreven:

> Koen Kooi wrote:
>> Op 15 mrt. 2012, om 09:25 heeft Bj=F6rn Stenberg het volgende =
geschreven:
>>> +PROVIDES_virtclass-native +=3D "gzip-native"
>>=20
>> This is either missing update-alternatives entries or it is missing
>> RREPLACES/RCONFLICTS with gzip/busybox/etc. Or both.
>=20
> My intention with the patch was to provide a native-only recipe for =
pigz, to improve distro build speed.

But it went in as a regular recipe and hence needs to play well with =
others.

>=20
> I'm not sure there is much interest in using pigz on target.
>=20
> --=20
> Bj=F6rn
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



