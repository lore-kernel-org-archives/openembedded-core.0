Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13C6B78866
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 16:42:30 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id e74so18314223ote.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UXWkaF5qh2/wfue9W/cTPGmJeAxaybSk/pTMHZGcHKs=;
	b=HomY9d4VcjJRR/7WiWN8UOHE8CPl+KTwWf6dpI/gEaH6I8KjxYf5JeBWOJD/wCCrO0
	/10F+a9OK9/OS7SoBBTPXHIWa3OXzBHmuvWbKzBsC7bqjg4ujdZT5OsXVUoPVdbiFyoL
	wa0oJteFcq+vBEZhu2vAbEImIbFbmyo4hKWzXPUDI1h3sFxj2zLI1cy9K0OWMZhoiTWH
	ratpKNpmjHDmDwq3HgMi1m3ZWrCrQ3aHo4ZseU4jiORK5XVFWDqiJgsg/Jq2++VOwj5X
	o2p5DekULWV/YGzYU1jD7S1FVQYMHI216XKN3PHK5GVqpy34rUl6Z/L3hvXgpAxNW5c+
	feHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UXWkaF5qh2/wfue9W/cTPGmJeAxaybSk/pTMHZGcHKs=;
	b=LDFe+kyBKUpTVj7HhU+I2J4mkB4HZjVE3CBS2gFSJgvjUj8BfCzQBo6yGvgEJWn+TP
	YOQbYfEMYc/qdU7/Xdxww35+zJ+eKAARC06ZR4QyDm17WV2K/6EzRTn2Zz2HWAYF3ZpM
	e8jTVPSaFVjuLVfDdyEw4JvHStBuACirLfLu2LIUHf6nn48voEdK9Nu9NzCY5Zw+Nv92
	jy+azICnSevEr1y+O9auXBh4HW6BVrZWFJfbhSiMiaxfjhxkYyifZ8xmspgVntctUkAE
	FzFWlNqb2JefMubzRBVhn/Mk1CB4bQcnkUZRMojzPsuewYQTkZd+tBicwEe2R7cuE1HX
	OX/g==
X-Gm-Message-State: AKGB3mIp88bkiqIQaL4jfWjs84Nnq2eUlBoynQ0iAzlvInHUSjIWGtTO
	E2X88iUfYwTd/KRUMf5BybonXQkP
X-Google-Smtp-Source: ACJfBouKvDOgHDU4MKZHScVqVLhMhU33tc+y4SSl9KWvivtSHJfR3VaBdT+gKugjIy3hZ6eUEiy7KQ==
X-Received: by 10.157.41.10 with SMTP id d10mr4327357otb.284.1513096951716;
	Tue, 12 Dec 2017 08:42:31 -0800 (PST)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com.
	[74.125.82.175]) by smtp.gmail.com with ESMTPSA id
	d68sm7835958oic.57.2017.12.12.08.42.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 08:42:30 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f175.google.com with SMTP id d5so18305275oti.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:42:30 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr3676480oth.370.1513096950206;
	Tue, 12 Dec 2017 08:42:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 12 Dec 2017 08:42:29 -0800 (PST)
In-Reply-To: <CA+_AqivtiNwbdU8mjYpEj_PiccuuJroxJXbyOgb_xoRaa7SBKQ@mail.gmail.com>
References: <20171206220037.32335-1-limon.anibal@gmail.com>
	<CAJTo0LYYn+FvwjH-DJc2GCraLRV=9uC3YX7WNXF82ZeFJtLrZw@mail.gmail.com>
	<CAP9ODKossF0X1FUyxk5HY4z_dSSpo47rkWUDRP2CzeE45k6eig@mail.gmail.com>
	<CA+_AqivtiNwbdU8mjYpEj_PiccuuJroxJXbyOgb_xoRaa7SBKQ@mail.gmail.com>
Date: Tue, 12 Dec 2017 14:42:29 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrSdCEbcCpqpvpV7yKxyA6VWNob9oCz5xFUZC7_PXsVGw@mail.gmail.com>
Message-ID: <CAP9ODKrSdCEbcCpqpvpV7yKxyA6VWNob9oCz5xFUZC7_PXsVGw@mail.gmail.com>
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Dec 2017 16:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 1:51 PM, Anibal Limon <anibal.limon@linaro.org> wro=
te:
>
>
> On 12 December 2017 at 06:50, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Tue, Dec 12, 2017 at 10:23 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 6 December 2017 at 22:00, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmai=
l.com>
>> > wrote:
>> >>
>> >> +SRC_URI =3D
>> >> "https://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.xz"
>> >
>> >
>> > ERROR: lib32-gst-validate-1.12.3-r0 do_fetch: Fetcher failure for URL:
>> >
>> > 'https://gstreamer.freedesktop.org/src/lib32-gst-validate/lib32-gst-va=
lidate-1.12.3.tar.xz'.
>> > Unable to fetch URL from any source.
>> >
>> > You need to use BPN not PN, but use ${BP} instead of of BPN-PV.
>>
>> Also, it should rdepends on git and git-annex no?
>
>
>
> Yes, i can add the git dependency but git-annex depends on haskell that w=
e
> don't have a recipe to build.
>
> You can copy/populate the gst-integration-testsuites from other source or
> create/use other test suites.

Would be possible to populate a package? so we'd depend on git-annex
on host for it?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

