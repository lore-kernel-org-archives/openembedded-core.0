Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.960.1592422633046369468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 12:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05HJb9MR018269
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Jun 2020 12:37:10 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 12:37:09 -0700
Subject: Re: [OE-core] Yocto Project Status WW23'20
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <10c601d63e6c$61797c30$246c7490$@gmail.com>
 <8a0a5043-564f-a64f-a672-e0f78c3a2ad5@windriver.com>
CC: Sakib Sajal <sakib.sajal@windriver.com>,
        "Slater, Joseph"
	<joe.slater@windriver.com>
Message-ID: <00d45790-b2d1-dcd3-a935-878572f569fa@windriver.com>
Date: Wed, 17 Jun 2020 15:37:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8a0a5043-564f-a64f-a672-e0f78c3a2ad5@windriver.com>
X-Originating-IP: [172.25.44.3]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 05HJb9MR018269
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-06-14 8:32 p.m., Randy MacLeod wrote:
> On 2020-06-09 10:43 a.m., Stephen Jolley wrote:
>> One which isn=92t and is looking slightly more problematic is the qemu=
=20
>> upgrade to 5.0.0, help would be welcome there.
>=20
> Sakib and Joe have worked on upreving qemu.
> If things go well they'll send the uprev this week.
>=20
> I wouldn't hold M1 for it.
>=20

We could send the update now since all the oe-core workflows
that we have run work fine but we did find a WR specific
test that is failing so we're going to resolve that first.

Richard,
Let us know if the YP AB is bored and you really want to
test the qemu update today rather than later this week
or early next week.

--=20
# Randy MacLeod
# Wind River Linux
