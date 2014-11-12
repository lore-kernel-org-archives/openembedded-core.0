Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E0E90720C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:28:57 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so4374873wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=SRnSxlcJUgahmmpvYmMB0XNcBSkOZFLYRZwp5ZS1DT0=;
	b=fN/KoCfhgTa+vwOOuilKUg71qKTPO+as9UePPG+r3+53XOqPwANRzgaxjf21KedfUX
	baWMYJvWED43JqrZspRmg+XGriaBHix6I6o0T2Cu0OhldboDD1iVlx4PH5eYaBFD/lk0
	AsE00WrM4Q692sWWOngA7Bv/ViwTJcBaHrPWBk1XxQgDX+fZlrW2q2byQgROEiVwl/Zt
	UQGzJhYfnbPk4F1LwnaldqxGkBonydGe2chBYSXvaJMAS/lwcKw2M5jyUWSpcFnm+mFX
	HLVVW7rIxBTVPRZdLburqeq0t5wEM16Wht1oA1eHa7LtPcAQcY4gRFOVXkmhi51un2u+
	0yuQ==
X-Gm-Message-State: ALoCoQlALIXTPERlLM1J/rhLcPsVrlhjhjh+11zG97GfHLHwsgNr17aMOkwbNxb2zmnfv0EfOgru
X-Received: by 10.194.95.200 with SMTP id dm8mr3705282wjb.133.1415788137801;
	Wed, 12 Nov 2014 02:28:57 -0800 (PST)
Received: from ?IPv6:2001:610:612::94dd:88c6:52a1:cac2?
	([2001:610:612:0:94dd:88c6:52a1:cac2])
	by mx.google.com with ESMTPSA id w5sm21056407wif.18.2014.11.12.02.28.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Nov 2014 02:28:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <546171BA.3030300@windriver.com>
Date: Wed, 12 Nov 2014 11:28:55 +0100
Message-Id: <039910F0-0321-4FBE-8EFE-5FCC34CE7C00@dominion.thruhere.net>
References: <cover.1414394124.git.Chong.Lu@windriver.com>
	<1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
	<546171BA.3030300@windriver.com>
To: Chong Lu <Chong.Lu@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: add bash to RDEPENDS
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
X-List-Received-Date: Wed, 12 Nov 2014 10:28:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 11 nov. 2014, om 03:17 heeft Chong Lu <Chong.Lu@windriver.com> het =
volgende geschreven:
>=20
> ping

Anders has 2 questions, you only answered one, maybe you can try =
answering the second one before pinging?

>=20
> //Chong
>=20
> On 10/27/2014 03:16 PM, Chong Lu wrote:
>> This solves the following warning:
>>=20
>> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires =
/bin/bash,
>> but no providers in its RDEPENDS [file-rdeps]
>>=20
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd_216.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_216.bb =
b/meta/recipes-core/systemd/systemd_216.bb
>> index 6d3e47f..8bc1cc8 100644
>> --- a/meta/recipes-core/systemd/systemd_216.bb
>> +++ b/meta/recipes-core/systemd/systemd_216.bb
>> @@ -202,6 +202,7 @@ FILES_${PN}-vconsole-setup =3D =
"${rootlibexecdir}/systemd/systemd-vconsole-setup \
>>                                =
${systemd_unitdir}/system/systemd-vconsole-setup.service \
>>                                =
${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.serv=
ice"
>>  +RDEPENDS_${PN}-kernel-install +=3D "bash"
>>  FILES_${PN}-kernel-install =3D "${bindir}/kernel-install \
>>                                ${sysconfdir}/kernel/ \
>>                                ${exec_prefix}/lib/kernel \
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


