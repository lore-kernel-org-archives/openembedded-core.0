Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.6.1587779009517922690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 18:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fhseu/Vq;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ms17so4635254pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 18:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=xiWmjcq1bO7FiV06wpCVt16l+Smvf7ExkFB6tq8xTIQ=;
        b=Fhseu/VqETkP+Edj0WtVJeYBGZ1ePVg9UKGKY5/TpIM+krdljqoHsv0d6+Swj58RAz
         udhVhc/LLBTtGADcEa41vZUSSH1BRk6yP/SfN3Tz1MACCuzHtsCrbjz9zKlB0O7u+DnB
         frYG2YvoR5OXEQfWYQat4qPmw1K0WDH/T4xXOpHzHrwnhEwdgPezY3brB1gOClEhFtYh
         3kpK/d0PJcn9t1aas2DvuVNt2zW/s/Ak+k+9/2zCCN7g2kFT4YFSyf5um1dPI1jepbwi
         IsWfJfoX3iyxVZi0It7QIL0GfrQis4wvnVjEOHNNXQz6nvK7O+Biu2LnLFcrmq3g/Jr/
         pNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=xiWmjcq1bO7FiV06wpCVt16l+Smvf7ExkFB6tq8xTIQ=;
        b=TLi3y+137MRr7ytZipScBquSMc9bric87xk+1b9Xrr1KUkz3GOF4enNyOWvolHIlWD
         324eKAVIcPoLOKEabh3lEpPIt48MRVjbyy6aQjlsVV/ibfUIvYWlSHCR3W1QxERP/xHe
         D3TkqV/MtvVFMGAOukTeCGRLHh/8JxEBE96mspLpppJaDXXVBjIf1QD5F40/OKcWdivR
         pTcIdJCa6pigWEciiMjyJJlyEy8Xq2NHNNIFNaghI3hvVkjeWf7P6rQLdTOL+c6Rj6sq
         jqpvNgpI16l3sohdtbGEj/ZcPX5wakttxl1YK51kJeSkXQl8vxhavZmTL1OfoZIQc92N
         6xfQ==
X-Gm-Message-State: AGi0Pubi6z8xSJNUs/BD/eGbt3n51pd7Cl0ECbm8tpMcRY5Pez3xRNMu
	xpX6XlryZ2n+tH7v4nUT9hN66SKi8Ek=
X-Google-Smtp-Source: APiQypJe4VbMM0jnsJscHt/Xm6Tk3gDYs7oVMrHrr4gMJ4QhxDffTjS3V8ZHSJojFfhX3Uj4eIW6zQ==
X-Received: by 2002:a17:902:bc8c:: with SMTP id bb12mr11595746plb.142.1587779008649;
        Fri, 24 Apr 2020 18:43:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id c10sm5988921pgh.48.2020.04.24.18.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 18:43:27 -0700 (PDT)
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
To: Andre McCurdy <armccurdy@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20200422135211.121292-1-alex.kiernan@gmail.com>
 <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
 <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
 <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <e2745c5f-8856-56f5-3fa0-84a89fd26216@gmail.com>
Date: Fri, 24 Apr 2020 18:43:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com>
X-Groupsio-MsgNum: 137453
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="NAEgSQJwZosUhRBxgwacFRiN3kZW6VpYb"

--NAEgSQJwZosUhRBxgwacFRiN3kZW6VpYb
Content-Type: multipart/mixed; boundary="YvSXXkC1OQGePsi2eYXDO4HqHagWiHazZ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <e2745c5f-8856-56f5-3fa0-84a89fd26216@gmail.com>
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to
 sshd.socket
References: <20200422135211.121292-1-alex.kiernan@gmail.com>
 <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
 <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
 <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com>
In-Reply-To: <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com>

--YvSXXkC1OQGePsi2eYXDO4HqHagWiHazZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/23/20 10:14 AM, Andre McCurdy wrote:
> On Thu, Apr 23, 2020 at 1:30 AM Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
>> On Wed, Apr 22, 2020 at 7:48 PM Andre McCurdy <armccurdy@gmail.com> wro=
te:
>>> On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan <alex.kiernan@gmail.com> =
wrote:
>>>>
>>>> sshd.socket launches the templated sshd@.service, so by moving the
>>>> sshdgenkeys.service to sshd.socket, key generation can start in advan=
ce
>>>> of a connection.
>>>
>>> Is deferring key generation until the first connection a bug or by des=
ign?
>>
>> If you've installed it, presumably you're expecting connections. But I
>> agree you could argue it either way.
>=20
> The trade off is between slower first boot (or every boot for
> read-only rootfs if host keys are not persistent) -vs- slower first
> incoming ssh connection.
>=20
> Since the first incoming ssh connection may never happen (especially
> if ssh is only used for debugging or development), optimising it at
> the expense of boot time doesn't seem to be an obvious improvement.
>=20

I tend to agree. Perhaps it could be covered under read-only-rootfs
DISTRO_FEATURE

>=20
>=20
>=20


--YvSXXkC1OQGePsi2eYXDO4HqHagWiHazZ--

--NAEgSQJwZosUhRBxgwacFRiN3kZW6VpYb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqOVugAKCRC7BTNVkZ0z
FHCLAJ9Obf5WUrD7CvG49NdxAu5XiQFpcgCgj3YJ0lv2AZQW+Q9q68HuVMaoa2s=
=rwG8
-----END PGP SIGNATURE-----

--NAEgSQJwZosUhRBxgwacFRiN3kZW6VpYb--
