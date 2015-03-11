Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D75BA739F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:13:20 +0000 (UTC)
Received: by iecsf10 with SMTP id sf10so4519255iec.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=L0tPH1+s7btRlIr8N/kVk80lXSvVCIA/CCWdKwiUMn0=;
	b=iOdMQa99E0oOr7z3lpA0Wr7pONsaTDuhLKiG9RMC17jHevDDOKMqMC4IXuZODRz7A5
	VauVrbC8fDp+rU6NG1gXnLjF6cMsnK9y6pQcnjkQbmBmjwN7W+HZeML1U1a1YUQo/3+o
	+JJ21Ies4GQxCOuKAz0w+3/+tA2RXH8AMf59mHPRxq5ukdXPkmss2ZGORc+qOJ5rkcyG
	VQ2woxBlp5x0rQfW6hh2Nm2/oQTNCKFaynM7glcl0UfmNOM8gNfRYS3isL/WC8qaz/Ff
	V3q8ln82WBHgCcGFCk3n8OYy1yRwP2fGgLDDjIbyORCmq5K64Vr9GLLUGqqykZ/JDpcd
	gVOA==
X-Received: by 10.50.72.108 with SMTP id c12mr4063464igv.27.1426039995878;
	Tue, 10 Mar 2015 19:13:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 10 Mar 2015 19:12:45 -0700 (PDT)
In-Reply-To: <54FFA2E4.5080500@windriver.com>
References: <cover.1425979509.git.liezhi.yang@windriver.com>
	<30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
	<CAMKF1sqgaHnXqynr2rEihsJ62QPnUyTw8q07-YihWA=3kUyZ=Q@mail.gmail.com>
	<54FFA2E4.5080500@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Mar 2015 19:12:45 -0700
Message-ID: <CAMKF1sq2BnBr_cdVJOngc5Ltmsiv2pzd7aFQFpE8cn7WgVtWwA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: workaround DEBUG_BUILD for arm
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
X-List-Received-Date: Wed, 11 Mar 2015 02:13:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 7:05 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>     [CC]     btrfs-show-super.o
> {standard input}: Assembler messages:
> {standard input}:3368: Error: invalid operands (.text and *UND* sections)
> for `-'
> {standard input}:3374: Error: invalid operands (.text and *UND* sections)
> for `-'
>     [AR]     libbtrfs.a

I meant detailed. use V=1

