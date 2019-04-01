Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 71DC57D13C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 19:34:46 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j132so8363566oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WFr2N6dPkqPxVpFKk0Cry3RppEeqmg1ikQ+FLbeLOsw=;
	b=mGNUM+WLAaI8BltiY6WlWxFgTcpsJVSjtCFURJ0s+ZK86o+W5Ts0cNFmuZQkln25qd
	4Pmu7MgoYedKgsaHwWqz8KCxA73HiO4oMXJQk8mkO0rxev5NkTe/agpaNQ7paC+5oLmD
	FeLfcBDlyqIitdTftks/sQQptwQuIX5VDiWswf5Mym+BQi3FraMPfA2s/bM5OsAL3xNC
	0YAu/Pkogt9ejxfcOZWJPD3nNRlbbQR49MiAWC8a9oIQP+Ar+8HkWz0ADFXCUR0zhBYl
	mygjOX79MpS09ssm0BEz8aBROcXTEo70whQnuAw1wREoolD/M2xVGQjvOF7cqzigxJcD
	coMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WFr2N6dPkqPxVpFKk0Cry3RppEeqmg1ikQ+FLbeLOsw=;
	b=sOMmFESKh//Q1Rf+/HGocwRTvITx52LmZ0SL84POtagt4nMA250/cEABSkkMY1MS/i
	Cf4W9jBhfVtjY8lMmakE3LNnGRWYsogoFLZyc4FGOubZ3QLNjLZzcO52shopH2lQAKYN
	hjKBAcXL0PlDWXzPKphEJJmpp1mqrOz8v+OL/V4pMlKd0M7mPnYPglkvHwkFy3SPYbVd
	y03Zd5ukaqI8lOoWVNHJyHfe2j6rO9RQZwW+woRMoYLcbFsedC1yAsU7RqFlTdQTEaoB
	QZ1TMnzXvPgTKS35W/hos5ZBtdx24Ik035GbwZpqt9P5GaZ0uLALlnl24T3JEItnHDAi
	gUrw==
X-Gm-Message-State: APjAAAUc6teevHTprGDyWv3XiXILu7Jqnpd/ycm/JoXvq07qCfnZXsm1
	76IEkoFLk3j+sFQvEuAeMEDP2Nn15HEmypubrbA=
X-Google-Smtp-Source: APXvYqy+ontIdzkSZKHYY3MMYlswR7cACz7Tx3BW3oSYRHICw16xHHl5IqkOEhXi4FsdCY4LI7uqf7gsQpcTX4RvXEg=
X-Received: by 2002:aca:5809:: with SMTP id m9mr14441878oib.88.1554147287544; 
	Mon, 01 Apr 2019 12:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CALbNGRTccK1a5QuZppiAOR1kG5mgMFzSYYg4+uHANRx3o3kCNA@mail.gmail.com>
	<CANNYZj_=Xwi4P88jqwPbR3xOom-LQkutRY=Vs11UcCpU=WTNtg@mail.gmail.com>
	<CALbNGRSOVaZWcMAVWn5RenYU40Cujvp1E_Jup7nqGW4kbHk-JA@mail.gmail.com>
In-Reply-To: <CALbNGRSOVaZWcMAVWn5RenYU40Cujvp1E_Jup7nqGW4kbHk-JA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 21:34:35 +0200
Message-ID: <CANNYZj-CwkZz0Z=fuE7BBCf-7mDbEd2T+VRR0hO98isGSn97=Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 19:34:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2019 at 21:26, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
> What about musl? Am not sure that my information is still valid:
> Broken qemu or not?

musl is fine with qemu.

Alex

