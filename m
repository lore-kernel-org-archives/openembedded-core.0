Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EFDC0600EA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 06:21:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o18-v6so10872478wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7h9J4aSiyG215qaRnZbs7vlhep8SgZ9Q1Ewhl4ofuRw=;
	b=AKxgHHFCtytVloPJRXe220FxQY+Co97Bv2lwCNIxYsqg35MaV6HlVrcU+rY37CzqW4
	gFKNX1QRU9pbvRQngV+KZbqmziqPSuIfp1qFZEQZ010oVVq6doAA4WnQ/AJVcxJ4LKU1
	Nh0TKGc2PFccA/hxG+ve/Ms2BLaAVfS7CcPws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7h9J4aSiyG215qaRnZbs7vlhep8SgZ9Q1Ewhl4ofuRw=;
	b=hDuUgZuT2gQPWjHq8sbZAVcul7OiRJCP51ufLBxBDQKtUqgGth/31pVnkX1Wei/0Jv
	BYuB/IAjeuO94iRcwbUp/gClLrM0rT24WSEE+p8uKAjOeXMm6K7iQe5Fr2tgi4m0+3t6
	i6Hxdp9r7IqgpR2jVMBXRSIlGn5zwqeQMZWrDtgsoPqThVBs+sjL9On5y4pOK4P5NmiU
	WHDvcJIjKswwyjLS0jU9iDoO8iuxDoGZoWkBokpW/6TroDV/3BRrG3tBpn6ZnAQwMf2U
	ILcbP4aZUBnRKKpsdyTvPqI0MkYKx7BKMhH/qdN0FXD28sOTGDJmUtpeXQXUyPs3UT7t
	ATxw==
X-Gm-Message-State: AOUpUlG+cu3+XQqeDbeUdDpN4/gB8tzqiBu+qLBLKAqYBLHX17HXhIer
	PX/IOAkLhQxhQJ37AfnRvhvIQA==
X-Google-Smtp-Source: AA+uWPxhvqnbWyUKcnxrJLagqcnFdm0nCiPFxxG919f54UlbDyWyDCMokuTP01a6kAn7jeCl3eD/rw==
X-Received: by 2002:a1c:c501:: with SMTP id
	v1-v6mr22024924wmf.115.1534659699600; 
	Sat, 18 Aug 2018 23:21:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q11-v6sm6026722wrp.58.2018.08.18.23.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 23:21:38 -0700 (PDT)
Message-ID: <0b003d4cfff278c6115d04a1d692a8af01f4fab9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 19 Aug 2018 07:21:37 +0100
In-Reply-To: <CAJ86T=XUR0xK-3M=yAB+P7xyVE0Ui7pmyDRm1SUr7Q86dZ=8rA@mail.gmail.com>
References: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
	<3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
	<e8e403ab1cd0a3e4a5754d4d4079508946da0c3f.camel@linuxfoundation.org>
	<CAJ86T=Xx=QwjS9ZpYyY78E_3sqd=_3JmncJJx6WpufoNQiwseg@mail.gmail.com>
	<d4b82bdbcbf9b984482f49ec0230646d45898270.camel@linuxfoundation.org>
	<CAJ86T=XUR0xK-3M=yAB+P7xyVE0Ui7pmyDRm1SUr7Q86dZ=8rA@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Sun, 19 Aug 2018 06:21:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-17 at 14:47 -0700, Andre McCurdy wrote:
> > I've not definitively narrowed it down to openssl but it has to be
> > one
> > of:
> > 
> > kernel-devsrc: restructure for out of tree (and on target) module
> > openssl: update 1.1.0h -> 1.1.0i
> > openssl: update 1.0.2o -> 1.0.2p
> > vala: refresh patch
> > glibc: re-package for libnss-db
> 
> wget builds against gnutls (rather than openssl), but there's a
> dependency chain from wget -> ca-certificates -> openssl so
> definitely
> something could have gone wrong there.
> 
> Interesting that this test is running wget without passing
> --no-check-certificate (which the wget fetcher always uses).

It turned out to be a transient network issue as far as I can tell.
Things worked out ok with a retest.

Cheers,

Richard

