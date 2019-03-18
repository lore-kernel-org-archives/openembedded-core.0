Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B65F7C629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:09:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 81so6155480wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=76jbovdLk1asrth4nmjbnbFB5+z/bHgR2GWxGyE9MGo=;
	b=j/PXjgSm1OZuLMukCFYm6wavBNY4WuptBWkGY2nJZhxUuHLhT9HKEmaHClRS+o2ETJ
	i7wgzkDXDi9733WuTI2KnzvA2EEy4IBAINeMwGTMJaMmVATp9NYBhCMwrFz0gaiIRYNi
	FJIFu7DpRS8BuL6p8NHo7Wtc729BPCUCpUse1tE2bWRD90devsW9vrgr+rjO9fHhNCGR
	BfNkJ5x3TU7wKGJCJ40qWlrEEiht7WRcP+IcTrVjo8Mu5EVOcu0KAndNk3TQeLeSXzzV
	mRi+zkYe8yV0Z6MISvRQrKhsLU5tHzaKUvqvPPhJnvt0LdRrxASI9xZ18t+L8qv7fMm7
	Rl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=76jbovdLk1asrth4nmjbnbFB5+z/bHgR2GWxGyE9MGo=;
	b=gxvdiBfd6f4GERbTLL8YpGMTdRJ8dWxLsBfz7w8Kuke2KoYPqWyAOOlDE38Ht8R0Aq
	Rt5IcWzePqWI51r4rRunMG1NVxikZm6a1pdrc8oi5lR2oI6hVLDm+5E8rkgT9Se/b6nr
	7xYNo4I8Dv0sySmXe/RittZbn3R1SrNXB4KyCbEeg5uH3br4Yply/uNYk9DwI2rPRJca
	G+k2Xwk/+KBpAcYFMmy8bR+YatLWYsu/7GYZy3/RkoKAb/REcdnXDwIUc16l8z+5LqnT
	oBlyXcLbI0XIXFu1xdi5l9kEBSFQiXw0Bn7NBXIvKWedqrMkkM/ACTaIYpU1CXkDXt3u
	FZiw==
X-Gm-Message-State: APjAAAX0tK47AVqgwrChLsY1+I1dPYhevuFPxcHospio+/uYP2W9R+Zw
	biLiPe8Q8a/0j7e/0mTzD/4=
X-Google-Smtp-Source: APXvYqyphYd/7XIERyFflc+W00K2zRKLLdT3bQY9whE/oU80pTBKCDIRIRl8ypObKK76/fqpIQ6/2Q==
X-Received: by 2002:a05:600c:20e:: with SMTP id
	14mr12771077wmi.144.1552925358209; 
	Mon, 18 Mar 2019 09:09:18 -0700 (PDT)
Received: from [172.18.182.189] ([46.183.103.8])
	by smtp.gmail.com with ESMTPSA id
	j64sm12483517wmb.36.2019.03.18.09.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 09:09:17 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <CAP9ODKq_bxdcX8DijCz0WFXBKMmAfxE8AhnPDhGk1t01axXnEg@mail.gmail.com>
Date: Mon, 18 Mar 2019 17:09:16 +0100
Message-Id: <81AEDE73-7DD8-4F69-BF8D-BC2BF92FFC06@gmail.com>
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<166926B2-31F9-4290-A4B8-1EC6486C7357@gmail.com>
	<CAP9ODKq_bxdcX8DijCz0WFXBKMmAfxE8AhnPDhGk1t01axXnEg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 16:09:17 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s fine to use the shell rewrite in the native case, as it=E2=80=99=
s only used from one place under our control. This is not the case for the t=
arget where we have no idea where and how the script can be used. So you can=
=E2=80=99t argue that native has the same issues as target does, and therefo=
re they must be the same. The reason we use shell rewrite for native is that=
 it handles sysroots properly from what I remember.

If something is broken, please describe the steps to reproduce and I can loo=
k into it

Alex

> On 18 Mar 2019, at 17.00, Otavio Salvador <otavio.salvador@ossystems.com.b=
r> wrote:
>=20
> Hello Alexander,
>=20
> On Mon, Mar 18, 2019 at 11:53 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>=20
>> Apologies, but I still have to veto this. The concerns I expressed previo=
usly still stand.
>>=20
>> The best course of action would be to work with the OpenSSL upstream to r=
eplace the utility with either C or shell version.
>=20
> I understand your concerns about this however, those also stands for
> the native recipe. So we have two possible routes which seem to align
> with those concerns:
>=20
> 1) assume the c_rehash in shell script is good enough and adopt it
> 2) drop c_rehash from openssl recipe
>=20
> either work. The use of a different version for target and native does
> not seem consistent either correct.
>=20
> As mentioned, this has been in use in multiple devices for years
> without concerns and this has been changed under the hood when moving
> to OpenSSL 1.1. Also, the ca-certificate is broken for installation on
> target now (as it uses c_rehash) and this is still unnoticed.
>=20
> So I know your view on this. I'd like to know the view of other team
> members as well...
>=20
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

