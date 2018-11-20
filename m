Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 799296C49A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:40:18 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id m15so4139528itl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c7/y1PnNXZznhDJl8Q1OkNht10edIA1MpjNjbs4E6BA=;
	b=y+Qpjj1+WRlIJWd6cUZNgY1u4Zfqu633DqTtMOYGL4gOuLdS9+tqHeIW5ahmylUF9b
	zZMImrgA3H0akjbGjfpEhFr2oeF8/b5xPY5gOasF+W6TlAuY8awY6FT8DaOP1WUOGG5l
	nFJCpi4aa1Clqm61ldnddLfTN+Ym2I87lqViTjuEjI43JuFpoZ3oXO9mQewlLaIskfSg
	M90L5pMK0LdGyrF2TxFIJD+Hw6yBfxWOvRCmTrkPm2NLTCv5F88mrwoWQuNV4K51QiLI
	5uUp7ayhScpD5JX7uWfedTpD1H/KPfeArSTLHwixMFki+DbieyRxaOUyk7QqwdgzRwGF
	KRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c7/y1PnNXZznhDJl8Q1OkNht10edIA1MpjNjbs4E6BA=;
	b=qsPW50wEoiKW1mouUDn2pF/HwoRu1KPjVaQI0RBqkbDwaVWwwwSZWqAeUY4nRKo0tg
	51Xsxy1OTsVYB+nBdwk45IcFg9dloXEhO8KIAhwbG38H01zvi1WjYsjr+0cQH56mUX4p
	L/snkyjXeFmW3Lm41g7EWjQVwUe89oyGnRV5gLIXib797g0ro04wszr1n/9SYhk5DGLA
	LOq/Y3e/DCkoYp5jOy0tjDIp8N3UzFfKKa4MRPUSRmc46X6LKaWHDlkNPTQiV3XX3uU5
	eTLXJoqIHGJXXesqNpMZyLbieE+hDW9UUdmTZpIfABE03LG/VEr2F/xSDs3laXyJbcQc
	EGZA==
X-Gm-Message-State: AGRZ1gLqZQTO4d2r47E4OiLUamFmCPVHDVmJ3pF/EUCwfr8nMRVmmAnw
	p9B4V33POYujrh+Kt2cq2Cywqm/CZ03trk2vxUMgNw==
X-Google-Smtp-Source: AFSGD/UBVxpjNdFtKJ/UzchB8YNgiqRxV4ZLjn0XrZ2y1npZ7wFSxS6XKRmdXV04huL9/owkrzO8rkkw3Ccc9LBM0Uo=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr2392951itj.62.1542728419457;
	Tue, 20 Nov 2018 07:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
	<153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
	<CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Nov 2018 15:40:08 +0000
Message-ID: <CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, alexey.brodkin@synopsys.com,
	OE-core <openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 15:40:18 -0000
Content-Type: text/plain; charset="UTF-8"

(hit sent too early)

Of course how big are these tools, and is it really useful splitting
them up?  If we're talking a 10k binary, is putting them in separate
packages worth the complication?

Ross

