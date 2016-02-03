Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 233A8602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:42:00 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id cy9so3219734pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 16:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TrnEjWww55Gts46UQX5IkvsP5upK6DdY1UDJq42dpq0=;
	b=ymYQUC7sQqpKoKAHK8YuJONIZDSSG0bzEmUt5yAQpdbrImeUjXTUzHzhGwb30u+Nd6
	tzfCzGFoTR9jY2/2tDyBTfSNqyraZGo/MU9tTSl3d0s7/uvQxbQudIyXKsQhfav4dpiA
	Iqi51XgQWyhv8dqkZEXNWqnHtz7D2fXaJE4M8Kd45SHyXwtt7wntNb84/XEzYN+n9aeV
	DJI2EREqm86BMmM3fAbbAd/EIoMDCmIKzJuxBl00CUD29BJ03/XH59xLxbnqs+49FNXA
	SUbYc72h4L+enBzT/tohmQBy/Jm4xmQwuHXO9zWDon781nITu4mxLVFu8V/nkUMtX3kH
	ROCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=TrnEjWww55Gts46UQX5IkvsP5upK6DdY1UDJq42dpq0=;
	b=CSpKq7ogvnO6QwfAp815QstA9SJJgXHzkH5mUEbFA/4d6jfhJCx9WhgHkFBopLTOFK
	8xb0NR761kkJvmnG20M3bmGqFLD1lQBFqKRz88O4gWmv686jZ15GaRZVz1wzG7BHrEti
	zbxW+8EBA2OjSkPFcIbUrZ0FaiOIogXuwmM8ysr4oT4LDdolu0b9bl0D+R/dRJWdGNdG
	e8ACZ6ybbV6frEW3/cnyeMl2iT7XbdwWEc45YvjbEnIlaKf8hOMyBTz5YTcPa2QD/XMR
	FNiA2/FV6zAgLyU84eFTRYWWvDClpek0B6Lg40gQ6TSjm8Td56GA8tWd0U1u57Ujds85
	HOwA==
X-Gm-Message-State: AG10YORPSJ2YOn+1BAdUZG1tljlgRwoJYgfXdEZnnqQ/55x4D08aoQKXhmApoBYuUyZw9w==
X-Received: by 10.66.124.200 with SMTP id mk8mr51970826pab.43.1454460121259;
	Tue, 02 Feb 2016 16:42:01 -0800 (PST)
Received: from [10.235.224.30] ([50.141.32.174])
	by smtp.gmail.com with ESMTPSA id 3sm5207902pfb.64.2016.02.02.16.41.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Feb 2016 16:41:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=XKG6FNEW5hjtYOkjXhmaRKV2vnjqLW2TgpEVG=XF0ivw@mail.gmail.com>
Date: Tue, 2 Feb 2016 16:41:54 -0800
Message-Id: <89461059-B47B-4CBA-BDB9-EC00A6F8B01A@gmail.com>
References: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqRtdCtm0jtGwMtPWJ3cUYmRB5FYZ9m7xmjq8+0q_pTGQ@mail.gmail.com>
	<CAJ86T=VMCnwns4grN6rWFg0z2oR7ifeSbo4Pf2o0te1ZOk2fOA@mail.gmail.com>
	<F583CDF2-1357-463D-AC7F-48C93A9C2436@gmail.com>
	<CAJ86T=XKG6FNEW5hjtYOkjXhmaRKV2vnjqLW2TgpEVG=XF0ivw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: drop --enable-target-optspace from configure
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
X-List-Received-Date: Wed, 03 Feb 2016 00:42:02 -0000
X-Groupsio-MsgNum: 77428
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EDA734DB-CD24-4089-8DCD-685BE4B1A58D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EDA734DB-CD24-4089-8DCD-685BE4B1A58D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 2, 2016, at 4:36 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Mon, Feb 1, 2016 at 6:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Feb 1, 2016, at 6:21 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> On Mon, Feb 1, 2016 at 4:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> What is the size increase in gcc runtime when u do this
>>>=20
>>> No significant changes.
>>>=20
>>> Binaries which link statically with libgcc all grow a little
>>> (somewhere between 10 and 50 bytes).
>>>=20
>>> libgcc_s.so.1 itself grows by approx 1%:
>>>=20
>>>  text       data        bss        dec        hex    filename
>>> 114896        516         56     115468      1c30c    libgcc_s.so.1 =
(-Os)
>>> 116148        516         56     116720      1c7f0    libgcc_s.so.1 =
(-O2)
>>=20
>> Thanks, I am ok with this change. Can you also report a qemuppc build =
with this
>> change and make sure it boots ?
>=20
> No issues seen booting qemuppc core-image-minimal built from today's
> poky master branch.

great thanks for following up


--Apple-Mail=_EDA734DB-CD24-4089-8DCD-685BE4B1A58D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaxTNYACgkQuwUzVZGdMxS+FwCaA92Ak+haaxsnzEV1y2eDeWxM
VtQAnjtfk2VljRY3Yq2Vsa/Qf25MxhCq
=C4aO
-----END PGP SIGNATURE-----

--Apple-Mail=_EDA734DB-CD24-4089-8DCD-685BE4B1A58D--
