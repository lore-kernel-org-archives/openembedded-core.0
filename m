Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CE0C4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 11:59:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.12402.1707566339305536871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 03:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UfrCNA3r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33adec41b55so872257f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707566338; x=1708171138; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LZ9U6E2ZAUTUqkaqoa2I5dfBDZ00b07pCOnvK/yqCA=;
        b=UfrCNA3rPqPl78l0cze8EAC8AELcv1Ru7PtE6mDt09cEzzNdHVneSgFyU42flESxwd
         f+ToOMiJxSmQEkGShuHRJUUHPx3XAQJsmwGM7hq2txq1MhKgvGX7QE/sT9dneujShyYu
         zksOWv/MfmZJFnxDtYSLPwzkOJSk0+ziNWR/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707566338; x=1708171138;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LZ9U6E2ZAUTUqkaqoa2I5dfBDZ00b07pCOnvK/yqCA=;
        b=u6+auopd8qkNXeGX2yOZQLIMyO6AUEPYNaSCKxzl5V/B9O5NMJc8Jw8xH/7xs/WKJ0
         57MLFwcUX4lHziOKetLySjDy/qq7VusG/BGx4GUHSSHIGgUJ9I/88wuJZ0W/R7L/usrD
         EV5kCIbzpbekVEzmoDNZw3+nHIW5Yq9SSLEJ9hSe7FSog/nEK0u6T2VdnJFre6PcHE+Y
         PLd4eydBrH1dJfkjvwCoOsALVanngGdEgm33/pkpL5i4S11mWUf1A54s3qFAPnamrils
         biU5GnuRZSrY1dywWRqwMzAibbg5Da4g6C+Vnq813fvX3yF7MzWjZ2Ldx96w79CbZ17W
         +xog==
X-Gm-Message-State: AOJu0YwCStTLaLBdJABf1yJK6kW4Y4SKJnclxhs9b2lB9SUgwHqFnLm3
	DqOkV9SNzwvUYYdmoi9r/MthNmavneQwunzBuOHHVoE3FKco1BqywigEvMV0vxk=
X-Google-Smtp-Source: AGHT+IEWC+cWnn+ZhmMzjtX8WWSwAQlmhkFvQDaLRfmQsAAQ4i0FNOOEyFjraxQ2jNzhkDaQGy244Q==
X-Received: by 2002:adf:cd81:0:b0:33b:4ec0:8166 with SMTP id q1-20020adfcd81000000b0033b4ec08166mr1119780wrj.37.1707566337685;
        Sat, 10 Feb 2024 03:58:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTUegr8TN3v/I28ynp6lBQVNjF+r3dc+PZzk+EkY1y4EIfNAgw10NBtozFf4v2M5Si3c9WeCSmDavk9JIWdYM6i9cEz4fh0YKqSfUO/fPRh04sM1197G8m
Received: from ?IPv6:2001:8b0:aba:5f3c:c350:b3c8:3bca:cef1? ([2001:8b0:aba:5f3c:c350:b3c8:3bca:cef1])
        by smtp.gmail.com with ESMTPSA id r6-20020adff106000000b0033b67ed67f4sm1672915wro.87.2024.02.10.03.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 03:58:57 -0800 (PST)
Message-ID: <b881a5ee3848fc910c9732d21a854f9572cc9cc4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 2/2] compatible-licenses.bbclass: Add
 class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 10 Feb 2024 11:58:56 +0000
In-Reply-To: <20240210111451.2112513-2-pkj@axis.com>
References: <20240210111451.2112513-1-pkj@axis.com>
	 <20240210111451.2112513-2-pkj@axis.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 11:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195262

