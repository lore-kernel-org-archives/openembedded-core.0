Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.9701.1627566594007268910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 06:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PKzzZtym;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id n21so3772125wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=cAiKZPNAlQ6Yc7vDwK6B4zLzEZcCc7CbY6543IFY/Wg=;
        b=PKzzZtymLFom+NYooR8D0wdNSQiJE2rdkE8hC0r7JUTnCU+Dggpi2ACGtfjQ7G5TW4
         2EmDX5jC5jcsx8UtSTTu94up1JjTXNfk2lXr097XhzMFD9pRkwHmm+sDx3+o9hdF2lhd
         VSa9XLZKrhX8i30iHebeuCiIxHCO37M5Aam5pAiw9g9weQEUc728M1EOh9bzBwJ1H6VQ
         kfA6hh//Ccat3mZT8Ws7eg4qrObl28TJZiEr8KywTa2OppceJSxqZVhku9ONGojUxbDa
         +x0l+Rg1J2n5vupXMqhrJggqje/C9PoG6XzfgHTq84bkJ2LcaiiEB1kDPeho+B1Rc9Ow
         iIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=cAiKZPNAlQ6Yc7vDwK6B4zLzEZcCc7CbY6543IFY/Wg=;
        b=ACiYMTMdt2iuqBm+E1cRlm6X8BcTDi4cai8CKLyGMAjh77Rnm0bOyI+Rk+A7usWDxV
         Gi8QWjRGjUCOH7n2aLc4/qv5FmdBY4vYqQ8JzKPkEoI7KoI2lobQFiXTop1Ieub/Qx8L
         +kS+vxSWXVrau2XcN6vKhvE0nQgo3lukjY2NCLcUW52WgeQMA9SAWhfn/Uodi+CAJoL8
         ehPF16/3AcGqx1Q+7E9d2+rZgpQ/N/bh588YyrR3wAuuum6FonjInQUAWXkvJkGKD2bZ
         JZW/aEQQ6LSD+6oLqZldD9/YDjQzbDWf8vrpIJI2iCvaHDpnrpueIt/cyyLFu81KIusC
         5cPA==
X-Gm-Message-State: AOAM533qQquqJlPwtRIej6E9S3O23Z4cptPwJnA6T01Ok1UBUBLHmZe7
	a3M/39kZK2PDd3u6imC9yYryRmqEQnhSIQ==
X-Google-Smtp-Source: ABdhPJxjSTaeI4sx09947wRf6erO+5rRwUc0CJslPs4OuwokWuS4i6ccC+kag6QroDl8Zz8qe2kh7A==
X-Received: by 2002:a05:600c:354e:: with SMTP id i14mr4876706wmq.96.1627566592228;
        Thu, 29 Jul 2021 06:49:52 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id 6sm9400721wmi.3.2021.07.29.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 06:49:51 -0700 (PDT)
Message-ID: <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com>
Subject: Re: [PATCH] systemd: Fix build on musl
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2021 14:49:49 +0100
In-Reply-To: <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
References: <20210727201325.2215487-1-raj.khem@gmail.com>
	 <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 154247
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/muPu1iwkv2REd/lNPLT"

--=-/muPu1iwkv2REd/lNPLT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-07-29 at 12:59 +0000, Khem Raj wrote:
>=20
> Latest upgrade to 249 broke a working build on musl, this is incremental
> fix to exisiting patches adapted to 249 release
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  ...002-don-t-use-glibc-specific-qsort_r.patch |  24 +--
>  ...missing.h-check-for-missing-strndupa.patch | 173 +++++++++---------
>  .../0006-Include-netinet-if_ether.h.patch     | 147 ++++++++-------
>  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  20 +-
>  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
>  ...-not-disable-buffer-in-writing-files.patch | 143 ++++++---------
>  .../systemd/0026-Handle-missing-gshadow.patch |  18 +-
>  7 files changed, 247 insertions(+), 292 deletions(-)
>=20

Having a look at the patches, a few comments:

- 0001-test-parse-argument-Include-signal.h.patch was merged upstream,
but never removed, I think because it was refactored so it applies
cleanly and doesn't raise errors?

- 0005-src-basic-missing.h-check-for-missing-strndupa.patch this is
massive and will keep growing and breaking the build, wouldn't it be
better to just implement strndupa in musl? Even out-of-tree it sounds
like it would be easier to maintain than this

- 0006-Include-netinet-if_ether.h.patch sounds like it should be doable
in a way that is compatible with both glibc and musl, and thus could be
upstreamed?

- 0010-Use-uintmax_t-for-handling-rlim_t.patch can be upstreamed but
needs to be reworked slightly as explained in=20
https://github.com/systemd/systemd/pull/7199#issuecomment-358268647
which seems worth doing to me

- 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
quite worrying, as it fundamentally changes access patterns, some of
which are done for security reasons. At best, this will cause
completely different runtime behaviours for the same filesystem
depending on the libc implementation, which doesn't sound great?

- 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch sounds
like a genuine bug, have you tried upstreaming it?

- 0019-Handle-missing-LOCK_EX.patch I see no problem upstreaming this

- 0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch should
also be fine to upstream I think, in src/basic/missing_syscall_def.h

--=20
Kind regards,
Luca Boccassi

--=-/muPu1iwkv2REd/lNPLT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmECsf0ACgkQKGv37813
JB7B3hAAgtjn7mGbKP6gswiSMA9obxHSPc0Btj96xWn8x+Z1Kmxnv7PUMMUoQ5UP
i5QWwiFyeO6Pf0NAuNuZl494KMqtgYILWkYhNo2MQdodoZxW/azYoKyi3mPLKNMC
k+mqDEzn1mPxv1stffnKX4hDxArRdl1wM23iUk3VXpJxLzJbAPxQFQjYvUpu3uBX
FLfpxu+9u8jR1TfadvA0s4NBbKBOUnalJY/nwmn5if2MvDbkNAQrysKKJEeaSHM1
RLkOupB+tJ4sbrFOvUaSCR0SoJWc5BvXfnLU5Bj+gQyPmDD0W7Gccs5Y++lstKuK
dpzmSlyyEPZkgbSWFmnpLOWyyEnruJXhYMAyY1zIpMrRMURhFj4IBOdmwO4CUDKT
Ds0ebBLajg0Hyv6CqWORLNOeYnCpMEhNYeK+O4a5+tccvPF5ja9GL6/XQYeOAfXn
/L9bMPyh36+oigyzr9lLUN38Qlsfih1ALduE3rx03T4VN2+9IOfuz1erRnvk+fEP
FBK2dUoer+wlIjNldMXW+Qu9juOG5nYqUibX/Z/E9+y5oHT+9xHv7prDfxtiayP9
9IEcz2ArFCYRPp27t7SyJUhkH1I2VQlcbuvzY0sItxmN64Vp4KvItaPwOe3LNZ5o
zVlHuwdznOym7SupIG+jowuBKySSdCql+xdpVG8agfrQD+PHZSI=
=cFqX
-----END PGP SIGNATURE-----

--=-/muPu1iwkv2REd/lNPLT--
