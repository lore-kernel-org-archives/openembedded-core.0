Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.1965.1620243539192286467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nzLKMLPy;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id i190so2704737pfc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BcwoyNdPY8KolOzHl7Vz51rkElHXg9qC36AhKrXg6Lc=;
        b=nzLKMLPygAd6/teIh0M7DatxZb157P7z1poWjMRrP/MosmKk0u1f4GEIClvme4d6ia
         Fa1H0EkUHXIFTqmlY4OTXp5LX1AogjtZuGOYlVL3PHwYVoWRLUpsiT60KXFHlNBttxZA
         BqHc9apg4CgK+Bywk0m3e4WvOgcMcAbWgNJAleRVniuGkCI2cwRPA+lk3mTJ7zh0krLn
         OMaTzILGvt2A5sQt9IysbLm3a230bNpb5p9/DwLjGhjRNjN8uk9UPl1tBCsFr42fcSEP
         hTb+zQCvab3QMjoTHK+RmkeDDYeNzxddg1+6yd3L4KkgbeOug0Llw13L1YWlfSViLRdQ
         LXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BcwoyNdPY8KolOzHl7Vz51rkElHXg9qC36AhKrXg6Lc=;
        b=iA/LNs6RovWskNIchmKJ76xKoAXXfQr2OzanTQzVwfpF+JUh1M1eM4+RHaRJj2EjdQ
         1ya7W4mC27p9mr4b0RAwAXk95rNWz0cF5gBPOtQlNhzTAy5OhFGclqZ/M+RFTBFHcs7D
         z3yd+wMihhgWVGq4KUGOBQmSKPxKkJdT64t1tFb0A8zg05maipXO9LWoA8rCWAEqUvBF
         HjCPR5AsJ/Wvf+pNvCCxdSAC/87RYkUtF6t8umEGXFsqlYjVmSdFU2nXl0hbOzwrLoPf
         OUzRoDFSV6lFtOd/2Itx2luQtWCoqyJd8AawbIwd4a+rd/Cz/1gar1ZuqX2W38Cajnx6
         6Pxg==
X-Gm-Message-State: AOAM533csgC/iCDFu+Xvxz+LXAULaDjKo4ZT/ki/Bu0+yOMJuBJhDtwD
	1rSwytMKCG7DESRf5IhHoZgeWOaSL3YYIg==
X-Google-Smtp-Source: ABdhPJwxiu/L2oq08+zeMqQLnglk5CDBt0h0daLTS1IYFZyPgyUxIfso05eaV3k+ilU4qA2nfBr0YQ==
X-Received: by 2002:aa7:9191:0:b029:256:898f:150 with SMTP id x17-20020aa791910000b0290256898f0150mr560881pfa.74.1620243538429;
        Wed, 05 May 2021 12:38:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c0f3:6794:1988:a526? ([2601:646:9200:a0f0:c0f3:6794:1988:a526])
        by smtp.gmail.com with ESMTPSA id z18sm54600pfa.39.2021.05.05.12.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 12:38:58 -0700 (PDT)
Subject: Re: [OE-core] CMake fails with yocto
To: Ishu Goel <ishu.goel@nobleo.nl>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <AM0PR0402MB3475803C5E790CA079CE2B35FB599@AM0PR0402MB3475.eurprd04.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7ccf3572-30b8-c6b6-9785-92766844aa6d@gmail.com>
Date: Wed, 5 May 2021 12:38:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR0402MB3475803C5E790CA079CE2B35FB599@AM0PR0402MB3475.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/5/21 2:26 AM, Ishu Goel wrote:
> Hello,
> 
> I am using CMake with Yocto and working on the hellocmake example 
> provided here: 
> https://github.com/joaocfernandes/Learn-Yocto/blob/master/develop/Recipe-CMake.md
> When I bake the hellocmake recipe it builds perfectly the first time. 
> But when I make any change in the source file 'hellocmake.cpp' and bake, 
> I get the following error:
> 
> ERROR: hellocmake-1.0-r0 do_install: Execution of 
> '/home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/1.0-r0/temp/run.do_install.147' 
> failed with exit code 1:
> abort()ing pseudo client by server request. See 
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> Check logfile: 
> /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/1.0-r0/pseudo//pseudo.log
> Child aborted
> CMake Error: Generator: execution of make failed. Make command was: 
> ninja -v -j 4 install &&
> WARNING: exit code 1 from a shell command.
> 
> ERROR: Logfile of failure stored in: 
> /home/developer/work/build/tmp-glibc/work/cortexa72-oe-linux/hellocmake/1.0-r0/temp/log.do_install.147
> 
> 
> I want to know what I am doing wrong? I noticed that if I clean the 
> previous build of hellocmake, I do not get this error. How can I make 
> sure that CMake works every time with yocto?
> 

you perhaps are not doing anything wrong. pseudo is a tool used by yocto 
underneath and its bailing out for some reason. maybe you can share the 
pseudo.log file and it might have more details.

> With regards,
> 
> *Ishu Goel*
> Software Designer
> 
> Nobleo Technology BV
> 
> Heggeranklaan 1
> 
> 5643BP Eindhoven
> 
> 
> *E *ishu.goel@nobleo.nl**
> 
> *I**www.nobleo.nl <http://www.nobleo.nl/>*
> 
> 
> 
> 
> 
