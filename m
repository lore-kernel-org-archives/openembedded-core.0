Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A1C54719E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 17:35:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so20828996pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=tdBauhvOUVfhOYKTbLK3tDYysLQEiRGEgq0jOxXlP+Y=;
	b=rdaYYZbpXT9GtXwa2m6gxinvAniWASMfwy/aleNY5Cn8EqDL6O4n+i4FhwMiUht2Ly
	7fK1Qbz+beEoYzXKaW9EupdLazzjcN4bn/soTe1pBypYWsZNeobM5B2czVsGGjDoH2R7
	RbDkjyFet57isN6V7zhZssUcHNL8hdKQzXt1YGksBmnpaQyuLhhd/H+LIYhnLfYUq6rR
	QnNUb2nzUrh989UQAAzCsK80dl/B/DBRTG0hwiHxzV10uiaAMDSzDJYt8SGwmFLIHh3h
	MhTnreQ0vhTgqxjaxK0zt7TtxcdhX8uc0BuoHXPiYJblsAkFFP8tTNTU0QaFoWWXFc12
	+Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=tdBauhvOUVfhOYKTbLK3tDYysLQEiRGEgq0jOxXlP+Y=;
	b=Vj+W9PPTyLfEEMmRpzydWQ/dojItNKzn7Xw/KCrJwrZlQzZs+vb9FYOYN6egL/kbw5
	MrN/oMQsOp9uJFQWMQduVvAWm74/4ROKTaR+iFg/zHt+CncDvmcCAQ1HFb79Xzm/LSl8
	YBqszORxFdY3nhsjww/2BdErOa7QpQcHmeNaPZniSTDTmAMVjGhhCQ1VSE/Eh6LXfJGn
	kd7cHmpodC6ZmwcV8wwBoNAF7UgbDq+RdbaaqUCW14rGEIkMyOUQTBpixcVCmiNQKO5L
	XRMy0oIqBVAzD4oEIT4MT9tFwjYlRVr/F4bn92g6l6wy/9lfjHOuFEMhFIFk/izzSuZn
	z5mw==
X-Gm-Message-State: AKaTC016VDYXrIiOZzj3eEvXAF2eddx12iSyNgVhZBKM5BteSG3kgywAKySlcUzO+QbLlg==
X-Received: by 10.98.17.80 with SMTP id z77mr1165418pfi.166.1479490527686;
	Fri, 18 Nov 2016 09:35:27 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:c4:5d55:7c7:2db8])
	by smtp.gmail.com with ESMTPSA id
	c22sm1319919pgn.12.2016.11.18.09.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 09:35:27 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <f17e9743-9231-4032-f154-f87649ec3cb9@gmail.com>
Date: Fri, 18 Nov 2016 09:35:26 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] systemd: Upgrade to 232
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
X-List-Received-Date: Fri, 18 Nov 2016 17:35:26 -0000
X-Groupsio-MsgNum: 89579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="oBvObTadhIPWSRHU6C68iGP39Nh2NfXWU"

--oBvObTadhIPWSRHU6C68iGP39Nh2NfXWU
Content-Type: multipart/mixed; boundary="Bc5AxiALUKe3Ha9JUS8b2uOTbHnRA9t9f";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <f17e9743-9231-4032-f154-f87649ec3cb9@gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] systemd: Upgrade to 232
References: <20161116174748.26994-1-raj.khem@gmail.com>
 <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
In-Reply-To: <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>

--Bc5AxiALUKe3Ha9JUS8b2uOTbHnRA9t9f
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/18/16 4:38 AM, Burton, Ross wrote:
>=20
> On 16 November 2016 at 17:47, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     * Drop support for rcS.d SysV init scripts.
>       These are prone to cause dependency loops, and almost all package=
s with
>       rcS scripts now ship a native systemd service.
>=20
>     * Drop mount propagation patch, it only happens with libseccomp, OE=
 doesnt
>       enable it
>=20
>     * kdbus option has disappeared from configure
>=20
>     * Ignore dev-so for PN now since systemd introduced private .so see=

>       https://github.com/systemd/systemd/issues/3810
>     <https://github.com/systemd/systemd/issues/3810>
>=20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.=
com>>
>=20
>=20
> Because systemd-boot basically include the systemd recipe, this breaks
> systemd-boot.
>=20
> Can we think up a way to handle systemd/systemd-boot without breaking e=
very
> upgrade?

I have been booting systemd 232 on multiple devices how did it got missed=
 to
compile this ?

>=20
> Ross


--Bc5AxiALUKe3Ha9JUS8b2uOTbHnRA9t9f--

--oBvObTadhIPWSRHU6C68iGP39Nh2NfXWU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgvO94ACgkQuwUzVZGdMxT8WQCfc2OQD2i/yk3XPDvq/YXHPwhR
K9AAn3a825gKbIcBeMFhcNt9nMj+WBNR
=CaJi
-----END PGP SIGNATURE-----

--oBvObTadhIPWSRHU6C68iGP39Nh2NfXWU--
