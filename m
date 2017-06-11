Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84ED3781F8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 17:23:27 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v104so17286146wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l7yDAzMVPOnBo3wXi+kXwk45LBp0+irWlPwofbglyRM=;
	b=saLhqrbIlPp7sJCZXELetsoOhB7CXjBiwzVFQfJH8GfFbjQDg+YLRX4eXEql8fECtR
	SUD0Grh1Cx3pUbSNoc7T6LNzuIPrWrAQaFOUEuBZoaDBEbdLp84B6hIgkkjP/riq8wUU
	37kibPbI2oj7NpL7Uq2rkMA7+xtrPW2jYA2vR9JsX78kYKcZ7VgH/zBn7vrRDq/NfVfE
	8xGVkvBrhqNd8YNpv0U+XSoHyoB+f7jNL011NW+sGvQYjqCUBEhsH3aO3Jsq7lb8TA5k
	rJ7WrY839LzvuwOY5Fm+aSCCaIoe2Pt6gNtywxn8n0nNKg7OPI4T4Zgki01lP9EQoB15
	eZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l7yDAzMVPOnBo3wXi+kXwk45LBp0+irWlPwofbglyRM=;
	b=n+hHB+fIUdJo8c41Jc6yCR8jgkqceNbauwcTDY0LA7vtdgxnZQ/n53E0tghpVLq6Z/
	VqGQMHrWkTuwl+0uVrK46wTVJyD11Ox/LagHTXbF2O3cB8ZPCoI7v5Un5fIDcUKiyEFO
	pMwbfN1EOAP3HWf2WxQ6Tm6WvLFcAehxL8JmwS1PxPbTFb+UAwFRZtm7iQKPV1QoeNdn
	PZoDU2yqivdOzo1CVS9Apq5PE4Gzp2R5unq7uS0FL/8+JvaBXhItZJ7c47XQ3IzGqvv1
	NilNHRPXgEpKWu7lCKK3eYnhpUQxICLNRnrxDrhYTj/jRytWEC3e9ff3roMeDqwUuBLU
	P5Iw==
X-Gm-Message-State: AODbwcAJPpEnrJj646ev6jGkZ3eBZxep8UL32lgHDIiebu87OiuvBeqM
	Ms8Z5SNZynxWmlr4kzPSu4Z8wN40+g==
X-Received: by 10.80.144.68 with SMTP id z4mr25686662edz.143.1497201808508;
	Sun, 11 Jun 2017 10:23:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sun, 11 Jun 2017 10:22:58 -0700 (PDT)
In-Reply-To: <20170611165839.26175-1-net147@gmail.com>
References: <20170611165839.26175-1-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2017 10:22:58 -0700
Message-ID: <CAMKF1spiqofNf6r_0v6Hg208zH38x13-pX09e9OfCTbiGHEyBg@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] bitbake.conf: Add whoami to HOSTTOOLS
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
X-List-Received-Date: Sun, 11 Jun 2017 17:23:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 9:58 AM, Jonathan Liu <net147@gmail.com> wrote:
> The whoami command is used when building the Linux kernel in
> scripts/mkcompile_h to embed the build user that is visible
> in /proc/version.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3ad905c917..4f20aa3d1c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -465,7 +465,7 @@ HOSTTOOLS += " \
>      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> -    uniq wc wget which xargs \
> +    uniq wc wget which whoami xargs \

I think it might be better to not use whoami at all to begin with, it
might be good for reproducibility
too.

>  "
>
>  # Tools needed to run testimage runtime image testing
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

