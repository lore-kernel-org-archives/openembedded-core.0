Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 916A2610D6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2013 07:44:06 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a1so3329117wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 23:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=c4fPNk3+FlVJZkhcVLy/6/AnU15BC6Qa+W+GoeQ4pFc=;
	b=lbFk9GRuPzmrXlzGMq9+YlXSdRj7AS84FcD5oH4bMWnrXJZ7w2g3sXRG6RRkhbnu6g
	WHRJb1/FL6Kx9j03YpiQ2IspUU+tB7A7gtOsSXHoJB1SA9V2M57zF7Nuj91IcrNkP1YQ
	I8mC7YXJ3PzmU8TobnH8L/bWnl7bphXlbjaGuMikl5lfBXrDKx4q+z6BIDh5gWxNPrUq
	RC5sITHn2T+F0aR0PrzM0Q314ASdLyeaOnO+GCIKpSUd7J1n9vd1rByiFW58eRNJ2oiP
	I3ZOQO/Oa73SlmrnqVQ0seK1eqbWXnrv2g1t4X0clMRDURh4Lz6UmrvwOqZ99MHzzInQ
	znMA==
X-Gm-Message-State: ALoCoQlBb+asgNEF38KdRG4AW3J4YIbv3u2IF0k7B59YwnPxRTxYZQq+DNTdpn1Xg1U4/Y0KIt+G
X-Received: by 10.194.161.233 with SMTP id xv9mr1106373wjb.79.1387611846938;
	Fri, 20 Dec 2013 23:44:06 -0800 (PST)
Received: from ?IPv6:2001:610:612::3404:7674:101a:5451?
	([2001:610:612:0:3404:7674:101a:5451])
	by mx.google.com with ESMTPSA id wy5sm4298174wjc.8.2013.12.20.23.44.05
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Dec 2013 23:44:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1387129060.8783.1.camel@ted>
Date: Sat, 21 Dec 2013 08:44:05 +0100
Message-Id: <3526BB5E-16DC-46BD-B4F7-098D1EC141AA@dominion.thruhere.net>
References: <1386775933-14232-1-git-send-email-koen.kooi@linaro.org>
	<1387129060.8783.1.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] grub: add git version
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
X-List-Received-Date: Sat, 21 Dec 2013 07:44:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 dec. 2013, om 18:37 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2013-12-11 at 16:32 +0100, Koen Kooi wrote:
>> Recently grub git gained support for ARM builds (using u-boot or EFI =
as first stage loader) and with 2 extra patches we get support for =
64-bit ARM as well.
>>=20
>> Buildtested for genericarmv7a, genericarmv8 and qemux86. The =
genericarmv8 build fails in do_package/strip due to a binutils problem.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>=20
> No objection but should this have a DEFAULT_PREFERENCE =3D "-1" at =
least
> for the x86 cases since we try and stick to releases where we can...

I have that change locally and a fix for $S vs $B. It looks like a new =
grub release will happen during the holidays, so I'm going to hold off =
on this patch will January :)

regards,

Koen=

