Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6118760B29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:05:14 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u25so36469763qkk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=C7gf+HoUNM5D7AFVRZ4ytqVNfVnvsYKsFOWYTjJ+5RI=;
	b=gA2b1yhcdA63MJnlVHiBqPVAifXENz61lRWcgd0Ic1kFWbU6PTIROMdxjg1kYwnrAQ
	OGK0MXD4rY5mlMAMJcbeDy9LgttnQRuBoNLta1LfYwTYaRNhNxLnpQKgfsGGX3zePLf0
	+oqzf6npecWa0roK8BtHr3zroivzxVv8Msh9MuYwTiW+qkCRR/mKr48nleBf+MrEYRLC
	uhXhTkKEaNc2+am58YfPRe1iZFX6ppSwGabzwYC2z5WKOJw9x2Y513l3urvtcbT/VQEn
	q/30zFpu9V9tW3KzlZooEBRCTJX2sLNnSkFdVDD8xW9E4Dk8qvYFbP5Fr+01ii7e1NRB
	Btlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=C7gf+HoUNM5D7AFVRZ4ytqVNfVnvsYKsFOWYTjJ+5RI=;
	b=hsfFSMu6o1bVLCmTUAvpWCHH2pvpFKBiRiy3yMbErffpxSWlWQrLjVmSQUbo1doj2/
	4U0BGTbKXKFIW5XX34nBxG5Ju9hLiZ2/JqVm4rM3QuGgB8nj+rBBiTkXSzeTYGs93lWt
	n5ijdd1k//ZyKJU6EllVfCT0uaHfm18baGUhoPR6pwR0I0n07yrZYUDqtvFOxgdzgwtu
	eSYO/IBFZ0ms/dqaMILwJc5urP9WoP8i5myEBRz5sZn1hGkrntrien1FLlEN+Y1HKCoP
	S0xkJ6m4dd+E/xlwiatUoao28ixBkFyV7tVKPin0kCBsVWD0MzxRrT5qEdDf7tLLxeLD
	YGVg==
X-Gm-Message-State: ANhLgQ0pVRtXaAMsOrD79DdFZ91ER2yAWwQFDQB47AAyA8xfck5oniUY
	DwqkHdVvt4QiinxGb2SXoXP3MhWVf/9rVA==
X-Google-Smtp-Source: ADFU+vvkcDTX5BKsMeGSCgJmmp6F7J2EYawQysEmD9sPLgzgi2TG10LS0w/SWEErMwBvVWQvIm7JQQ==
X-Received: by 2002:a37:9b4c:: with SMTP id d73mr1846031qke.242.1584500715108; 
	Tue, 17 Mar 2020 20:05:15 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
	[209.85.160.174]) by smtp.gmail.com with ESMTPSA id
	h47sm3793410qtb.75.2020.03.17.20.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:05:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f174.google.com with SMTP id l20so19527322qtp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:05:14 -0700 (PDT)
X-Received: by 2002:ac8:7c95:: with SMTP id y21mr2357236qtv.387.1584500714040; 
	Tue, 17 Mar 2020 20:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-6-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-6-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:05:02 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2P02hBqz66eOTmRwBJ6E-ipv4xMmJU2+c425B9mEjXw@mail.gmail.com>
Message-ID: <CAP9ODKr2P02hBqz66eOTmRwBJ6E-ipv4xMmJU2+c425B9mEjXw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 05/11] systemd: Remove X11 related files when disabled
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
X-List-Received-Date: Wed, 18 Mar 2020 03:05:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> When X11 isn't in DISTRO_FEATURES, remove X11 related files.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

