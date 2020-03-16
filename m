Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 502C160CA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 22:20:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s5so23300791wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=pCoF2ps2OVIJa01Bsh0VyM9Dni18/0sK81RgFD5AgdU=;
	b=GTstKWZR/V4jRBoAx+T5LF5nxLZ/dmU/ACZLM9sIgzqDiTt/5GRVQBbKmcLsBsL/Dy
	W1BinVAXfG/m+YHV7Y/WXwRx3QSrIupcFS2zdFEddgCpBjqlLlDhHnebiFoxqj7Vsaul
	HW4VZCF/K1D81u0QY86Q8sDubdtKKSZO/2Rwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pCoF2ps2OVIJa01Bsh0VyM9Dni18/0sK81RgFD5AgdU=;
	b=V6gaUJLP9+og8GYf6YV2L6EUyAadReoP6ZSzMkt6dwiHUJOXDmb8yHV3SOEu7DUapN
	0uUl2Xc+j702UQ1v9V1bT8IXDegRmRuhFUk8ramdTz368Wx8Ane15ASLMRNTmT6IdeeF
	tkSpwELfbujE0BalOyPjxZWRISgutfzjc69ZAn8UzfbbGPr3z9yIm3lzxkZ5wXH9VSKq
	QOICNl3yAMVTTH5WTpjSRi16l4SREO269LwKcAAB/Og/micMRTDzqKnPeChFejqBulpV
	vSYPFh0QQyK1HHKjm+CdOsZf+9bTNGwb4UJGjR+RTnFKsiuB+ss+n4l06G6AKq8uTLz6
	aCag==
X-Gm-Message-State: ANhLgQ1kLzj58mWmgcRWq5bjPjVccnD8lfLZ/L8baQUaOeWUcEh4tFYk
	iEVh78L4OAgKk/x9wt1YwM40tg==
X-Google-Smtp-Source: ADFU+vtokf1AC14x84folaIaFNVd4xQeOoQl4cvjwRi1Hvopy+Yw1T6mQSK0k80XaVe8KQAOlQOjyw==
X-Received: by 2002:adf:ed0b:: with SMTP id a11mr1547218wro.78.1584397210939; 
	Mon, 16 Mar 2020 15:20:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n186sm1309521wme.25.2020.03.16.15.20.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 15:20:10 -0700 (PDT)
Message-ID: <8eefd1f82f080fd17e2880fd979c87cf3b37090e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, =?ISO-8859-1?Q?Andr=E9?= Draszik
	<git@andred.net>
Date: Mon, 16 Mar 2020 22:20:08 +0000
In-Reply-To: <CAMKF1srjjKfaLFQH8UtL+-xdmB6_HtX=MaK3ZnJjP7LHBV2qng@mail.gmail.com>
References: <20200316190628.19383-1-raj.khem@gmail.com>
	<62485e60-999e-54c6-09a6-590a8a3e2072@gmail.com>
	<CAMKF1spN-06_oN-gnXO8osuKva3DerMBoGJ8zf41ybQPtm2Csw@mail.gmail.com>
	<c741696cac17d9b3cc50630c32ba9b0a46396cf0.camel@andred.net>
	<CAMKF1srjjKfaLFQH8UtL+-xdmB6_HtX=MaK3ZnJjP7LHBV2qng@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: Extend parselogs to rpi4
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
X-List-Received-Date: Mon, 16 Mar 2020 22:20:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-03-16 at 13:50 -0700, Khem Raj wrote:
> On Mon, Mar 16, 2020 at 1:37 PM André Draszik <git@andred.net> wrote:
> > On Mon, 2020-03-16 at 12:17 -0700, Khem Raj wrote:
> > > On Mon, Mar 16, 2020 at 12:12 PM akuster808 <akuster808@gmail.com
> > > > wrote:
> > > > 
> > > > On 3/16/20 12:06 PM, Khem Raj wrote:
> > > > > rpi had additional diagnostics which should be ignored [1]
> > > > > 
> > > > > [1] https://github.com/raspberrypi/linux/issues/3195
> > > > 
> > > > So does this mean OE will take similar patches for every BSP in
> > > > the world?
> > > > 
> > > 
> > > suggest a better way and I will do that in BSP layer.
> > 
> > Not sure about better way, but in my BSP layer I have:
> > 
> 
> thanks it certainly is better than what I have, I will adapt to it
> 
> > layer.conf:
> > -----------
> > DEFAULT_TEST_SUITES_remove_mx7d = "parselogs"
> > DEFAULT_TEST_SUITES_append_mx7d = " parselogs_mx7bsp"
> > 
> > lib/oeqa/runtime/cases/parselogs_mx7bsp.py:
> > -------------------------------------------
> > from oeqa.runtime.cases.parselogs import *
> > 
> > mx7bsp_errors = [
> >     'list of messages',
> > ]
> > 
> > ignore_errors['mymachine'] = mx7bsp_errors + common_errors
> > 
> > class ParseLogsTestMX7BSP(ParseLogsTest):
> >     pass

Its definitely better. I'd also take patches to further improve things
to allow easier customisation by BSPs. I did think there was some
mechanism but I'm struggling to remember what was intended.

Cheers,

Richard


