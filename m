Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2607761992
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 23:02:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c84so5057212wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=D7nqDhNyPhj2SxQCRQL4NUTfsG44C2aAOVVKDitV/9o=;
	b=My7w2E/hVZTB0JycRFpzppyrfFLleaP7fzEeK3VRf/Y11v6fTdotamTtc4XIWn17X9
	MpecRfxlBxJBNkEvuWFKf11kgtJ98G+TZUwLNpbmuZsz/q+xJKEP5M1RzGksA5ddXB18
	GBcxEpurqq2G2kiF90NjRvFJ8OTDMCfDZTCiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=D7nqDhNyPhj2SxQCRQL4NUTfsG44C2aAOVVKDitV/9o=;
	b=ShlG5VtY/W+XfjE/T3gWED4kYF/gFIfEa4RzAGkDzP5QInmZ0T/XhMi5XvKjMsVHc1
	JG5rolfY45UsozBgcod+RZFjGMB1rzZYifiCTWqaVrTt87AUOYKGErB+dFFtbYqxNj1Y
	8oJa7fgkMlyVBCoB5yyqQZ0q6DV5UmgBORT1RtwlfHPxH3UIx1M47ssxepjMFF/Jkt8d
	NHni+dmYisDZmD2ImUl4kURMsKANY5h8zcNbfiA1qU6XYSpU0jp8djKSWZ3yztlv4GAe
	o1gpWxqMdmF7E971h0qWmyDhidq834Rz+Ac51/VF3hfe0KWi+txZ3UOr6vSGMwmQunAM
	JSMQ==
X-Gm-Message-State: APjAAAXd/ehrgHzu3FpsosntAswZG9idRhiQRqn/iNtmqE73RX67YTXx
	b1/RSUc7kXl9z5rSiMKNnLZhEA==
X-Google-Smtp-Source: APXvYqyrjuBLYqCg4rwskf3YCq1r+hmuX44EHnNZFzSn0+sy3z9W1f7yRNVJefmBSrSl4ETnSG5bsA==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr6712405wmj.27.1582930926821; 
	Fri, 28 Feb 2020 15:02:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o26sm3882944wmc.33.2020.02.28.15.02.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 15:02:06 -0800 (PST)
Message-ID: <e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:02:04 +0000
In-Reply-To: <20200228175731.10604-1-petr.vorel@gmail.com>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Fri, 28 Feb 2020 23:02:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Petr,

On Fri, 2020-02-28 at 18:57 +0100, Petr Vorel wrote:
> Removed ffsb copying file and associated runtest file fs_ext4
> (both removed in this release).
> 
> Added LIBS=-lfts for MUSL.
> 
> Removed patches (accepted upstream)
> * 0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
> * 0001-testcases-fix-an-absent-format-string-issue.patch
> * 0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
> 
> Merged patches
> * 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
> (into 0001-build-Add-option-to-select-libc-implementation.patch as
> they
> touch the same files)
> 
> Refreshed patches (some tests have been fixed for musl)
> * 0001-Add-more-musl-exclusions.patch
> * 0001-build-Add-option-to-select-libc-implementation.patch
> * 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> IMHO this one shouldn't be needed not, but CI still fails without it
> 
> Updated status
> * 0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> * 0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v4->v5:
> * Put back 0002-kernel-controllers-Link-with-libfts-explicitly-on-
> mu.patch
> as it still needed on MUSL (although it should not be needed,
> strange).
> Reported by Anuj Mittal

I'm sorry to say that this still isn't quite right for musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1634
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1630

Still having the fts issue :(

Cheers,

Richard


