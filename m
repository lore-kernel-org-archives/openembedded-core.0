Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (unknown [209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 83E0C6017E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:40 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so5855150pab.35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 16:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1k4FvZDeGAZLjFq07ckMnvhWYk6f1tYXMK+nekSssuo=;
	b=C7TaWIg4nnMQzHx6pGSPIQswiuirzdHFWGRVFl0AwI1weUwD3RkJ+uMiNCQRgG5a3z
	k6bJPqtJrDDojwDlsNK7dMil2x7O+EF5lYJ0oxh1cnUgrt1dLkZDyp+dexTZx6dn9NiV
	KINvRjxlORulko16lWPchDL4WK+wQ22ct1p56Vb4WdUfnaqru+Kpqvge+xJg94BQZEyW
	tvODUU8RqpEzzRV6zSaSK8WdgACAO7gt5eT+1CHgItwkgFl7xrN1Ki9S0AjkfMAQP2Hk
	myckLhdV2dD7BSTApVQ0rj5bs1byNcc0X5h4jNYvrJhrZoTcL2g1nUXSH1H5RG8GSMpE
	jIRQ==
X-Received: by 10.66.148.197 with SMTP id tu5mr37779821pab.108.1399765781944; 
	Sat, 10 May 2014 16:49:41 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:7a5:21bd:656d:abb7:5cd3?
	([2601:9:3580:7a5:21bd:656d:abb7:5cd3])
	by mx.google.com with ESMTPSA id
	hk5sm14785183pbb.86.2014.05.10.16.49.40 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 10 May 2014 16:49:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <df4fba969a1fcfe305dd2d3d304bfc35@technux.se>
Date: Sat, 10 May 2014 16:49:38 -0700
Message-Id: <FE43330E-F520-41D3-8553-4F0964EA7AA8@gmail.com>
References: <cover.1399671290.git.petter@technux.se>
	<a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
	<CAMKF1sob1+VHoBZQxjm-MkrPE02+f6JKqzGaxiNz0yNL-WA2ZQ@mail.gmail.com>
	<df4fba969a1fcfe305dd2d3d304bfc35@technux.se>
To: petter@technux.se
X-Mailer: Apple Mail (2.1874)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 01/13] systemtap: remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 23:49:41 -0000
X-Groupsio-MsgNum: 53064
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7D48AE3B-C750-4ADD-B652-1F8F757B761F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7D48AE3B-C750-4ADD-B652-1F8F757B761F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On May 10, 2014, at 3:31 PM, petter@technux.se wrote:

> 2014-05-10 18:58 skrev Khem Raj:
>=20
>> On Sat, May 10, 2014 at 1:05 AM, Petter Mab=E4cker =
<petter@technux.se>
>> wrote:
>>=20
>>> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/systemtap:"
>>=20
>> would something like
>>=20
>> FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/systemtap:"
>>=20
>> avoid the prepend and immediate evaluation
>=20
> I guess someone with deep bitbake knowledge can answer this better. =
But as far as I understand, you should always use immediate evaluation =
when using THISDIR, to be extra safe. Not sure if it's more safe to use =
FILE_DIRNAME if you want to avoid immediate expanding when using =
FILESEXTRAPATHS?
>=20
> The bitbake documentations says:
>=20
> "The operators "_append" and "_prepend" differ from the operators ".=3D"=
 and "=3D." in that they are deferred until after parsing completes =
rather than being immediately applied."
>=20
> Not sure if above means that "=3D." will also immediately expand =
variables or not?
>=20
> Personally I have always used FILESEXTRAPATHS_prepend :=3D =
"${THISDIR}/<somename>:" like the yocto documentation recommends. But =
sure if you can avoid immediate expanding in FILESEXTRPATHS, that would =
mean a tiny optimization. In that case perhaps the documentation should =
be updated as well. Looking in meta-layer both methods seems to be used.


I was hinting on avoiding THISDIR but that does not solve the problem =
probably what you have it ok in this case.


--Apple-Mail=_7D48AE3B-C750-4ADD-B652-1F8F757B761F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlNuuxIACgkQuwUzVZGdMxRVGgCePc/GE0gGY1ige8n41yd2Ajw/
FqUAnjBdmUYA6t5WqR2P7cS0S5Kgl/lk
=bSuN
-----END PGP SIGNATURE-----

--Apple-Mail=_7D48AE3B-C750-4ADD-B652-1F8F757B761F--
