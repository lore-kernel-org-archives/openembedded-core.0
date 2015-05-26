Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE877322D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:01:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4Q71LHf013574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 May 2015 00:01:21 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 May 2015 00:01:21 -0700
Message-ID: <55641A3F.8030905@windriver.com>
Date: Tue, 26 May 2015 15:01:19 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <55641868.1080406@topic.nl>
In-Reply-To: <55641868.1080406@topic.nl>
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Tue, 26 May 2015 07:01:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/26/2015 02:53 PM, Mike Looijmans wrote:
> I get this when running
> bitbake -c menuconfig virtual/kernel
>
> scripts/kconfig/mconf.o: In function `show_help':
> mconf.c:(.text+0x884): undefined reference to `stdscr'
> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
> checklist.c:(.text+0x2c): undefined reference to `wmove'
> checklist.c:(.text+0x4c): undefined reference to `acs_map'
> checklist.c:(.text+0x54): undefined reference to `waddch'
> checklist.c:(.text+0x66): undefined reference to `waddnstr'
> checklist.c:(.text+0x76): undefined reference to `wmove'
>
> A bit of googling reveals that this is probably due to "ncurses" not being present.
>
> I just can't figure out what the proper syntax for this dependency would be.
> menuconfig needs the "native" version, so it's not simply DEPENDS+=ncurses here.
>

Try:
DEPENDS += "ncurses-native" ?

// Robert


>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>

