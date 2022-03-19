Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711A4C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 00:10:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.2237.1647648622283234192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 17:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SqxYN/qh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u16so12675454wru.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 17:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=doK2mnCaLIHD5h8emJoX+tqfTFMpvFeKyyOFqRdW6Q4=;
        b=SqxYN/qhzI8LUhRpnt+VxB+4tFNw6+TqYAsb/KazPr6GWgUQYpg+Deshzu6N6MuYiL
         Vs4tRvv0L8rhzElY1avARN6MePAGO46uaRwjwt2cfWtLbZu6WWo/cOIeIPtqwDSAgwos
         zm2uEBjR22P/kHB4BMeMMA1eTJ4jzDPYopEhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=doK2mnCaLIHD5h8emJoX+tqfTFMpvFeKyyOFqRdW6Q4=;
        b=bbCGM96CWh31Pam3PL3hSoJDtBL6If9JnIxq7U007H8UXnMytnDMMb80IomFvZnTys
         Wox60RgAHEF0dF4KG435pZlugql334xqg0tmLU2eIsy55EKbsI7Tb7Br1fywCjhUenFq
         3I99XEv1DqofrFEejkLnUgEmoZsSsQ80V3EIiqBIjvDX7HmSBvihyAe4P0hIP5yfcGE3
         Fo1GcHC0Tbva7co4ge8THPoVPRDZxLhlGBS0ccSYFLIPistS+ihwuU1yqZZRLWDW/o7O
         XHV3rRGzFd2G7wEcA10Xxj18Jpf2bc1VLJJUSsZQ1cHtNNibt1awZirGpxHfZeqNnnbM
         nVOg==
X-Gm-Message-State: AOAM530R8zBq60jtuWwAx22q0ZVPtotbeEtzMqMuHtLBA0MlLFWNnmPL
	/abD0xAaOO9cgZSVhzVODQvbJg==
X-Google-Smtp-Source: 
 ABdhPJyKRjSOsgD0z4yDF/f7WfWWq2lBAomDPMcu3R8ro8kXUiEn8SxIfhK8Kh3pY4pixl/nr83zOg==
X-Received: by 2002:adf:910d:0:b0:1e3:9484:1601 with SMTP id
 j13-20020adf910d000000b001e394841601mr9514972wrj.419.1647648620637;
        Fri, 18 Mar 2022 17:10:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5?
 ([2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a5d584f000000b00203ded4f92esm11969264wrf.18.2022.03.18.17.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 17:10:20 -0700 (PDT)
Message-ID: 
 <9f00a3fe1b69e4c4e9fd34ae04effcee6229b929.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libtool: Upgrade 2.4.6 -> 2.4.7
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 19 Mar 2022 00:10:18 +0000
In-Reply-To: 
 <CAMKF1soE840jiaiuKZ3-zJKY+f5DWE8Ry_7HOhPFoK=hvZwBWw@mail.gmail.com>
References: <20220317180005.1009380-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soE840jiaiuKZ3-zJKY+f5DWE8Ry_7HOhPFoK=hvZwBWw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 00:10:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163455

On Fri, 2022-03-18 at 17:06 -0700, Khem Raj wrote:
> seeing these 3 failures with new libtool in meta-oe
> 
> https://errors.yoctoproject.org/Errors/Build/142979/
> 

Those are all libtool version mismatches. Might be a case of deleting the
libtool m4 macros before reautoconf?

Cheers,

Richard


