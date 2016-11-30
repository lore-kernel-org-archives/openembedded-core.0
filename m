Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7F386014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:47:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 144so10717412pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=a5nVUR7kvtHI1MxXf2OCh2VLVygqn3hb8IJpd9qQSnA=;
	b=GMNH76PewkiEN964skjA34MbD4RRM6X8Qa7Y6WmX0ALz7513lkjHeWb8h3/yMGVecc
	/0VdaKXWc9ZqUvL058edtuKQMnbisYLxU7SqaJUX1q8xUiM9rdNPixFnd3MFnmkOvgIZ
	K1MyJFMTaIyng31XLvB+yfOl7dCPFXtYPwPgxz22P+vjiAZkgT+uJG696FefCl+KmNwm
	0dPDETZIqz+Rlx0X8im1LQ8SNUDKsAfYtkNTwGgn/8o7BeqRPaNTqzc77fBNEL/Sf/6j
	beVCsBa1K794+Et84Mr6OizQU6yAPTfLrOzkbQrSzm0ioSYyZiBjMy4UuqpFi2lvAuAe
	VkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=a5nVUR7kvtHI1MxXf2OCh2VLVygqn3hb8IJpd9qQSnA=;
	b=BgJGZNBfnSECB+3hXSfU/K1dI2NCc0SEo4n1L35Zlt50V0Rvx5Pclt+4BxlsAHCkNZ
	xmSyhJ/lOLHQdEujAX5dW9raPEzxZWRm8j1tzT6S4uDXd3fFR0gAhhzeMxT0sQnqN8n5
	Yqmvm2AXILwp/1gohKJREWORppX8dmF+LtJjwYykAzYi6bsqTYP8mzIpfa65hhLmUWnm
	y79I9UNypudLSZptOuWHxttw8Fcth8oqKbeazDxwUl2kewfM7yKgSffTx1XsIZA0te6z
	LF8wyrcWuHM9HQYwpm0+VnSwaJemQqZ9slZ61sG+gy5ug/5WNS2B76bY45WV22wgcDFI
	hHVA==
X-Gm-Message-State: AKaTC010EYrQUuX9BoquV8skgP3OSm76uAkj6jC1W/WlhgNxOB2cfSfxNeonpT74nUex/g==
X-Received: by 10.98.105.68 with SMTP id e65mr35736234pfc.10.1480542423189;
	Wed, 30 Nov 2016 13:47:03 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r74sm105043543pfl.79.2016.11.30.13.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 13:47:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
Date: Wed, 30 Nov 2016 13:47:00 -0800
Message-Id: <8FBFB538-09E4-4681-9DB2-CBB870B9DC6F@gmail.com>
References: <20161130073953.18166-1-raj.khem@gmail.com>
	<CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3251)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Upgrade to 1.10.1
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
X-List-Received-Date: Wed, 30 Nov 2016 21:47:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 30, 2016, at 7:17 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Breaks if built from a empty sysroot with wayland enabled:
>=20
> gst-plugins-bad:
> | make[3]: *** No rule to make target 'viewporter-protocol.c', needed =
by 'all'.  Stop.
>=20

I am not able to reproduce it however I have added a dep on =
wayland-protocols=20

> Also rtsp-server gains various runtime dependencies on util-linux, can =
you verify that these are expected and in the depends?

I did a clean build of util-linux and then rtsp-server it reported no =
missing build time deps=20
I am doing it for raspberrypi, how do you reproduce it.

>=20
> Ross


