Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPd83-0008Ja-7z
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 20:18:49 +0200
Received: by mail-ee0-f46.google.com with SMTP id d49so2059597eek.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 11:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WQtNXvBs6hq0bRzxWSMB3dgEABUiXt8iwFT2zxEv1vs=;
	b=LRuv7n0OD9dtxGwoYgSUBJ0ZJgltih+GZaBYle7PWv6rAp3TY2faQxOXUrNdD5uGE7
	iK9rg24NiJoEAZGa0DYtl6j/zEJW8aYokiW8yzkWUWloMRijFGzY/VxmxLU0xcqsEA2D
	tu3K1Imwfax4SFcLBNQyXDR4YFL8rGy5Bgw/gVnbfBhOuVY/kdqJMGPx8I2/gU8LIVeX
	fmFRCL13tqyooJAfr7n2dCun0il583XzJGP9foqmhRj92fBNDAescaT1h/4W30+WhMkz
	qQoIZWYVA1oVm8Cd5UFxTUrd5JlU03qBy2GBikXEjyrJadLwiZsxlHBGo8ouaIbxq6HC
	0GCg==
X-Received: by 10.14.210.132 with SMTP id u4mr51402722eeo.19.1365530486815;
	Tue, 09 Apr 2013 11:01:26 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a41sm5150706eei.4.2013.04.09.11.01.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 11:01:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130409174646.GD2474@jama>
Date: Tue, 9 Apr 2013 20:01:21 +0200
Message-Id: <C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQmZFC27Z3R4McVozn0514GPZqTevEuvNLNsm6Pc8fbtlXtjAn50pYBpmJHaZUBG7DbIIYQ/
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 18:18:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2013, om 19:46 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Tue, Apr 09, 2013 at 03:26:58PM +0100, Burton, Ross wrote:
>> On 9 April 2013 15:21, Marco Cavallini <koansoftware@gmail.com> =
wrote:
>>> * Recipe taken from oe-classic
>>> * Required by xinput-calibrator
>>=20
>> oe-core already ships not one but two terminal emulators, let's not
>> add another one.  Can we make this configurable in the recipe somehow
>> and default to use matchbox-terminal (which is in the Sato images)?
>>=20
>> Long-term, alternatives along the lines of Debian's
>> x-terminal-emulator is probably something we want.  Then again I'm
>> still not entirely sure why this is even spawning a terminal in the
>> first place.
>=20
> u-a is not enough, we also need VIRTUAL-RUNTIME-x-terminal-emulator =
for
> other recipes to RDEPENDS/RSUGGESTS/RRECOMMENDS on if they need some
> terminal (and don't care which one will be used).

Isn't this what xdg-utils are for?




