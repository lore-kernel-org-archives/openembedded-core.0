Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5159AC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 08:15:33 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.61755.1643789732059593572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyDtOLhU;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id z199so24412369iof.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=fGqmmg42ZLDoQKDk8NuCKMPQUOa5oIYWu+o6oljgvzw=;
        b=QyDtOLhUona4VY5WRkqkLyD5YiZS7/zHByuF6vn5upIxH3YiGkR2t1B22DKmtPzUnJ
         h2MnxJy3ACkADI2ifzgkUic1ZDLcU87GTqWZfddZC+3CxK1tKCmnFE81BqHox8BkGCwA
         qEVmVpiALtIo/qUREwiTQDAllYpjdQd3erp2/bpBabmNfcRycjtbRxqGsz8Oi/6tHayf
         lcptcedAwBvkwtyr3gJXOB4+2cMI7b02e3/n/pRsETA0VKBhvAx/abU1+w6rW2bB6G2X
         AVXzeL3389cz1iPhl/lF07IY8zmvOQKmYI1CS00P5aSjLBrpOfO8WspXB+rj9eDzAbgD
         BHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=fGqmmg42ZLDoQKDk8NuCKMPQUOa5oIYWu+o6oljgvzw=;
        b=Ot5KCgLEfDc8J1PXwo9k4pIfDgsC9ARkoVP/9iQyaKJLt3jgJEEuESlSMiF6UG7N7g
         dXanNz3d19ssG2/iy1rONexZBXsUAy/oDEIdrO337KyG4JYI8jlrQjmd30P2wN5cQ8Hg
         a7prpJ2+XmoymlxOmjPyb+HFbUtyC7SwYjI66HyrZch27K8Opq4eWwvCiQtro0m75Dpn
         61J1GgyyUt98nptexHng/VjOj5TlT1dwFvdp/7gF0qYQt3nQIzdR67aQAUyT4mkEfinb
         xnqt12UmVYz1dwHF5OaEgUzk+4OzeCcIBRk2Cvx7k+BF3ZHCo7oYaB4DrlYGToRT8J8p
         bQDw==
X-Gm-Message-State: AOAM530akmvDLDtEbKkEaKV1nF+KUNfx7zP/OP0gF6RBJ79k58CWHwTb
	XhzMy4cWNrgKt42fdzwmxzI=
X-Google-Smtp-Source: 
 ABdhPJyuC7yrqJLHWu4FtYc9hH5MyA+4qaq22UurzYVD7XGua6O/twzf2cV+EGYuQKn0ldV/xc4juA==
X-Received: by 2002:a5e:dc4c:: with SMTP id s12mr15899513iop.47.1643789731233;
        Wed, 02 Feb 2022 00:15:31 -0800 (PST)
Received: from [10.128.99.121] ([72.10.160.133])
        by smtp.gmail.com with ESMTPSA id
 z5sm22401150ioq.47.2022.02.02.00.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 00:15:30 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------PLlRP5pJVoMfOK59ByGR1lHC"
Message-ID: <193aad3a-ef93-fb74-7a9e-a6fe799d5778@gmail.com>
Date: Wed, 2 Feb 2022 09:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: Add overlayroot module
Content-Language: en-US
To: Alejandro Hernandez <alhe@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
References: <20220129194839.3280002-1-alhe@linux.microsoft.com>
 <10c1ea08-3b69-aeef-6052-41ad98f37ce6@gmail.com>
 <ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 08:15:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161183

This is a multi-part message in MIME format.
--------------PLlRP5pJVoMfOK59ByGR1lHC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro

On 02.02.2022 07:58, Alejandro Hernandez wrote:
>
> Hey Vyacheslav,
>
> ...I definitely tried extending the overlay-etc class but it simply 
> does not work for this, since the rootfs becomes inaccessible once the 
> system has booted, ...
>

That's what I meant. What if we added another parameter, let's say 
OVERLAY_OLDROOT_MOUNT. If it's set, then lower layer can bind mounted to 
that mount point. In that case -etc part of overlayfs-etc has to be 
changed for something else, of course, to make it more general purpose 
class. Perhaps overlayfs.bbclass can be renamed to 
overlayfs-systemd.bbclass then?
What do you think?

> ... but it is a different use case and boot flow so I believe both can 
> co-exist for different workflows depending on the user needs...

My concern here is code duplication :) If we find an issue in one place, 
we would need to change it in two places.

Thanks,
Vyacheslav

> Cheers,
>
> Alejandro
>

--------------PLlRP5pJVoMfOK59ByGR1lHC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Alejandro<br>
      <br>
      On 02.02.2022 07:58, Alejandro Hernandez wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><font face="Courier New, Courier, monospace">Hey Vyacheslav,</font></p>
      <p><font face="Courier New, Courier, monospace">...I definitely
          tried extending the overlay-etc class but it simply does not
          work for this, since the rootfs becomes inaccessible once the
          system has booted, ...<br>
        </font></p>
    </blockquote>
    <br>
    That's what I meant. What if we added another parameter, let's say
    OVERLAY_OLDROOT_MOUNT. If it's set, then lower layer can bind
    mounted to that mount point. In that case -etc part of overlayfs-etc
    has to be changed for something else, of course, to make it more
    general purpose class. Perhaps overlayfs.bbclass can be renamed to
    overlayfs-systemd.bbclass then?<br>
    What do you think?<br>
    <br>
    <blockquote type="cite"
      cite="mid:ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com">
      <p><font face="Courier New, Courier, monospace"> </font></p>
      <font face="Courier New, Courier, monospace">... but it is a
        different use case and boot flow so I believe both can co-exist
        for different workflows depending on the user needs...<br>
      </font></blockquote>
    <br>
    My concern here is code duplication :) If we find an issue in one
    place, we would need to change it in two places.<br>
    <br>
    Thanks,<br>
    Vyacheslav<br>
    <br>
    <blockquote type="cite"
      cite="mid:ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com"><font
        face="Courier New, Courier, monospace"> </font>
      <p><font face="Courier New, Courier, monospace">Cheers,<br>
        </font></p>
      <p><font face="Courier New, Courier, monospace">Alejandro</font><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------PLlRP5pJVoMfOK59ByGR1lHC--

