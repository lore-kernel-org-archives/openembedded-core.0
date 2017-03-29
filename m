Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1361677C28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 15:22:59 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id l43so20500224wre.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qMks8Gh4GMktJzIvXLm2Xe2MTJiQJokNROcO64yYyAw=;
	b=lk3SZCKnrsIcjxMTFEbgQkNmBhm2m+ZBN36fbza5qZ2A5yOlBjSiFiVZCqzKA4Yw78
	uvdG7hskdUWAMtR8o++C9VIBvxZl1uVaOdYSvU9SLXTq9QGHNuCr/aW9U0dkMnCkhz2v
	X6XiX01OPN24fS1YJExRDYHAw4nip4Pm1luW8e4oShaEOcmQslVDAP9hLwHwBS+UcUcm
	Id4VS7S88c3FOfMyi7MepDQqbHYLT0L2Dyri7K3Ava9WNx1DporSencRUzwvHZHEqISs
	dPJgLI31EJl/IkyyoUu27x7YFbr+I9TWKNasj5T5Rsa/JpcpmxKJziH9DgkOnR39LPR/
	f3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qMks8Gh4GMktJzIvXLm2Xe2MTJiQJokNROcO64yYyAw=;
	b=igB5ulRdw7WLB80n0MsBADyB2p5rSBrJ8NQC4+PMDlrwvSg0lQMWBnHJkfbVauRDb7
	RKY5nXsRSWwFU367gPU8fJrBbY8qoGNulB13kTc4msMtnqbWf/0nscspG7e3q2O2Nx0l
	ayyFANnu+Mkh/iT7Z80JYDvmqC87Q6D1jWUv2fSDh1cH/UgjXv6YhFTmpvxC+Pro++08
	+3ltJQ1tP5iRuxLsMKEnhVFP68Vt7iTArVR5MMpRzhlrBhbvk43NJutZOaonmZSNQ5gu
	zbH9PKv95gPzoKSB3cjWNzEGpuzIbg6noon2Fji/3tJMNdrVBoZthIYZTaJLjwzVPyn3
	jJuA==
X-Gm-Message-State: AFeK/H1BmhpJzCx1RU8LH9eZJRfGBkso3SpNOmXNhOpG1QRrj+jDq9QUcj9yuK9g7RL+xaKLSsdPd8m7C3Q3iw==
X-Received: by 10.223.182.133 with SMTP id j5mr1050958wre.19.1490800980863;
	Wed, 29 Mar 2017 08:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Wed, 29 Mar 2017 08:23:00 -0700 (PDT)
In-Reply-To: <1490783069.13980.307.camel@linuxfoundation.org>
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
	<2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
	<1490783069.13980.307.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 Mar 2017 08:23:00 -0700
Message-ID: <CAJ86T=VJjTvtwBPvY+jW1+P8tDMMjMJuRgsHTZXSgj=F=vjbxA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Wed, 29 Mar 2017 15:23:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 29, 2017 at 3:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Also, in case its not apparent, you can work around this today by
> providing empty fragment files in your own layer. These would override
> the default ones in the main recipe if you set it up right.

Or use SRC_URI_remove = "file://login-utilities.cfg" etc.

> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

