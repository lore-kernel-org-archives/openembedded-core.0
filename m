Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.8590.1615741123843271309
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 09:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Afsm/N7C;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id l2so19066355pgb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YdTNC6vQ02es6Z5MYsIShGmgeJzMzoOqkt/gxO/PRek=;
        b=Afsm/N7Cy+rbxQNrIjZaP2EIqHyDIrAPgOsa8mnbzQNLJ552A1Z0gRodCRvy1LhSTT
         BDrxhai5nE1dKen+RvhX/5YK1hGdzOndarmmUA7DvV0RkUmwRru/ppdfuBEf+3ui6fLU
         SgV+zc6ZOnvpYQ6YYSF8VQ+dSDuJcOZrJ+J1XWTeRCKMJiTUyjH1kY9pBnVgGc/Ss1VM
         s71TfwknSmLl6UDUdaKu2NbargdDpVl/CkiEnf5KXsdNg1fuMc7TDKMXxpcIPPmhWyRX
         TKe0odunwYQtCOsaIrKQDohJYev6rPjWvOfjnCO11aZKmvJ89w9Y/Zqe0qxm6Dng6zsH
         c1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YdTNC6vQ02es6Z5MYsIShGmgeJzMzoOqkt/gxO/PRek=;
        b=KbXtm3C5STYcZLf+qmI8b/pUAmofwEQjkk0040QTXEkIY3d00iLiH+AGzzNZg6RSmf
         JRg8rGodbIrWStD7E2HQk1/uwP+PpRCU/03x+O7DmVAvp1dpjRcpR8SKbyf1mzW5CYNd
         o88IFxfLGk/Xa8PjMZ49wZRlmO65R6QZ1FSYdrTOrocTp1tqDYOItnl6CzdxpqE/xQsP
         3fYUYkTOLW67CukWa1CqeeJPydZsEffLsK1r35Hsntrw8T/BsCkROMCM9z0YtZ39+ddk
         uJZ+pCsjJx8q00C+F2B5PdOiPYHoxjRmEwK0PcJOzzRpL1DwWB9Y/1lnh2LVW6wlJW5/
         JqNg==
X-Gm-Message-State: AOAM530lR2tFrpQ1pW1tUcj3hQu+9V0FZBTvY06nBf41vR9A+hbxcf3R
	zg3MCkDaI/g7jfYwCL+W+4Q=
X-Google-Smtp-Source: ABdhPJwzwm9aSNnGd4stSvM0oEaQcpEOUjcMCfB5c34chVFrd1/k8kyznj2BpOyEhPWXEcCWm3vbig==
X-Received: by 2002:a65:6107:: with SMTP id z7mr20385728pgu.435.1615741123231;
        Sun, 14 Mar 2021 09:58:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d2c6? ([2601:646:9200:a0f0::d2c6])
        by smtp.gmail.com with ESMTPSA id q205sm11805258pfc.126.2021.03.14.09.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 09:58:42 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 4/4] go-dep: Remove
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20210312062107.1549935-1-raj.khem@gmail.com>
 <20210312062107.1549935-4-raj.khem@gmail.com>
 <729a07918ea4baec2608d1f462c4a4bdcd593551.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7cae212d-110b-c72a-eeb9-b6713d4b3abd@gmail.com>
Date: Sun, 14 Mar 2021 09:58:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <729a07918ea4baec2608d1f462c4a4bdcd593551.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/14/21 9:31 AM, Richard Purdie wrote:
> On Thu, 2021-03-11 at 22:21 -0800, Khem Raj wrote:
>> go-dep was an effort for dependency management before go modules, which
>> since 2020 has been deprecated in favor of go modules. Since its not
>> developed any longer and go mdules is officially supported, this should
>> be retired from OE-core as well.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
>> ---
>>   meta/classes/godep.bbclass                    |      8 -
>>   meta/conf/distro/include/maintainers.inc      |      1 -
>>   meta/lib/oeqa/selftest/cases/reproducible.py  |      1 -
>>   .../0001-Add-support-for-mips-mips64.patch    |     54 -
>>   ...bolt_riscv64-Add-support-for-riscv64.patch |     33 -
>>   meta/recipes-devtools/go/go-dep_0.5.4.bb      |     30 -
>>   7 files changed, 145701 deletions(-)
>>   delete mode 100644 meta/classes/godep.bbclass
>>   delete mode 100644 meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
>>   delete mode 100644 meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
>>   delete mode 100644 meta/recipes-devtools/go/go-dep_0.5.4.bb
> 
> So we also need to remove the go-dep tests?
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1950/steps/14/logs/stdio
> 
> If so, is there some other go test we could replace them with?


I think this is some connectivity issue. see the below error I pasted 
from your logs.

    File 
"/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/gotoolchain.py", 
line 68, in test_go_dep_build
     retv = self.run_sdk_go_command('build', proj, name)
   File 
"/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/gotoolchain.py", 
line 54, in run_sdk_go_command
     return runCmd(cmd).status
   File 
"/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/commands.py", 
line 210, in runCmd
     raise AssertionError("Command '%s' returned non-zero exit status 
%d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'cd 
/tmp/SDKQA52f_qj7f/go/src/github.com/direnv/direnv; . 
/tmp/SDKQA52f_qj7f/environment-setup-core2-64-poky-linux; export 
GOPATH=/tmp/SDKQA52f_qj7f/go; ${CROSS_COMPILE}go build' returned 
non-zero exit status 1:
go: github.com/BurntSushi/toml@v0.3.1: Get 
"https://proxy.golang.org/github.com/%21burnt%21sushi/toml/@v/v0.3.1.mod": 
net/http: TLS handshake timeout

> Cheers,
> 
> Richard
> 
