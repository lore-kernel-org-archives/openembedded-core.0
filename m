Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0A17571E4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 18:01:39 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id l5so2042616wre.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=fhB5KsFtMpZsFqddBp8itClrq1WKs6hbWSgL2WLuTVY=;
	b=KzJFPmegCP1AGr5SL5x0SoLRH1F3dcNMY0jIds9NXnF6IhbIOaQWN/RrzIm5Vs/vFP
	ucHcul1Tp9xO1fYCPCKOEck2Wqlf7vVCKqvsh5tjTNK1rgM4LJUzY4x5gCgU02InGwy4
	Mx3lTlPuoHpDkxlHqQxwiDD2Yd8WDlyhmCKDgmB9iRPIfwJUZw5LYqHGZbu8y0S+oqoG
	pjw79V4e5XmiE2Jk/InTNLobX/QE2ytjANhGqzNeQvPKfFGgAdrjTvbXeRTKEeZGaW1c
	4obfI7IwmNgzxGFJ4LCaNjHTbtBJXFSKvE6dLC86cxHMBGt6TyxLV6UoThbZTQvd9BM9
	81EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=fhB5KsFtMpZsFqddBp8itClrq1WKs6hbWSgL2WLuTVY=;
	b=gowpqeDpzokYuyO3gqtzefs6rcUN+Gk2YBKvwSOHIyrMyc2H+O5WLDAfWH+kf+Ukzs
	K5pAQNMaeKuIX31oH/BKlxBefDctewRZ0eiaZF94HYwqhFqXC9ss5e9gJMuTJLX/WcU5
	j93rIdmTsJuJKZNqZla5NV5OhCSfvuIP2GOZCqfYthSiacq3n9fZhq6MMx6xNdqDHVOj
	biFzkf5gbiXm6pDFtGThwyxqIxAKcGFAvX9/atMxjKRrULz7lkrxhFkHDSLVMguw4Ofp
	X6OIW5f8Zb3vEVM/eaHDvxRTLMC9FHxfHmDAY/AQfIPMzQEba21Zg2cELhEb2l/bp/ys
	7CDw==
X-Gm-Message-State: AKS2vOyEVSqxx8o80gmme78K3OSYA65x8GGkfCq4INRCiwpe+1IR66xT
	BkwxMmxB8pFoIForbuw=
X-Received: by 10.223.172.15 with SMTP id v15mr28664850wrc.84.1498068099505;
	Wed, 21 Jun 2017 11:01:39 -0700 (PDT)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com.
	[209.85.128.177])
	by smtp.gmail.com with ESMTPSA id o7sm15697139wmd.0.2017.06.21.11.01.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jun 2017 11:01:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f177.google.com with SMTP id 77so145220999wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:01:37 -0700 (PDT)
X-Received: by 10.223.163.197 with SMTP id m5mr11825713wrb.128.1498068097086; 
	Wed, 21 Jun 2017 11:01:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Wed, 21 Jun 2017 11:01:36 -0700 (PDT)
In-Reply-To: <20170621165256.GL27196@bill-the-cat>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
	<20170620235544.GO28053@denix.org>
	<20170621120317.GG27196@bill-the-cat>
	<20170621155023.GQ28053@denix.org>
	<20170621165256.GL27196@bill-the-cat>
Date: Wed, 21 Jun 2017 15:01:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqZoPwo128rHr1kJfnP9590YySU4GCb3gDOTxPeG4WGrA@mail.gmail.com>
Message-ID: <CAP9ODKqZoPwo128rHr1kJfnP9590YySU4GCb3gDOTxPeG4WGrA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Brad Mouring <brad.mouring@ni.com>
Subject: Re: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 18:01:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 21, 2017 at 1:52 PM, Tom Rini <trini@konsulko.com> wrote:
> On Wed, Jun 21, 2017 at 11:50:23AM -0400, Denys Dmytriyenko wrote:
>> What I'm arguing against here is some partial solution - modifying the global
>> recipe in oe-core, but still require .bbappend to provide a file. It's should
>> either be "do everything in .bbappend, like we all do now" or "do everything
>> in main oe-core recipe and let machine.conf define it".
>
> OK, we should do it globally with a ??= of the in-tree example only?  Or
> just let u-boot-fw-utils fail to build?

Maybe the best is to allow for boards to have its fw_env.config inside
U-Boot so people can provide a 'good' base for users. Doing so, we can
teach the recipe to install it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

