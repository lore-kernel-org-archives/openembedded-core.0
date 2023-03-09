Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE71C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 23:15:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6133.1678403707921498358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 15:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SB3mo2IV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id g3so3470367wri.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678403706;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa69X48+gdyLMyGWjCc+Woq7JSmRhOeRf1WZNAhpFrQ=;
        b=SB3mo2IVkg7l5yT6BCnZa5LAqzOe7D30fAZaxoRHBq6ZphepL0zUsjkHYAjxJ6dBJe
         aIqTffgqkulvNw5uSHAkzbSO+L8QMHmx1wxRXr85GuLG+mpynHrAwH4tN56AzIZb3ruM
         KcmhPXEDc9QGzBF4WjGs6949jdtYhbWLw06Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678403706;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pa69X48+gdyLMyGWjCc+Woq7JSmRhOeRf1WZNAhpFrQ=;
        b=yGCdvYQudcAUYFm39d8rW7zWZIjX9ZXvhbur0v9C+zP0JQXM0ukcwvKsL6YZGmgS9+
         MuGUrToLunY57Tuuy6LGWmUWnO9GOVnAfoZOhwpEenYNSuT7suXzvomIm7eBbnXqO5PD
         KpmWpGnV2+TWFLs8JUxI8d9vF8cmR4da+1PW9YfrQxcWMWZvHFFRpwFeoHq9FzCxwXbK
         R8dlDLs7koloSydzppjVA33aQXC7Mov5d5UZgNVY+cQcoot1Xp/Itpp1uXoc47r2NVBy
         juQq8pZZvIc8HvXxYWHD+Jzczf6FZP32HLJqWV9zLJZWA9soj/cEMCp2rQ8Fc+nytp2E
         te+g==
X-Gm-Message-State: AO0yUKVfpGDjNQSDsCHE2hdqfCL/V1GsFiBplnkghIp60q0ih/uz8j39
	8cyfA4C3DEkwF6E74QXxOPY/6iDOL3snxJKAOfw=
X-Google-Smtp-Source: AK7set/wm9cX2tpkg3Pi9YlTFeGKHi8F/zP9bsmkgWm445RqowjRwb1g9mNLRRm3u/sLzbkvDEw3MA==
X-Received: by 2002:adf:d850:0:b0:2c5:a742:572f with SMTP id k16-20020adfd850000000b002c5a742572fmr15015275wrl.49.1678403706054;
        Thu, 09 Mar 2023 15:15:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a9dd:6583:8973:50aa? ([2001:8b0:aba:5f3c:a9dd:6583:8973:50aa])
        by smtp.gmail.com with ESMTPSA id j21-20020a5d6e55000000b002c706c754fesm544087wrz.32.2023.03.09.15.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 15:15:05 -0800 (PST)
Message-ID: <00f4dde74caeef7ecd1b26bf5f9a76c4f21dece7.camel@linuxfoundation.org>
Subject: Re: [OE-core][langdale 13/27] devtool: ignore patch-fuzz errors
 when extracting source
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Mar 2023 23:15:05 +0000
In-Reply-To: <aa256e62df4f31de1c2c1ce7d0a6ab8bdba4a032.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
	 <aa256e62df4f31de1c2c1ce7d0a6ab8bdba4a032.1678401759.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 23:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178301

On Thu, 2023-03-09 at 12:57 -1000, Steve Sakoman wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>=20
> So that patch fuzz issues can actually be fixed,
> as extracting source with 'devtool modify' is the first step
> for that.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 7067abd31d9dd4b98ec70c1c7effbe2904797cd1)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  scripts/lib/devtool/standard.py | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index d64e18e179..0339d12763 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -567,6 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, config, basepath, works
>          logger.debug('writing append file %s' % appendfile)
>          with open(appendfile, 'a') as f:
>              f.write('###--- _extract_source\n')
> +            f.write('ERROR_QA:remove =3D "patch-fuzz"\n')
>              f.write('DEVTOOL_TEMPDIR =3D "%s"\n' % tempdir)
>              f.write('DEVTOOL_DEVBRANCH =3D "%s"\n' % devbranch)
>              if not is_kernel_yocto:

Whilst this is harmless, I'm not sure langdale has the patch-fuzz QA
test enabled as an error?

Cheers,

Richard

