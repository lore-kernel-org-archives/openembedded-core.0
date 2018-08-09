Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B44D607E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 17:03:52 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v22-v6so4600204lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LhRaMbTKvBdzMbSJznyJAgyt9u3iBAOphSdnKY3XtNw=;
	b=Dd+LCOqOd3f1IYb5gpKqbNpPjbknp8cCVHdLaGAAmSaiZAtI1NSMQvIs9SclBavx3b
	m4VOPITCULlPARg0YvivNcmgmvKDi3nl/ZHVYzFG2vILOPkxqA4spKoRj94loirN3q+f
	BciXHGjSGvR9V7Ir1tWyQ7OkhPylf4veJcx9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LhRaMbTKvBdzMbSJznyJAgyt9u3iBAOphSdnKY3XtNw=;
	b=lcnGWomBiPuhbSYx14CFCMHn9S5okY8NQqTQ3Aq5dXq9F7j3Kx1NjAVgU0xDyV8fy6
	CJZzbRo8geVulwzSBiIV6AeBJx1nH7XE4Henx4o36QbPgJeuCu02kNvEsGPhnRUlp6S1
	rkhiLoqu4syk1et4H0qyjaMXslNHYgiyqd280CY5l1ejUJgJc5D6XvmHjbQVaWuDg1S1
	XV6ag781mbSiZy1xEczg6LPhp9qfQnTsQV0dPG4rMHb77zU+2TLIdbnq9y0fkZiBjhB+
	Te+WtvCbE70Dtp/L/S8DQTsxjTzdpOvsvRUVCREasGtfLBd518PnhsxTY9YMhybhkSGq
	lnnA==
X-Gm-Message-State: AOUpUlH+lXSjeTc3cU+M8ZYV008k72Ae34iw4Do8zGJunt3aS4jr26ml
	I9zTd0vaUCbS69NhwsEBVYTPMsmloAJ4dgNkUFZT9w==
X-Google-Smtp-Source: AA+uWPz0kaXXDJM4RWsDOvTkk+3cEKLJWSaDHnOLpca3X9YKMIMdRdOO51+uM5RSSZqr3Bb2i3SzItltefJZIkNRlE8=
X-Received: by 2002:a19:5d54:: with SMTP id
	p20-v6mr2048705lfj.143.1533834232821; 
	Thu, 09 Aug 2018 10:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:140c:0:0:0:0:0 with HTTP;
	Thu, 9 Aug 2018 10:03:52 -0700 (PDT)
In-Reply-To: <e6cdc11a-c949-df7b-0b41-806fdcc74689@windriver.com>
References: <1532543734-17529-1-git-send-email-daniel.diaz@linaro.org>
	<e6cdc11a-c949-df7b-0b41-806fdcc74689@windriver.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 9 Aug 2018 12:03:52 -0500
Message-ID: <CAEUSe78F0L=GbbztXfFJ9_iU2a4v-akt884R63eWg1V8XVc1oQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Thu, 09 Aug 2018 17:03:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!


On 30 July 2018 at 21:01, ChenQi <Qi.Chen@windriver.com> wrote:
> This patch causes a regression in multilib SDK for qemuarm64.
>
> Error: Transaction check error:
>   file /usr/include/bits/wordsize.h conflicts between attempted installs =
of
> lib32-libc6-dev-2.27-r0.armv7vet2hf_vfp and libc6-dev-2.27-r0.aarch64
>
> Please consider sending a follow-up patch to fix this regression.

Thanks for the heads up. Follow-up patches coming along.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

