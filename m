Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34A0C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 11:34:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.22684.1683891258009017781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 04:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=WjvuxsKM;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-24e3a0aa408so8578416a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683891257; x=1686483257;
        h=in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Heke+m6tzKfW/kRwqU/hLIBOI92SDtJXOayanwGkZlY=;
        b=WjvuxsKMrNwBS0/ob5gQD1kIUxdeFLDGwAywxLb02zlr5GUkMb08GnRBeQR1ofNal0
         DoSqwjROUpZz5uDHseg2KY1HG561JkMUnx29Zznw2PleVkNyI3vMaPxT4Zmv+ne/b82H
         7WhEMAoQHe9pV7U3/y198r4RKlDNdTjP9sp60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683891257; x=1686483257;
        h=in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Heke+m6tzKfW/kRwqU/hLIBOI92SDtJXOayanwGkZlY=;
        b=CQ6s926ld7+ZhQelXw3Zf0WYfpatPR627lcTZ7Ed3ozX+BkkbK6NWRELM+slkCHOY0
         To/Lk12HMQ+t1GbGXf8GuG6ssEO8N/19BMyKAeV11p9PA/h2TQpY3f1LrhuZ5K/XlJNO
         2ohEOkrsM95gCMlVqp3i8UY+ShCsP1DFdmDY7+KsdkMd9aRd32d7DS0QXeZqguZ+G5iw
         F+NHX5mgqE/2LUtO6nBqUtRTs+TDPx6YN9aySC5+wnRKJMhUKOcrucC2/rXTh15MaukH
         gRxOTdGKiabY54weccai7LnXpol3EIgZ8G6eDZbs2T+QOUdMGzT2mlhBNIFsOMWaJj7+
         b5Eg==
X-Gm-Message-State: AC+VfDz21jffR9s1b44CbZivSZE1GBl7plS6iGcgiW+hIqmVbE8wGxA1
	L0ZInChM5Rcqd/rzEGdC6IN8IC5sPpdjX5KuHTM=
X-Google-Smtp-Source: ACHHUZ7gXQHY7lWthe/LmiGT2B94IOvN/5TLkfRQGKzX82pkoA1KAAiGb3u4QS5zKOZu3AaLg8VdPA==
X-Received: by 2002:a17:90a:9307:b0:24d:ef6a:dd0a with SMTP id p7-20020a17090a930700b0024def6add0amr23646873pjo.5.1683891257248;
        Fri, 12 May 2023 04:34:17 -0700 (PDT)
Received: from [192.168.0.119] ([103.250.136.152])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090b068c00b0024e07ae2cfesm3004205pjz.38.2023.05.12.04.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 04:34:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0hgdJ2WEpJbwT3pWn8hNFT2i"
Message-ID: <8de494d5-0906-6c33-8dd1-9392ec6a9d37@mvista.com>
Date: Fri, 12 May 2023 17:04:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [dunfell][PATCHv3] curl: Security fix for
 CVE-2023-27534
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230511222942.106215-1-sdoshi@mvista.com>
 <32354.1683891148912826584@lists.openembedded.org>
Cc: Siddharth <sdoshi@mvista.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <32354.1683891148912826584@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 11:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181179

This is a multi-part message in MIME format.
--------------0hgdJ2WEpJbwT3pWn8hNFT2i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

++

On 12/05/23 17:02, Hitendra Prajapati wrote:
> Hi Siddharth,
>
> Thank you for looking into this issue while I'm away from work.
>
> Thank you & Regards,
> Hitendra
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181178):https://lists.openembedded.org/g/openembedded-core/message/181178
> Mute This Topic:https://lists.openembedded.org/mt/98838387/6955432
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [hprajapati@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
--------------0hgdJ2WEpJbwT3pWn8hNFT2i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>++<br>
    </p>
    <div class="moz-cite-prefix">On 12/05/23 17:02, Hitendra Prajapati
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:32354.1683891148912826584@lists.openembedded.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      Hi Siddharth,<br>
      <br>
      Thank you for looking into this issue while I'm away from work.<br>
      <br>
      Thank you &amp; Regards,<br>
      Hitendra
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#181178): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/181178">https://lists.openembedded.org/g/openembedded-core/message/181178</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/98838387/6955432">https://lists.openembedded.org/mt/98838387/6955432</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:hprajapati@mvista.com">hprajapati@mvista.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000ff">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
      </font></div>
  </body>
</html>

--------------0hgdJ2WEpJbwT3pWn8hNFT2i--

