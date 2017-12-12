Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB8417198F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 12:50:29 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id y10so17654820otg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=04ghePNQGw9egE8hHe3xd25oo76Xg1Gn/dp4YvUMafs=;
	b=lgkXi9v5x3uEhwYzBswUERAkZfnvQW3Uah4I4cX4LJmfi8axw5eJkoYCHC2T/doJnR
	KGNTfuJhHqAouWHh5UVljydhMM3hcQwumiV05MRsMwCF0SBEBmWyOKW6kv/kNp7DWNhU
	UM73ofjsTrU2t2fHQDGIYbEtKflmKE5AVaPB2vC7JxhE09F3aZZupE2GwLC8tthJqbIQ
	TohoXdok7fjeIvlVdkL16/2fdB1DUQGbHHyzOpe/DDGGJYOH31puRyDagMy37qZzVCYl
	0DPrNWJ8h3JfotXO5s7jE8y7hPfYRbiVmXeyDGbB/09uE/vTW3gFW8ux9GuQHMmTDxMN
	ZCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=04ghePNQGw9egE8hHe3xd25oo76Xg1Gn/dp4YvUMafs=;
	b=Cr/FJhVgKQkrWbEkbUCJgg6JvA582cKhCxsk1Ivf7/2HC/J9NRP33T+cxxZi0452qs
	XBZspAX/MCJo7X0RJN/AGTk7d8w3pUlD45mkIfEWccm6/gBzD1PpZnVk65xAkQv1cnwl
	sfQdLNLd2xFhbKGaNAl+3uJ6LXy1XKM2TULfQxz7PkaamtFV5ane3vJRH5AeVzalznpG
	6GZAng5dxAqz4Qru1+PhEwHp2osB4u+/+3aCAqZeZKKktGGBLqtAM97sZ8ENc32CrIkV
	px2tUhEK4WeEhX9fw6L31hxCmF6+Yiz5VXn6ba+A40fQ2IH5PISCbnDlTQIHGGmK83x1
	L1rA==
X-Gm-Message-State: AKGB3mJ1bc4v+27jB5kmK4OTbTYVOTPvte6ksGHyi0+nspPSBdSgL3q6
	VNsYaphcsyAF90KFqHuOeVJtsn7f
X-Google-Smtp-Source: ACJfBouTh7ROAfY61FJzjzP0gaQwnGesRhkc4XbdGv0oX2rSv8CY5C8//NB2YUg8tPHWW9UTUA9eqQ==
X-Received: by 10.157.39.230 with SMTP id c93mr3312587otb.176.1513083030385;
	Tue, 12 Dec 2017 04:50:30 -0800 (PST)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com.
	[74.125.82.177])
	by smtp.gmail.com with ESMTPSA id 68sm7652296oik.1.2017.12.12.04.50.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 04:50:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f177.google.com with SMTP id d5so17653956oti.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 04:50:29 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr2981830oth.370.1513083028686;
	Tue, 12 Dec 2017 04:50:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 12 Dec 2017 04:50:28 -0800 (PST)
In-Reply-To: <CAJTo0LYYn+FvwjH-DJc2GCraLRV=9uC3YX7WNXF82ZeFJtLrZw@mail.gmail.com>
References: <20171206220037.32335-1-limon.anibal@gmail.com>
	<CAJTo0LYYn+FvwjH-DJc2GCraLRV=9uC3YX7WNXF82ZeFJtLrZw@mail.gmail.com>
Date: Tue, 12 Dec 2017 10:50:28 -0200
X-Gmail-Original-Message-ID: <CAP9ODKossF0X1FUyxk5HY4z_dSSpo47rkWUDRP2CzeE45k6eig@mail.gmail.com>
Message-ID: <CAP9ODKossF0X1FUyxk5HY4z_dSSpo47rkWUDRP2CzeE45k6eig@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCHv2] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Tue, 12 Dec 2017 12:50:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 10:23 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> On 6 December 2017 at 22:00, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.c=
om> wrote:
>>
>> +SRC_URI =3D
>> "https://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.xz"
>
>
> ERROR: lib32-gst-validate-1.12.3-r0 do_fetch: Fetcher failure for URL:
> 'https://gstreamer.freedesktop.org/src/lib32-gst-validate/lib32-gst-valid=
ate-1.12.3.tar.xz'.
> Unable to fetch URL from any source.
>
> You need to use BPN not PN, but use ${BP} instead of of BPN-PV.

Also, it should rdepends on git and git-annex no?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

