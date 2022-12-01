Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAF5C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 11:41:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.40777.1669894889350453153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 03:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OLFouJ/W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id q7so2247239wrr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 03:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nOZchWuSrdfRMWN3lh9rybONXHPwQZsig4WXXp3fG8=;
        b=OLFouJ/WK/ZEuoau0p3+ZUca3HNI/tW85CqUp+ObB3hKdJIgVhpUZd0ZFLetfBkWCO
         tQaNOtm5usebzELhfxMLUmbeHldsme9zJ3GkP5MU9tpx+mnBsf4mHRtNELHs4PBkc3bj
         sX70+N8vffrqg/hzFZLkzdVhFJnGewnf+fym0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nOZchWuSrdfRMWN3lh9rybONXHPwQZsig4WXXp3fG8=;
        b=zetYeWAsA7UZwegYJuXD1R32O7KGyoW1XdiAlc+WwqcBXjr/y9LqM91v241YhTj85i
         kU9ZDYUTZUWpT4WO3EOajJf6naemoL2z9o6jISYEc+XAJC68eDW5jPq6B9Qoqo5D4SB6
         1IvifZwsEoJ+zFy/RLJC9wcph7PKGsiJQoAptaf7b1B5ED6Esgi/oOPowZL8VgxYATwd
         RgB3ehBMIzoifkh+A78mtVGE5/FzsVAZ+K8GofHUYL5PfrgALJ0moVyjc8ILE4VvfIfR
         3grA4wRQNO0LQ9HTuu5bARsW23M4VbP85RUaZAfylshgLUNTMi2vscMcGwuN+eRQgIRV
         6Bkg==
X-Gm-Message-State: ANoB5pmXZageukoKzXfa0zN895t4/LRKFz9pyAixuMDHEYxQfY5gFRFy
	/jcU6bKUQ6FgThO5d5s6AV6ok+c+dqiAJg==
X-Google-Smtp-Source: AA0mqf7ARMmWj2Y8ztWhJSM8kacb2PkENIc1RVSrvkPPnoBLBnMVKCi8AK0jESnAaxGwfSjxAY+NJg==
X-Received: by 2002:adf:eb92:0:b0:236:80a8:485e with SMTP id t18-20020adfeb92000000b0023680a8485emr33309827wrn.362.1669894887605;
        Thu, 01 Dec 2022 03:41:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f4c:de93:c029:9984? ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d55ce000000b002422816aa25sm5121527wrw.108.2022.12.01.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:41:27 -0800 (PST)
Message-ID: <35ea92148bf5fa123685be303936b0c2b5b5cf13.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCH] rm_work: add note about how to clean
 all built recipes' workdir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 01 Dec 2022 11:41:26 +0000
In-Reply-To: <20221201080904.6042-1-Qi.Chen@windriver.com>
References: <20221201080904.6042-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174052

On Thu, 2022-12-01 at 16:09 +0800, Chen Qi wrote:
> The do_build recrdeptask dependencies are removed for a cleaner
> dependency relationship. This, however, makes rm_work behave
> differently than previous releases. Not all built recipes' ${WORKDIR}
> are cleaned. This is because we use the 'depends' varflag to
> specify some dependencies, and rm_work cannot handle such case.
> e.g.
> do_rootfs[depends] +=3D " makedevs-native:do_populate_sysroot ..."
>=20
> I really don't see an easy way to restore previous behavior, but
> we can use `--runall build' to ensure all built recipes' ${WORKDIR}
> are cleaned.
> e.g.
> bitbake core-image-minimal --runall build
>=20
> It would be helpful to add such note in this bbclass, as people who
> use rm_work might also want cleaning all workdirs.
>=20
> The following testing is done to ensure that the extra tasks added by
> specifying '--runall build' should be mostly do_build, do_rm_work_all
> and do_rm_work.
> '''
>  1. bitbake -g core-image-minimal && grep label task-depends.dot > curren=
t
>  2. bitbake -g core-image-minimal --runall build && grep label task-depen=
ds.dot > runall-build
>  3. diff current runall-build | grep '^>' | grep -v do_rm_work_all | grep=
 -v do_build | grep -v do_rm_work
> '''
> In my testing, the output is empty, which demonstrates that all extra
> tasks introduced by '--runall build' are these three tasks.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/rm_work.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 4121a13279..b54d949e46 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -23,6 +23,13 @@
>  #     echo "bar" >${WORKDIR}/foo
>  # }
>  # RM_WORK_EXCLUDE_ITEMS +=3D "foo"
> +#
> +# Note:
> +# After removing the do_build recrdeptask dependencies,

I don't think this wording is going to age well, it refers to a
previous event which nobody will remember in the future. I think if we
do add anything, it needs to be worded differently.

>  merely running
> +# `bitbake recipeA' does not clean all built recipes' ${WORKDIR}.
> +# To ensure all built recipes' ${WORKDIR} are cleaned up, run
> +# `bitbake recipeA --runall build'
> +#
>  RM_WORK_EXCLUDE_ITEMS =3D "temp"

I am worried this is really something most users of rm_work will
consider a bug and want the issue fixed "properly" too. As you say,
finding a fix for it is going to be rather tricky though :(.

Cheers,

Richard




