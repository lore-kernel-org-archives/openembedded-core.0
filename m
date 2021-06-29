Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.10929.1624984364012804986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 09:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kBWd+PzQ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.46, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f46.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so23325193otl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mPEOF2gkTAMq9jbNax+WTJ3Jj6N/vQ/bzMSLK3/iElA=;
        b=kBWd+PzQaovMvS+YhgDI9zn3Znc/6KRjfgwuNJBuvEGzljEPUuUsdbkU+Q/Me3SlUJ
         VyDczLAfVrc1dyPjzg+pFmU4SaMp3oPViZ4aRJ919WL2WOYM+Y3lCr5xw/4uzbs2hAIH
         7cZ+vZki5KWN+IxTGXcSvSZfG/+jsxYBRhcOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mPEOF2gkTAMq9jbNax+WTJ3Jj6N/vQ/bzMSLK3/iElA=;
        b=OWLxHmHvlp2ZXU2U4w1nANNSM28J6rhH4f3hDIHAho+gV3HBXn98hXbfo1gc6doBPo
         IBt+iK5FqjdIjTTpJWdeXLpyKhwwBDMT3wGjUQvu6VkzR0NB4EgHx+47gfGCudU7XydO
         w7l7KyB5OqnBn6jNXTYD7csnSXSCxS4QO8ZcuATo57TSyiAVvd7DUOF1wPy2nu16g13y
         6nyEGyotOIv8FtyJu3QtFD2voE39X+q5dpOdMOV+Vp54j5cRQjcu3iUb0ptESz6yWikg
         BOwDsHtAjJu5htWCV/j19+Q7lg3DRKybh59tTeSAVLQYSH397DgRLsHEP1Jsyu1uy3/0
         O6Kg==
X-Gm-Message-State: AOAM531smtH/Sew2TBC8A20fSzLS3igGDPMeSCHm+XrcoKaGL8GaQLaY
	vmOia9UnKNgwCj3IpE0zIry4dMr1JP+qfaeFFMtTew==
X-Google-Smtp-Source: ABdhPJwdl9+NC7V2TAYiFzxEUIo+VVCbkQKJTE/K2jHTyfcDBHmSHyJUokIkLyKdKJus2EWRp02NOFvLEM7FTxp6SXk=
X-Received: by 2002:a9d:4501:: with SMTP id w1mr5224828ote.305.1624984363314;
 Tue, 29 Jun 2021 09:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210629140826.13243-1-akuster808@gmail.com> <CAM9ZRVvTUj6zNH-hg1ymQc+kGmKg5o0WrXAhct=LFqjNZgJ6-g@mail.gmail.com>
 <1684669268.2868693.1624983560306@mail.yahoo.com>
In-Reply-To: <1684669268.2868693.1624983560306@mail.yahoo.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 29 Jun 2021 17:32:33 +0100
Message-ID: <CAM9ZRVsNs-vxRFqxn3KvPCgBzYMheDCMwsG_w4ebELnnv_be1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] Safe PEP8
To: Persian Prince <persianpros@yahoo.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jun 2021 at 17:19, Persian Prince <persianpros@yahoo.com> wrote:
>
> @Paul Barker
>
> I spent days and nights for testing the outcome of my PEP8.sh script and I used it on more than 100 repos to check the results, what you see now is the result of that.
>
> People at https://github.com/OpenVisionE2 , https://github.com/OpenPLi , https://github.com/oe-alliance and more other teams like ViX, ATV and ... trusted my work and all those are using the changed codes for months!
>
> This is why I write "Safe PEP8" not just "PEP8" as if you just run a normal PEP8 on your repos you'll end up with dead ones.
>
> If you check https://github.com/openembedded/meta-openembedded you're using my changes for 3 months on this repo also so I don't get you being rude.

Please start with
https://docs.yoctoproject.org/dev-manual/common-tasks.html#making-changes-to-the-yocto-project
which documents the way to make contributions to the project. If
you're using an automated tool please give a quick description of it
alongside the changes, preferably with a link to its source code.

You may also want to check
https://git.openembedded.org/openembedded-core/tree/scripts/oe-pylint.
Running that script should flag up errors which we do want to see
fixed. If there are more warnings & errors to consider then these
should be added to that script or to a pylint/pep8/flake8 config file
so that we can run this against all new patches in the future.

-- 
Paul Barker
Konsulko Group
