Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.25740.1585482796925303064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 04:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XGG4eDor;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id f74so7009619wmf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=V+83HXkKeIs3J+uXO3q/70ZqUq93J7rfnJsmTAZrEiI=;
        b=XGG4eDornPYfsyxCOIxl4Qwo9LtSXnwdpP0T5EQCQcibxoGBlldj9lUQQcqR9J7sua
         OzZHWusj4I2Rd54YzWbKMfB4lVywpIlniXQaT6fygjWGb76eEFBjGF0zv47CEu5daujW
         laACjYv+oD85SmaL0HfOVfpPqIrf5TjTF+RgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V+83HXkKeIs3J+uXO3q/70ZqUq93J7rfnJsmTAZrEiI=;
        b=Oq5bXSQ/I5ZuiXXNswdmKgOeJonlBiEeAFppJsd71uUuQhju/IqbNFV0fSQKK5CEYR
         Ul0H+RJ1W9uC3mZP5yaQZUs24bie9sUkxue69WBgoy78/9e6c5yGRq7FbthHsTdBhArI
         So5Gh+XTS3tZfYUuMtF+FsfCe36MnWhntktpNhFvQEH79r/8Tj6JTnDlo7imNuo9BoFe
         LSePwoQ1OShU3YLzoaXWNm54lRVm8kektZURzTGFztWpeFUZ3FTKP3yKrFY+0vriVOQo
         BrJZdZMdGYQsJG1F+Ylioxi2weUu3TdiO8KZi3atQijUp2y/hmuJLo18quMlfxOaDyxK
         cjoA==
X-Gm-Message-State: ANhLgQ0agKG4JbWKDJRQqKbFumZQLC2scFuroJvqo0vsimIeFbESztF3
	UZ4ZRWcLbC3IbPtE48lwMZyxBA==
X-Google-Smtp-Source: ADFU+vs1gGwZfYkDInxtUJRNfNI1YGQWSQM63aBk3lEXX8VpvabgleJYEzNNs5njeRnoCQxP5+x/Uw==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr8094131wmo.73.1585482795260;
        Sun, 29 Mar 2020 04:53:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c85sm16453054wmd.48.2020.03.29.04.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 04:53:13 -0700 (PDT)
Message-ID: <25025303f418e7ea6d8d8f16e781347655aecd89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: Fix CVE-2020-8432
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2020 12:53:12 +0100
In-Reply-To: <20200327163851.5867-1-sakib.sajal@windriver.com>
References: <20200327163851.5867-1-sakib.sajal@windriver.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-27 at 09:38 -0700, Sakib Sajal wrote:
> Fix a double free in cmd/gpt.c, function do_rename_gpt_parts().
> 
> CVE: CVE-2020-8432
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
>  ...error-cases-during-gpt-rename-more-c.patch | 116 ++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot/0001-cmd-gpt-Address-error-cases-during-gpt-rename-more-c.patch

Breaks the build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/843

Cheers,

Richard

