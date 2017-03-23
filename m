Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 234E477B7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 19:11:31 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u132so69684128wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NDI0DvxzAioz68lxn60LbIEY7NEgUsz/rCwhXkksIbk=;
	b=RxAcx/iYt/BKg6e/L4nPbPwSiW1z3c6NweKafc2Oi45dZ/1KL6HYHuqHnOE8GdfS8k
	cAsnPFxknFpry4A3OkG9Vnew7+voWpdhzYk2v6cGhr25ZquI8FyuUz8QiShap69B9K+M
	aAJzPXFK03SHrYEQOylr+aJ0dT5d51ksUXpmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NDI0DvxzAioz68lxn60LbIEY7NEgUsz/rCwhXkksIbk=;
	b=Xn1erVeL4Cs1VJqCK9wyttFyzupkrCXQCR9EMavSMeJPDaY/dnQcJXKOLNwkSqiTVO
	9+5YEpjWN4UJ2/bINyPbi4w9es3J+d307w48QL+s4R6EEHca3E06evcfSICDLd75rI+P
	/1ygdGnjInUvAj2BJieC4mmvm9N/dqwyBXPl5U5BZ4+nve9NcQX7kWNHg/eUfevZ7a3Q
	tXy3bBfPmb6h28mPJM+hsFmEOd2JLw4OGF9CgTPCuOeg1FSsdxkXIbfGZFcxhVM/xNAB
	GlEv5pt/irgP4qvNQxLOCDoUtoaONxGLIywTTyeYM2AhgOCAQoCGLdSySutEUEhHCobX
	rzig==
X-Gm-Message-State: AFeK/H2Jjf9GgDqwg4Xm4UHI8lAfW1NQRtthuOPwViVAQdKWIEVDhD8bEwcQ282M2zU1TpbPyfWeJfx2L48rihJe
X-Received: by 10.28.126.17 with SMTP id z17mr14353586wmc.33.1490296292806;
	Thu, 23 Mar 2017 12:11:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Thu, 23 Mar 2017 12:11:32 -0700 (PDT)
In-Reply-To: <CAMKF1sq9UMGWoCBEOp-8gmpPekA4p6MEKg3FiJvrFr85mFjxVQ@mail.gmail.com>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
	<CAMKF1sq9UMGWoCBEOp-8gmpPekA4p6MEKg3FiJvrFr85mFjxVQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 23 Mar 2017 21:11:32 +0200
Message-ID: <CAGNsrLBy2phUWevgVdR4njdQJPUaGRW=PTHTZG2wU_e6Hp9_BA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 23 Mar 2017 19:11:33 -0000
Content-Type: text/plain; charset=UTF-8

On 23 March 2017 at 19:22, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 22, 2017 at 10:54 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> Patch submitted upstream, pending to be merged:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=21286
>
> Patch to glibc is fine provided you resent it with proper SRC_URI change
> and report on how it builds in OE with this change applied

we'll need a v2 to address the backslash, but also the patch itself.
It's currently incomplete, it misses the inclusion on other
architectures siginfo headers.

