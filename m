Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63B7A6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 09:08:43 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id ib11so2002010vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 02:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=SLJgwZd0riAh9NFmp5ahlQHlECOghqdEmyll3w+vCDo=;
	b=DQbUluSUnuGf2M7YLrzwmQK4InUVeZVwJ6EdU7K5DjAyEYqIs15N+EU41N/geMrTwD
	jU4lZg5HuiOdo7YsqDh26qmgFibFNNcYO0IyRhOefvQme4oOxoiYiu7FCYVuOn0foBI6
	ChstIa199pd/lT6hjban1+6YS1lvGwKNKLtSijAirGM7BxpsKRwjT5l4xmY/wrBB9YG3
	EIrcTbPHC1UHnFlMFZcOAeuXwaPltXuxsnElqLvhIpCUjmVF8AEEaEkZrlPWtfp4mwUN
	/xre1jAAhwgY+0lGPR9XHusAmwhthNlFQTTMYU4LizfB1QeKwITt59eUbaFxi/waaGXE
	DRlg==
X-Received: by 10.59.3.198 with SMTP id by6mr4578592ved.39.1369300123983; Thu,
	23 May 2013 02:08:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Thu, 23 May 2013 02:08:23 -0700 (PDT)
In-Reply-To: <1369299303-15980-1-git-send-email-Martin.Jansa@gmail.com>
References: <519DD2D2.3010009@intel.com>
	<1369299303-15980-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2013 10:08:23 +0100
Message-ID: <CAJTo0Lbw4-fCkk_K4Li8CZ-UsnDBdu9WgH1ByXdGyvfSU7bUPw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQk2Co9G9JurIfbPrpSjpfxBemyn5GeRW2Jnti+5ERxclZdyUjwYTshIOp+iT3WMCFiGJb2v
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: fix packaging after last upgrade
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
X-List-Received-Date: Thu, 23 May 2013 09:08:44 -0000
Content-Type: text/plain; charset=UTF-8

On 23 May 2013 09:55, Martin Jansa <martin.jansa@gmail.com> wrote:
> -FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
> +FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"

Why not just capture ${bindir}/* and we won't have this problem in the future?

Ross

