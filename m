Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C869460722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 17:28:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so12698474pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7xriPMdSO/O3Hw/hPHRA2PQj0jxFN84YWDE535HtKcY=;
	b=vOLpBxgESWO+6edvvozhW9qQOOfY3mSo4wogc2HKYXTLTa8lrlEwgm8c1jvOPC+ZR2
	PcpoIYh1KyyPT5MQbdYtMy12qy1h7Buyp0fJOg94emch3tlHAtI73Pqct1LXXMTKmbBp
	w1kE120yLx2bI1fYkIriMiMuH9g14jDdfSqHSpgekv/nS0LqQ6VhwKJvl3jTBfQbBpY9
	O3NYUphKTUteWlJmO7xUmf8q7NaRA4Roa+vuPf82sKoVgLkjN6b/Zz/7MKE9B4230E+E
	n5p/tA/pArVYOO/jJwNRIZeEjGy5z0cw6KhbzsEwZEQ7xdUjjpc9IsjIz81P1sw8xGnW
	KYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7xriPMdSO/O3Hw/hPHRA2PQj0jxFN84YWDE535HtKcY=;
	b=AEVqh/8GZos8srIDbqmAIlZVW6tbVgXOyrE65IkiykEMdMsdsDYZiiuufbIy/hPVsJ
	C7NXpu49G+kxsl85D1abULji6Tya6bYaCX8NFHzJSvTmJ4p+hVjkbTerJrx7+lRqZDm6
	gfgeUEBxUbiatzl231Wvs5j/dwQuuM0SJZp6EwWayURbO/13Xfeh149v7TEZ7gQqRT41
	Q7zR63WodwY0JY1iCV27S/wlloik1dDrYPVAWrofOwAT+7CTTB99thKLzzt/1x4h3NCl
	7Atx85iDsRWdMcAsLPRbSTZMQ+l7l9pQb+U8SuJcIfT/T6MwB9KJluHzd+qZ+y33c8mp
	73xw==
X-Gm-Message-State: AIkVDXKj/UcLh+49Kbbf5dWCdi9Ock1acmUMEqX4EZh78/kSKF/OEXCBRszaTox8Gkoxkg==
X-Received: by 10.84.218.197 with SMTP id g5mr21446982plm.173.1482427703646;
	Thu, 22 Dec 2016 09:28:23 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:dc6c:df58:7743:431c?
	([2601:646:8882:b8c:dc6c:df58:7743:431c])
	by smtp.gmail.com with ESMTPSA id
	w11sm56195680pfk.75.2016.12.22.09.28.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 09:28:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48AC0FF12F@SESTOEX04.enea.se>
Date: Thu, 22 Dec 2016 09:28:23 -0800
Message-Id: <84598796-18B6-4415-8139-696137203834@gmail.com>
References: <1466986302-33565-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1466986302-33565-2-git-send-email-leimaohui@cn.fujitsu.com>
	<3230301C09DEF9499B442BBE162C5E48AC0FF12F@SESTOEX04.enea.se>
To: Sona Sarmadi <sona.sarmadi@enea.com>
X-Mailer: Apple Mail (2.3259)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Made spdx support SPDX2.0 SPEC Signed-off-by: Lei	Maohui <leimaohui@cn.fujitsu.com>
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
X-List-Received-Date: Thu, 22 Dec 2016 17:28:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 22, 2016, at 1:07 AM, Sona Sarmadi <sona.sarmadi@enea.com> =
wrote:
>=20
> Hi Lei, all,
>=20
>> --- a/meta/classes/spdx.bbclass
>> +++ b/meta/classes/spdx.bbclass
>> @@ -1,12 +1,9 @@
>> # This class integrates real-time license scanning, generation of =
SPDX
>> standard  # output and verifiying license info during the building =
process.
>> -# It is a combination of efforts from the OE-Core, SPDX and =
Fossology
>> projects.
>> +# It is a combination of efforts from the OE-Core, SPDX and DoSOCSv2
>> projects.
>=20
> Why replace Fossology with DoSOCSv2? Why not make it optional?
>=20
> Has anyone any comments on this suggestion? AFAI see this patch has =
not been accepted yet. Is there any plan to do it?

I think DoSOCSv2 is more integratabtle into Yocto/OE infra and seems to =
be having, fossology setups are complex and is
slow too. so it might be a good option to have.

>=20
> Cheers
> //Sona
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


