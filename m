Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 39E2E6002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:06:06 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id l18so3542742wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 06:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=C1RaLqww8WeuIXi9PUie+jRbc8COvL5L+arETBgl+1Y=;
	b=bRWCOCiLkvbkKO31XTGIdsecOCJjR6/wAwsMB9dFUGNlJ7Wd2+CclnFFg/lgss03P3
	P2fKw6uGEIrXI+okfJ7Djyol9Hi11D1KFyhgXMgbXBBPEGs7+G7weJgP2KTch7qTXEjD
	QclRR3QnaxdVxsjULdVL2NyUloGrS+8khkePXknxkS5k+w7QEo2cTYuPhvtCP1gWJtQN
	A3n/7T1Rr35Rn08n+bk5GIsLs1g9hQWKZKTIwGE+WkRsYi9IUuv6Ia4BvOBYE0QHol83
	pSer+ntYNjwKq8SCI/DO0zdbnETLJR4++PIUU+fPyztI9FUnTcRbjuvYKOqVapvcc7KP
	AFgQ==
X-Gm-Message-State: ALoCoQkT2WxEjzhikpdZl7oxH6VBA+Hr1EetwhCkaLT9yuSfpVxmL5nnXEtdbdjScYn1XFxwkNDq
X-Received: by 10.180.13.33 with SMTP id e1mr19887156wic.38.1391004366705;
	Wed, 29 Jan 2014 06:06:06 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id bm8sm5130559wjc.12.2014.01.29.06.06.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 06:06:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAOMwXhP4y9MrxWDQzw8D9ukvoXSL1EBD0on3byix4cKu3-RdEQ@mail.gmail.com>
Date: Wed, 29 Jan 2014 15:06:05 +0100
Message-Id: <88EC4A0C-7B54-4385-845A-480394EEC20C@dominion.thruhere.net>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999042.19023.160.camel@phil-desktop.brightsign>
	<CAOMwXhP4y9MrxWDQzw8D9ukvoXSL1EBD0on3byix4cKu3-RdEQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Mailer: Apple Mail (2.1827)
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 14:06:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jan. 2014, om 13:39 heeft Laszlo Papp <lpapp@kde.org> het volgende =
geschreven:

> On Wed, Jan 29, 2014 at 12:37 PM, Phil Blundell <pb@pbcl.net> wrote:
>> On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>>> Is there any obstacle why this cannot be /root as per default Unix
>>> philosophy [1]?
>>=20
>> No.  This is distro policy and you (or your DISTRO) can set it to
>> anything you like.
>=20
> The email is not about distributions, but the default value in Yocto
> (the distribution generator itself) ...

You mean OE, right? Yocto is 10^-something, the Yocto *Project* is an =
umbrella project contain lots of things, among which is OE, which can =
build a distro for you.=

