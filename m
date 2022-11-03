Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC194C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 07:49:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16786.1667461736019821298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 00:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TzE+7fCS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bk15so1336596wrb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zwsjjl4WhG8Z3Vm5vyX7+0p3xjbN+QC88h8hk7WdHNE=;
        b=TzE+7fCSBcpDpPqqcVjc5bxWrYBenfEbmgh1if+czWcYve/TRjsVH/r9SqcWBsZleh
         +umBDTrASpJGZB/SBRIXqRIhV3/O7IAWbhiJqkgpKFHC+YFrZWlk/BMY4UwaZ9LKfdtY
         pfZKTD1xdWL2NiXP4s7ZboVOZg1vUQy9nr4xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zwsjjl4WhG8Z3Vm5vyX7+0p3xjbN+QC88h8hk7WdHNE=;
        b=m5V3KPAAxeYkF2s3maBSLO05YezxYKt4AFk5TubdaGs1+7eM33QC+fX8DOoC0hZpK9
         BYW1gm9ODKBfVofYhs3YrbjNxMvWjqUEoTv95noe6IfK75sNnFg2sn5ZAOTi51A5o1o8
         FDY2TKTUlwbiL/CsmCytnKY4a7Nbc4cRGGjvtzb0pnMTWDYesvQzpXRoAdnePIl/Naip
         vO9Lx2z5oU+qonOlsf17sFLdy0KbivhoPaw7z86r2sZXIZPUJcO0iDSNY6KjskpugRjw
         wAzl8auHH72R6fzjv6kYvPMqHsbD/qryJgoJ4PprPdDMcyAT11QNV+9bZyItXqrVDPEB
         w+FQ==
X-Gm-Message-State: ACrzQf2+WCftFxiPn/C2txYOGC09ULWtR/Uezrn73jkW8nFYT+W0ogop
	L/G9Y/JK5lqvUw3b7jcnnglWsQ==
X-Google-Smtp-Source: AMsMyM5Pi4/hmNIvyiD/RzX0Bipo0lfk5DuU/VgAwn8jb6xdecA+eGCNxR8Kh3wijDV3rPWFUUTJmA==
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id q16-20020adfea10000000b00236ec3e869dmr5752189wrm.33.1667461733720;
        Thu, 03 Nov 2022 00:48:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fec4:d12e:21c:2d17? ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id s7-20020a05600c384700b003c6deb5c1edsm388477wmr.45.2022.11.03.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:48:52 -0700 (PDT)
Message-ID: <500a73b3658f2a77796df31a4ef6d06a91d04174.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 10/11] python3-typing-extensions: upgrade
 4.3.0 -> 4.4.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>,
 openembedded-core@lists.openembedded.org,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 03 Nov 2022 07:48:52 +0000
In-Reply-To: <20221102031830.3606777-10-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
	 <20221102031830.3606777-10-tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172614

On Tue, 2022-11-01 at 20:18 -0700, Tim Orling wrote:
> diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.4.0=
.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
> new file mode 100644
> index 00000000000..c8cbb215f04
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
> @@ -0,0 +1,69 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgra=
de'.
> +# The following is the difference between the old and the new license te=
xt.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')

[...]

Whilst this surprisingly made it through Alexandre's queue, I think
there may be a change needed here! ;-)

Cheers,

Richard

