Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id D3B0C6CB44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 09:13:19 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id ez12so2838665wid.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 02:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Hm5hybuLDXTmQpnOvjAMllLCbFLK9waivAc94N+wkn0=;
	b=WSc7NtoqX7KctDfS4ViifSNZ/ycOgxQasi1Vw91Gy+NUUu4H2r7mZTtb1VMrhHbSTB
	Pr0uh9bQdQvaYv4/mCoNTaZrbiChJir/J2pZno7xWe+kvzi/4rcYYDjXqMHu3dqVEGyn
	gPQQxB/HCDPBJ2igdq51v6ZH8ydu305MoZqy3dpnDg8jyp54OqeJ6Bd+qLYZZ5LfXrYM
	Bo1TIPKamxvstsuD1rsmvrYVuDdovaBJBtcfA7bSBbk2j54RpvmNFQj7PDjDK3004WkD
	OYia1vu3eKtV5OfQ+aH/Sv+un6PmkqZHhJ/sEIHxoFAVRHq6/gsPINW5izsX53JsL46h
	9nUw==
X-Gm-Message-State: ALoCoQle9QnHmWZNtXvEW5JJijP6biKakT9CFHr7vC+8pO5monzyrblvbDkZ/ppMOah0soMl5w7i
X-Received: by 10.180.75.232 with SMTP id f8mr1418170wiw.26.1381914801106;
	Wed, 16 Oct 2013 02:13:21 -0700 (PDT)
Received: from ?IPv6:2001:610:612::403c:b6ec:4247:e13f?
	([2001:610:612:0:403c:b6ec:4247:e13f])
	by mx.google.com with ESMTPSA id ev4sm3900209wib.7.2013.10.16.02.13.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 02:13:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <525E57FA.6000200@windriver.com>
Date: Wed, 16 Oct 2013 11:13:19 +0200
Message-Id: <727B405E-7E1D-4F53-8CC8-FE4F8B93D31E@dominion.thruhere.net>
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
	<E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
	<525DE1D4.40109@windriver.com>
	<EF2228FC-1E37-435B-A76A-426E585A2E0E@dominion.thruhere.net>
	<525E57FA.6000200@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Wed, 16 Oct 2013 09:13:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 okt. 2013, om 11:10 heeft Rongqing Li <rongqing.li@windriver.com> =
het volgende geschreven:

>=20
>=20
> On 10/16/2013 04:54 PM, Koen Kooi wrote:
>>>> ConditionKernelCommandLine!=3Droot=3D/dev/nfs
>>>> >>
>>> >
>>> >What is your meaning?
>> That's you are creating a huge script that does something built into =
systemd.
>>=20
>=20
>=20
> Yes, I can not find a way to avoid to that,
>=20
> Do you have any advice?

Yes, as I said a few mails earlier: =
ConditionKernelCommandLine!=3Droot=3D/dev/nfs=

