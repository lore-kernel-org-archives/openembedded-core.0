Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BABEB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 06:07:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.1410.1689919656249062619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 23:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y8Zue2D/;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9926623e367so255396266b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 23:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689919655; x=1690524455;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mR6Xdf8k16qpBL3l1UYY1R1AsQ+uHpkWLn6P3QRHrM=;
        b=Y8Zue2D/0LsierR9VHmGq9+mGwZfZ6pvX0u0h8uhfatJc6lK1dypeHet63Zx2fpZWI
         5zg8kBYtkoFUTFro8CLNeVTw8PSb/Vjd5Ldx9Co3wRM0GC1eNgntEQtE5mVnr5ZudO4Z
         TdfpJ46+ZRCJ+3wJgkfTQMJU+pXlANodNp3LLo+03YpGaxMKvRBrWjG1UPXp0vm798AE
         K8fVo+x+r1k0+KNB+NrZgoXnbk2hySbl8jA7IoufawK2j2JDr44kJAtT847BYeGbWc1o
         G8KpFchNqXvv+SzE+SSupbYRymFgQSXajXz6tXfZMCon9tRdxYklp0VfMVk/m2qK9nk6
         pa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689919655; x=1690524455;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8mR6Xdf8k16qpBL3l1UYY1R1AsQ+uHpkWLn6P3QRHrM=;
        b=lXzt01chXfmPPgU9ymUIgWJXHiPMyvF7geXT384vYW32y3ONjlLz+V0tqiux8j9DQQ
         oi6wJ8mOxxJd9NknsIkA7xoFEAa7w4xO+3Xm5mRYbGbC+l7ZnvJtj79F4GsHfL72ixJl
         8/2OPgS/gJTVBJoKXnlyYDRUZUMqMeog03oysewmCFN1y/kE9+7Yo3RVN/he7d1FrG+6
         bw9e1ASRgt71skqssFIpM4dsT6SqUAaPXZy1tphYJaZMOwSqL45NnpPXRyULFyGGtKM6
         h3AXoBpRjDodk7Oo1nt50NpdHDyHD6pz13+zS+V8NWjSZCCzHs0SG9RixjOGlNTgHuoK
         nsOQ==
X-Gm-Message-State: ABy/qLa5NHRESJyW95MNykdNbZVOwSwczNaKrgzgYmNdAgWIoCdqWGkM
	CSyPIuETgjJrxXJ3Xv7jWlY=
X-Google-Smtp-Source: APBJJlEBirRG78RMQ9ppYMfzEc0rxQ8woa7x36zOjS0vLK49d0Ww4fUqvom3Crv7bEB5Z2tf0w7Brw==
X-Received: by 2002:a17:906:538a:b0:988:9621:d85f with SMTP id g10-20020a170906538a00b009889621d85fmr842180ejo.58.1689919654376;
        Thu, 20 Jul 2023 23:07:34 -0700 (PDT)
Received: from [10.134.44.164] ([89.249.73.139])
        by smtp.gmail.com with ESMTPSA id j16-20020a170906051000b00993860a6d37sm1665640eja.40.2023.07.20.23.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 23:07:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------iL0xQsr0ln8DYrw9AgljD0l0"
Message-ID: <f8527dac-70d8-488f-dbcb-78d29acd8e01@gmail.com>
Date: Fri, 21 Jul 2023 08:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [OE-core] kirkstone boost upgrade?
Content-Language: en-US
To: throos@amazon.de,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 06:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184668

This is a multi-part message in MIME format.
--------------iL0xQsr0ln8DYrw9AgljD0l0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I would be cautious with boost upgrade in stable branch.

Boost is known for having breaking changes almost each new version. I 
only had a glance at 1.79-1.81 https://www.boost.org/users/history/ and 
there are a couple of them.

Are you affected by some particular bug or vulnerability in 1.78?

Vyacheslav

On 21.07.2023 06:49, Thomas Roos via lists.openembedded.org wrote:
>
> Hi,
> we are hitting an issue with boost version 1.78 and like to ask if and 
> how there is a boost upgrade on kirkstone branch?
> Cheers, Thomas
>
>
>
>
> Amazon Web Services EMEA SARL
> 38 avenue John F. Kennedy, L-1855 Luxembourg
> Sitz der Gesellschaft: L-1855 Luxemburg
> eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284
>
> Amazon Web Services EMEA SARL, Niederlassung Deutschland
> Marcel-Breuer-Str. 12, D-80807 Muenchen
> Sitz der Zweigniederlassung: Muenchen
> eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 
> 242240, USt-ID DE317013094
>
>
--------------iL0xQsr0ln8DYrw9AgljD0l0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">I would be cautious with boost upgrade
      in stable branch.<br>
      <br>
      Boost is known for having breaking changes almost each new
      version. I only had a glance at 1.79-1.81
      <a class="moz-txt-link-freetext" href="https://www.boost.org/users/history/">https://www.boost.org/users/history/</a> and there are a couple of
      them.<br>
      <br>
      Are you affected by some particular bug or vulnerability in 1.78?<br>
      <br>
      Vyacheslav<br>
      <br>
      On 21.07.2023 06:49, Thomas Roos via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ef85e3d213644b25adceed1a851ac01b@amazon.de">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div id="divtagdefaultwrapper"
style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;"
        dir="ltr">
        <p>Hi, <br>
          we are hitting an issue with boost version 1.78 and like to
          ask if and how there is a boost upgrade on kirkstone branch?<br>
          Cheers, Thomas<br>
        </p>
      </div>
      <br>
      <br>
      <br>
      Amazon Web Services EMEA SARL
      <br>
      38 avenue John F. Kennedy, L-1855 Luxembourg
      <br>
      Sitz der Gesellschaft: L-1855 Luxemburg
      <br>
      eingetragen im Luxemburgischen Handelsregister unter R.C.S.
      B186284
      <br>
      <br>
      Amazon Web Services EMEA SARL, Niederlassung Deutschland
      <br>
      Marcel-Breuer-Str. 12, D-80807 Muenchen
      <br>
      Sitz der Zweigniederlassung: Muenchen
      <br>
      eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB
      242240, USt-ID DE317013094
      <br>
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------iL0xQsr0ln8DYrw9AgljD0l0--

