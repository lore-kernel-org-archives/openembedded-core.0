Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B1A047F98A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:36:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q70so2903890wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Zk5bDwIRIiwVUQfQqEN0dxCJkmlXhklIWC7t2UfnmhY=;
	b=hMllRpnOJvOtTRzIITRr9zWf8XGKeprKKomADZaFOVFR53jCkDvpIS0AmZcTEUDAbO
	gNOnI4trFP5OelMjHeKtNIms5oySDFfTGImzIy8rH45pT1Nuu99oJvbDB5C8ZPbLCJlZ
	gXo8a1M2zazL6Y34wbO2IzYA8sWbOsW50YNFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Zk5bDwIRIiwVUQfQqEN0dxCJkmlXhklIWC7t2UfnmhY=;
	b=IfCKYhuLLf65Iyh9kQP65BcxiNihglOf2GAuYl7WdhWzw0jgXA7uMwZkmkG+LZl3Uf
	VOTb47zXAPx37neIWx8JXO37g/e0jYGaS1UlrwnIHPnRPxphEuZCI+Am37astHjqiouR
	4tlRvv+ysQI3F3i74OwBbjI1xOb79vbTihEvy1Znv7mplXU35oRgdH2Y+uRdFuCOs6A1
	VNe9JJ7oveZtt0fzwfRzMgQSlDkGXFerrokkVnu1YfIoITFP+kdWewTE4UlOCBMdwycF
	+BhkWPq86w1/iAgEzdd1A33JKhbghkpMFK5dY9Og1RAjBf4iLD4dJ3NClduuBFyQ9bSA
	ixqQ==
X-Gm-Message-State: APjAAAVSzD363Ttpq0iz86CZJgrngFnqhDZkq71ViV5rirTtdtRvQbPV
	n6BmrMcIc6/JhiPFAPtwDCKxiQ==
X-Google-Smtp-Source: APXvYqz0XAVsiA2lp06rtlHiBIFuOholg4Z7sWNxL8OECqnpB8cFKjb/6LBWGXlrH+D8TJEIMyw9Vg==
X-Received: by 2002:a05:600c:2056:: with SMTP id
	p22mr4983962wmg.44.1571924187216; 
	Thu, 24 Oct 2019 06:36:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 79sm3468037wmb.7.2019.10.24.06.36.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 06:36:26 -0700 (PDT)
Message-ID: <dfce773cde47183486e5b58126a98190d96d4005.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Stefan Herbrechtsmeier
	<stefan@herbrechtsmeier.net>
Date: Thu, 24 Oct 2019 14:36:24 +0100
In-Reply-To: <CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: brendan.le.foll@intel.com,
	"Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 13:36:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-24 at 14:12 +0200, Alexander Kanavin wrote:
> On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
> stefan@herbrechtsmeier.net> wrote:
> > @Richard: What is your opinion about the per recipe dependency? 
> > Typically OE use one recipe per project. The NPM based solution
> > handle a 
> > project and all dependencies via one recipe.
> 
> I don't think it's at all realistic to stick to the 'one recipe per
> component' in node.js world. A typical 'npm install' can pull down
> hundreds, or over a thousand dependencies, it's not feasible to have
> a recipe for each.
> 
> I very much welcome a solution that uses 'npm install' in a way that
> preserves offline builds, and integrity/reproducibility of downloads.
> License management should be also handled by npm, and if it isn't,
> then we need to work with the upstream to address it.

I understand however keep in mind the way this patch series has been
going, it could end up simply forceing all processing into the do_fetch
task.

We need determinism form the build in that building this today should
give the same result as a build run in X years time, assuming the same
host OS and so on, even if DL_DIR isn't populated. The state of the
internet should not change that.

I worry about the amount of magic "npm install" has going on which
would mean we couldn't achieve this.

Cheers,

Richard


