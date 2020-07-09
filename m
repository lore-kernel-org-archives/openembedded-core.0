Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.759.1594273029856379471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 22:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gIPL7pte;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id k17so447657lfg.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 22:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fY45+K8BzD7YGEkmiW/JYvHAI/IxlZAOK+Rk1TlgIs4=;
        b=gIPL7pteBuUnn7YDDjDyMmjVo1vLo05BU3Am6kkRpEnpFPi523WQZuFLANr+8dPv91
         wvrA56kceIE/w7EAoSnZS2ijzwOi+ThuZWVx7b8BgNsN25wZ272hLYwvwF26+MXCAtMy
         j6TQR9SjbfdAdD96gxWvPGKGXjjTt7Aelp5GO1rbtN1JXiowqSLbYHOQRX3AZDUoPzgm
         fFyr2UWT/TzO3ZFDgSRlmBW3XVG1idH/7e1S5JcDb2YKp0IynDP+AoZCxqJlqObnmCsU
         4ul28BpNhl+eL/VsX55Avva1PDTJyExdroa40i1mxKwLAhIsyYYiLcsdNplJAIwtdcni
         +Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fY45+K8BzD7YGEkmiW/JYvHAI/IxlZAOK+Rk1TlgIs4=;
        b=Dtr2VQEKrFt0a5GhJYI3YrEWvUI31NvFfPEBtR+duEQbnZ+qLG5Ugj0U5RhB/ZOrs4
         /w78LvqOtDHYkaInqqBZkXuzJuc8cLliIbcbqON+fnW5dclh6RSof5G7e8qIaohyLdww
         RvV4I3rZHCuYLpscUYfa+QH7BBFpgQ2nYiE0QdpS/Fh8PUu1wS9pXKi9SgsnYQkR+hn2
         uBIz+4tROVEwrSl+JaotX8s+s0pNLwepVgIG/c8U1kFADkiuP7v9Gf61xrlsuZwReOgD
         vgvgHj0eXuEq+PF1GBi8OMCCNq1euaorMYJyVv3xpICYBOSPbIi56gEcNW7FP4q6KtQ+
         +7Tg==
X-Gm-Message-State: AOAM531TJ4IYuUjxDoUnTzqqWS/pHGthIDhLLyH3sE/TfpkArJZh0t4A
	AxC/0vTDB2XDTwx3uVR5k/Yu1a4e
X-Google-Smtp-Source: ABdhPJw5G3Rk/9ZQlK5WX7xupukwCLWRf4QHXdxdR3QrzxyqICsjcKY3dV0Kqf444M5oILnw0JJpTA==
X-Received: by 2002:ac2:558f:: with SMTP id v15mr38965605lfg.187.1594273027751;
        Wed, 08 Jul 2020 22:37:07 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id e10sm475601ljb.118.2020.07.08.22.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 22:37:06 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] rootfs-post: remove traling blanks from tasks
To: Jens Rehsack <rehsack@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
References: <AM7PR05MB68810192ED5AB6DB0BDFF67DA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <B35F64C3-D38E-4612-B68B-A359F79AE892@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <78623d14-1e14-0109-742b-1ba9366f6d85@gmail.com>
Date: Thu, 9 Jul 2020 07:37:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <B35F64C3-D38E-4612-B68B-A359F79AE892@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/9/20 7:30 AM, Jens Rehsack wrote:
> 
> 
>> Am 08.07.2020 um 13:09 schrieb Konrad Weihmann <kweihmann@outlook.com>:
>>
>> remove the traling blanks before the ;-delimiter, so one could use
>                 ^
>                 here & subject: do you mean "trailing"?
> 
>> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
>> which are currently hardcoded and not bound to any
>> configurable feature flag
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>> meta/classes/rootfs-postcommands.bbclass | 6 +++---
>> meta/classes/rootfsdebugfiles.bbclass    | 2 +-
>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
>> index c43b9a9823..984730ebe8 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -1,6 +1,6 @@
>>
>> # Zap the root password if debug-tweaks feature is not enabled
>> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
>> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>>
>> # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
>> ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
>> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>> ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>>
>> # Create /etc/timestamp during image construction to give a reasonably sane default time setting
>> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
> 
> How about
> +ROOTFS_POSTPROCESS_COMMAND += " rootfs_update_timestamp;"
> 
> Reading a list is much easier when words are separated by whitespaces.
> 

The += and =+ operators already insert a space between the concatenations.

https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-manual.html#appending-and-prepending

Jacob
