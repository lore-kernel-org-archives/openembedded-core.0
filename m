Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.1320.1605739990962157216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kernel.org header.s=default header.b=R67GsMAs;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 01DC6221F8;
	Wed, 18 Nov 2020 22:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605739990;
	bh=ONGVEFnp+ORYVkeYTR0vhuKxP9/Z3cmiD11Vj2IRYYA=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=R67GsMAsaL1m96tW8N8/pPGpTONjQa/1Qfw1XNMXtkr+x8txERtIbkOkSEVo9OnNg
	 jbzwB4ESo9B2QgMYSsUOlJr1nb0zlaZWdNp9AbE65JGsNDdAUKO7XwH0RoNjIQjn0h
	 uNtXN3oBGAv1j8H2ao0Yg2XpegzMWU5Ve/THdH/0=
Subject: Re: [OE-core] [meta-oe][PATCH] volatile-binds: add /srv to mount and install
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20201118223708.9664-1-okaya@kernel.org>
 <VI1PR01MB64628148F729E6775EBD6651A8E10@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <bbf1fd65-f132-b869-496f-c29bd4adbe23@kernel.org>
Date: Wed, 18 Nov 2020 17:53:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <VI1PR01MB64628148F729E6775EBD6651A8E10@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/18/2020 5:40 PM, Konrad Weihmann wrote:
>> =C2=A0 =C2=A0 FILES_${PN} +=3D "${systemd_unitdir}/system/*.service"
>> +FILES_${PN}_append =3D " ${servicedir}"
>=20
> Just out of interest, why does that need to be an append?
> Why can't that be part of the line above?

I can fix that. I copied from a bbappend file.
