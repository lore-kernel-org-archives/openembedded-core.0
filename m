Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DCAC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 21:20:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5929.1686259251986430711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 14:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=HGep1u3M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso6852625e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686259250; x=1688851250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQTg0QB/kCMM9LVloakv7WsEtpxq5cCeeLnOVM+QGi8=;
        b=HGep1u3MTRdD69CMqVTMv1DNMifU+KhrAcr+9h4nUwNuAHy/ifO6iea62UfHqnx2UK
         Mk/igviVD3AIAcz1FY6ihvR+dVAPH9exB2B9I4dvDL5vVXaZ0EMs4V5qGXhchbiIVpBi
         fkWcXpGolA4vAigN3N6u327j6jcF3EyjUcUHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686259250; x=1688851250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQTg0QB/kCMM9LVloakv7WsEtpxq5cCeeLnOVM+QGi8=;
        b=Q2gWgjERRtSvq/24zCcNyWN6rpmjGgEAddkMVIpQf9m45yabk4zI8UvfrNnCz2n+w8
         kcQlC2Qje7az+s9zQ2NlRXoSSlDBQMB9TCyZc9h6HIjVCOXAZWldYJHFBLUkrt2ZWMkN
         EMSErddxG4xjXELTJL2Lb36blWiTA5s+qFI74AMfkIwNeLfGuexWzrzw+lYnSlbN46ke
         u1HseEGTFpQDPAalWOHnlQTky0jhAAK5/BgEtiYHcTzdqa5G/2+J0QHrGU9M8IkO4hyl
         R31Dq//sb5nXdRyFzSsfDtZDORfoyuLwkzJNroJot7uGcUU0ThKy0VnmSfXqfyn7ksO9
         kzzw==
X-Gm-Message-State: AC+VfDwUXyAo0NctqFOxCg27iryPLQHEIl3QBRuThDXdcic3OW4DBeV0
	rkE3S9ikYGA8woXZcRkaYmW+LA==
X-Google-Smtp-Source: ACHHUZ6NpbZg5i/nLFCfUHwGuEdbThdAAtThUIFv947SSbWbHPJvsNc7OoG/3eRbs84rrKt8JbM0Qw==
X-Received: by 2002:a05:600c:3785:b0:3f4:2158:28a0 with SMTP id o5-20020a05600c378500b003f4215828a0mr2278956wmr.12.1686259250156;
        Thu, 08 Jun 2023 14:20:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f? ([2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c22ca00b003f427687ba7sm650804wmg.41.2023.06.08.14.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 14:20:49 -0700 (PDT)
Message-ID: <f679fa743116eb541986884190dbeb1ecf681eb5.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] icu: increase command buffer size
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joe.slater@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Thu, 08 Jun 2023 22:20:49 +0100
In-Reply-To: <20230608171803.3728701-1-joe.slater@windriver.com>
References: <20230608171803.3728701-1-joe.slater@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 21:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182522

On Thu, 2023-06-08 at 10:18 -0700, Joe Slater via
lists.openembedded.org wrote:
> From: Joe Slater <joe.slater@windriver.com>
>=20
> Make cmd in pkg_installLibrary() LARGE_BUFFER_SIZE to avoid
> pathname truncation if the install path is longer than about
> 150 characters.  For default compilation, the U_ASSERT does
> not detect buffer overflow but this is not addressed here.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...pkgdata-increase-command-buffer-size.patch | 43 +++++++++++++++++++
>  meta/recipes-support/icu/icu_72-1.bb          |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-co=
mmand-buffer-size.patch

My worry with a patch like this is we could end up carrying it
indefinitely. This is the kind of patch which really does need to be
discussed with upstream...

Cheers,

Richard

