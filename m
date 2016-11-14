Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB20660053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 17:49:20 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id x23so9483853pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 09:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=JWkLIkiwmL2PQpc+yBhNh+Gp55du8Cj0f2RciNrutPg=;
	b=gVssazjmkMJzxW8mUDmW7XuL46SVnuVQgQIjsFhOedSyFcqg7VgR4MiEGEeSreFGel
	/wOB4bfUllycxUV49kV0mSvZo49gb38NLq8mnzsPKYyn2GmLT5MYIMFMxbVP9Sr0Pss9
	vAiM/ycem9IIKo8MuOcL+ckvBx+bBVZq0noBx7CJCgbpk58FEzQMpFF8/N53Oli5dtrL
	RFZSglh7WhIfW8gztxd3PuET49xTwMDtvvDeYV7yQJH8L0zqLKvmx+6hZyJSLzvmKa/i
	On88pgv6uSBT0Ds3/C2EVF0EzgDne+Wt1eb2DZZFjJxiLldnD0zv6ez7zFwQCodqBGxK
	eRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=JWkLIkiwmL2PQpc+yBhNh+Gp55du8Cj0f2RciNrutPg=;
	b=VbQGeF+wZoCpNgDBuKpUcvWPRUzsIU6TpfD6y52LBwEKtnfLDga9VnkqqV41Ead/7+
	KR/Gq6Wdrvq/djMkOTmZqWRbA8OXJC/OT3KVWopLNNUmnClTFvCFm1yhNLdwpjUZlZh+
	mq9VajDbVxiFZn6x4k3ekIIZ1WXNIWDKXmZ0d7QayrUTt/Um2YBg7O9QUkE0VLk1iYi+
	8pvmRcVCptPzhR1iAh8F3MUM8Smn5IRHKyvdfr/q/IyzuDcwAv0Dm+/LIO22DGjXoJrJ
	KFKGFe6VzbAyGmtIT8sLD7O/K0TeXG7tczJDchM2QaD92Sx3pekpVVEdzDsA2Hhz6b3o
	JqvQ==
X-Gm-Message-State: ABUngvd1MWGFRv4Djrgf9Rjsp7f0lXR8Lz8GYHdicB5EMSRPfCh0ED0gxjCSz5SXyrwm5A==
X-Received: by 10.98.35.5 with SMTP id j5mr37913866pfj.91.1479145761951;
	Mon, 14 Nov 2016 09:49:21 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d8e8:a625:64a7:acd8])
	by smtp.gmail.com with ESMTPSA id
	r194sm36639539pfr.94.2016.11.14.09.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Nov 2016 09:49:21 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
	<1478887474.23123.233.camel@linuxfoundation.org>
	<dce6aa96-0ebb-6158-e9fa-f5074ec1fadd@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <d06531a1-474b-0b82-33cc-fd87fe82fa47@gmail.com>
Date: Mon, 14 Nov 2016 09:49:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <dce6aa96-0ebb-6158-e9fa-f5074ec1fadd@linux.intel.com>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 14 Nov 2016 17:49:20 -0000
X-Groupsio-MsgNum: 89356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="b3vF1EIFu1jJQLQJbDI7S5t8iJVvmiMp8"

--b3vF1EIFu1jJQLQJbDI7S5t8iJVvmiMp8
Content-Type: multipart/mixed; boundary="e5VCgwLcBs4uxWBi9d1O84p5mj96sB5xe";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <d06531a1-474b-0b82-33cc-fd87fe82fa47@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go: Add recipes for golang compilers and
 tools
References: <20161110003935.1858-1-raj.khem@gmail.com>
 <d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
 <1478887474.23123.233.camel@linuxfoundation.org>
 <dce6aa96-0ebb-6158-e9fa-f5074ec1fadd@linux.intel.com>
In-Reply-To: <dce6aa96-0ebb-6158-e9fa-f5074ec1fadd@linux.intel.com>

--e5VCgwLcBs4uxWBi9d1O84p5mj96sB5xe
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/14/16 5:00 AM, Alexander Kanavin wrote:
> On 11/11/2016 08:04 PM, Richard Purdie wrote:
>=20
>> This was something that came up at OEDEM. There are several layers wit=
h
>> several attempts at getting this right, most have some issues.
>>
>> Whilst we've been pulling things out of core, we also need to consider=

>> things that perhaps should get added. Having this in core would
>> certainly address a number of issues (but is also potentially a
>> maintenance burden).
>>
>> We did agree there that we'd consider this. Obviously input from peopl=
e
>> not there is welcome though and this does need discussion. I'm leaning=

>> moderately in favour of adding it as things stand.
>=20
> I guess I would be more open to this if Khem at the same time sent a pa=
tch
> that explicitly assigns maintainership of all those new recipes. So ple=
ase
> don't merge until that is agreed and done.

Sure, Ross will add that

>=20
> Alex
>=20


--e5VCgwLcBs4uxWBi9d1O84p5mj96sB5xe--

--b3vF1EIFu1jJQLQJbDI7S5t8iJVvmiMp8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgp+SAACgkQuwUzVZGdMxQT/QCfVjX19yHKT2RGQ3YhzFOdDM9j
NwsAnjZS73FNwJThLu3gbLPmT6js6YY+
=d9U5
-----END PGP SIGNATURE-----

--b3vF1EIFu1jJQLQJbDI7S5t8iJVvmiMp8--
