Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7E46561C3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 09:15:17 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id g126so8229843ilh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=DXqRe6nYP+So5WsU+jHP5ksvh7PwoNFTprdtU+YFZZk=;
	b=WbWKvEynYil2yX6KsiHfHPRuYBX538Vix0nu2lM/SFcmmf6d9S+bRhoy7weCC8b49w
	96GkNlGJp/R1Nm/EhpNrIr0S4kseClEbort9GozTsoDXVh4qyKqvXHtEXjKAI2v4oh6v
	JhOejP8yZw8YER1XH3yEjTbawVDAgnTMZPfowv4mXqZMCyyWoEdCKW/YKHg8VusRXPV4
	+YUqeiacHtgdAsimCFwHVDBEy3wOuWxT0y+Er03AFulZ7tT3Yq2FU0ghscf7SIAGk37O
	5psv6FcMYzDaUaNfvbJ1HXm6S16jzF+R9L1MXZ/cE3gFuyhNp7jRTXoZevSNz6nTmM98
	8WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=DXqRe6nYP+So5WsU+jHP5ksvh7PwoNFTprdtU+YFZZk=;
	b=faO26QBKZzLZahCjSw+5rxOk7caO1F2DoRBB+BH13b5dDjRXLzXf04L2bC12ppGIMk
	5ukhrYiKcSM6w3bi9dhBCiCjZASim0+pGciaLTykgA06ioxU0qv3W5818LppEjGlyO0w
	M9c178MEvYs7xwl/g4daqKy8lHJTm+AC0tgDdCdRVlh4xk7ukNnB5az9sT+pGSIl1DB3
	lQTV9n0G9XfzsddPmpOdOrAP0L0M0pOYke6dWl3Yfmo8xGxnGstZYUR4b/fnarKfNvCN
	dgsaYMAKnk9oBp5a5FaDDiQNB4pICy/EOgN1Y+SzCko43ngUbUr/WEPcBDq+/11QByHq
	v6Xw==
X-Gm-Message-State: ANhLgQ0B1SZi3Yp8bKDi5RAGAD8Oi3X6G1OPhTVMs4tzW6R37NAGrmsb
	9vlBiYQK7tB9gLko2lGO7OHhyad0RoF/SiihQrA=
X-Google-Smtp-Source: ADFU+vsWglJviqfTHbwzUV82XvHHUF+qwsR8gnr4Erk+C+Wo/4Gfqz5ftlHJkUaruyCbGjbgYu57DgQ9tDRaMwTxxr0=
X-Received: by 2002:a92:216:: with SMTP id 22mr12564037ilc.53.1584090918350;
	Fri, 13 Mar 2020 02:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:ed34:0:0:0:0:0 with HTTP; Fri, 13 Mar 2020 02:15:17
	-0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Fri, 13 Mar 2020 20:15:17 +1100
Message-ID: <CAA=hcWSGmz-GRFac-UR6AcTRyUYjvf1buRaYQvvCMrr__OuV_g@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: menuconf u-boot
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
X-List-Received-Date: Fri, 13 Mar 2020 09:15:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I tried to run bitbake -c menuconfig u-boot, it popped up a terminal
u-boot-imx configuration:

make: *** No rule make target 'menuconfig'. Stop.
Command failed.
Press any key to continue...

How can I  run menuconfig u-boot?

Thank you.

Kind regards,

- jh

