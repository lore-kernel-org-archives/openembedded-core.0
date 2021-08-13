Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.43248.1628891821211223625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 14:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y13hg0WK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z9so15005083wrh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 14:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2E+2yNCwigBaCop4Ly2FpP8R3/VNode/S6qpeJf3Rpk=;
        b=Y13hg0WK2GWMobnPhH7vC8QldJVVoCH1O1oteNbXcdu2z1GYnHD9Yclwl8lsB3Bzzu
         CvF5AoEGXPSSoZ2ttmGjC/3cX6biCt2tUc7JCzUeIPoAhA7kNnVpNmepUTx7uyjIpIiD
         ZN8dlHzGMTBc7r1/bgEUI//4CQUerK7+q9F6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2E+2yNCwigBaCop4Ly2FpP8R3/VNode/S6qpeJf3Rpk=;
        b=s0Nifi/GE8+Bi4+6f6LQvSm7UkMT7CnRlUUBjZGfXVDJ5bRyCoXlGKyJW/ZXs6DqqU
         qTD785csmhC0fVvju1S0JYn7yf+KOMDjmCnW5iTeS+KsDJ9GxlOlsagumz8bcQKRq9ji
         ZFLa+ZzIMGhfUCRD6Z8I887Cz2+A3mZi6L+49tAlHYw5KbtpXb1249+IkazendX+Cs8S
         lbK6bj6RGOlBZvkDJ+rz8x1xeAYCIyBhdwIVc7LsPiTaWSNInDPrhxjiIaclt3WO3CSn
         WtoYSb6PeoJ441vhrGJB8megD9au0JUhYPqAhEko+I1yj17IQdVOkFW/6hpG2siSO40F
         LChQ==
X-Gm-Message-State: AOAM531ukwqKHEE+oU1s0hVhZc1e6NH/Z9vwSOzTwdcMIvesbkslXVPm
	UPiRPygyVrHvoyAKvc45IT44Zw==
X-Google-Smtp-Source: ABdhPJy7BFlut43dekuXe2rM/uxjkU+NGNPHD5dCy3XCDJzG6iOE39/3hJSEg09nZOXhfj0T/NP6Fg==
X-Received: by 2002:a5d:58da:: with SMTP id o26mr5497909wrf.140.1628891819659;
        Fri, 13 Aug 2021 14:56:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ef44:3f5a:be32:a2fd? ([2001:8b0:aba:5f3c:ef44:3f5a:be32:a2fd])
        by smtp.gmail.com with ESMTPSA id e2sm2574045wrq.56.2021.08.13.14.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 14:56:59 -0700 (PDT)
Message-ID: <00a408d147c98960dbf2bb8980bd20a1b6616b7a.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 07/17] image: Drop COMPRESS_CMD
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 13 Aug 2021 22:56:56 +0100
In-Reply-To: <3ebaa86707ea99e8272dafc442318e3a5f483018.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
	 <3ebaa86707ea99e8272dafc442318e3a5f483018.1628863869.git.steve@sakoman.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-13 at 04:29 -1000, Steve Sakoman wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> This was replaced by CONVERSION_CMD a long time ago and is no longer referenced
> in core. Remove the references to it.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 576d52cdaca047d290c3b10b26aa2244da230dbb)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/image.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 1900eff412..0e252e99ff 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -460,11 +460,10 @@ python () {
>                      # Create input image first.
>                      gen_conversion_cmds(type)
>                      localdata.setVar('type', type)
> -                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype) or localdata.getVar("COMPRESS_CMD_" + ctype))
> +                    cmd = "\t" + localdata.getVar("CONVERSION_CMD_" + ctype)
>                      if cmd not in cmds:
>                          cmds.append(cmd)
>                      vardeps.add('CONVERSION_CMD_' + ctype)
> -                    vardeps.add('COMPRESS_CMD_' + ctype)
>                      subimage = type + "." + ctype
>                      if subimage not in subimages:
>                          subimages.append(subimage)

Not sure this is appropriate for a stable series?

Yes, we got rid of this a while ago and there are no core references but
there is a small chance other layers might.

Cheers,

Richard

