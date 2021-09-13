Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.992.1631557915584511358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 11:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j3RBSfLn;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t1so10270559pgv.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=A2wH3XTgW6nZ5Ro1NKiPsrDTd8Z76+UarapZfE7ft5U=;
        b=j3RBSfLnnoHBdevU/CJsar0KV6GZOdiU9jQSyeIGX2Ue3UD3jXq/6LtgYdehoYVrrp
         EVY7/msPc2VONlZWZ1kKMJTrjC87dhXqgwc1nMuJYpE69zX3E0CPf4/mX/9e2JbJy4km
         KVXQ4Ewin7qoi2gvb3QU82w8fg3k7iOlm1g/kX4vVX77cb4IL3K8E86ji88bsTGKCpbT
         oCha4sllSkHz0tinEyb6QJma8E26RdxfSJExVXmEth2+ciI4h8G49lf/aqTjvaBL5TGS
         HMXu57fXV1rJ8qHlC1lylZHaYiXn/QBFiwaGwu3YXqFucblkCEMeZduBdv01zRQJP3sr
         zY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=A2wH3XTgW6nZ5Ro1NKiPsrDTd8Z76+UarapZfE7ft5U=;
        b=D5MN0DivGgO3I5NBDrkZOjLtB1BiTFj4mODhSgSIYx3jRA4r0tNM7oRhOdZ+bFhQvJ
         8U1B3fXdSCbvsUtYK7T0QdJ8P/bTsMFzAKp6DlChbpMWm7eDJ3hvloX9GruBTdHMdSez
         OOTWa3i+IttIJJe6QZ33KDKBLN9Piq0TRJLklRizunuJ4mQ6pxtiSK7wxpvXubR+pvdN
         CtoeAULXMBuYMEWZMTjVL0D7jWmx/NN3FifkJj0uc1AWXBHRwIBr5Vs8zzV1GllA1A3I
         E8CJakH0A+RONc+GwRYb+EInxXJrfKp83/qtM2AE3wdWyM+EyUjfxRsI8kNTmeTjpRjk
         hD2w==
X-Gm-Message-State: AOAM5304E+XwJRiBgg925TeXqEoScptH/ixEww/ws0bdQSM7wT35V4RJ
	xAj8mtMxpNlAX8f7KhnEwPERXggymWE=
X-Google-Smtp-Source: ABdhPJyES+PLURr+dIumpue82woWjxAH4mgAOT7ID1FOD4PyHapwTVjehC2JqLKEIYlGzzWYWC1wZg==
X-Received: by 2002:a62:7785:0:b0:42b:e557:8e65 with SMTP id s127-20020a627785000000b0042be5578e65mr729794pfc.62.1631557914654;
        Mon, 13 Sep 2021 11:31:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:51e8:68a0:3bd2:beb7? ([2601:202:4180:a5c0:51e8:68a0:3bd2:beb7])
        by smtp.gmail.com with ESMTPSA id z25sm5102480pfj.199.2021.09.13.11.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 11:31:54 -0700 (PDT)
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Release tagging scheme
Message-ID: <166510d6-41d9-8677-9e43-0e64d7d879ef@gmail.com>
Date: Mon, 13 Sep 2021 11:31:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

I don't recall if we discussed changing the release tagging scheme. I
noticed hardknott is now following the Yocto version scheme.  (eg:
hardknott-3.3.2
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tag/?h=hardknott-3.3.2>
& yocto-3.3.2
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tag/?h=yocto-3.3.2>)
while the older releases are using the Poky versioning (eg: 
dunfell-23.0.10
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tag/?h=dunfell-23.0.10>
&  yocto-3.1.10
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tag/?h=yocto-3.1.10>) .
What scheme are we going to use for  honister?

- armin
