Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5D28B6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:41:32 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id i5-v6so28019076otf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2wf1ho8vInP5zw4oEiKYHA2+8JCLXVSc3q970t2XmA0=;
	b=sLzGWVZn9qp7n6Db/KqpWPYVBh4MTa2ctqHNVgMBqHh9jok6r6KnA+rQqHG6nor9Mx
	Gxv6ddufJkkTBfEqM21/S7ASG4crOs5sDP8JlP1SYNd0A3+pm9wceBrIgMzxtL0c2wiZ
	7QI/Vazb5ef/jzUWOBlOvSyMb9KJLtBmuAV7QEPH2ECDO9biqdbnXEkkCfmfixiGFKBO
	No4ZPI5KA6UydPwqHAsGSkpxjChofSVQ7pVhhnkc24UbCEb3QkAN1nhITjIha4p/dnag
	KDGlxwyIGPVR+PVVJ58o5YUoVG+6syjBgpdb50sz841kiX8IhjsDqD+Cvt7s46cpC+a9
	A8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2wf1ho8vInP5zw4oEiKYHA2+8JCLXVSc3q970t2XmA0=;
	b=P+fjMNkduTPKHxUYDAHC0Di1lWRY99dZbH5+bHW30ulARorszdf1VhZO4nqfiYQIz5
	1MTAIIObok7wOpcCVbmYfA7KtDucACeVwePCOA6NCDOuYe/ab7hRnQSYS5BQDB+12oZI
	af7k2GkOR6MBmteGVjJyuvZ3fyThTyhy7OlpY+WtVjUdZLIwnuW2RbJyekifigPF1It/
	niIbSfF3hsVuxszPN+99Tbuh4A/y7AzvhUnXtTYsKrZIgu/+OzuI7wIKfa9tH4jM3RnK
	n++YN2mfXKK4EAZYPksMwc9Ud+9UZzRultsp0Jp4L8ghqFHGy+uvqfrew59Tr9QTM/wm
	gnHQ==
X-Gm-Message-State: APt69E02cv/VwvRWg7DK0exqUMfx9ngrAQ6q28MlqGpfoakRnPrkE7xA
	UlW2cWgHdr/KHEZ9U6h9wgxlpS3l7P2Ev5mDJuY=
X-Google-Smtp-Source: ADUXVKIS2S0cEcCrhvecBv3EQgzs7Nq31b0r6cEspFxUdYyzL5VCvpPNWBv0xMUwOmvlwHg/REwvzou+i/Zhh1lzlIQ=
X-Received: by 2002:a9d:4609:: with SMTP id y9-v6mr521073ote.259.1527831694161;
	Thu, 31 May 2018 22:41:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 31 May 2018 22:41:33
	-0700 (PDT)
In-Reply-To: <4de3e30e-48da-24ad-55e9-9b6a3664e67c@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<23d9ef25030216df5bcfeccfe6dcf12defc53648.1527755434.git.Qi.Chen@windriver.com>
	<CANNYZj_M2f=R+mro8oUnVV+dWuz42o8T9GpYjhBeujPF=ic=ow@mail.gmail.com>
	<4de3e30e-48da-24ad-55e9-9b6a3664e67c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Jun 2018 08:41:33 +0300
Message-ID: <CANNYZj9sAHZztGjP6W1i51cN4+GMppnJEus5oJoseeeHSTcYbg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/14] oeqa/core/loader.py: support the 'auto' keyword
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
X-List-Received-Date: Fri, 01 Jun 2018 05:41:33 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-01 7:42 GMT+03:00 ChenQi <Qi.Chen@windriver.com>:
> I agree with you that we need to re-evaluate the settings of
> DEFAULT_TEST_SUITES.
>
> I plan to do this work from next week. And I plan to put such changes in
> another patchset.
>
> Looking at the codes, I can see that the DEFAULT_TEST_SUITES are set with
> consideration of qemu machines and libc.
> e.g.
> # aarch64 has no graphics
> DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
> # musl doesn't support systemtap
> DEFAULT_TEST_SUITES_remove_libc-musl = "stap"

I suppose we can introduce TEST_SUITES_EXCLUDE for such cases, which
would be considered when 'auto' is expanded to a specific list?

Alex

