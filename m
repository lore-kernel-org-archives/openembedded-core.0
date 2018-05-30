Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF84260068
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 17:46:30 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id g9-v6so13093229uak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=18pWA6G5LCqiK+jFdjb3fyeXclxVChqxIwgmM18t4z8=;
	b=OlMaDHXplCQACQM8nLmZYnuczXH2RplnPRxnRvuxxfAruQbe2V+IM3jj4y7bPx/F2O
	cUcSQg0THEMeusOENRDP+08/QEeB/IS8hXWVtlOI1tCcct4Lvyc3JMQ6uhPppNN0GccX
	koBMl55gexYw9Yc/RWqQiRFvNW1LThqZWYjHDL3EgJWzUj3fElkivJ4zJ3WTZ46hY6X2
	lkgEGglveUnLQPfvAxijNOdvM2t/tk8bVYNysWO+hc5JBcahrzctgcd1tSL7wUaja+cH
	IpxZDU3yYQiGv40C59vU6LLNp329kMseAXQB2vHatDIWvmpHQVzs4irxIGhsK8hGOnvq
	7ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=18pWA6G5LCqiK+jFdjb3fyeXclxVChqxIwgmM18t4z8=;
	b=lDXeM4BfEDnR+LGaydvkkf0v/VsKce7fFj5fDN6ZFVLWpOO5HdanURIqMPfIoYqTlY
	KuF/sIbFxamIgukMYqIYFn+6QQDwXWtNYaaF87+JgpfxXHX9zY2UYePsPwfBQypiQqyX
	vO98XNUuMPkpnUrfMRLCw3humH+FIPOO1XwdNksmiQ/HTqQY0TUd2KISASJ/xKnAe97w
	vd/FWtjIt8JDzWE3qaw6FgdZAunXY68g+o+B+n4lpQq5S9K3aJVnemDENCGZVF/QseTq
	GgCVDz3Slav2UybFDeRGPw+bODK41Tkt8VfindXxFiHItpcBgJBhbKTbRyRSfQ/5Y2ad
	cxzQ==
X-Gm-Message-State: ALKqPwfNjkK7CK4M3MtcbCAttRvaSe9YgoJeGbO2wMlPAyiMylzg2EEc
	q//0HF9OvRemRMBdse9WS8E1FnqvR7IgD+nzkrc=
X-Google-Smtp-Source: ADUXVKLPZPaRy4hHoiBe/vvKu2CRtsjkFUoEe/FPrCJ72bMJunWJ4zLgHAk4tLRQgDFaenQTCfqHVa2192cMaUhNevQ=
X-Received: by 2002:a9f:3766:: with SMTP id
	a35-v6mr2444484uae.66.1527702391638; 
	Wed, 30 May 2018 10:46:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Wed, 30 May 2018 10:46:31 -0700 (PDT)
In-Reply-To: <CAMKF1sroBR0o=tfORJxX-Fg5itQLEtBxtiTjia4E2YGYuj1OEg@mail.gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
	<1527629388-3808-5-git-send-email-armccurdy@gmail.com>
	<CAMKF1sroBR0o=tfORJxX-Fg5itQLEtBxtiTjia4E2YGYuj1OEg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 30 May 2018 10:46:31 -0700
Message-ID: <CAJ86T=VWrtpr61mxhwJNDz9FcB-V60CWFdL55Zfkw4pOC9wWkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] bitbake.conf: include ASNEEDED in TARGET_LDFLAGS directly
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
X-List-Received-Date: Wed, 30 May 2018 17:46:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 7:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 29, 2018 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Previously, ASNEEDED was appended to TARGET_LDFLAGS from
>> as-needed.inc via tcmode-default.inc and so may not have been enabled
>> for external toolchain builds or other configurations which over-ride
>> TCMODE (ie builds which do not include tcmode-default.inc).
>>
>> Include ASNEEDED in TARGET_LDFLAGS directly from bitbake.conf to
>> ensure that the optimisation is applied to all builds (and for
>> consistency with the way that TARGET_LINK_HASH_STYLE is handled).
>
> We have to be ensure that external toolchains can either override or support
> --as-needed feature,

External toolchains can easily over-ride ASNEEDED if they need to.

> since we may not be able to control what linker they use
> or version of gnu ld they may deploy.

When was --as-needed first added to gnu ld? Do you know of an external
toolchain which might not support it?

> From internal toolchains pov
> this is a good change, but It would be good if some users of external toolchains
> can chime in.

