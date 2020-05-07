Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.3000.1588881773816243091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 13:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hzuGb6CJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id l12so2965843pgr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 13:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kpuc+VfV9iK6pqBSxDiYqGEfiDX+4J38YNj/3LxtqeY=;
        b=hzuGb6CJGE9+Jbv9yeJ2jqtyfit+rRj+q1UAfvRsdvRyIIRzdP2pzI/pmEs6QI9mP+
         pS5TbxYSB3DTMeABiEgE7hCw3zEjsqmY4tKxHg2ilYI/LkuPZLZwbkqOE1nPKMIFC/er
         U9IyDRExc1DiBQWAIdBt5HLiW3QmicnuxvTPc4AkBHckwKTYmxWeFfPdW6LertMIe1Jx
         mZ9GRasY2KF9xKUs+kx/OPVPtf4aTHC91RVq1XrG/deaSt1DgEwzRui5phJ5/YkRvy/F
         ozfO+8hqMDSCv93wmzmIaJZZU1KtvO5vxCw+QhvQMpsL3ZHAYM1je8E2k5QxV0c1obtl
         JQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kpuc+VfV9iK6pqBSxDiYqGEfiDX+4J38YNj/3LxtqeY=;
        b=sG4LsMB015jW4agXmKq+z8yNJ7ZWwqwi8E6DCxk8QTyVklcIJvTm9Y40S38sCNyBDp
         rts4ieAKQKZoYzdDJoRs/2dKy+8iQ1YBAMulegMBsvWj8sC08BVfoPrbusy2s9PavCHP
         5ovmRq4d613H0ZJAnolLR381lAX7qDX3tQxxtzdhc+3A08DjZaLYeqB89oORd7CTljuH
         GQkQNWWFlJTjrhJ9nuDoFTAK2O3PgAgY2MYnlj19heG+hUkkgRdQmxVQmVlIdx5ZYUcD
         bqt/RB1VebWGQ3oK5QNNgOP3gkG1Kbguy1/pnq7X0S8nVHw1DLfDuPHlZYnxnpBqkK0T
         DT/w==
X-Gm-Message-State: AGi0PuZ5lFJk9YedURb4AC7XCP248fOHL07xxz7ygEtaFUpZOe2dq6JP
	zlf+gPkduE6ILo4k6sAF72DUXeNSD24=
X-Google-Smtp-Source: APiQypKz1vx7qp2AZEoVk/GLYlPiFVa3RWURn7avT1+lSJqqgxNFLSwEN2Fv3eap53AD1Gl6mr6a5w==
X-Received: by 2002:a63:6747:: with SMTP id b68mr12939708pgc.142.1588881772859;
        Thu, 07 May 2020 13:02:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2691? ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id m7sm5854607pfb.48.2020.05.07.13.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 13:02:52 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] dtc: update to 1.6.0
To: Adrian Bunk <bunk@stusta.de>,
 Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200505115535.141557-1-richard.leitner@skidata.com>
 <20200506071016.GA31672@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <cef57e74-44cf-549c-8d9f-c793dd5875bc@gmail.com>
Date: Thu, 7 May 2020 13:02:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506071016.GA31672@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/6/20 12:10 AM, Adrian Bunk wrote:
> On Tue, May 05, 2020 at 01:55:35PM +0200, Richard Leitner wrote:
>> ...
>> --- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
>> +++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
>> @@ -3,7 +3,7 @@ require dtc.inc
>>  LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>  		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
>>  
>> -SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
>> +SRCREV = "v${PV}"
>> ...
> 
> It is tempting to use tags, but it is a bad idea.
> Upstream might move a tag to a different commit.
> Someone might do a man-in-the-middle attack on a specific user,
> and there is no other verification of the sources apart from
> the commit hash.
> 

moreover bitbake will still need to enquire the repository since tags
are floating revisions. and this might fail to work if network does not
allow access to internet etc. This is a good document describing the problem

https://pelux.io/software-factory/PELUX-3.0/swf-blueprint/docs/articles/baseplatform/reproducible-yocto-builds.html


> cu
> Adrian
> 
> 
> 
> 
