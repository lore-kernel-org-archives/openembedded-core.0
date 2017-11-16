Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4890578793
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 12:02:22 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a75so12599967oib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 04:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=baUAhfQIIVXYWaQd+jkiNTterBSJzdHufLrITkU0eew=;
	b=NkpzfTPNHjveXLUNFtmytiIJHqf0OqGDYIswjktlbRROcJm9n8/YsgZzKK7h5JEX6f
	ocRekSwKJeNUdF3a91p23AjC5uvohSiBiTBnP8r3DwDco3zg5EPq81G/NCe8dRL2A8Ax
	WqZFTVMHuIge9+zV+Y1LOkFXs5OfLH+baZHFU9oIveYLKZG36E50AptEZZbqXw3oij9i
	Keg4aOvlrRAxeY7rZEvZtpBIlowfJKqbCujYzd0nzwSduEOXac/KqwLHGbdutCEJ+CBr
	m4J8fhaQ+eubTUWgSwpJTVsSd/E74i/Kk5RDOgvS4C7P9e6En642tUkqS0lucV3I4G41
	1a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=baUAhfQIIVXYWaQd+jkiNTterBSJzdHufLrITkU0eew=;
	b=NhloCUS/QopFXC15hb5yQ536cRTAkhJpfW1IP7LNQzcTqT6u/FIPlD12QlGrh7AjPP
	p0EnVDRutOJ+PKaujt1DmCPamnHFvxNC2LKH0zv3Po90pYYI+s/TRJ7w360F8tzeUwh2
	b2gANpAZHFP1Uhm3NFQq8PDyJBJEfhYOk2tPTs99dCcrrz7KyFfwTcLrb59FrpvrPcqN
	VzY80kQh9L3VoMo/K3CWIyofG+3ktXPngJEFSetctahdTf3ZRKRjwXhC0uThnDeVjeZa
	ciH0iosxmB76PboAbSbKMg+TjsNrUkirqt1Elq7Ip1xoh19lkgnUqg3l8cO28eof2/7W
	cDJw==
X-Gm-Message-State: AJaThX4xRPZfrz+Gp4tlDS/nLmoj7hbDOdSeAGE5gd//6nYhHAXW4yKQ
	WWjijny5+k4hUkaMFki4yfA+f2Z3
X-Google-Smtp-Source: AGs4zMay4qRrGw1Mj9Z3eWu2k5AvPXzwfcj9iusTxfnwS4Mob7iStImneKy5tqyWYQ65T/o02XqkAg==
X-Received: by 10.202.171.196 with SMTP id u187mr729419oie.255.1510833743828; 
	Thu, 16 Nov 2017 04:02:23 -0800 (PST)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48])
	by smtp.gmail.com with ESMTPSA id v33sm389570ota.29.2017.11.16.04.02.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 04:02:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id e142so10455472oih.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 04:02:22 -0800 (PST)
X-Received: by 10.202.83.131 with SMTP id h125mr829433oib.329.1510833741876;
	Thu, 16 Nov 2017 04:02:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Thu, 16 Nov 2017 04:02:21 -0800 (PST)
In-Reply-To: <12cc8c4c-7d8c-f3c5-eef0-938ff9d16801@denx.de>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<52e78a6cf11a3a374fab68885140c2b4@agner.ch>
	<12cc8c4c-7d8c-f3c5-eef0-938ff9d16801@denx.de>
Date: Thu, 16 Nov 2017 10:02:21 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrR9X6Cr04hTvVPUTRnS5-1DjFVPsX+KOHXCmkznU3t2Q@mail.gmail.com>
Message-ID: <CAP9ODKrR9X6Cr04hTvVPUTRnS5-1DjFVPsX+KOHXCmkznU3t2Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Thu, 16 Nov 2017 12:02:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 6:12 AM, Marek Vasut <marex@denx.de> wrote:
> On 11/15/2017 05:47 PM, Stefan Agner wrote:
>> On 2017-11-14 19:32, Otavio Salvador wrote:
>>> This upgrades the U-Boot from 2017.09 to 2017.11 release.
>>
>> You might encounter this when building fw_printenv/setenv tools alone:
>>
>> https://lists.denx.de/pipermail/u-boot/2017-November/311505.html
>
> [...]
>
>>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>>      file://MPC8315ERDB-enable-DHCP.patch \
> I also see that the number of out-of-tree patches didn't change since
> last time, even though I complained about it ... why are these patches
> still here ?

Because you are the maintainer and didn't do your duty. Stop
complaining and go help please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

