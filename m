Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 675897D13A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 19:37:59 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id t8so9735301otp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=efCKSyjNC9vB6/Nep4IfiLTZrngRX0BwQrV9my4IG1M=;
	b=t3RurwzttpWUIUZQa4ghC+Yxr9rmQbx8QZ2R/l6+1ro/e5ZzNdg9I1OWKFBHUNsFx4
	SAm+841Sd3KBdfisKjFRV5EukawYLnMmWMwHebG2QAMh1We3O6ZiAY/2Rg7fSFLMO7cG
	OoHyOWMSleZnj78HEKxIvgTdAWAnBbPQScU8WOpjnkDaQQMYIKEuf1VqRUrZjkmA2V8l
	09jCULM+h74BNuZ0JKvnqpteFzuaxE3+Zm/byB/9igczVeFOGeiI4Zq+HdDlxOcPH/ZU
	xQlH7RlbSiU2BsyM+ea7XnBgypwC4JbFqSGbIKyb9F69EwwAz8/0uP6nk4HtTtOkGGJh
	FWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=efCKSyjNC9vB6/Nep4IfiLTZrngRX0BwQrV9my4IG1M=;
	b=QP/0v4hbSRbhVAknI0V3D0dWzV99QhK8rQYHAajiecHWVzlv2oPKgP4UZ6GDWyQh+J
	aM4Lb8Lz06abhG0hJPPJaVGSh2OxPunbyLJbD17mJXfRdETz01y5LQIMdUt/fGwlp+3g
	NgBqKw9Gk4D8Kf7hTKObM7o5ouOkcPmyqpE3dfn4eCzAIYgedn30Qp/s+6zyJol9XHlK
	Bw6jLXI890iNwOVNT/a3IQgC/l0VeuSd3E5Q7F1eMWxOQ2g9dcghsoRbhRiZBTlXkdMP
	7lUFpD1LFSdqYEeANWEdvq4ss1/7HBgWE6YLyqIdenS6ryPPD1/iVl0gdeiDDPQ/cugo
	9HkQ==
X-Gm-Message-State: APjAAAU9BpBZ3tzWVwFdrsq+V219Z7O76hjHjUpP2F/RcvhP/whqlsWu
	fS8siQ7+GKiHuNJ2Q60KWwpP9FnkDX7d389PBds=
X-Google-Smtp-Source: APXvYqw5+U5aPRcSvM6qAeeJIfqO0IIqmTlL6M5iHo+XUglvJL7Seqt6RiWXjXOXJ5aoTcpHAcFs1+hSOFbSQsCIPKU=
X-Received: by 2002:a9d:62c8:: with SMTP id z8mr45610025otk.144.1554147480462; 
	Mon, 01 Apr 2019 12:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
	<25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
	<09ee1ada-c90a-c04d-5032-dcd94e7bb864@oleksandr-kravchuk.com>
	<CANNYZj9rmK_hmgT9gS_tbZpOdMepq_F58=ux_N5F1oY7zwy_KA@mail.gmail.com>
	<CAJTo0LY-zE3PaRRs0gguBJJtacOBAM716GDWLchgVD-dFpNrQg@mail.gmail.com>
	<d21b331b-2cec-1cf0-a3b9-ca3493f0d623@oleksandr-kravchuk.com>
In-Reply-To: <d21b331b-2cec-1cf0-a3b9-ca3493f0d623@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 21:37:49 +0200
Message-ID: <CANNYZj9KYZRknsNAWojVsv0VB3VSQz==ZaCzQ7-X-oNZtvc4tg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Mon, 01 Apr 2019 19:37:59 -0000
Content-Type: text/plain; charset="UTF-8"

You need to add ell recipe to oe-core, add yourself or the ofono
maintainer to maintainers.inc for it, and make a patch to remove ell
from meta-oe.

ell removal patch goes to oe-devel list.

Also you can clean up the ell recipe and update ell as well to latest
version at the same time.

Alex

On Mon, 1 Apr 2019 at 19:41, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> On 01/04/2019 18:04, Burton, Ross wrote:
> > On Mon, 1 Apr 2019 at 16:58, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >> It does not look like a hard dependency.
> >>
> >> configure.ac has:
> >> AC_ARG_ENABLE([external_ell], AC_HELP_STRING([--enable-external-ell],
> >>
> >> So you can make it a PACKAGECONFIG option, disabled by default. It's
> >> fine to have oe-core packages conditionally depend on things in
> >> meta-oe, if the condition defaults to disable.
> > That's not right: that's the toggle between "a system-provided ell" or
> > "you have checked out ell into the source tree".
> >
> > https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8452a7f34907472c5e21c334673afd10df409eef
> >
> > We'll need to bring ell.bb into oe-core too.
> >
> > Ross
>
> Alright, gents. I am rather new to the project, so just instruct me how
> to proceed here.
>
> Ofono is a great piece of widely-used software that would be nice to
> have up to date.
>

