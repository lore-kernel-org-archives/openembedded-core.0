Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3AA7198D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 20:45:05 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id r136so1949275vke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+k7fvWK0aWIQK0h+xv5CzqHV1k3g6lpUmvZKpQN3OB8=;
	b=K0b8XGbOIwybZH66UicAo2+JgmjKdS9adDJ/hi+ZVr5FKuZ/nUaYCjf7Awnx0v6Xy3
	IJaj8HPKnULbb0950Ju+zbkOtYYoOmCPGYrvmgbU53Z3vjlBssq7S4rFYONq8Ix/tUlz
	jzzIGuGtP2FhRqtxHuFDrLxoWZdqCBJQd//MABwRturAKM3k78FCTRE5ayFwZK+1nyi2
	zAl2PcQ9i+KZViDSfaVPliKc7S9eGrIf7oeScmrvISTTwS97hyahLrHdFLreoaYQi4kJ
	A16+iTv7/8qXAOiJsQZqoEL5jvV2Tpm7HarO7CP+YTGXitHp8WOH2hy69FLQfaCY+Tm6
	AJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+k7fvWK0aWIQK0h+xv5CzqHV1k3g6lpUmvZKpQN3OB8=;
	b=jD4vCXH74Mlvkevs4OUiEfRTzAgxeOZjDjBe8rsRe2n350qRACamHsjHulE3nle9Dm
	CKSl7OALny+lsyCd/4YAFaEkTpHBNcIrX6xLBGp5eE+FlLMPOjYoNNFDhqZ9ljY8HSmG
	61xrrfUPVlF3huX9HEggBJHkWLiJgb7VoJRbe5+LCKwc+IHi403WRK5cVfK+G4z7XHwq
	RYc97iGnx6dJ024b1CJDa6fr8SEpFumS0dCi2Njm4KZcAdRAJoJL79ldDxvXxWpxwnFq
	ufbrcqSDHXBPVC1J3YbdaFCyqDbzkLAtAwG/tIxA9bc97ghDNklt2h3NggvqE7jrSfQ1
	AFTg==
X-Gm-Message-State: AIkVDXK8pdaR2+K3EYEG45v08ME3m1/z3wFjiNxd8HQT/N3X5kdor8+hwBZ/Ea+A+pEEC+SaciKh1xBKwcZ/pQ==
X-Received: by 10.31.197.195 with SMTP id v186mr2572045vkf.84.1484772306189;
	Wed, 18 Jan 2017 12:45:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 18 Jan 2017 12:44:35 -0800 (PST)
In-Reply-To: <CAJTo0Law0LLbHdy6_dUoEnmd1amMJRygw-k=uspKDdxsve3kcQ@mail.gmail.com>
References: <20170112202050.22808-1-raj.khem@gmail.com>
	<CAJTo0Law0LLbHdy6_dUoEnmd1amMJRygw-k=uspKDdxsve3kcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jan 2017 12:44:35 -0800
Message-ID: <CAMKF1spU2=Gh+32hSQFJ5hzy=zyHs51azvOhYACe=UsUt1SzTA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] glibc: Upgrade to 2.25 snapshot
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
X-List-Received-Date: Wed, 18 Jan 2017 20:45:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 18, 2017 at 5:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 12 January 2017 at 20:20, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  .../glibc/{glibc_2.24.bb => glibc_2.25.bb}         |  23 ++--
>
>
> I was wondering what the actual version was as this isn't 2.25 yet.  The
> libraries are actually libc-2.24.90.so, so I think the recipe version should
> reflect that, if only for clarity when 2.25 is actually released.

in practice it should not matter. Thats the case will all gnu tools we
have been doing this
kind of intermediate updates for binutils and gcc as well.
>
> Ross

