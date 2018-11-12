Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 83E5B6C298
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 13:32:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i73-v6so3194841wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HKA+EIrp8rYwkl1uHpQ5ele3HmAhM8j5ApcRw4oEB24=;
	b=FcWxiMuUzasMf/RhdL8YloufEirnE5xnrJsz0Y0b1jjknvCTRzRU12wFbPLwQJyKNA
	BvmEDoY0Cj2c+GgUjxQR/HcYPfxf5rmAd2MXZf3iYjFEs72jCcLv3ViedVoL/n4nLs16
	VSQllyzlUpPo3/FI7yedXTgOi22vZSacgpotU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HKA+EIrp8rYwkl1uHpQ5ele3HmAhM8j5ApcRw4oEB24=;
	b=Th34zb6qu/4QACYRT+IyV/m13ljAnVb9ZLD9ttS2R1PdxV2+Yz0qUQG1R/UE6CnOdj
	xcaoAcZfYKLfvPkAYtms2DoQ8ijjUS3qS6TIMN5OPDhc3IX/1rSlw2XkIy7x5PybuC3R
	kUS+4SYvwwMfOcBU+33xxmWLK9l7iVP+HFJHSRo1lrcXdl3C6q5KRlfBtKTokwEvwbPv
	d8sZvDn0qsRunLnJXLHGGRqwK2Gkem0+R1FoUPgCnUS4me7M8QenC4ECD1lMYaF7H+1e
	ClHxA19o8MAR5FyixCWmScRL81zMk7hUp+gdobNLxDX3Pb22Xd7AbfzZEJ6X/Mze41jN
	rRlw==
X-Gm-Message-State: AGRZ1gKrq9r+R0ecf2f9+dlqmq0bIsZe9x8axGFpHELBTmYfwwC/74By
	uviUpo7nXUqaXmtdoRoE/9VpaA==
X-Google-Smtp-Source: AJdET5fzzrWTI16cAEsNSYgVVhQoWbz5tz9D0YlHPmimwi56Qe9or7LhDH7HLy646wtpOGv+onvqBQ==
X-Received: by 2002:a1c:111:: with SMTP id 17-v6mr1955954wmb.55.1542029529714; 
	Mon, 12 Nov 2018 05:32:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a1-v6sm7776434wrs.62.2018.11.12.05.32.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 05:32:08 -0800 (PST)
Message-ID: <54ecea0d0db3dc8b248928ae1e84e860ee547adf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2018 13:32:07 +0000
In-Reply-To: <67a0f3d9-f454-5e9a-0583-de60c0acc3af@windriver.com>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
	<5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
	<a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com>
	<2fd9b7ba-ca8e-fea4-c138-93f6f717f18d@windriver.com>
	<b4d475e75bf06b19dddc7ab34a93328d204d4673.camel@linuxfoundation.org>
	<67a0f3d9-f454-5e9a-0583-de60c0acc3af@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Mon, 12 Nov 2018 13:32:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-11-12 at 10:10 +0800, Hongxu Jia wrote:
> On 2018/11/11 下午6:18, richard.purdie@linuxfoundation.org wrote:
> > > I am trying to catch the issue patches
> > 
> > I dropped all the rng pieces from -next and the current build is
> > looking a lot happier from a timeout perspective. It does seem to
> > mainly affect x86, particularly the x32 target for some reason but
> > its
> > not exclusive to that.
> 
> The rng-tools is not installed to any image by default,
> I curious why it affect run time test

I found we could still get the timeout issues with the rng patches
removed so I think its something to do with the testimage changes. I'm
continuing to try and figure out which patches are causing it but I
don't think its the rng ones now. Sorry for the false alarm, its tricky
to figure out where a problem like this is from.

Cheers,

Richard


