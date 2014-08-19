Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7297C617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 10:41:16 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so6262630wes.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=OPxkiOGQEXwuRiXcwRx2uYm2R25M3W+JCLB3wW5M5n8=;
	b=HNHOJT3wWlZ6IDaokiKF/NOd/tm1O/3w/5/y9V4jOyNLqRhKYHSBvdebd1D/RvUppD
	COoTgvb3fOgYUNProK603RqHJ8WV8bYxAOYpqdWbN/i1/pAfaLNk5eX1p/Zlo0x8qSAg
	D/UvhHjaHJ3pD+k7qNQyLQq0sE12Q/2PxZ9kk1iXKZyp9tQl59XDIVjKw2BH+bMZzAkd
	RYZD7GQGsdEsAN2WKgC4XsyDh1GBVPPv+XmL0ATPxK2y00tRIpzOhA5RXamCqZ9K0sVS
	y0k59MsljbRL/N/YrCSqnu5G807YjlKGJ1Y+JDDY9NVNeHee9FU9Nho0L0db1LR+paS8
	qmkw==
X-Gm-Message-State: ALoCoQlkd3M0V9YDwma4+gFbhlFVoi4A0J+bbdhUkAMIvm2rihpS7bqG0+e3e5v7Q9FEEkorQbb/
X-Received: by 10.194.110.135 with SMTP id ia7mr1640805wjb.128.1408444877976; 
	Tue, 19 Aug 2014 03:41:17 -0700 (PDT)
Received: from ?IPv6:2001:610:612::9ddb:a7e3:ceac:a8d6?
	([2001:610:612:0:9ddb:a7e3:ceac:a8d6])
	by mx.google.com with ESMTPSA id s4sm42167981wik.23.2014.08.19.03.41.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Aug 2014 03:41:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1408376104.1669.33.camel@ted>
Date: Tue, 19 Aug 2014 12:41:15 +0200
Message-Id: <22E8A6CB-313F-4713-B76F-FE090570EB15@dominion.thruhere.net>
References: <1408366010.1669.11.camel@ted> <20140818131443.GL3660@jama>
	<1408372750.1669.30.camel@ted> <1408376104.1669.33.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Allarch and packagegroup improvement proposal
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
X-List-Received-Date: Tue, 19 Aug 2014 10:41:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 aug. 2014, om 17:35 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Mon, 2014-08-18 at 15:39 +0100, Richard Purdie wrote:
>> On Mon, 2014-08-18 at 15:14 +0200, Martin Jansa wrote:
>>> Well then maybe that allarch package with perl dependency shouldn't =
be
>>> marked as allarch.
>>=20
>> Take a step back and think about this from the end user system
>> perspective. The packages are all identical for each architecture,
>> "perl" doesn't change name.=20
>>=20
>> To me that means the correct end result is such a package should be
>> "allarch" in the package feeds.
>>=20
>> The question then becomes, how do we generate such things in a sane =
way.
>>=20
>>> I'm in favor of removing default allarch and setting correct
>>> PACKAGE_ARCH manually in the packagegroup recipes like we do =
elsewhere.
>>>=20
>>> packagegroups are small and "rebuilt" quickly, so I don't mind
>>> "building" them once per TUNE_PKGARCH or even once per MACHINE_ARCH =
like
>>> we do for couple of them already.
>>>=20
>>> I can even find few changes from me on ML which do exactly that.
>>=20
>> It does seem a bit of a cop out to do this on the grounds that its
>> small/fast :/.
>>=20
>> I agree there is good reason why some should be PKGARCH but we can
>> probably do better than just marking them all that way IMO. I think =
we
>> should try and mark them correctly too, i.e. think about whether the
>> packages really are identical and/or make sense as allarch and try =
and
>> avoid duplication if so.
>=20
> I also have one other idea. We could adjust debian.bbclass so that it
> adds an RPROVIDES for the original package name. We could then =
instruct
> packagegroups specifically not to adjust the naming for debian =
renaming.
>=20
> This would mean that the packagegroups would know the dependencies by
> their non-debian, unversioned name.
>=20
> Would that work for people?
>=20
> I'm torn on the idea right now but thought I'd share it.

What happens in the following situation:

foo.bb generates foo.ipk (/usr/bin/foo) and libfoo5.ipk =
(/usr/lib/libfoo.so.5), will libfoo5 RPROVIDE 'foo', 'libfoo' or =
something else?

regards,

Koen


