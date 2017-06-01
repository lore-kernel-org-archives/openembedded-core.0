Return-Path: <dev@codyps.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id B47996FF69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 22:17:25 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id p66so31199736qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zDAesvSW61snG6G27HY+r5V+AhPFPdO/R8XtsCsgUUg=;
	b=bZK/tJu4xQLhnJkYjG1BT7JYSkf9hRBRe4lxDjb64WYlzvoyGKckgI8SSbn0X+uIb5
	KG2NfprD0z6ltNB5bD5ITCiAesFylI103rulZw9izNhlnKZMkWihmKmaLAE8dlOF4QWt
	txp6N018daS7J46JJ3ZS1nz/7OPdFc/ON8tYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zDAesvSW61snG6G27HY+r5V+AhPFPdO/R8XtsCsgUUg=;
	b=ZYTEagITzWYd8bd/5W5hRBcjR+2hjJfGt/HQjQeujtz5hx+OBAVTqoi4gMBgAZzrCx
	Bp7llBWKamOkhUuh/6WJUbFpAG/G963Nf5IR5ZdUHVlNLNpgUnY/1DxlkcAu7NV+EL9x
	ahh1FQTZ2/pITYst3BfiyjLy1El0NjzvvPUJOdaelM5nG42kzA+hnLcFii1kJQvH4Gok
	/dI5agSM2auOWxqBquj3Oa0gRBTuL2D+LSUofdzo4BZl8BFwgJLk6Mi0jCc0oKskApvN
	Wmr1cbdyMNNiordkw+TdHJhonPZ0F2BkLtzofY0oBHkRfmppNMcm8jLHXhIJFMlLvPWE
	p7gg==
X-Gm-Message-State: AODbwcD1dPPAhLq3qbnACj0TbwBTUWGMvQPu09pxLvQP8zqKV0Jz6/YD
	G9wCeyheiU9e01wGtAOnS7Ipb12tdAIb
X-Received: by 10.55.200.209 with SMTP id t78mr4863251qkl.178.1496355446870;
	Thu, 01 Jun 2017 15:17:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.168 with HTTP; Thu, 1 Jun 2017 15:17:26 -0700 (PDT)
X-Originating-IP: [2601:190:67f:ebb9:e065:d5f8:984a:e361]
In-Reply-To: <f3591f2b-14cb-7db8-b697-17db7c2e3cb0@windriver.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
	<CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
	<7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
	<CAPoQQ-3k3HBh97T855_qY4PtBy8Z2qTVuU_BawnBJsvcBCoe8A@mail.gmail.com>
	<d5baf3fb-75f5-d50c-e59b-07f3688a88d4@windriver.com>
	<CAPoQQ-32FvReq9UQPKVYM0dL4LC=vg__GVvnVf3uSq8YwDQerg@mail.gmail.com>
	<f3591f2b-14cb-7db8-b697-17db7c2e3cb0@windriver.com>
From: Cody P Schafer <dev@codyps.com>
Date: Thu, 1 Jun 2017 18:17:26 -0400
Message-ID: <CAPoQQ-2J0YV7kj7sRHo9G_rtq+PwJDhVguC4jf_E_ai0Zh6nAg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Thu, 01 Jun 2017 22:17:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 1:02 PM, Mark Hatle <mark.hatle@windriver.com> wrote:

>
> The rpcbind runs on a privileged port (usually).  So either you have to 're-use'
> the system wide on or run your own.  On many environments, with a system wide
> one, you will clash if someone else is offering the same services.  So you are
> forced to run your own and/or register then with a different set of port numbers.
>
> This is absolutely needed in a multi-user or 'locked system' configuration where
> the user does not have permission to run these types of things.

unfsd does not include rpcbind, it optionally uses the system's rpcbind.

In the runqemu-export-rootfs case, unfsd does not use any rpcbind at all.

Still not seeing anything that would require runqemu-export-rootfs to
use custom rpc program numbers.

