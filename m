Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2FC6A613
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:07:31 +0000 (UTC)
Received: by mail-bk0-f45.google.com with SMTP id je9so3015541bkc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1pjRj/uk/CmY5J6FQTpS89z/kUlPsB9sEAoQvQ4ZYNo=;
	b=Gk4QC63FYqNAMXezSwg3eNXpwoS2lEWkq6OQHFlITMJ9jLLN3+ESLpuUyzyNyDNRJf
	rDnN1R12n3P6bI8258tegdWe08GN+JOrlLB+xIHoMK/jpd0vPjCevowSC2DGLUg+/rrd
	OYgBnakihao2tSGf1vW1jnavTgPnBuznmMkptBzAKCtXtKIO0nMG1udmKgIthL7x41+O
	8oJmXYfiT7u074CUomkLNZ4kyvR9884sHcCIQgu6KKk6uL2033RMRuis4xSlvF7VhhfB
	RAq8ni5xvoCCpJSMGlvX2EakZQ3LD/Go4EWJsXKi75X4qIYVXadB8E+G98ArotaZ3REH
	B6Yg==
X-Received: by 10.204.225.12 with SMTP id iq12mr3053919bkb.37.1371042451031;
	Wed, 12 Jun 2013 06:07:31 -0700 (PDT)
Received: from [172.20.0.132] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id i15sm7658126bkz.12.2013.06.12.06.07.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 06:07:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGDS+nkMujRn-M+Oja==L+kMynx0-P0WxZWeVaSsAHJGGWPUUA@mail.gmail.com>
Date: Wed, 12 Jun 2013 15:07:27 +0200
Message-Id: <51FB023E-F4EC-42A6-8230-D40DDD2542AE@dominion.thruhere.net>
References: <CAGDS+nkMujRn-M+Oja==L+kMynx0-P0WxZWeVaSsAHJGGWPUUA@mail.gmail.com>
To: Steve Sakoman <sakoman@gmail.com>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQmOaTUtRUQVhf9zMs3h+hlPB/F7hO7W3x55F0Z/3lNHsqobwPNZpyCZW3Iikgo+bnWULEaG
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Possible to fetch from private github repo?
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
X-List-Received-Date: Wed, 12 Jun 2013 13:07:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jun. 2013, om 15:04 heeft Steve Sakoman <sakoman@gmail.com> het =
volgende geschreven:

> I have a client that keeps their app source code in a private github =
repository.
>=20
> I haven't managed to find a way to convince the git fetcher to grab
> the source code.
>=20
> Has anyone else managed to write a recipe that uses a github private =
repository?

Yes: =
https://github.com/CircuitCo/meta-circuitco/blob/master/recipes-tester/bea=
gleboneblack/bbbtester_git.bb

You need to have your ssh keys in order before trying that, though.

regards,

Koen=

