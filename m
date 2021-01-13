Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.250.1610580240068080369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 15:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZfRd2Fw0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 190so3035781wmz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 15:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=vzt2I8cL9U+uZ3tHk82FrwfuYcbeAH9wwkBYt2m78Vk=;
        b=ZfRd2Fw0uY2gk7+mrnQtOkS3m7SUKTAnmf3+uzS8I0X3+tC1xaR16RwiMvbvVqbzyV
         48zc1L4qauibkjbpu1saEgSjHee9ZAeLSXvXR4rJNUwmpIGxDYvD+yFamQEvoTwKq3+W
         Iq85mXkNfO4++RFPYznC+vVMGtSbbxQcN5DUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vzt2I8cL9U+uZ3tHk82FrwfuYcbeAH9wwkBYt2m78Vk=;
        b=U4psUyHYhzi8F4p2SR/HfgFOYuNSkWxK+VxSsqM1qK8B2j3IRUD3S/X245WRSNmf/u
         lAEhqbAQfQMSnl/6p+AeDklJwEUQd+I8twXRywFumJdXwnDGqFf21ZofO3RyZKRqOs+f
         /JMb7k0rw8IEVGAhCQHQcpJP/KXWlWB4GPopFNHCgYmE2h/4J+87VpKsWMXZFqTLO+lY
         ZiOlBsk9/bTUet9Wj92I8hYcRYMdV7UNPlhBhpTm3HoVI5sPBqTwjX7EOHFlFZEHQESj
         kmvJK2yse7zwa5fcIi31GJfGYYJpejG9PrINe21BubxCTCBi6nBmmheRdT+KngQfQTP5
         LjZw==
X-Gm-Message-State: AOAM532JzXPPu/BSzYrkkGcs5+bzBwe7ijtzRTWO7gsdGU646c9f9bVM
	ezvJ5P5VXQbfgK0QFD+9hFjXtg==
X-Google-Smtp-Source: ABdhPJzs2cyYg3yIC5a7AC+kgBjDP82FdMwPPl6BrS3Icp6ILzUZZj3h/ViKIXzuZgJiRIzysMlc5A==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr1269438wmc.117.1610580238682;
        Wed, 13 Jan 2021 15:23:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3? ([2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3])
        by smtp.gmail.com with ESMTPSA id y13sm5921295wrl.63.2021.01.13.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 15:23:58 -0800 (PST)
Message-ID: <85783eea9b8cec5df8258a0adc5aaa675f3bc052.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libpam: remove entries for pam_tally and pam_tally2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2021 23:23:55 +0000
In-Reply-To: <20210112204332.3506294-1-schnitzeltony@gmail.com>
References: <20210112204332.3506294-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 21:43 +0100, Andreas Müller wrote:
> Both were removed in 1.5.0 and one should use pam_faillock [1]
> 
> [1] https://github.com/linux-pam/linux-pam/releases/tag/v1.5.0
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta/recipes-extended/pam/libpam_1.5.1.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
> index 8c008a9701..f2f4fd91d6 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
> @@ -118,8 +118,6 @@ python populate_packages_prepend () {
>                        'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
>      pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
>      pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
> -    pam_plugin_append_file('%spam-plugin-tally' % mlprefix, pam_sbindir, 'pam_tally')
> -    pam_plugin_append_file('%spam-plugin-tally2' % mlprefix, pam_sbindir, 'pam_tally2')
>      pam_plugin_append_file('%spam-plugin-timestamp' % mlprefix, pam_sbindir, 'pam_timestamp_check')
>      pam_plugin_append_file('%spam-plugin-mkhomedir' % mlprefix, pam_sbindir, 'mkhomedir_helper')
>      pam_plugin_append_file('%spam-plugin-console' % mlprefix, pam_sbindir, 'pam_console_apply')

Just for info, this entire code block was removed by a different patch
that came in a little earlier!

Cheers,

Richard

