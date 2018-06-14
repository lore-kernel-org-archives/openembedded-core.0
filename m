Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 21C7F754B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 20:15:00 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id l15-v6so8560039oth.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 13:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qKRYN7KhZzCeY+u0YuKVM3tkO/rQgGbIGxOtn6v/HBM=;
	b=pNqD1rD5HZXB4cxX2f2JIC9nYO5NPldn4v1W3WZv1On52ZH7HxH2hTcuQkoiYqkZQV
	+gp5a6JH0RznR6BNqtiDOHPkUaEiPYX+cCBOSpKPiLbN8ImniEN9CHSG5JLhc9JqZfQK
	ppyzJuBj5FizMjgN9BIlGeY2U4K3Ci+jaERyBtZqcmZKFfQTJMrphYPhCDBQIKcr6QNM
	RxL4Jlf/afMgGRFQQ6PoqYM3ztoICyfApNSK9DaGgwa+q0ids+vX4cYspO0McnppPLDi
	YvSL4zm+Ne1f0xYZsj8ia5yqZJ3od/V/hL/5f0Qj8DQKPKXYa44HBUAxWPQj/QlZabU3
	+JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qKRYN7KhZzCeY+u0YuKVM3tkO/rQgGbIGxOtn6v/HBM=;
	b=CZnRB9zfnezv9T16Agtcwl4t7Y9FdE7jEfB7Vh7+2gPy23/H1c7KKWRwlAHpuw0ynQ
	bUam2hTI0u1cf0fRq/poTcMqfd85is8ZmiyImxWrJZb+GwhIpPbxPqa2rsRiDIbTMt3n
	A9DPIScVGClNbGdl8Fpyxx3H89XEE2I9XYjXJ7vUT9evhwb3UPRchzrDNtRjbRBmfWK5
	EBjeJmaLjvwNPyGlNbYwqNmf+yvfxomFmslGBUxbxgZ7js/mSPsnlGAZvspMd6bGC+L0
	W9w0nv9+SaFjzHNWdWTN7Pczhy0gNuhaCU72EYITm2vFq3gsfg8T8OPkbDURw3T9FYsd
	KilA==
X-Gm-Message-State: APt69E3OegwVmDAGeQ5y8dBOp6Nyvcpdhm2kuThmh9pAHgsMH/2F1z/v
	o57zl/qCM926rD1Poi4DtuPq+s+W6+lNOrrM5nU=
X-Google-Smtp-Source: ADUXVKJDdM2Fzwky7En+RWGMfIJHBZlqx5dEVpIjo+gO+sqo4/XVgk0uskKjWC3qEa44naxsx+boblEJmw/wYjtvWPo=
X-Received: by 2002:a9d:3010:: with SMTP id
	d16-v6mr2064756otc.23.1529007302072; 
	Thu, 14 Jun 2018 13:15:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 13:15:01
	-0700 (PDT)
In-Reply-To: <20180614194507.93168-1-alistair.francis@wdc.com>
References: <20180614194507.93168-1-alistair.francis@wdc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 23:15:01 +0300
Message-ID: <CANNYZj_cWfMG8eALOcmuHU62RvmyuZDryEp6RbkZkqFAMPEUQA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes-extended/psmisc: Don't exclude autopoint for RISCV
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
X-List-Received-Date: Thu, 14 Jun 2018 20:15:01 -0000
Content-Type: text/plain; charset="UTF-8"

Don't exclude why? Needs to be in recipe comment.

Alex

2018-06-14 22:45 GMT+03:00 Alistair Francis <alistair.francis@wdc.com>:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-extended/psmisc/psmisc.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
> index 82ef947709..73b4c56f69 100644
> --- a/meta/recipes-extended/psmisc/psmisc.inc
> +++ b/meta/recipes-extended/psmisc/psmisc.inc
> @@ -19,7 +19,9 @@ inherit autotools gettext
>  # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
>  # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
>  # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
> -EXTRA_AUTORECONF_remove = "--exclude=autopoint"
> +AUTORECONF_REMOVE_ARGS = "--exclude=autopoint"
> +AUTORECONF_REMOVE_ARGS_riscv64 = ""
> +EXTRA_AUTORECONF_remove = "${AUTORECONF_REMOVE_ARGS}"
>  do_configure_prepend() {
>      ( cd ${S} && po/update-potfiles )
>  }
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

