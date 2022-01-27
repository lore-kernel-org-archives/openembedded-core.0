Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00F0C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 18:32:01 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web08.1840.1643308320148603276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 10:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OMufB8aW;
 spf=pass (domain: gmail.com, ip: 209.85.166.173,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id 15so3253217ilg.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 10:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=OtDJTShnGklRZ0qbWUEe9PgzJ1MC0BES7Grdmrysi8Y=;
        b=OMufB8aWeAt0hpLTrBiMKXQg8ZN8PtjOe9dG/84ndfVNeFFX+iUKuAI4RjXJIl9Uo9
         jUtnVrr5wpErmMQHmNrU3yXiHwa2MArYbBvEmk0u1Ub3hJQKmZP25OJuzGe7Ar31asbP
         ZDCm2C9zydiVP9yuW2AiUpYWbnqHoMg3/tlJic/VQdl6NZwSCmPWcZrZ7dRCir42DEV7
         Rx4L7/xnGCb9D8MxIQVWHMI6EO9SJQV71FU1LnI2T9A0I11bDipL9pLgXS1woquOLgyD
         OHi8ViekAqwcYu60nT+frtIbTaFPRPJNpD60D8rb+8fLQV6Oqw23KOYnZuteXCBZP7Vm
         SjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=OtDJTShnGklRZ0qbWUEe9PgzJ1MC0BES7Grdmrysi8Y=;
        b=PdZQ152NmAuYJ8VA9jKks6GWZUhdEFBlW/HaovHqOIuhpYpqZhxyB59CsYZpDtGlyl
         YM6zQRtQpHoBa3NtBy2y1+uIvL82XBZzPc37NB1t08qZWwALXQhk7KwStp+ifWT6X6Il
         r6HZfbm1CszqkkEzaE6Z6GJE/Ntp4OM4oQHNQzeVKd3CwS0qvd0jKEoDCjy3C2fdOh1v
         XG5lrrJufUb8OxpqvvE4683gJUWr/y5xrxSwbz+8UXsNRdQ+MUVgNX++RH9cg/eIaIM1
         NQRr0qW4oRjiIO7BemOLiJOT8oshaOLJ7+g4tpUwdPCnS4yTbFTEGGFYp32/zCtTPhEB
         +JRw==
X-Gm-Message-State: AOAM530lFhnpZFAKgT2HsNsELdn2QJJbJ8Gt/Ay2xQFhsbUXifMIdFXw
	Q3+GhrrXfZ9tejb1A8w6Trk=
X-Google-Smtp-Source: 
 ABdhPJx/llXwn5atpBgNvWsNWQz/e4FmEi3LMpM3WR0495Sz37Hz6s3EPkBvMsk7VNAV08j4ghQkWg==
X-Received: by 2002:a05:6e02:20ce:: with SMTP id
 14mr3498922ilq.261.1643308319461;
        Thu, 27 Jan 2022 10:31:59 -0800 (PST)
Received: from [10.128.88.142] ([72.10.162.5])
        by smtp.gmail.com with ESMTPSA id
 k8sm5003636ilo.45.2022.01.27.10.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 10:31:59 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------q0RfMk2E4lGZUqC5yffVcjT6"
Message-ID: <7e42c014-6ccc-7323-ddea-ec8181711b7d@gmail.com>
Date: Thu, 27 Jan 2022 19:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] initramfs-framework: Add overlayroot module
Content-Language: en-US
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220126072231.1749903-1-alhe@linux.microsoft.com>
 <CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com>
 <3954c194-7d7f-9dd2-a1f2-54b088396009@linux.microsoft.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <3954c194-7d7f-9dd2-a1f2-54b088396009@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 18:32:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161046

This is a multi-part message in MIME format.
--------------q0RfMk2E4lGZUqC5yffVcjT6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.01.2022 19:09, Alejandro Hernandez Samaniego wrote:
> Oops! completely forgot!, I'll add it.
>
> This is loosely based on the overlay-etc.bbclass the difference is that
> the class only works for overlaying /etc and it doesnt require an
> initramfs, but, while its possible to tinker it in such a way that it
> overlays /, its not possible to access the original (RO) / after booting the
> system, this is the reason  why this has to be done from initramfs and why
> this doesnt patch the overlay-etc.bbclass instead.
>
> I believe Ubuntu has this feature, coming from the cloud-initramfs
> package, functionally it should be similar although no code was borrowed
> from there.
>
> I'll add a note about the overlay-etc class though.

I missed this part when I answered to your first email this morning. I 
generally against expanding the scope of overlayfs (i.e. using it for 
the whole / ), because it creates a bigger migration effort when you 
need to update the files on a persistent partition. I see the only 
difference in your code is that you provide access to original lower 
layer fs. Why would you want to do that?

Thanks,
Vyacheslav
--------------q0RfMk2E4lGZUqC5yffVcjT6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 26.01.2022 19:09, Alejandro
      Hernandez Samaniego wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3954c194-7d7f-9dd2-a1f2-54b088396009@linux.microsoft.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <pre>Oops! completely forgot!, I'll add it.

This is loosely based on the overlay-etc.bbclass the difference is that
the class only works for overlaying /etc and it doesnt require an
initramfs, but, while its possible to tinker it in such a way that it
overlays /, its not possible to access the original (RO) / after booting the
system, this is the reason  why this has to be done from initramfs and why
this doesnt patch the overlay-etc.bbclass instead.

I believe Ubuntu has this feature, coming from the cloud-initramfs
package, functionally it should be similar although no code was borrowed
from there.

I'll add a note about the overlay-etc class though.</pre>
    </blockquote>
    <br>
    I missed this part when I answered to your first email this morning.
    I generally against expanding the scope of overlayfs (i.e. using it
    for the whole / ), because it creates a bigger migration effort when
    you need to update the files on a persistent partition. I see the
    only difference in your code is that you provide access to original
    lower layer fs. Why would you want to do that?<br>
    <br>
    Thanks,<br>
    Vyacheslav<br>
  </body>
</html>

--------------q0RfMk2E4lGZUqC5yffVcjT6--

