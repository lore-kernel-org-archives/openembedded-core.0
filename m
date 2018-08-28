Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8E278EFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 15:32:28 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g33-v6so2010579wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uGBh4Z5W8Cl0cqnvo+TqtVAkdbY9QPwaeAlEpuOdvVg=;
	b=GPsJmKouHBx6iLF6vobMl5+VYhbDTlUsW2qmIUCJeahsxlztx36bDzENPfWgVoUV7h
	ClUthOWtdCvRe/x15L8eDCVlwJqzOx4AfwH2+6Jk6OrxTKJC/fMZbW2chWdRxNTRczRJ
	DLFBAtm/fulaYNDpaoAhZqye1jByondA9bPts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uGBh4Z5W8Cl0cqnvo+TqtVAkdbY9QPwaeAlEpuOdvVg=;
	b=B1f34/fqJxUpdfx/GbcNvfs/ROMJdOIXaXJN43sue2iRHz+GeT2Adqwk90tXqSm/cW
	9Kcj+12T9+9FgIJTxxkVBLM6nVGwv56tcFrJN+egC/g/q1fzn4/L7c8/tTfH40BLc27T
	spZIwKENipJKAehZDrBSXuFzcE95Mi16nZGo5bvtLHy3oK8Jx+gqMnglESruWX3u8hMF
	K8J+D06ObxRX8gXaIpYtjSpvKVUy/HX0OqY0gk/foeX4OuyaDN0aomg+lZuT//cDr7EM
	2KW8cmpkP/KxciiTXsuG/cSApNsqZlCKy0FRwwpInJUgzPIUN0Dlq0+K5H1pMps9D85D
	srWQ==
X-Gm-Message-State: APzg51Dayn/leky5a6vxsbYMxAuF+9YDfNK4bSfhhkxSzG+Hy4gcdWab
	9axlovHXU4F/GLBu3HXPNzzD6w==
X-Google-Smtp-Source: ANB0VdbZAp66S1RAocbvig7MWa6NwJY3gECCRijCvJu9bqQBaOdWj7TyCtNfz9si7U60d/1SJxpgxw==
X-Received: by 2002:adf:d4c6:: with SMTP id
	w6-v6mr1499030wrk.185.1535470349820; 
	Tue, 28 Aug 2018 08:32:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r140-v6sm2847742wmd.7.2018.08.28.08.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Aug 2018 08:32:28 -0700 (PDT)
Message-ID: <ac9893cbad5bb3a6852dd4c86e2e5cac32cdfded.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, Jens Rehsack <rehsack@gmail.com>
Date: Tue, 28 Aug 2018 16:32:27 +0100
In-Reply-To: <CAMKF1soWiC3zD_Ki82FCNVPDmwYDwZncmrgkZPR8w0T+Gpn2vg@mail.gmail.com>
References: <20180824080738.6061-1-raj.khem@gmail.com>
	<90CD9834-5DC6-4700-8CFA-53634E2A2EA0@gmail.com>
	<CAMKF1soWiC3zD_Ki82FCNVPDmwYDwZncmrgkZPR8w0T+Gpn2vg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "cpan.bbclass: adopt to recent EU::MM"
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
X-List-Received-Date: Tue, 28 Aug 2018 15:32:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

I put the alternative fix into master as it passed OE-Core testing.
Could you see how the perl failures are looking in meta-oe now please?

Cheers,

Richard

