Return-Path: <alibey@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB0E71B04
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Sep 2017 10:24:31 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id r141so11117640qke.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Sep 2017 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GesZ23ksXY+iP7DuoPRCIClVDsBDObs1ZcrTx6N0rSs=;
	b=F8YCotE5cd5jb8knJHdc5aUXkaFpu83Q1unfaBg+NENbBvSYsfC1/Dvi7wNkNZTtY0
	OLQBmSKVszjjhl7Bo0M7mLyjoK6BzaKgQs9nRD7RhLJp/WOMNb9L5Ul4fxW5jn1hLKX6
	sBNWt0gv1hDOi8qxN6biZn6jYFHyOmPW6UJR/jRbDNm6RXs9NVz5WEe3ULsEUgHrdzVD
	3cxdy/G9nh/hQJ38h/84sU0+0ks9TFjiXMMmG4U2H4oYxBkvn9UxIDNM9VdbeLSmjO7X
	N6qarNc/C31PrcPpDnTziwKE24TFYZXOUsZdhfxG7F8l8fUPyvGie2slhjXap68ZSzHZ
	ogMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GesZ23ksXY+iP7DuoPRCIClVDsBDObs1ZcrTx6N0rSs=;
	b=JHzIgDqUfg0jxzgrNjhev5uGsv+QKHTk8Pakl8PzJ2zw8rdzNFVR9ezuIOj2IzTCK2
	EzjczRhbhIzYXn8SPaZiDGB/Yh25/r0NGV4JhPt9B4pAw1q5gFecL7h2xvQmxX3lT3qN
	li1HA9Jnf0rvL0n8flsi2X7N8++uFOE8XamZyebzIkjQFUoAUx2ecwIux/1rm7IhNwDs
	14JPW3GD+PPSzqEe3VupnHAxDEBReyyQ5N3WGJUYcTt82XHpAIm56xGdX4dDvmjoUPwG
	F2ldvctyoH8fP9luECpSznW6mo2ILXSJT2uAZZkRzpyc+6xs0tJCiOHkfXZfbZ3I4fmv
	zi+A==
X-Gm-Message-State: AHPjjUjC2x+052g2NZTshxPtqlmvjjbI/ycbWV63+TMJA/QN0VHe8lGq
	xr1p1CqLKqTRx/aGbNZM7cUpof+pOpVR
X-Google-Smtp-Source: ADKCNb5jJVY6GsjFnH6Wv95dmog737wX97uX5byCxdtlo4lqovft+oHtXWxTTwkoDnEts6Ru+ufiS4pFehrDdZNCuIs=
X-Received: by 10.233.221.3 with SMTP id r3mr7319712qkf.219.1504952672452;
	Sat, 09 Sep 2017 03:24:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.171.131 with HTTP; Sat, 9 Sep 2017 03:24:32 -0700 (PDT)
From: =?UTF-8?Q?Almir_Alibegovi=C4=87?= <alibey@gmail.com>
Date: Sat, 9 Sep 2017 12:24:32 +0200
Message-ID: <CAG5rOOGB0bP1CUUgE=srNS+mA5CUyV069T6iCeXwoZSydGQ9ZA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: New USB ID to kernel
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
X-List-Received-Date: Sat, 09 Sep 2017 10:24:31 -0000
Content-Type: multipart/alternative; boundary="f40304360c687218200558bf1935"

--f40304360c687218200558bf1935
Content-Type: text/plain; charset="UTF-8"

Hi there,

is it possible to add TP-LINK TL-WN722N v 2.0 stick (root@vuzero:~# lsusb
Bus 001 Device 002: ID 2357:010c) to linux driver and how. Vuplus zero box.

I'm trying to install the ipk, but cannot get it working because system
doesn't want to override the driver already included in linux kernel.

Is there solution for this?

Kind regards,

--f40304360c687218200558bf1935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi there,=C2=A0</span><di=
v style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">is i=
t possible to add=C2=A0TP-LINK TL-WN722N v 2.0 stick (root@vuzero:~# lsusb =
Bus 001 Device 002: ID 2357:010c) to linux driver and how. Vuplus zero box.=
</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.=
8px">I&#39;m trying to install the ipk, but cannot get it working because s=
ystem doesn&#39;t want to override the driver already included in linux ker=
nel.</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size=
:12.8px">Is there solution for this?</div><div style=3D"font-size:12.8px"><=
br></div><div style=3D"font-size:12.8px">Kind regards,</div></div>

--f40304360c687218200558bf1935--
