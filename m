Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C415C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 22:40:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.1374.1637707212612196256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 14:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XMmYysUI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id s13so596650wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 14:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3Sh4gtRsn9VZp2pcXSYN/nyEIj/wzE7NaFTnIVngPWU=;
        b=XMmYysUIxpF4M+k+U3flQtiRY+hcLCAB4C9aI7uGAPXnfl/BZTexPu1zHsEf++hqz0
         pwFqQuisr1lcU6FVa0cPpYlQJSYsqBrLlcpa4zZd7y+exP332i4Jh6lHAUw3Eo2MskIE
         5kpuBtDK8MiwHHR5MsPVzgJQ4tr8IpwI33sTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3Sh4gtRsn9VZp2pcXSYN/nyEIj/wzE7NaFTnIVngPWU=;
        b=rlz3H9biPXaBFqAQ39+u8c1SmiFERWZoKkz56uTc/WHgdlPvWdM/XfMBomuVyYfzdl
         YAqdpethhKwbp9qKiJoBXRooHfR3ysfMDNXmpF3JmPx0TVvvLJtpSj5GdYlobaop+H0w
         315yF+P9OxxvO+WDTXzb83Jn8hpzea3wf67ecXx8JHR57+RcSw7RUIgCnqQ/2IbaFRRd
         4nDYzTpxW0+MYeWFqRQLCIueDwIVkSktsv5Y0qGg8XjcuaQazETwOWDXpSgUxhlCSUFz
         ir/V849rUx+KP24RBpVZC5NvwEPU9vwvvbTq3alCsxXNYqjMxr6lkrE8J09Hte5yyyIp
         dA4Q==
X-Gm-Message-State: AOAM533Gn/RhAFKeKZ8UYMDBJ94rNivfB+Y9xPDyZ+JnM6VLzgCmTpM1
	oBgj8aoOE3jLjXeh2YRO1cqLxA==
X-Google-Smtp-Source: 
 ABdhPJwkf8Rt8zZ1ABH/lzzfAAILqoxFmnzqzkXkYP3lH55Vtz+KfDPqt2zZaNBDUQgOw5AvD5saHA==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr11858823wry.261.1637707211185;
        Tue, 23 Nov 2021 14:40:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id
 a12sm13004338wrm.62.2021.11.23.14.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 14:40:10 -0800 (PST)
Message-ID: 
 <82e623096c8435851e548c63ed6f25b95d093fa7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3] waffle: add explicit dependency to
 cmake-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal Limon <anibal.limon@linaro.org>
Cc: openembedded-core@lists.openembedded.org, ross@burtonini.com
Date: Tue, 23 Nov 2021 22:40:10 +0000
In-Reply-To: 
 <CA+_AqiuXK9Sd0EpcdWX32dj3G4ZmxJxO+PmiR3W8erPkKXTChw@mail.gmail.com>
References: <16B7C59052251915.18463@lists.openembedded.org>
	 <CA+_AqiuXK9Sd0EpcdWX32dj3G4ZmxJxO+PmiR3W8erPkKXTChw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 22:40:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158644

On Tue, 2021-11-23 at 12:00 -0600, Anibal Limon wrote:
> Hi,
> 
> Is this patch good enough? or need another change.

There was feedback about the commit message needing work. Someone else also sent
a similar patch with a commit message with the right explanation in it so that
was merged in preference but the issue should be fixed.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=50e0aed0684526c74072ceaf8fa52964c9cc0d19

Cheers,

Richard


