Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A19A971C30
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 17:00:37 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n85so12117115pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=J9aCmE4B8e69D7G38PR5V0G9FkRZGbIEDhoZUfyCupc=;
	b=hPb+UUk6L6rzs03OutoBeb9ANVWmJznH3FVer4PDBWNDi5sJYszoMg20hOw3s/K26c
	C66KxWSk50VAS3f5NpXBZRE5WgFrzWGIsEbmF4bPYMAEBGd8lEjVaoH9qEX8FrckQnZb
	tv167K3tI5TrzwJqGSBBlb7HdZSPCOM8eNidrUWxrLDUZ9vHaMREeH+IaeeLQ23ChItB
	OaG2yP11MBuy54ikUXijpwAUbu/aA/l829odm+ip2GQ3+5uQP0lmgvXtp2lGjl1A8J+/
	PJnIIVJAZvO2kTios3CL+ZhqyK7KXMI7vA8yTn80wxpEirgUZUbt5YITSNddPpnVEFzT
	Cw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=J9aCmE4B8e69D7G38PR5V0G9FkRZGbIEDhoZUfyCupc=;
	b=YGKyQIoTQVrezbVG+ROVusK6/C/LVbWhat3jFRWgK3YKRO9ZeiYZ0IOBoLveBizF92
	WRc9rhjRyEIGEmX0vdvML8VxXjrBbyhJ9ingPiXkoCIrdKC29aLTifU7QQCNWmesw/HW
	8OjYAwJBGL80G/3lHSie3DjyyAUFmDjrBDXIen8KZiMV1MqMUOfr54T/mR59jmRilumm
	8418GfNLVjH6DJqvUfbakq1GIKRld74idDlvMKk1cQFzy+ozXFswA0/JJkEexAsaZjYj
	x/z5nO79vYuMqIMxTVdigqhhlgZaXRvmHm4/ke/9XMByIi2/WyDfXC7vZzCBAyWH1d5p
	z1nA==
X-Gm-Message-State: ABUngveQiJAVuzrc0Qx+VJLSRnw9m2Bv4h06fsnFjScCPg+7fqLHowNpZjdnmZC0fv62Vw==
X-Received: by 10.98.9.67 with SMTP id e64mr62282616pfd.74.1478019638029;
	Tue, 01 Nov 2016 10:00:38 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:bd37:fcaa:669f:4910?
	([2601:646:8882:b8c:bd37:fcaa:669f:4910])
	by smtp.gmail.com with ESMTPSA id
	q28sm19801601pfj.73.2016.11.01.10.00.37
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 10:00:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAGNsrLAHewjcgMojrCaVT+T-cAogpicW2=o=D0T6Fn+3tmNdog@mail.gmail.com>
Date: Tue, 1 Nov 2016 10:00:32 -0700
Message-Id: <428BE263-16FC-4F67-AE69-982BEED0E18E@gmail.com>
References: <20161029145747.32390-1-fathi.boudra@linaro.org>
	<CAHvQdo11Y5ZV0GaC0YsdFCEz6KwLymLms51hDkASayPXo-3TVA@mail.gmail.com>
	<CAJTo0LYBANe9f--NJkex3sN52ZGUH6Nrd45ktaYV1qxdY8gNJg@mail.gmail.com>
	<CAGNsrLAHewjcgMojrCaVT+T-cAogpicW2=o=D0T6Fn+3tmNdog@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core PATCH] wayland: upgrade from 1.11.0 to 1.11.1
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
X-List-Received-Date: Tue, 01 Nov 2016 17:00:37 -0000
X-Groupsio-MsgNum: 88873
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EDEEE478-7706-4411-9C8F-857BE951F046";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EDEEE478-7706-4411-9C8F-857BE951F046
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Nov 1, 2016, at 12:04 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> 
> On 31 October 2016 at 13:32, Burton, Ross <ross.burton@intel.com> wrote:
>> 
>> On 31 October 2016 at 08:25, Johannes Pointner <h4nn35.work@gmail.com>
>> wrote:
>>> 
>>> Wouldn't it make more sense to update to 1.12?
>>> Since 1.11.1 is backporting fixes from 1.12 as stated in the annouce
>>> mail of the release.
>> 
>> 
>> Absolutely - there's a 1.12 so unless there's a good reason to avoid it in
>> master we should be moving to that.
> 
> The reason is pretty simple, I submitted this change only to go with
> the weston patch backported from master to 1.11 serie since it is what
> is available in oe-core. It's the combination I tested on my available
> boards and nothing related with newer version.

This also raised a question if minor version upgrades will be accepted
in maintained released branches.

> 
>> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_EDEEE478-7706-4411-9C8F-857BE951F046
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgYyjQACgkQuwUzVZGdMxSx8ACfYB4cZ8JBn/BqeGhJx71joWUH
8Q8An2kBTYuoUh+a1qWsmxYjQM/5r9gv
=U3t/
-----END PGP SIGNATURE-----

--Apple-Mail=_EDEEE478-7706-4411-9C8F-857BE951F046--
