Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.9085.1590076272968919294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 08:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KfFhszQO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id i15so7092197wrx.10
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0K+zZAf7A+HqzSG1dg2adRLRr5PDD3c1dDfhgtLdzbI=;
        b=KfFhszQOyGqUSMU+hvb8Wn0S3Fp41I9zpkNC/86XPqZQVPjwYQjs0BIx8mxTI4nw4D
         JazWNkvnU/fTq6nqHKTQKaillyLP9tMEU0XLkx0Sib8ng8odEZyEY9YJPTx2EfRfFtbk
         BqAa4BG+cWIsRyKHNKCtOp98aX/JBRn/4++j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0K+zZAf7A+HqzSG1dg2adRLRr5PDD3c1dDfhgtLdzbI=;
        b=E3tW/CJUv1BQNxqYEZAuT9vzilTGPHDyvqsguu7N+NK/vRqi2eVuaenXNy1TEbhd6w
         PRdr1xP/egk1j4ZRm3ylCIumIkUpu7Ay4Gas6qpeByJQsBEYJUhqrwm1xN8HiCQhcpGz
         ZjTe6I/7lVYgPLfnCCiM3q2gv8+lmLmnAoQcbOH/vL4vTPO/xomFQVHIwJOfiMNUbzZc
         U/gFdmbZKnkaEsVkqNtyrML8Lr1eGmMYqo4d88JNa7fKvbvkTMJap5P9gMW7HS2twDiX
         JQptdQitdxgEN+Ms3jZ6qp99XEJdMs3XkpzQ7bUNyvaduNRT2p98C0LZKhIS1CCIAEXN
         3Eqw==
X-Gm-Message-State: AOAM531U3X+ICAyKTMvh3aWqVldKTd8TNASnNOEz3gSvOSE3cwspgURd
	XHS3cSJRnlRnnZDORzub9lgDOA==
X-Google-Smtp-Source: ABdhPJzUkMvglgd5A+XVujc0dld6vJAmCxCn3dZ/XZlmg6PFuby1aPz3zIBKkf3w0dauIkh8OFhFWQ==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr8832213wrx.36.1590076271500;
        Thu, 21 May 2020 08:51:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z11sm6795845wro.48.2020.05.21.08.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:51:10 -0700 (PDT)
Message-ID: <3fb18a4cbc85e21a21c4c833e0dfd672ab52bc13.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Bump layer version
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2020 16:51:09 +0100
In-Reply-To: <20200521153455.11252-1-JPEWhacker@gmail.com>
References: <20200521153455.11252-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-21 at 10:34 -0500, Joshua Watt wrote:
> The commits 910ffaf5be ("pyelftools: Import from meta-python") and
> a96f815c53 ("pycryptodome: Import from meta-python") moved recipes
> from
> meta-python to oe-core. In order for this to be communicated with
> users,
> bump the LAYERVERSION so that meta-python can key of it in its
> LAYERDEPENDS.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index da93d64e0a..098ef12ac6 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -11,7 +11,7 @@ LAYERSERIES_CORENAMES = "dunfell gatesgarth"
>  
>  # This should only be incremented on significant changes that will
>  # cause compatibility issues with other layers
> -LAYERVERSION_core = "11"
> +LAYERVERSION_core = "12"
>  LAYERSERIES_COMPAT_core = "gatesgarth"

I'm trying to work out if/where this helps. It can certainly help the
case where meta-oe is updated and core isn't as you can get an error.
Where you perhaps don't get one is where you update core but not meta-
oe.

Its almost as if you want core to error if meta-oe is too old too.

Cheers,

Richard



