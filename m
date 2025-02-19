Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5750C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 10:08:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.19072.1739959685593416517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 02:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RJthAs9v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso71503285e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739959684; x=1740564484; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzVa/SgwR2A2hMboU5OZGoE6xEDHWPWdfAahCT36k6o=;
        b=RJthAs9vA5TtHMU2fVdyAz4wrE5PP3W/yMXuTBV+uMzcVAOTKVTpJ/4QHozvTcx8hJ
         geyfm6I5u6bmBSsF6BLZsAG9++pFf2LgZ32f9bEf5iM8CltjHoilRiVvqN7Rv9joDNYB
         m588Z1HbsVoq5c3SJocJKKEyjG8QXFxnr4aGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959684; x=1740564484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzVa/SgwR2A2hMboU5OZGoE6xEDHWPWdfAahCT36k6o=;
        b=C4sKuDzchYuOBZROZqWEXgcqyrCtg+pe8KczvIpi6BCZw+euV/ItxMZxpR0tO9S8f7
         G0ZP04CmKtN7VG7RZFkDfm4X0pZ3cNEpVVp3EYa6pP0rIDpfQD+o7lcbyC1pmY3+qjtk
         CfyDiMYZvpdQsCTrOG+chZSSKJTJjc3GjD4CFjGjYlpdTgjPEPrt5xqnDjs27AHDbscu
         rqvIrOa49HUPTwxDIhRi5czbiTRBxAv0VilD2HilN7KxKZV/91HDppYe/OpAFfgOrqlu
         IUc3d317HG13gBxMahORa1lXtcXsV1SqKrtyG2YiblbdywUs5OBFxV2ZJrIQOjbUKzf+
         26OA==
X-Forwarded-Encrypted: i=1; AJvYcCUSEEFvSrHPE3nFnpE5c2Owqey6QsQ6C1yNEtyAFstUkxasTJolX3l/DLdXuPKc22vKdZIoI8aIEYV0fnwyq3fcfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzz7otQjQ9nON5g4OHsazwacgiciMfXZJ9YLspZprR/vtPezXdI
	GD7uZg2Dg0wZC7DxXzkaYTy8BNmGlQk/BBem93uy4j69/vMzucyzTwOJZA5dM+M=
X-Gm-Gg: ASbGnctfOXH/8t1YpkX3MbE4hT346Wtf6CLqUWU84oqY4qTQIJ/EQRPSsCSl04Uv8Cw
	mdPI37COB7XL+wyC4+Ug3MpLXlKeZKCT/WPhm2BJvLhVipkMAPqwSV79TSzTqjKJsKrBdLTnpTo
	VhF6npieIJenENXWoCGzpSj00nOqsBgVB/Py1PU46HrWPmoF0CW4ifqEHKfnDHhGwDfaUMTwh1I
	/nBuu8yHs71oRQn/BHgIltIBgNaxgn0UlS02iE2z15YLQ5IMadXwY1EdmmscnmlykoKO+9a8KVM
	4DDwGi9DWSbzqhOde8IQYmWDBSTZn8mgPSC1MceUwFXpCwGFOIjlSfzfIreajlO6ON8q+daCcIu
	9Uznh
X-Google-Smtp-Source: AGHT+IHDy8oJ9QlDNfjdtBs8gmxgKen6jsr8NFUD4uv9MXyTSAtbheO80rZFDr2ljQ/9QQQr62DCFg==
X-Received: by 2002:a05:6000:11d0:b0:38d:af14:cb1 with SMTP id ffacd0b85a97d-38f33f58dbdmr13319796f8f.54.1739959683805;
        Wed, 19 Feb 2025 02:08:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:396c:d4e5:27ae:9672? ([2001:8b0:aba:5f3c:396c:d4e5:27ae:9672])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm17299153f8f.73.2025.02.19.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:08:03 -0800 (PST)
Message-ID: <4627d4fcba4316135a495df64537b141412f72f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: Check for non ascii chars in TOPDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sofiane.hamam@smile.fr, openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2025 10:08:02 +0000
In-Reply-To: <20250219094239.3283023-2-sofiane.hamam@smile.fr>
References: <20250219094239.3283023-2-sofiane.hamam@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 10:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211697

On Wed, 2025-02-19 at 10:42 +0100, Sofiane HAMAM via lists.openembedded.org=
 wrote:
> Some modules (like Perl's MakeMaker) do not support non ASCII
> characters in build folder's path, which leads to task failures.
> A sanity check is added to warn the user.
>=20
> Fixes [YOCTO #15764]
>=20
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> ---
> =C2=A0meta/classes-global/sanity.bbclass | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 66693fc9b9..5d33ef9d73 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -299,6 +299,11 @@ def check_path_length(filepath, pathname, limit):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "The length of %s=
 is longer than %s, this would cause unexpected errors, please use a shorte=
r path.\n" % (pathname, limit)
> =C2=A0=C2=A0=C2=A0=C2=A0 return ""
> =C2=A0
> +def check_non_ascii(filepath, pathname):
> +=C2=A0=C2=A0=C2=A0 if(not filepath.isascii()):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Non-ASCII character(s=
) in %s path (\"%s\") detected. This would cause unexpected errors, please =
use a ASCII-only path.\n" % (pathname, filepath)

Thanks for the patch!

I'd rephrase the second sentence to "This would cause build failures as
we build software that doesn't support this."

I'd also leave a comment in the code against that check which says that
it is Perl MakeMaker that has this issue, just so we know in future why
we added this.

Cheers,

Richard


