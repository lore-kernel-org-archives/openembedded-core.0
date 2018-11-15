Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3C48C60272
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 17:03:18 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 192-v6so17335149oii.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=4bSb/h41SR2L+0z591SLipyJdgtl3MmhkTUlWunXPlg=;
	b=yH6ShdCy0oeJRVzx7LMFTlSEbO4M8Acp9kuReOzS8gmM2EvhJlOqjkLe9awGxNtn3Z
	Egg/UwxctpxgnVMFxPKSSyGn/9XBamvEgVW4RgJaYezH+8AWu5rtE1ejXj6/wK6Idl9L
	tCyCys8vtPCqBrLnbW+SRX2q7kTtwo6lOhovLdZtaSFU6jAGXwSAalwkhSqawO6xrPxv
	NNqkB3+9+M8XrLyvh9BlON5U72fktMN2cUrTXbiMlYjMtb9zqasyIJomqYax095XETkV
	0wwGbN80tHS0Xb5xI4g8nYIPUqMAR8GMU+2OyC1JbCMF/tkRLJJNLowXjxU7QtQW06qA
	Niww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=4bSb/h41SR2L+0z591SLipyJdgtl3MmhkTUlWunXPlg=;
	b=pcKLaFrcKgEAb+SlUGJfvb1xFG5BpJgsXCihjVRPaBuZIXVos0oeVwvn97X3FBD+Me
	doG1ZGAW4iSsp2aif/oTYnI3b2+9499vOzfjmNbdA0E4t6J0WWzNwSkvsLR4l8FBvD44
	MdNkWNO4Tf/Lvz5DNTv16gbOgc0QIKOnxJDIMZk5HOPYhsa4kOg1DPgg73/Ym2OAQz4W
	92C1spTVAJRenfA8HylapsjYXN68MeOwZUqaeVkc6cJFNjfTQyJI73RnhKL3MaK87zOP
	AQm9B4fAjRNaMDMSc2jq/ZVzoqBvsn68++sz/d2RbJZxSfkMI5fEsey2OlkFcJQxPHTW
	3sng==
X-Gm-Message-State: AGRZ1gL6uduryA1EAiOSh/r4uE5W6LRX8wsDt96dFi2bS+5nI0t46g9h
	YTR1MH2+oLdiPkO03SKnMWqAw8Dj7Ms4gA==
X-Google-Smtp-Source: AJdET5dNdlRr732mNTjCIxr1KVUaW/sxCKSO7K8+0H7SI2XCwXY7ToFDdQF+iV+azNZgaopugLqrQg==
X-Received: by 2002:aca:ce10:: with SMTP id e16mr1314635oig.317.1542301398802; 
	Thu, 15 Nov 2018 09:03:18 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
	[209.85.210.45]) by smtp.gmail.com with ESMTPSA id
	n204-v6sm5261308oif.35.2018.11.15.09.03.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 09:03:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f45.google.com with SMTP id s5so18655372oth.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:03:15 -0800 (PST)
X-Received: by 2002:a9d:5325:: with SMTP id g37mr4403894oth.253.1542301395261; 
	Thu, 15 Nov 2018 09:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
	<2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
	<804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
	<20181115092758.GA1430@jama>
	<104a73697f5072fc3abcf7d9cce47e95ca2e8c12.camel@synopsys.com>
	<CA+chaQd+_55SeR-61zi4DOU8iTyac=w-tEkBDJJvQb-3OvC8iA@mail.gmail.com>
In-Reply-To: <CA+chaQd+_55SeR-61zi4DOU8iTyac=w-tEkBDJJvQb-3OvC8iA@mail.gmail.com>
Date: Thu, 15 Nov 2018 15:03:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpzrh7-98eiEOOnbH+ASd4-Nt2=jErA_7dJi=7eZFYeag@mail.gmail.com>
Message-ID: <CAP9ODKpzrh7-98eiEOOnbH+ASd4-Nt2=jErA_7dJi=7eZFYeag@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Marek Vasut <marex@denx.de>, linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 17:03:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 15, 2018 at 9:35 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> yes fw-utils is similar, but has different dependencies and builds slightly differently.

fw-utils use the machine setup to find the default environment to use,
so it is indeed machine specific.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

