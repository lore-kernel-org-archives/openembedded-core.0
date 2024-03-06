Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67D9C54798
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 00:13:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5243.1709684022433717342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 16:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2RTmWV0;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412f1ccf8d8so3520015e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709684020; x=1710288820; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYjeVu10aO6kYi6qB7HL7VMFm4rnUhpU2arbPXg1QME=;
        b=f2RTmWV0qRJCqhw/EI4z1rUxhrM4kcfuY5Ib50Zh3XZGssJ/mV2zGvdoSumUpci/U/
         UW5JM2ixRdtJCDtVtgAsXyDWgy+yZz/UtGnR+rdqtrhBXC+w43O30p7sTVQavez291nP
         Pe1EMYhWlGIG1G9gIfQL7JZpM2Ofrk9HXMaS/AssT+FuN662JenF47vFPqrVvRP9siRB
         SvXEh1c0UNyYXbysRd+jUgn9NQmAHZNzTy1lbAeasYjZx+suTunnmy97sup7AqszlWWK
         P0MID2GmTNFLxi/EmzsE9rscw0eOBxiyjIExGYwBnIixnzXldcxOZFT29CAofXSqHzaz
         M2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709684020; x=1710288820;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tYjeVu10aO6kYi6qB7HL7VMFm4rnUhpU2arbPXg1QME=;
        b=ANWQFKoWHyb0JQdYqmoKSmKCsyruvq7QdZeVyQ3SBYzcpNXFEXxLv6KeBY2SOqOixt
         M8D61pSjzCl53JSLPiEuRUX9H5bV911D8D/2TDWF9yrirPnhhuJPsGR9UPE2uq48jBC5
         NR+EQlGLl/FkjlIKkxkL/9VorsBrsud6PmY0rtVRPj6etONwzDy8hIpijdhcRbceLFfc
         I9WxVE6CTO66msZh2SdHJzJyhHVA7K9X/aneWlXlDANqidj2Nhn/tMvsz7BzwmUNYpq4
         dS3D/MlbwT8w3GG7xR0C89m/NsDnvf4KqiOncp+ZL7Gjfg3ldX7IRASdJg/1nMHNhKel
         K7LQ==
X-Gm-Message-State: AOJu0YyRc4zUZqba9Of+JmbBnNgifQns2TDC1F8WYfnd7htN1Xdv/w+b
	C+ZyE1NZVbh2du95/OjgvoZ5+0FNjtMdU4W7Iw9nD7Uzhal8apLKTA08ayQV
X-Google-Smtp-Source: AGHT+IF8axWqLGGdLNsg8UgHK/o/AZuv0WoH/b8d5RgaCw7FLrjwcTO5M0zo4VmPBNWoYnD58YEbSw==
X-Received: by 2002:a05:600c:548e:b0:412:e4f6:75ae with SMTP id iv14-20020a05600c548e00b00412e4f675aemr4249652wmb.32.1709684020315;
        Tue, 05 Mar 2024 16:13:40 -0800 (PST)
Received: from [192.168.144.7] ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b00412b431eb0csm19154550wmo.14.2024.03.05.16.13.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 16:13:39 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------efq5UZiYFaV9fDmCOdO0qSH2"
Message-ID: <203ebf7b-d4e6-4257-919f-6020ab3409f8@gmail.com>
Date: Wed, 6 Mar 2024 00:13:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH v2] shadow: backport patch to fix
 CVE-2023-29383
To: openembedded-core@lists.openembedded.org
References: <29120.1707998122174808963@lists.openembedded.org>
 <29581.1708924459856405185@lists.openembedded.org>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <29581.1708924459856405185@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 00:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196655

This is a multi-part message in MIME format.
--------------efq5UZiYFaV9fDmCOdO0qSH2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I checked on kirkstone using OE-Core with DISTRO="nodistro" and when 
running bitbake useradd-example I can see this:

configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrator)
configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)

in the log.do_prepare_recipe_sysroot.

The same happens without CVE-2023-29383.patch and 
0001-Overhaul-valid_field.patch patches. I didn't understand why the 
SYSLOG_SU_ENAB is not supported.

What is the correct approach here, remove SYSLOG_SU_ENAB and 
SYSLOG_SG_ENAB from login.defs_shadow-sysroot?

To use the useradd-example.bb was needed to add this change 
https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch/104757004

Thanks

On 2/26/2024 5:14 AM, Pawan Badganchi wrote:
> Hi,
>
> Could please help here?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196178):https://lists.openembedded.org/g/openembedded-core/message/196178
> Mute This Topic:https://lists.openembedded.org/mt/98361235/6083838
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [fbberton@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------efq5UZiYFaV9fDmCOdO0qSH2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><font face="monospace">Hi,</font></p>
    <p><font face="monospace">I checked on kirkstone using OE-Core with
        DISTRO="nodistro" and when running bitbake useradd-example I can
        see this:</font></p>
    <p><font face="monospace">configuration error - unknown item
        'SYSLOG_SU_ENAB' (notify administrator)<br>
        configuration error - unknown item 'SYSLOG_SG_ENAB' (notify
        administrator)</font></p>
    <p><font face="monospace">in the log.do_prepare_recipe_sysroot.</font></p>
    <p><font face="monospace">The same happens without
        CVE-2023-29383.patch and 0001-Overhaul-valid_field.patch
        patches. I didn't understand why the </font><font
        face="monospace">SYSLOG_SU_ENAB is not supported.</font></p>
    <p><font face="monospace">What is the correct approach here, remove
      </font><font face="monospace">SYSLOG_SU_ENAB and </font><font
        face="monospace">SYSLOG_SG_ENAB from login.defs_shadow-sysroot?</font></p>
    <p><font face="monospace">To use the </font><font face="monospace">useradd-example.bb
        was needed to add this change
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch/104757004">https://lists.openembedded.org/g/openembedded-core/topic/kirkstone_patch/104757004</a><br>
      </font></p>
    <p><font face="monospace">Thanks<br>
      </font></p>
    <div class="moz-cite-prefix">On 2/26/2024 5:14 AM, Pawan Badganchi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:29581.1708924459856405185@lists.openembedded.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      Hi,<br>
      <br>
      Could please help here?
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#196178): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/196178">https://lists.openembedded.org/g/openembedded-core/message/196178</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/98361235/6083838">https://lists.openembedded.org/mt/98361235/6083838</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:fbberton@gmail.com">fbberton@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------efq5UZiYFaV9fDmCOdO0qSH2--

