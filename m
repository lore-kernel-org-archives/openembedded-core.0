Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9817.1630432721378872469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 10:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sfXfnB7L;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id m9so457742wrb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=QBI4D22aMbsorgCSEYfLput34DGitbn4h5S5eSAk/Go=;
        b=sfXfnB7LRSLz3PNIIZQs4jNDqfXE+/Yb10MUB2pWT0JM1yLERuBfG6JTAm13bONIJA
         gp6eDGOKwtWb0rsqDHsHv0vXUeEIR3kjURFK7z4IWgOHLdNOK/jIixErFRLEvJe2a8qU
         QlaqDTskEpFtWLMW38pQnx3+rdWUbZdH5gbBMHbP85YGGYByFZj3Lv4TL4EYEKWK3Ip8
         hLF+JS4yVZ5YcFzC/nL6vlt4b1tNstv4IN3ULnzaUmnVJ71ceD01eQtLlQDpfUDaUGv1
         HYqCMO5OO2JD03FfCpsAyrQolmttw7OXVvJ5KK3ZhdwzE/BTtzyOeNGs26h4FcFRYPPu
         tuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QBI4D22aMbsorgCSEYfLput34DGitbn4h5S5eSAk/Go=;
        b=FZbQkBeCBr1oy1rlkvCdcUXXNkxhoeZYN0J+rCB1jm1fuHISEfBwTDDFu+AFKt5pAr
         lbSfWhekWd0u9/bhkfzd/FaBPwok5H9f0Jg4gocLlsdn+ygAf9TfPLt0J+IgY6qu6WqE
         IB36w5E/SlLlPD8fN3kGxI5Ca/Uri9wHwBkM6g6nQF1HLnWMZfMO4qcU08GTYekGkBHT
         Wtx0ja1jBJDQLOJWxHvuyx78YNlOcRMod9gTIf40XjzOoClecHbLxgoBQqIGjBlGfKdc
         aTzE/fw8DVRNgR1EJRH124VwmDK4RZ8Blncn6KqtDKAFtmN/jMFE5Z8Rib3dJOcUDp17
         gizg==
X-Gm-Message-State: AOAM531Jwnn1F6Epy2fXR9iMbjMUKNVEDuyak8jjhk1oNXV0tMZ8oT8s
	zooHv0sr/DdYGcapkdLlOIQ=
X-Google-Smtp-Source: ABdhPJxHejioPwZHL1WPHkFaShD9mw7Nm5/vkZ8nCuZB3EcQDMu8YEfobbebI8RRuWA5ondvcKVWlA==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr33341072wrq.147.1630432719887;
        Tue, 31 Aug 2021 10:58:39 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-94-66-232-217.home.otenet.gr. [94.66.232.217])
        by smtp.gmail.com with ESMTPSA id o7sm2961909wmc.46.2021.08.31.10.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 10:58:39 -0700 (PDT)
Subject: Re: [OE-core] Upgrade uninative to fix multiple native build failures in old unprivileged docker
To: hongxu <hongxu.jia@windriver.com>,
 openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, raj.khem@gmail.com,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <169FF34664D4ACC1.22970@lists.openembedded.org>
 <169FF42BF9440142.22970@lists.openembedded.org>
 <f1f1ee17-1f81-8791-b87e-3692a0cafe2a@windriver.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <5dee0c30-b658-b730-44ee-a9c2159d21e7@gmail.com>
Date: Tue, 31 Aug 2021 20:58:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f1f1ee17-1f81-8791-b87e-3692a0cafe2a@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I just experienced this problem in Docker version 19.03.13, build 4484c46d9d

 > $ bitbake pkgconfig-native
 > | configure: error: I can't find the libraries for the thread
 > implementation
 > ...

Can you please tell me what patches I need to apply to get this to work?

How will this be handled upstream?

I guess people would want to run a build in an unprivileged container.

Regards,

Robert
