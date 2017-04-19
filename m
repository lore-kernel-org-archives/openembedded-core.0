Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0C7719C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:37:56 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w64so84919561wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eSg6DTkEXophEKWjqRNKWcpWU2yBFSoRxSWwuK9NddM=;
	b=jZwUpjAqJgOzUs+lYqBzu61hk6gOA06gZdJp3zGcFqqRWsXLIQaqabf7/b5z9fsYG3
	X9Bq8aYzpN5Gtl1OmIRiwXk4/0sYT7dmHsVD/q2Or6gDVSYirk5BtKzoF9ZYcR4Ht2m+
	4OBQYoisGbLd31bwuadQXjHApyJ7FjAfAsYrNaKZtA4ciPs6tNLSwifzMq4bplAfgzeJ
	l5oUTMAMYfKDzFwRS4OzcS2xte+84ihRoXeVnY/JYFbqPx4TAY6vznpFBKosh0+UPlts
	x9mZd+XyL0awx65MXh5+Bn40wgKkIA5dCXV4wGWEEU0Fo2/a7Y5Xt1t7BtHxUu8lkiOM
	yAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eSg6DTkEXophEKWjqRNKWcpWU2yBFSoRxSWwuK9NddM=;
	b=YCFIaQBtbc4LnjnmWqN9VPb8H6Z77Ojrw6OSZIYIj9cDYQfN1dYyioryPJvbh00xgS
	VfY05mnit5JtQvGur2fzp6iac6kC6ySgG9mNMq49JH+XiNxVfOi2xsuP8Ni5nKwr1P5k
	ulTAAh8TSe9jFe1VfDdK39fXhROPk8JsmXmmxuoUv/gDMdxgN5cFnN1ZDicaslGsv1Mj
	686P2LC7KtmUcCrvBkGePgjd+QVakrIgHZGlM1Te7/3QBtuPMor9EnqtrLM4ouARMtOI
	PfSEa49WtV/85P/w47z7uKZZ022Sob58tzSMc0KNGrdYaruKLPl5j++CYjfZBBzrepLH
	OK3g==
X-Gm-Message-State: AN3rC/4frl9Q2k/5/TXzWB8PymZYAlMXBaSqzXvnWhD6GnSo6YoWr2tQ
	mu/AhqU1LCHe2gYvuS+zyMH+jbBsbQ==
X-Received: by 10.28.87.70 with SMTP id l67mr17676366wmb.37.1492619877086;
	Wed, 19 Apr 2017 09:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Wed, 19 Apr 2017 09:37:26 -0700 (PDT)
In-Reply-To: <CAJTo0La1PPef_BP-6Zc8aSJiSkmDwXR3AR9i7Dn+vRakRScS1A@mail.gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-2-raj.khem@gmail.com>
	<CAJTo0LandPvX8nK+oPW0vj8DSC+jU7mBEZc+LEE4uq3TmkubHw@mail.gmail.com>
	<CAMKF1spCN1u2cWm9V4VHStu7Btj=34JTSqvTbNWXPsb3r99JBA@mail.gmail.com>
	<CAJTo0La1PPef_BP-6Zc8aSJiSkmDwXR3AR9i7Dn+vRakRScS1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2017 09:37:26 -0700
Message-ID: <CAMKF1spLMWMXtGTWZKyshAO89h9+njY4V1vt1=BA4uRmk+Vzpw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Wed, 19 Apr 2017 16:37:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 19, 2017 at 9:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 April 2017 at 17:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> key_secret_is_set is a typo in libtirpc map file which is fixed here.
>
>
> Can you resubmit with that in the commit log.  Are you pushing these
> upstream?

Upstream already has a report and a patch for this
https://sourceforge.net/p/libtirpc/discussion/637321/thread/fd73d431/

>
> Ross

