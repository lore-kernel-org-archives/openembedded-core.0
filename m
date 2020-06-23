Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.15615.1592942164433659484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 12:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PSoyQr9h;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id z63so10598180pfb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EMe3Os5aBBrwhQ3pgh9RSeJjBIiWuc5m3vR/xIpjx1Q=;
        b=PSoyQr9hsPXb2jyaG972cvgCPsKF/XmuIBUBNlSu91h8UQkcHpnU1Hoty8E3OtZwok
         u/yT+ANN2tGdZ4OmyQyOjE6qyuMzcRxESnRf+rQfVNuYIWvV69mhLYOfHX4zDFOcRru9
         7yjbBqdeUp45pOO+fX15FzgYu+xEI6Aq9lusbS38l9wrgzU2Fu4CzDDOea+DjPxnBmmp
         35Al8Hz2utX8BOEbg5lUVrP9CdMJ8tivdiJesrOML5tLFLg1i1+dhnJGT+nkXHGj4YLq
         rfNPqjnNc4NnI1vaCQYG1879/sjotmW6HllJ/XljURRWm/cHwh2ZVZSrUHX7cGBxpMnI
         RVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EMe3Os5aBBrwhQ3pgh9RSeJjBIiWuc5m3vR/xIpjx1Q=;
        b=cGmUssEq00595BMWWgwuuxn0MQXaSsinRIGGwb0W5tBWDe34aqKbTN5kCVNuvspDwH
         Ift4Dys+UQMsS2ektcYROu89dO5eL0GajxSbRZQKdzm8FRtUNZkGb+VnCFgjloffjvRG
         T8EK9b7NGMpj3tH0gee9CuK7wVrGxnfxUawAEfZ45NmhU8tmEHoT2YPEsLUKGlTITMRa
         Y+zXZbuTOA5zxNWakMkCODn3J/xeQKGxiXjRuMQphB1OBmu43BOClErqIt2TBBko/LBJ
         Q/OP/NTGQBvLe5DMySCnrYi29Mas9SHKPst4uVM0R2Rsk7zEuJ0Pmw7TDJwxx4qT7Db3
         4hAg==
X-Gm-Message-State: AOAM530q6HYXW+vi49T6TLDww5G68SD4O5/Rz7VeMq3QIaczGrMZCqUE
	R7JWo/HsYxAC5l+bf161AhyZk61pAW0=
X-Google-Smtp-Source: ABdhPJwKy56Vv+MJS2EQADFMEWSaXmbCRfzgfUtPU7IPuonNNbttx6ZBEXxqfiwRJpBUoTUkdfxjuQ==
X-Received: by 2002:a05:6a00:1490:: with SMTP id v16mr25402628pfu.173.1592942163514;
        Tue, 23 Jun 2020 12:56:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a? ([2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a])
        by smtp.gmail.com with ESMTPSA id h8sm17649667pfo.67.2020.06.23.12.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 12:56:03 -0700 (PDT)
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com>
Date: Tue, 23 Jun 2020 12:56:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/23/20 11:35 AM, Stefan Herbrechtsmeier wrote:
> Hi,
> 
> Am 23.06.20 um 20:16 schrieb Khem Raj:
>> On Tue, Jun 23, 2020 at 9:47 AM Otavio Salvador 
>> <otavio.salvador@ossystems.com.br 
>> <mailto:otavio.salvador@ossystems.com.br>> wrote:
>>
>>     Hello Stefan,
>>
>>     Em ter., 23 de jun. de 2020 às 13:37, Stefan Herbrechtsmeier
>>     <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>>
>>     escreveu:
>>      > because of the changes to the 'GO111MODULE' variable in go-dep and
>>      > glide, I wonder if Go is ready for use. I would have expected the
>>      > variable GO111MODULE to be set to 'off' within the go.bbclass
>>     because go
>>      > could bypass the fetch task unobserved otherwise.
>>
>>     Is there any known issue?
>>
>>     For me, with those fixes, it is working fine.
>>
>>
>> Yes it’s working ok with go-module for me but not sure of go-dep has 
>> regresse
> 
> What is the expected behavior of go-module and go-dep? Does they work 
> without network connection after a bitbake -c fetch?

I think so. Its perhaps after first build unless you clean the build tree.
