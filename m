Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B13257F260
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:51:16 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 201so11060228qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=szNGDlU1SPmDwwyLLpoJUhrXOzduDltN9Kmf4cTCDck=;
	b=rtOGDWV1UWRt0KfnzcBK9h9cBghFARiZjc/ozaup89EV6vvZFkRBli3I0NtYVOpL40
	upDipBCQfGfnfz2kWEwtDf5lIzG9QoPebPDPUOreiYMI5wv2hms5EukQ5Dw61TD5RNVx
	swmW1CvsRqsZMRr6RuVvxBFLnyxrKseIHTmzERHXHBORAI57Qf7jeAhEN/xDquGyiAoZ
	bG1YWPOOAhlzKF7CtsTsQSENWrzBnDUsQYPJum3AHLli7+V+hab8K+RiU0gQI1JftC2v
	T5bY0M8q/vrVPGLTjCYXnZFzyO4PpUihJnLSQMEgQK33b1UWox/te8bvu4zXOWL1o4Sl
	gXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=szNGDlU1SPmDwwyLLpoJUhrXOzduDltN9Kmf4cTCDck=;
	b=AsA+CKfUGn/YFI0Yj954JMlCx2fQRJD0UCI/MOCnLFEeA6r6so8lM9dYa0SXp/dPaj
	TOxY6hBaoQaJr/FVaZNtuiIhdx9UanlHpnUPieBHhFKdzkHwVwte1PgUGZLGKv6OKGXy
	HQ9Z0JzgYx75iioIankrO+VRaolnhIAR6wGIaAdwteXH1/21fSQ2idh3IviBqkERS/AO
	c9X+EC5hCxnpE+HvQ12Ms2jtvLKPBbrDJnBP8qQi47/qQGk0jo8OcP10ryKp+gNX0ru6
	OxMqIZD1JRKC7ra50n2GUeRQvTnYSBntthBnoRSxBG5ojFmeUmm50x/2mE0rIExITXmR
	PlYg==
X-Gm-Message-State: APjAAAWHcl7AU9QCvCyXUDQlXimlu1pzvsCSDRckgFWYNoItpgDBlLdF
	c1OmVCIueTEIaK7pOGLXkk5x2MzNT7aAguyLz/Y=
X-Google-Smtp-Source: APXvYqygEa0E8GRAY9wBuCmHqdFbhV7rTsWFT+tUy4HcxJG5ETUQtYcX4U4yY47dL4xoYM2utYr2mKkdZMXmQ0Xz29Q=
X-Received: by 2002:a37:4f97:: with SMTP id
	d145mr15781148qkb.474.1567623077599; 
	Wed, 04 Sep 2019 11:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190904181009.8374-1-raj.khem@gmail.com>
	<CANNYZj-P2egu6X8-kVFKnNk_NHk6Z6Pme8BQZfh=AbCq-NJggw@mail.gmail.com>
In-Reply-To: <CANNYZj-P2egu6X8-kVFKnNk_NHk6Z6Pme8BQZfh=AbCq-NJggw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 11:50:49 -0700
Message-ID: <CAMKF1so5vokOmUk-XWkWc872DFrFpeqVVfY=yAB56G5rhXpY0w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python3: Expose PYTHON_BINABI in global config metadata
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
X-List-Received-Date: Wed, 04 Sep 2019 18:51:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 11:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 4 Sep 2019 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  # llvm version being used, so always bump it with llvm recipe version bump
>>  LLVMVERSION ?= "8.0.1"
>>
>> +# This should be bumped when python3 recipe's MIN_VER is bumped e.g. 3.7 -> 3.8
>> +PYTHON_BINABI = "3.7m"
>> +
>
>
> This is already set in python3-dir.bbclass, so please use the values from there.
>

we can ignore this patch

> Alex

