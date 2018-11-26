Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 39F766C0F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 23:07:56 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i6so5940290oia.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=nhY7/VjlhfzG4IrSkCNUreQP5cuTqfYxDlnlfWUm0VY=;
	b=mqtOD7d8Uu5Dn6QUOr/xZ/qDo8ycZdV2SSi+gEl3Q2A8dv5StkiqE6N8BQYv5q2A0K
	Uw1mD4kCzCKrV2HdMCWS8bnp9uCQ6pbUWOEOR65XX/oQ3iaTmr/khJ/x1zG+5c/KYJpr
	mbTz1NdKPgvzT8FvwsasxV6/+57wrlvpTk8SHVYsGo6dIr9c6bGSklECjGT6tTt+YjGC
	zu4FEn57VOVkRyHIAy2spqvLlTzPT8dnUkp+6EIW3ZLufWqvREg0DCQ5WXknjguQv3HQ
	qudNZhQv0H2noKVxYJTWDzcokY9ezIwV0BWO4EFluYldaeimG3ru+9s5IxnTZRMQTJ2F
	TxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=nhY7/VjlhfzG4IrSkCNUreQP5cuTqfYxDlnlfWUm0VY=;
	b=mFIhQGQYrOZev964ATVN52ycaJSSJ6fPviBWf2gy1y+7S8G77Hd58cljsPkIJYXy6J
	ppg05X9HDxnuPVbuJmqpu+UvxDCYXuPji4C4xHTzNccJsyRWWm70pixecguVM6xx2OIb
	l6uClRwTdeBYMxnkqHsGcblFP1nlYLwJDn8ux0wfGblrrHye5JLdujKE5pvth2GVyHWE
	1Re+PutoFjk6dCxuKl93Fl/8Kb3Qf9L9FNfavVy0KmHxh8Df/roz3w9tyj5RZ16LTne/
	ud43CkCCMRwEZmzC2pgh4og7vYSZwLvtY61MAjJyRRURehlKtP2Bh6s789vquL3vtxU0
	GnRQ==
X-Gm-Message-State: AGRZ1gKj44Tv8TUnLk3egxyiXDnEusThxaMQPaejrAvOITUUX5ypD6+/
	FPo22zLCSedknrxSdC1lZL8GdSn0Elv3UA==
X-Google-Smtp-Source: AJdET5einYxH5YC85Dy3IPVLrEB66/bgFyMidJm5w06N1Ljx+mliutIsalfPFVj1oYLmfOCnvoxMgw==
X-Received: by 2002:aca:c003:: with SMTP id
	q3-v6mr16978323oif.45.1543273677338; 
	Mon, 26 Nov 2018 15:07:57 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
	[209.85.210.41])
	by smtp.gmail.com with ESMTPSA id t21sm840853otq.67.2018.11.26.15.07.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 15:07:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f41.google.com with SMTP id s5so18326755oth.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:07:55 -0800 (PST)
X-Received: by 2002:a9d:1b2c:: with SMTP id l41mr9771667otl.1.1543273674781;
	Mon, 26 Nov 2018 15:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20181122225820.2553-1-abrodkin@synopsys.com>
	<CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
	<8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
In-Reply-To: <8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
Date: Mon, 26 Nov 2018 21:07:37 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrJ0Yshn29tSt-Aj1Gr01+XrZ7C_K4Yn4r6yA4CdkiCnQ@mail.gmail.com>
Message-ID: <CAP9ODKrJ0Yshn29tSt-Aj1Gr01+XrZ7C_K4Yn4r6yA4CdkiCnQ@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v7] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 26 Nov 2018 23:07:57 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexey,

On Mon, Nov 26, 2018 at 7:30 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> On Sat, 2018-11-24 at 06:57 -0800, Khem Raj wrote:
> >
> > http://errors.yoctoproject.org/Errors/Details/202185/
>
> Looking at the target name "u-boot-tools-1_2018.11-r0 do_compile"
> I think it might have something to do with bump of U-Boot to v2018.11
> and the error message in question was added in v2018.11-rc1,
> see http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea
>
> The problem is we use "sandbox_defconfig" as a dummy defconfig
> because otherwise (not configured) U-Boot's build-system won't
> allow us to proceed and in its turn mentioned patch adds a check
> for a target platform like "if defined(__x86_64__)" which
> we essentially don't satisfy and so we fail.
>
> There're the following solutions:
>  1. Revert mentioned patch
>  2. Disable "CONFIG_EFI_LOADER"
>
> Reverting is not nice and not future-proof.
> Disabling of "CONFIG_EFI_LOADER" might be done in a couple of ways
> like:
>  1. Patching sandbox_defconfig
>  2. Filtering "CONFIG_EFI_LOADER" from "sandbox_defconfig" right before
>     execution of "make sandbox_defconfig"
>
> I think latter option is the simplest and cleanest.
>
> Should I send a patch for that?

Let's add Tom (U-Boot upstream main maintainer) to this so he can comment.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

