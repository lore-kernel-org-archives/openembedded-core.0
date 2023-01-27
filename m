Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DD9C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 14:26:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.103154.1674829561167439928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 06:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g2DUwlEu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id r2so5116017wrv.7
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 06:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mZs1IAmoPBojwdn6e7dm2ZCV59Et9euhYE6Pj94ocvo=;
        b=g2DUwlEuQ48IQozaBYySd58pOc3dLlunoXNHCCUSAzZQNcXhL/tg37YIeDD4I0OHEV
         gDJlsN3WK3p4WoSopPBnDR9UjeYzNg2oiiQnzbhMJUksrxHLoZrsW1eQaZchg1Thpzvh
         A9oRX5HMzthgS5Qx1Oi1ceacDI5N0t+psRsqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZs1IAmoPBojwdn6e7dm2ZCV59Et9euhYE6Pj94ocvo=;
        b=CVp9gt2cZILT4/MdftaCnBgQSP4Wi25fIKrEf0WTtg+zW2NNKfaDBf45SvZdCRFphs
         P88PrnApa34+xQ7nfcfbQRlBeLsC7uQnNqWSjOQjMW1ZmgF3v0m+5s8ut0iL8l+eLXtH
         TF0fSxIA20k+xeZcaDwZIzfrYSV4CtDhGGLxEB5rxDPRWkumpG+9wMJeiaszK1zlGmP8
         TcyBfd+2iUtXZ3ul5VYBBdlgiTELpuSM5GljWcCSyDjk1ZjqzncSJqhf/MiVpDpOzzgi
         orkDBb9BUZ3KuYHWG4pvDEoVkVgxCuEkK3R1fr5TP455bkGhA2PyOKl1ZG8FsR1s7Jyd
         WL2A==
X-Gm-Message-State: AO0yUKVW7bcohhX0fpZdeIfUtZQvFLPgGkuIcwx8SgkNrWFX4RKJs8pd
	1rnMtvFzza4y1z/vJc7uOfkP2kx8KmubMJjg
X-Google-Smtp-Source: AK7set+BdWD+iL4wyNIEuoMbzvUYx9XcC+0tZ+Kf6SNcdzcGAY+IjzcSLcneP0peDBbpN8f9EDNH/g==
X-Received: by 2002:a5d:5712:0:b0:2bf:b106:9f9b with SMTP id a18-20020a5d5712000000b002bfb1069f9bmr11303147wrv.10.1674829559660;
        Fri, 27 Jan 2023 06:25:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3876:ca46:43a6:4b49? ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id f28-20020a5d58fc000000b002be5401ef5fsm4256807wrd.39.2023.01.27.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:25:59 -0800 (PST)
Message-ID: <628bf7942a37c7e97d50ebcc07080b257b47f315.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "cve-update-db-native: show IP on
 failure"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Fri, 27 Jan 2023 14:25:58 +0000
In-Reply-To: <20230127134055.1870465-1-ross.burton@arm.com>
References: <20230127134055.1870465-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 14:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176449

On Fri, 2023-01-27 at 13:40 +0000, Ross Burton wrote:
> The bug this was intended to find has been resolved, so we don't need
> this extra noise in the logs.
>=20
> This reverts commit bd1edfa3d5b1c24cd1192620f7085ee1df03e1af.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/meta/cve-update-db-native.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
> index e042e67b09a..079f062f79b 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -130,10 +130,7 @@ def update_db_file(db_tmp_file, d):
>                  response =3D urllib.request.urlopen(meta_url, timeout=3D=
cve_socket_timeout)
>              except urllib.error.URLError as e:
>                  cve_f.write('Warning: CVE db update error, Unable to fet=
ch CVE data.\n\n')
> -                bb.warn("Failed to fetch CVE data (%s)" % e)
> -                import socket
> -                result =3D socket.getaddrinfo("nvd.nist.gov", 443, proto=
=3Dsocket.IPPROTO_TCP)
> -                bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in =
result)))
> +                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
>                  return False
> =20
>              if response:

Since the error is only shown on failure cases, isn't this better left?

Cheers,

Richard

