Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 033D1600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 07:15:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so3098852wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 23:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JhrytpjV2zbzaqSEVhgdS2D+fmVDIZUDK/16o4coIUE=;
	b=D0j4myxxAgdGohlDn3nsICXCP4vnUWC1+RyGTCuclIwXmxia2VC866jFepdyhI89aD
	/cS2j2gAY7mgeaY/HUJxbhb35Wf/MYp3cnOMFpk3Vh27by8duCBoMnhuIpKXjBLvBHM/
	/Brgyo3S4UeCAZxmGWEqO2IJ9d7LuddWv99BE0lefNoV0tub4qJv2fu741qSs+3LtPwG
	SlkaGnuYVkopJMbg1CSh9MOWJcdzo3SkhGlkT4lx317SGFTCrGcMQ1lBG+ZEwafB7t8u
	30fsFlhOmo+wUqAO0Lc4np6+t2BqMnt/15gf6I75y4INgLjSIByvcNohbpOk1vyOcMU3
	xxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JhrytpjV2zbzaqSEVhgdS2D+fmVDIZUDK/16o4coIUE=;
	b=aselCky5PD+WRw2fCSop7xHoPTPktVu6lYET7q6VzZEYDHqAr9GRUveSeAYQinlfFg
	L1JRiPE0cQfxU3vgtmMuuPt0A/9lV0+8aVLT/a+K3a8/s+Xyw4ZuU/Lnal2Jf1rRhN+m
	Iy2CBVM/LoeDB/rnnIwE3uOEb8IqBqZOd/UM+QnXHHfAUudhzGm0YuOGeJTSacYRxpk7
	OJbilfUAM40i9ztOg0ioGBTtbzBGvsdm4UqM+SYAJS6A4wyy2b+2H/C6WAaMq9mI/ZZy
	rpAcYKiysXTojgc9Ykz4EuI1JUHEIl9A8MFeVtfNf7dtqUHWjsxeRMupPMoYDgV2OmG/
	leOw==
X-Gm-Message-State: AKaTC01X3UAkUEQYf+kS5+h4uk2W5daGnFsuMVa7YzDmMG5FjfeLU3jdGzXCJKDzdjJc/Q==
X-Received: by 10.28.21.21 with SMTP id 21mr8079684wmv.132.1479453307774;
	Thu, 17 Nov 2016 23:15:07 -0800 (PST)
Received: from [172.20.0.13] (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id
	r138sm1782155wme.9.2016.11.17.23.15.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 23:15:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
Date: Fri, 18 Nov 2016 08:15:06 +0100
Message-Id: <AA4AB54F-B782-4CFC-9E77-512EAFE73399@dominion.thruhere.net>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Enabling uninative by default in oe-core?
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
X-List-Received-Date: Fri, 18 Nov 2016 07:15:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 17 nov. 2016, om 18:31 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
> Hi,
>=20
> Background: uninative is a class that downloads a precompiled host =
glibc=20

Why can=E2=80=99t OE build it on-demand? What=E2=80=99s next, requiring =
prebuilt toolchains?

regards,

Koen=

