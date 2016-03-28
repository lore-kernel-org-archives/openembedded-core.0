Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A704F607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 18:14:37 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id x3so143215719pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Nn4ABtnHUQA1MNXxVbvH6z+91Y0FAQ12aSRUciCTicc=;
	b=OY9YgyZMlkCNhXcJu0YHnvl3SPd/7HtMbkImx+mUJgTZtf6pZF34ysmZdIxH25un1t
	92g+vgUcxlNtM+AbSQgcjDFw22KAqSWA2jvVU5a2Ka8M1YMyIohBALXnjhtyYk5tg4l2
	4Nb/8zOQQnip44YSgIddoSsUPGbgsHjRz5lTC01TEta6TUaIJLrnFHx948Mh9rqSAhO3
	JaeAu1TOF+TidotV4QBvnVzLq2ki90SBcVgLNcpducwgvW35eYCoTGCdYu/oxDnotPeM
	9x16fRtmSA/QSBBxqqWs9nOIc6r4DhxyzHndLsVrmXVyhJNxzzi/XsRD5HQxvWm7tieX
	cJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Nn4ABtnHUQA1MNXxVbvH6z+91Y0FAQ12aSRUciCTicc=;
	b=RMbt3rJ/da1NE+qfvL4t2WrdubedWDzIMxdmKtYEYbXSzf/z6FOpyq2qzBjWpHZ7VU
	g79CX16r7flMsklpNIUB7rbIJyIGtAdlQO14jq3lPpoMrMT4W3jXLWcaI2sWwGdgtEZE
	vCzk/sGDRPB7CLlqrC3efEYNzb0eeryUcvmAzk1y0TBhwgU85oxod+b4ARAO0jJYAcMK
	qVejeKEazUneRwMn/jhV2Fcd9mqv60LuqfnotJQk13S5806FcoGMGGfAleXjYkdT54Xa
	1kh6ovpvhWY+3UXxU1Nuku/Ut5DE5dPdUkbfG/xx9A6QbI6x1bAxkZJbdADlagFZg1CB
	XDVg==
X-Gm-Message-State: AD7BkJLsFYuhidf99YtBnDCtQNycd3pZGX3YxJ8VNIbxEaeKQ49itjkf/GZWEO7HjUCysQ==
X-Received: by 10.98.16.198 with SMTP id 67mr45253817pfq.21.1459188877619;
	Mon, 28 Mar 2016 11:14:37 -0700 (PDT)
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com.
	[209.85.192.178]) by smtp.gmail.com with ESMTPSA id
	xn8sm37372078pab.15.2016.03.28.11.14.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Mar 2016 11:14:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f178.google.com with SMTP id u190so143521387pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 11:14:36 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.67.139 with SMTP id l11mr45049496pfi.112.1459188875694;
	Mon, 28 Mar 2016 11:14:35 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 28 Mar 2016 11:14:35 -0700 (PDT)
In-Reply-To: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
Date: Mon, 28 Mar 2016 15:14:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrFxoo+jyLTFdkNdAPiBYKQA8Y3uHtuJ_=-P=fxYtPCWg@mail.gmail.com>
Message-ID: <CAP9ODKrFxoo+jyLTFdkNdAPiBYKQA8Y3uHtuJ_=-P=fxYtPCWg@mail.gmail.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Mon, 28 Mar 2016 18:14:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 28, 2016 at 12:29 PM, Daniel Dragomir
<daniel.dragomir@windriver.com> wrote:
> ARMv8-A supports two main execution states:
>   - AArch64 - The 64-bit execution state including exception model,
>   memory model, programmers' model and instruction set support for
>   that state
>   - AArch32 - The 32-bit execution state including exception model,
>    memory model, programmers' model and instruction set support for
>    that state
>
> This patch adds tunes for 32-bit and 64-bit armv8a platforms.
>
> For AArch32 state, the default tune is aarch32 and include which
>     include by default hard float, fp-armv8 floating-point, thumb
>     and neon extensions.
>     Depending on the features supported by the core, the user can
>     select between little or big endian and may choose to enable
>     crc and crypto extensions.
>
> For AArch64 state, the default tune is aarch32 and include which
>     include just the aarch64 feature.
>     Depending on the features supported by the core, the user can
>     select between little or big endian and may choose to enable
>     crc and crypto extensions.
>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Just for completeness here, Daniel and I been discussing this (outside
of mailing list) and we agreed that including all the tunes supported
by the ARMv8-A core in a single .inc file makes more sense. As this
tune is still not widely used we think the more invasive change
present in this patch is fine as well.

Khem and Richard, please review and comment on this one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

