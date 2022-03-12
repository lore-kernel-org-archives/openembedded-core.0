Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7E2C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 09:19:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.3245.1647076777481526388
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 01:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LhCBHoCt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id r6so15924993wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 01:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6O8d4DJmrLcXQsWGKM/H3rh0E43hkFAOHq0JqZgM3fk=;
        b=LhCBHoCt+8h0zlBTJwIM9Ldow14L6DrcGvuwvjcquT34f+/db9FpOwnkpijZ9eZSoE
         S+XSBYZc4YsKU9ZRW7SVwBS9rPtDRi3YWbWAqLqpIIhQWh7/sGDM6ZJQT3EY9eTOxjV2
         PqcXSUnQcoasWdxE/Nl9qsW+mZZTM/xTr60nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6O8d4DJmrLcXQsWGKM/H3rh0E43hkFAOHq0JqZgM3fk=;
        b=giNqcMaEHVx6i6MBb6PDf9kK1du4y9ago3iWLavY0syRAAFa7naGz8rmXgrEiQCYvv
         ANSepjU+VC987Jrl5cMzj4ovVC+PpW4VDKxoOA1r2Dd/g3VwKqwqlwROWScBsFIXAsCU
         Spl94gje4DG0grK5Vok7yQlPdLNA51HPOKKvfa7L4Z9XnXeXs7NgdQ+TKxt3XwAgxtY1
         2bOGcsWrMdUos/JW9lnHdPQAYAXLMUCfwwLdv5sQbbxRWK2dkvA3ge89D5tlB0WNsZX+
         sdF8+LbaIPmNpn7yZMJWZz3f/krdoZxzdKeeF3Cy/w4DTnb4hpUnHjkTmr4n+TTdI5/Z
         GVww==
X-Gm-Message-State: AOAM5304BzFbySbO6fRrhhIQ+lXwS4JcaqfvakuD8rLb9mp7jJ/ewnQu
	io4e9opdre+sPnJ3XEJ12YRz4A==
X-Google-Smtp-Source: 
 ABdhPJzAxOfiqtexGIs8hqp+opMgmaEq9xJyLyNX8suQT8rVuItIDV5xh0DR4jNmHGr6gzFXiRQKog==
X-Received: by 2002:adf:fdc8:0:b0:1f1:f134:433c with SMTP id
 i8-20020adffdc8000000b001f1f134433cmr9874919wrs.305.1647076775740;
        Sat, 12 Mar 2022 01:19:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7?
 ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 h36-20020a05600c49a400b00382aa0b1619sm8828001wmp.45.2022.03.12.01.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 01:19:35 -0800 (PST)
Message-ID: 
 <7968b70b22cda72139f6dc75b9ff252bf7cba2cb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/2] libxml2: update to 2.9.13
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ralph Siemsen <ralph.siemsen@linaro.org>,
	openembedded-core@lists.openembedded.org
Cc: tony.tascioglu@windriver.com
Date: Sat, 12 Mar 2022 09:19:32 +0000
In-Reply-To: <20220311165855.3477645-3-ralph.siemsen@linaro.org>
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
	 <20220311165855.3477645-3-ralph.siemsen@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 09:19:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163086

On Fri, 2022-03-11 at 11:58 -0500, Ralph Siemsen wrote:
> - new version includes fix for CVE-2022-23308
> - drop two patches which are upstream

One of the patches is upstream, the other isn't. I can't see any patch adding
pkg-config support to libxml.m4?

https://gitlab.gnome.org/GNOME/libxml2/-/commits/master/libxml.m4

Cheers,

Richard