On Sat, 2024-02-10 at 12:14 +0100, Peter Kjellerstedt wrote:
> Contrary to INCOMPATIBLE_LICENSE, which is used to define a few unwanted
> licenses, this class takes the opposite stance and expects
> COMPATIBLE_LICENSES, which contains a list of all allowed licenses. Any
> license that is not in COMPATIBLE_LICENSES, will be added to
> INCOMPATIBLE_LICENSE.
>=20
> The typical use case for this class is if you, e.g., have a company
> policy that declares what licenses are allowed to be used. By using this
> class and defining COMPATIBLE_LICENSES to contain the list of those
> licenses, any new code that is added with a license that has not (yet)
> been approved will fail until the license is approved and added to
> COMPATIBLE_LICENSES.
>=20
> The class is intended to be inherited by image recipes, e.g., by adding
> it to IMAGE_CLASSES.
>=20
> Since it is still INCOMPATIBLE_LICENSE that is used in the end, you can
> override individual packages using INCOMPATIBLE_LICENSE_EXCEPTIONS as
> usual.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> Someone asked for a way to only have to define the compatible licenses a
> way back (actually, quite a way back) and this is the class that we have
> been using to solve this.
>=20
> Compared to an old solution that used AVAILABLE_LICENSES, which was
> removed in commit bf08d9ccb9cbc749a571af3d33140bcae0e252a6, this
> solution should have none of the drawbacks. Since this class is only
> expected to be inherited from image recipes, there is only a neglible
> performance impact, and LICENSE_PATH, which is used by
> oe.license.available_licenses(), should be well defined at that time.
>=20
> I will send additional patches for the documentation if (as I hope) the
> class is accepted.
>=20
>  .../compatible-licenses.bbclass               | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/classes-recipe/compatible-licenses.bbclass
>=20
> diff --git a/meta/classes-recipe/compatible-licenses.bbclass b/meta/class=
es-recipe/compatible-licenses.bbclass
> new file mode 100644
> index 0000000000..46f72f831f
> --- /dev/null
> +++ b/meta/classes-recipe/compatible-licenses.bbclass
> @@ -0,0 +1,29 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# Contrary to INCOMPATIBLE_LICENSE, which is used to define a few unwant=
ed
> +# licenses, this class takes the opposite stance and expects
> +# COMPATIBLE_LICENSES, which contains a list of all allowed licenses. An=
y
> +# license that is not in COMPATIBLE_LICENSES, will be added to
> +# INCOMPATIBLE_LICENSE.
> +#
> +# The typical use case for this class is if you, e.g., have a company po=
licy
> +# that declares what licenses are allowed to be used. By using this clas=
s and
> +# defining COMPATIBLE_LICENSES to contain the list of those licenses, an=
y new
> +# code that is added with a license that has not (yet) been approved wil=
l fail
> +# until the license is approved and added to COMPATIBLE_LICENSES.
> +#
> +# The class is intended to be inherited by image recipes, e.g., by addin=
g it to
> +# IMAGE_CLASSES.
> +#
> +# Since it is still INCOMPATIBLE_LICENSE that is used in the end, you ca=
n
> +# override individual packages using INCOMPATIBLE_LICENSE_EXCEPTIONS as =
usual.
> +
> +COMPATIBLE_LICENSES ??=3D ""
> +COMPATIBLE_LICENSES[doc] =3D "Specifies a space-separated list of all li=
censes that are allowed in the build."
> +
> +# Mark all licenses that are not in COMPATIBLE_LICENSES as incompatible.
> +INCOMPATIBLE_LICENSE +=3D "${@' '.join(sorted(oe.license.available_licen=
ses(d) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"

I strongly disagree with this.=C2=A0

Obviously when I'm struggling with the load of patches and the backlog
and we're about a week before feature freeze, now is a really great
time to bring this back up again, thanks for that. I now need to find
the time to respond.

Whilst I think the use case for saying "I don't like license XXX" is
clear and we called than "incompatible" for want of a better
description, I don't think the concept of "compatible" is as clear. The
issue is that it isn't clear what it is meant to be compatible with. As
such I do concerns about the naming but I do understand how we end up
with it and I haven't thought of what could work better.

The implications of the way this is implemented still worries me as
you're having any recipe using it make multiple directory listings
during parsing through an inline python call. Users won't realise that
is going to be fairly slow but they are going to complain parsing is
slow. Somehow we need to try and speed up parsing, not slow it down
further with this kind of operation. This change makes the hit per
recipe, again, I understand why but I don't have to like it.

There is a much simpler implementation possible where the code simply
checks if the license is in the list and then fails if it isn't. Trying
to make this work off the back of INCOMPATIBLE license just feels wrong
to me.

The code was previously removed as a way to try and simplify this, give
us some chance of being able to improve parsing. I don't think this
patch series does address the concerns back then.

So no, presenting basically the same code again doesn't really work for
me, sorry.

Cheers,

Richard




