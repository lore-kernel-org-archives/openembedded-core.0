Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9E132747E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 14:12:46 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q12-v6so4210414qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PSyq6zq/uTHFh/OfqEXDVWpJrZFsoduO6iGVsRMXTSk=;
	b=s5B6aGdOzAv2xqCug+oGG3JzdK6YVPgLLdyfZ9ghLLljZOkuHDz4sqn2gV6pdI7cq+
	7gG+muUQ6BxtH5gbfcbzCpEp1AvsOpH9fzHxwOMQ8pX3Yc0LpVPnL7R1A2lv6sHMul9D
	CUPqIzWy1P6+EjW/6uL0T3KADymdUEp+qwK8r3vTK3FdkcdUhfvH5nmHAIyXJaCf+Ebf
	5knkN0ib1nFWFQKcwlQ3GCKSVPh+J300P2+qR/FbWp7THhEfIbLedX5bMK9SN7sh27Te
	kn2ZO7ZyoHzHaLG0csVaLKjmi8+LGnssMq9P88K+FytNvUzq65I4nsSd+FjDOIRgcGhQ
	3tHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PSyq6zq/uTHFh/OfqEXDVWpJrZFsoduO6iGVsRMXTSk=;
	b=Z3IdTpeyQ2lYu2mjeu4U41YFDVkmBjZHiaO+Kqp6PS9c8n9wkUK9UZrNTYFKSlHkqU
	dTvQPWFVFBPLJVCLIoCz2BGF4O4dxLVNW4hKqBqXDArsGc7smnESqJ6WMhqHPHC/MzP8
	R8aZNnfKNfxU7Z7Pf9ue0YC+ljfvPcqw9/rSI55sKQBfyUaCfb7iDhIowuetwIqW8AKS
	0VE1v0SZkEmteUH45bMThHqEeCW1Qxp/mcbTf8P0k8NjBNQmHsTcSPhusgXqlgMJuCMb
	kKduE79UNQatjSpYZeZpNf4Im6MYEhpQQ8+ZsLQQNs4Et8ft9cTxwEw+mWInvmYPkXaI
	FvxA==
X-Gm-Message-State: AOUpUlFUE8suiCRrgDlFVcJla4K8YpyaMKYHABUraFYKo8zNbaMMsdqQ
	8C7DyoPKUmaGzRWQXUP40N8duqhbjN5woDEAWdg=
X-Google-Smtp-Source: AAOMgpeJ+dPgcIUV5DERcY4VOZTpI2xuvL3cuORA+tVx/M2+vV6YLUOsmyOgaS5yn2litYmz2xTO2oZ3IbsgrAVZhUA=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr16491094qth.188.1532441567285; 
	Tue, 24 Jul 2018 07:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
In-Reply-To: <f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 07:12:21 -0700
Message-ID: <CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Tue, 24 Jul 2018 14:12:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 12:30 AM ChenQi <Qi.Chen@windriver.com> wrote:
>
> Hi Khem,
>
> The comments in security-flags.inc also needs to be modified to remove
> 'poky-lsb' info.
>
> I'd suggest we still put it into distro conf file (poky.conf) instead of
> defaultsetup.conf, because defaultsetup.conf is included by
> bitbake.conf. I think things in defaultsetup.conf should be necessary
> default values to build things out. I don't think security flags is
> necessary to build things out.

this is the default setup, even non-poky users will get consistent experience.

>
> Also, I got a question when I just looked at this file.
> Do you think we should adjust CFLAGS and LDFALGS in security_flags.inc
> instead of the current TARGET_CC_ARCH and TARGET_LDFLAGS?

in many cases packages do not honor CFLAGS/LDFLAGS say during configure

We are naming
> variables to SECURITY_CFLAGS and SECURITY_LDFLAGS, it seems that they
> belong to CFLAGS and LDFLAGS naturally. But I'm not sure about it.
>
yes they do, but this makes it easy to override the setting for packages where
these options are needed to be overridden or modified.


> Best Regards,
> Chen Qi
>
>
> On 07/24/2018 03:09 AM, Khem Raj wrote:
> > This has been an opt-in for so long, some distributions e.g.
> > poky-lsb uses it by default however, since most of linux
> > distros have started to default to these settings for security
> > enhancements, time has come for OE to make it default too
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/conf/distro/defaultsetup.conf | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> > index ca2f9178d2..352e279596 100644
> > --- a/meta/conf/distro/defaultsetup.conf
> > +++ b/meta/conf/distro/defaultsetup.conf
> > @@ -1,6 +1,7 @@
> >   include conf/distro/include/default-providers.inc
> >   include conf/distro/include/default-versions.inc
> >   include conf/distro/include/default-distrovars.inc
> > +require conf/distro/include/security_flags.inc
> >   include conf/distro/include/world-broken.inc
> >
> >   TCMODE ?= "default"
>
>

