Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web08.740.1615582730242621860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 12:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Dxypc2pxXz1qs3D;
	Fri, 12 Mar 2021 21:58:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Dxypc2THSz1qr5L;
	Fri, 12 Mar 2021 21:58:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id O6EexFZE_qCZ; Fri, 12 Mar 2021 21:58:47 +0100 (CET)
X-Auth-Info: Gx+0PE5v4Zjwxx3y7bJV42qExrmnh25RNfYbTkKmies=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 12 Mar 2021 21:58:47 +0100 (CET)
Subject: Re: [PATCH] linux-firmware: Package RSI RS911x WiFi firmware
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
References: <20210312153049.96411-1-marex@denx.de>
 <09f4663de2447ed8a6cf3ca16e1cef921987f368.camel@linuxfoundation.org>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <77a5b4a4-6a61-07ae-eacf-088e3d926126@denx.de>
Date: Fri, 12 Mar 2021 21:58:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <09f4663de2447ed8a6cf3ca16e1cef921987f368.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/12/21 5:55 PM, Richard Purdie wrote:
> On Fri, 2021-03-12 at 16:30 +0100, Marek Vasut wrote:
>> The RSI 911x WiFi firmware is already part of the linux-firmware
>> repository, package it to make it easily available.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Steve Sakoman <steve@sakoman.com>
>> ---
>>  =C2=A0.../linux-firmware/linux-firmware_20201218.bb         | 11 ++++=
+++++++
>>  =C2=A01 file changed, 11 insertions(+)
>=20
> Doesn't seem to apply against master?

Argh, I rebased and sent V2. That should work better, sorry for the=20
inconvenience.
