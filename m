Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B56E874FDF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 18:33:53 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 31-v6so5862269plc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=HaIvR2YVWgzmf0r2ki73AW1l7JE+A+vV9lYIJvMTllE=;
	b=UaeyN7JvG6dtEIDuBITo27YgLqzKdhfsCzHowsovqA3z/5WsaaD/8UPOe8lxDQ3zKE
	Kl9kiHNoVwxZV6Kj+klfI5E+Zeo0gASCvwhA3VyEJEIPpeBK6gzc00SNyQu5dg25zheT
	G5oT7htfCSF8ml76cdfnGKOi+7pnSvA/7yNlSb0NAH+fIqJLPoZa3ZbV6el9EfU46eX+
	44oy9n1Nt1h2+xWFPaYvBzdV7AtTMm1giKCd2n2Xs5j8W8ds1t8IEzkcZs3fl9SMBB2D
	/zREEuG+uPSUnf77GrZQeM25xLOxp3gvSKUK75eQXEZnepNNFjhJytgiBfExdDy+1RaW
	9Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=HaIvR2YVWgzmf0r2ki73AW1l7JE+A+vV9lYIJvMTllE=;
	b=XyOALwb3CvGV2Yd+L9lbfJ6NsvcsESpYvgYiMKQrrS8T7vbQbyW6cIHpW6Q7vvifUU
	bUrlUYPASDpQA8KwK/7GpQGtbY5QSDmGxlSt4tqR+SYtqbv72do8KGsLp2mFg6P0z5ZR
	vKWZmiE+pgALRxyqfLIMXRHXHVeOlhlRkeeYvlF1+DqhxSJv3SUmmTsX/ANT7EGtRymb
	DbQSrkbM0ff0L6mSOyEJ7VBE65Bzw7QY2U+hFEWcmP+LZLTZUF8UDphUnDNQ4YR6LhoD
	srklMer8HcQFrfK+kD8mcfdM16sC+DmKLwKYI2m7iteFiOrSs799gtXCDGizi4lauWLl
	wh2w==
X-Gm-Message-State: ALKqPwciqhAuoq0NX714QbPSExlwnQDiQwXm2AxoXppps7gLN/y4TinQ
	MWdKxIihXzi6qlMOIrVAuKZ2J6am
X-Google-Smtp-Source: ADUXVKJeZQb9ZckBcGKnqxZW7sj3Fdx2GpGy/JAdqtAB38uAvbngUaQvKJiviSnPnWqAjEaoOinY2A==
X-Received: by 2002:a17:902:4545:: with SMTP id
	m63-v6mr12406286pld.268.1527878033898; 
	Fri, 01 Jun 2018 11:33:53 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	y7-v6sm71852730pfy.52.2018.06.01.11.33.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 11:33:53 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
	<CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
Date: Fri, 1 Jun 2018 11:33:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 18:33:53 -0000
X-Groupsio-MsgNum: 112034
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mzeRB0DPYsdBOnd8Ao5M9ipC0MIwAKOtT"

--mzeRB0DPYsdBOnd8Ao5M9ipC0MIwAKOtT
Content-Type: multipart/mixed; boundary="16qOTnjizVx2nXlCrX6J1N79R2nCVaKsl";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
Subject: Re: [OE-core] [PATCH] boost: Improve reproducibility
References: <20180531062031.40334-1-mingli.yu@windriver.com>
 <1527772404.16911.155.camel@linuxfoundation.org>
 <5B10A3D7.20309@windriver.com>
 <CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
 <5B10DBE5.5050603@windriver.com>
 <62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
 <CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
In-Reply-To: <CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>

--16qOTnjizVx2nXlCrX6J1N79R2nCVaKsl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/1/18 10:56 AM, Alexander Kanavin wrote:
> 2018-06-01 20:07 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>> these symbols are added by assembler, if you have .file asm directive
>> either explicitly added to .s file or emitted by compiler, compiler
>> would emit it if the path specified to source file is absolute during
>> compiler invocation, it will take it verbatim and put it in generated =
=2Es
>> file
>=20
> The .s file is not generated and it does not contain any .file
> directives. The .o file also does not contain the path. It appears in
> the final .so library at linking stage.

Can you share the linker cmdline ?

>=20
> Alex
>=20



--16qOTnjizVx2nXlCrX6J1N79R2nCVaKsl--

--mzeRB0DPYsdBOnd8Ao5M9ipC0MIwAKOtT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxGRjAAKCRC7BTNVkZ0z
FDHCAKCRHouIH90MnagJ1WwUNjfboQL/awCff7kSeWXRBoJe8XkPh5hby6xKEhM=
=ytdT
-----END PGP SIGNATURE-----

--mzeRB0DPYsdBOnd8Ao5M9ipC0MIwAKOtT--
