Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE1D7CF96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 15:09:30 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f19so4311296eds.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fHD5yUcjyWT/Z8hHnKzOXBjN9cdE6W1noSHoP4ooDAs=;
	b=IhSECz++WVS1iK9V3Cok23TqpfdJxMSVoCkpzA3f72GNXw1cJe7IGCT5Iveii/aOCg
	Q1xjT8c4Xp+SMZcR6+uOMFkAXcan+vxKNwJSMmohxAHol19Jq9eegDabE7AyUgeFGuUv
	zO5zQhe2h9uRlIbV5hHErL9EN1T22ZVuSAxc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fHD5yUcjyWT/Z8hHnKzOXBjN9cdE6W1noSHoP4ooDAs=;
	b=jtroYyl6WIYkN3B4W1nO5V2sJ3XIUuWoV4sVDHqffLKp/yBrZNXWJKAeivkPM3wbjK
	Bmur1U1MW8nIi45LlFDrRdIWsJ20MhAb6vQ9SDq8Nq/dWjLUUg4OCRy95RbA9FMq92Bl
	nvydEXZ250GCT/6mMaBIA5b5m9XCGLKIJiv+UUQagM+sefzisJ2WRYTxg5yMXbgwk/mo
	mX5X5zeuTyQMbOwGhGtEO6tjFlH3HvVKqFyKHvsaVeuyoKCbdJlK3AOFGTtJbYyWUPpM
	EoqeZTVHFt2pu0WjtYEsMHXrGY/VF/9a/cDhHt/0FJVkDrQYQ3ESEkrCtDYkWxoJhwsl
	8h+A==
X-Gm-Message-State: APjAAAWjsEFlMamYQLC3wRB0uohwzU8l8yQizY15nUDCC53fluBYReE7
	bLQDktwahYoacYFe5Al0+gnhGNDkKXo=
X-Google-Smtp-Source: APXvYqz8/a5N322/mlRoJ9v36n/809go08J8yCQFc5ASUSs8w0N44mgZ4VOfzhQQZ/HO6cRosCfZoA==
X-Received: by 2002:a05:6402:54a:: with SMTP id
	i10mr2117065edx.275.1552316970968; 
	Mon, 11 Mar 2019 08:09:30 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-8115-A47B-CFB7-48B5-2047.dyn6.twc.com.
	[2606:a000:1401:8115:a47b:cfb7:48b5:2047])
	by smtp.gmail.com with ESMTPSA id
	g20sm3122456ejk.72.2019.03.11.08.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Mar 2019 08:09:29 -0700 (PDT)
Date: Mon, 11 Mar 2019 11:09:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190311150926.GY5026@bill-the-cat>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
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
X-List-Received-Date: Mon, 11 Mar 2019 15:09:30 -0000
X-Groupsio-MsgNum: 122190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uMNE0C2is0k/ADx7"
Content-Disposition: inline

--uMNE0C2is0k/ADx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:

> From: Jon Mason <jdmason@kudzu.us>
>=20
> Add new QEMU BSP for a Arm Cortex-A15 system and use this as qemuarm,
> moving the old armv5te Versatile PB based machine to qemuarmv5.
>=20
> The new machine uses the QEMU virt machine type, which should be
> faster to emulate and updates the qemuarm support to a modern
> architecture.
>=20
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Should we also not set UBOOT_MACHINE here to qemu_arm_defconfig for the
new machine?  We dropped versatilepb support back in 2015 however.
Thanks!

--=20
Tom

--uMNE0C2is0k/ADx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJchnomAAoJEIf59jXTHXZS2oIQAJ662N586VldSZpwO+vvWB0k
wailQ4S4wT38ZoJWcQNZ/+5sTf5Hc2iK6gsByKZox2KnpT5/ck5wI7ujq8vRQvFv
Ijlb1mDDHnihE2Nr5Wavuuy8+ffKrvxw0t3gUwz4D9JJTt0ka7pXpMSzA88MkjcP
G6n4MEOnnotGKmwb/76dNacvXREXWuWStdSCYxZz0DZQQ8xiHSvW29J2idsV3N3+
8crF5YmFfvzp5YLN1uuovN8We0BRZMe/YJbd8TPtW5Q/fkknr9XuGmVSUTsdHQU5
okWbA7qfwA7jkKq/ABrHHBGj7ppyVF3sFInQg0MmyBIoy2MB8oH2xUBmGEGVc/in
d9auBNacJSjWMWQiomWiQyev6D4fZYaf4Q6XLBGoajgV0dOgPgfC4yxeRF+/lflP
UqBzxvTA2g9xJb0ZsFDwAwd/Wd6DSDDq/+mlY1Y9OkpH/xdX7Zi0GNzxQapYHCx0
VwRpTbuJpp9kFq8Tyw/XekvI9pVJEIKUAEzsr96H9Hme7UfomP7Z4c01rNf7DuqZ
JgBO2L/4KRdD+V014u5jeyIlXYJp0DNoqkLKDPEK5R9r7lvgd/Qvb9o87RQ2v3Ga
ScklHE9q7KudNZsQOge6532/f2EZSnYYgFQLHXVGQeOXUJRjsPR4QTL2WdHpKzXk
JNxNIro4OYzR0zpwa9QD
=N1Ek
-----END PGP SIGNATURE-----

--uMNE0C2is0k/ADx7--
