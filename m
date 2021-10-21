Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856F6C433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 19:19:04 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.2650.1634843943322757660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 12:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O022TZuG;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id l5so382997lja.13;
        Thu, 21 Oct 2021 12:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to;
        bh=ec/7LV7rI2THg9hattXg93FyllsEIEELgjQOMXshTn0=;
        b=O022TZuGaU5wsn8iyu/Baiqz1ViHKb8Xjij3ui3MRX3KLz1t5law1Z4Q0AVFRrtPy8
         T3PKTa5tNk/TBcHYwxIMQM83xc2NpU2MknZ6ebfvT/DGEq3pvGM79/h1/n2zBt06V50B
         kDZ6YTpiDwRFmSkUdBbbASSl2O1aa7ln9zReAfsEEvrSLffz/FlL6FZtTT4ptWZsvOnA
         uiXv/WhUKcLK+mNU6P9WFEFxyTcDMyqeHJs1g4EIXQpH+ykpGpd2qa7QbahZ9egPh2To
         w6XkQgvWFPYlP57r73MFoSFsIyiqj5IZU4pPj3aSq7oufyK4iqlkfqMf6IjVvIiQ8upS
         nQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to;
        bh=ec/7LV7rI2THg9hattXg93FyllsEIEELgjQOMXshTn0=;
        b=BxLVwsSFqa6WdOsXgxsxvMqA3rIPkMacr/LDu+ndioFj3+cCjgVcJSI2xiQ0hDCNHm
         S5QFy/hkQZH6SY/nW78stgOcqhd3pety3GJqov8/cD5IKq8ig0MzfpeSohf0bHP4A1dp
         mn/f6NqxsO6mGlAZeYWOcRNJBY0mkbG6ExuIo0kKAzW+W6fusz96vnlT/B1u21zTiRaZ
         gr9Cu/jZidyuNucJWBTx3Z8V15WomE1DYyIoGBFaGq59zCT6bWGmeqxFTNstC3NC05MY
         TJQw09lZocyfELbtpG6uAycVaMaZ4D4J2/c2TVWwsO0DW5GelzzmzcXIr3L5ksxR3vH8
         p2Yg==
X-Gm-Message-State: AOAM532L4fg+gfMD4w1u3aCXLfH72L5of+G9wwXKgRkYogzGD5il1I+O
	J1t+cZ+RRlAawAnUV+boXj8PHRWa36anKA==
X-Google-Smtp-Source: 
 ABdhPJzFlHUC3jXmCtIoVw8UL7X3VLgZrg9M5Cdu6n+6ZO4RiBOKGwfrl5vyObFmC4rnlOfjYpAJcw==
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr8108549ljf.107.1634843940726;
        Thu, 21 Oct 2021 12:19:00 -0700 (PDT)
Received: from [10.133.221.89] ([185.253.97.12])
        by smtp.gmail.com with ESMTPSA id
 w16sm532424lfl.189.2021.10.21.12.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 12:19:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8B1LW0UXoSDp3WM5ovsfkvZa"
Message-ID: <743957ea-092b-b8d8-27a2-b183619b507d@gmail.com>
Date: Thu, 21 Oct 2021 21:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [OE-core] [meta-java] why openjdk-8-native is need to build
 openjdk-8 ?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: 
 <CAE84iWU4=MKr2VK5aK2bZrY_q2xaaX-fVsD=7Z7p6F8NhawrDQ@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CAE84iWU4=MKr2VK5aK2bZrY_q2xaaX-fVsD=7Z7p6F8NhawrDQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 19:19:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157288

This is a multi-part message in MIME format.
--------------8B1LW0UXoSDp3WM5ovsfkvZa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I believe this should be sent to openembedded-devel@lists.openembedded.org

Vyacheslav

On 21.10.2021 12:11, Akira Shibakawa wrote:
> Hi.
> I have a question about openjdk-8 recipe.
>
> openjdk-8 seems to be built using openjdk-8-native as boot JDK.
> And the openjdk-8-native seems to be built using icedtea7 as boot JDK.
>
> Why openjdk-8-native is need to build openjdk-8 ?
> Isn't it simpler to build openjdk-8 using icedtea7 as boot JDK?
>
> regards
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157279):https://lists.openembedded.org/g/openembedded-core/message/157279
> Mute This Topic:https://lists.openembedded.org/mt/86486039/4455192
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------8B1LW0UXoSDp3WM5ovsfkvZa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">I believe this should be sent to
      <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a><br>
      <br>
      Vyacheslav<br>
      <br>
      On 21.10.2021 12:11, Akira Shibakawa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAE84iWU4=MKr2VK5aK2bZrY_q2xaaX-fVsD=7Z7p6F8NhawrDQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi.
I have a question about openjdk-8 recipe.

openjdk-8 seems to be built using openjdk-8-native as boot JDK.
And the openjdk-8-native seems to be built using icedtea7 as boot JDK.

Why openjdk-8-native is need to build openjdk-8 ?
Isn't it simpler to build openjdk-8 using icedtea7 as boot JDK?

regards
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#157279): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/157279">https://lists.openembedded.org/g/openembedded-core/message/157279</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86486039/4455192">https://lists.openembedded.org/mt/86486039/4455192</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>
--------------8B1LW0UXoSDp3WM5ovsfkvZa--


