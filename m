Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6565678A02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 13:25:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id s14-v6so2898684wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/ztW1Phle7UYoeHcaGesgcFI0bke0UoPQfMgqNJbLD0=;
	b=MSFNobvYOL4XYkuZFN8cwiQBjRhWgD7HtBvxNYn1r2N9ujuAiZ1Q+8HZ7tt81F7pw7
	JP4Mc2QHgD0uDCemplHOEI2X6dwqHxvpvAzxrwK5Nlb1vQx2CYgMfilq0emFZu2kRazI
	yL/FhKkm+Cwqp1SnQVTylK37pZXG7J+TcZjK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/ztW1Phle7UYoeHcaGesgcFI0bke0UoPQfMgqNJbLD0=;
	b=grbdwJ2HAP79WxMBhSqzytGIQhFbiNQim+WnSuv4R3u/SdnrFRpUrRSa3f0kPmA0bL
	nP7SHpfBFFDtscEGk96qtBuOPwHjwqrXLVQqPeZMqowvq4MbVEZ/xNOZxCo42krnTuMO
	+Q6s+ihdydrcJ92s+NgQmEzyuJrdAaJ5r9PK1R2xJyCpbMIjlL6yyppmBl+Q/QBfArz2
	9ELGevQT7i3UyRcPKFCRidlULBzyKOxm3nL7mfF1faXgKlQmYHnbUCUftfUKxntp6AG/
	PIBJOFuQw7nl0w8BRs2H6UuUU1gHHeodXRa53qTA765kvkUbZzJplJmaZqdyXWA5wUH9
	GfIg==
X-Gm-Message-State: AOUpUlHR8yBBmUdusE54bcSt7V20iiaGuF2eFQCsru+chxhBhDE/2uq5
	Z17FwpKkUEfBwuFXECImVPDuyA==
X-Google-Smtp-Source: AAOMgpd9R6tqpsLjzggaYAU1Gj1Ef15IVLdh0tPwpokiao4/OEqEYn7fuWkdTy6aM9eXVd7trkNvog==
X-Received: by 2002:a1c:1f87:: with SMTP id
	f129-v6mr1564044wmf.154.1531920332108; 
	Wed, 18 Jul 2018 06:25:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w21-v6sm2230399wmc.45.2018.07.18.06.25.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Jul 2018 06:25:31 -0700 (PDT)
Message-ID: <920085fac0672e7edcb1edd4f5d1e49d4967ec03.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2018 14:25:30 +0100
In-Reply-To: <CA+chaQf89Q8+mTKaHnnMdcrem98oHke=zXWRjZjYJc-y+Ut4Dw@mail.gmail.com>
References: <153191861669.10298.15614848702695214584@git.openembedded.org>
	<CA+chaQf89Q8+mTKaHnnMdcrem98oHke=zXWRjZjYJc-y+Ut4Dw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] branch master-next updated: package: Rework PACKAGELOCK based upon sstate for do_packagedata
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
X-List-Received-Date: Wed, 18 Jul 2018 13:25:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-07-18 at 15:20 +0200, Martin Jansa wrote:
> I haven't seen this one on oe-core ML, so I'll ask here.

I haven't posted it yet as I was going to test it first.

> Will this fix the PACKAGELOCK appearing pseudo.log quite often (as
> discussed in https://patchwork.openembedded.org/patch/144312/) or do
> you have any idea how to fix that one?

I can guess why.

PACKAGELOCK is taken by both do_package and do_packagedata. One task is
run under pseudo and offhand, I think the other is not.

So that tells us why. How to fix that? Don't know :(.

Taking a lock both under pseudo and not under pseudo doesn't seem like
a bug in itself...

Cheers,

Richard

