Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0D07FA3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 08:58:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i12so7579509wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tIyhM9iF1SK3wEAcpc/rgL8A3ZQhAQDCXFJCBLqGnlE=;
	b=Daxpmb5puu1ggWTRxhx+91lzCkedOfMy00g5YcfaLkSzlWVN7O3gsE6raAqA0S6B4X
	ef+mr7W4gegx0Dguh6nOnWGexz078jcz7iobtE6gjCffLoKRQi4BVTPYLpehEc6mvtU2
	H+bkPmjlpWcJA2N4731/4Ns6yHfm+ulHq20zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tIyhM9iF1SK3wEAcpc/rgL8A3ZQhAQDCXFJCBLqGnlE=;
	b=f4QIx9LucSXgbuyRNHnRMGGrytcnbBRBTXq4HnvZ42hQmVk77y/Xkyi8B0Hc/JZ1d9
	u1qWjqeyE5p9E8RdgmmbgJl+6IIZM7/q1MF7Zy/9Uj148IENwraRzmQmwOa8zlVT5xif
	TIqMUFT7TOyEW6tSnq88I0vjw1RwObkWuyJm3LIu7BNRGi7kNVCM8fylxZrxu/GyQoNQ
	0MNabViaX9H3gq/Fpgu8GbLYGd+cfAyelA2j7qGUjcJbzBRTghwZKbF0PzX/da2Xo6C4
	mD4a29pzuA6NpyRdtS/q1kOGcXk1B9ogTv2btQ3hOWB76hKWr6bgrc/VkZ5Tgc/7eZUH
	x4Xw==
X-Gm-Message-State: APjAAAXTPe52002fjUORk/3fICYyEXce7W064tpayYaSxGhdb4/VPWnU
	iPyzh62Ck9Z1xTo48EzAPaHhIQ==
X-Google-Smtp-Source: APXvYqzq7G2x7aEHy+95g9R4SKtrclTApJXP+N1TQ0gqSPniHS3FLWWP6KYNbaaY7t0x30YAuQOtaQ==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr17065308wrr.341.1574413117919; 
	Fri, 22 Nov 2019 00:58:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w11sm7491442wra.83.2019.11.22.00.58.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Nov 2019 00:58:37 -0800 (PST)
Message-ID: <0e33e0aac09ea020a6a3d0714a9de15cf07d6f66.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2019 08:58:35 +0000
In-Reply-To: <CAMKF1soT1CqsRqkVOfpGjuCjvvHOExnwjZguXEog9Sa6dc_uFw@mail.gmail.com>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<CAMKF1soT1CqsRqkVOfpGjuCjvvHOExnwjZguXEog9Sa6dc_uFw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] opkg: Add upstream fixes
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
X-List-Received-Date: Fri, 22 Nov 2019 08:58:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 16:27 -0800, Khem Raj wrote:
> On Thu, Nov 21, 2019 at 7:02 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../opkg/opkg/open_inner.patch                | 150
> > ++++++++++++++++
> >  .../opkg/opkg/opkg_archive.patch              | 160
> > ++++++++++++++++++
> > 
> > +X-Evolution-Source: 1525863794.3857.16@hex
> > +Content-Transfer-Encoding: 8bit
> 
> Perhaps this raw mail header can be removed it seems to add no value
> moreover is distracting 

Yes, I realised and it was gone in the second version.

Cheers,

Richard


