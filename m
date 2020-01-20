Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 65AD37FC03;
	Mon, 20 Jan 2020 16:41:25 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id k24so34315069ioc.4;
	Mon, 20 Jan 2020 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q866C3AcBXubVwTqE+Ali5H23eySxcBcusFihIe1TOU=;
	b=MQ9HpiawHBw7DcIPsI9KWfHIXGXmnLEQ+F94A/Z/pRuXMgtl+FNU4U5ZG6lHbQzxAB
	q9s5zL6MsBYwpIXR+CjQ8NkKwJLUGhp+ehE21dV5gVFlrWD3u0Ik14myNBROqoxVgC4i
	xk095OlYhZ80YiVOuPqMYUYAi4gLwzHWQzw/ZN8mfcxAcugnnd5KIRNFvxPBSz9FIbbs
	WmG0o4CSiR8EYM+TElvozqZY89CCrHuGK/o789Qmvylh3P4zFh5rTq3oBcrsUyNWpTcN
	+9YDPeKc/uJdZcCg1emIjx/zyvRUFKdh/zruL/fqZZkUKfZEGp/sH4xHC+hspWJG67eF
	kl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q866C3AcBXubVwTqE+Ali5H23eySxcBcusFihIe1TOU=;
	b=p2TQ2sfNyll7ILVwmAais+Zd5NpzWY64NI9cdHEJuf/q+Dgu/zMTQeZ+JAuQJ6RiHT
	vhKLozu068rPP5qiuIPc40BZ1GJn/A9pZ61QmLKtgcHTf9vMTHWc+d0UZylGaEgG2qsV
	BhkEY/UxxlAovSL9hZcSFDUHvKnivWlXfQs2DOhY261plOPNlclNYnxs3T8sO4RwRM5V
	PALORhX6dzvPNtls/+OtwbKS/fq3qAWLBhOReJeqpU/vsm+o0kdtfn0N/3mY0JYWOmv2
	mH4oLSEh7Np9VEQTPZjKsjDqbDhrUegdD3jaUpii+9qFcTf7V8BSfpTeAmPCMV3vwVUn
	i51Q==
X-Gm-Message-State: APjAAAVERy7fJY8nKC23/AH7T2hMsD+S5BJFAI1Vb+b7rfVA43A8kYzC
	Ebfth16yUlpwlIdb/+sx4ode4suYuATLecZQloI=
X-Google-Smtp-Source: APXvYqzQQQ8ZCoP5USHkR3WmYXZvSRjMW6Am6FB25FQyOqh/g9cGwOrO4SjR+mV/dc528I+7W80Pf8FR+uqwyqUhXb0=
X-Received: by 2002:a6b:740c:: with SMTP id s12mr44373992iog.108.1579538486292;
	Mon, 20 Jan 2020 08:41:26 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
In-Reply-To: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 20 Jan 2020 17:41:14 +0100
Message-ID: <CALbNGRRAJrjThF4RQ-Qa487QmSWdT8aTXBtXYYi_8qgqBfxbFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 20 Jan 2020 16:41:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi all
>
> Recently py2 is removed from oe-core, So I did quick patches to get a
> world build going. And
> here are initial failures, please help out with recipes your can or
> care for. Eventually, the remaining
> ones we can blacklist for 3.1 release.
>
> http://errors.yoctoproject.org/Errors/Build/97185/
>
> I will post more arches as they become available. If you want to try
> the same for machines/distros you can try yoe/mut for meta-oe
Looks less than I expected - (Iknow dependencies are shadowed...) Will
try to assist...

Andreas

