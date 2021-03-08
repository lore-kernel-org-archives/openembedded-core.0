Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.851.1615228682081227659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gL5Ki3oy;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id t26so6956498pgv.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 10:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6+WR1uwuV0i0Iq+DKPi7PgfoqZSQU4jsf5mUNsYLuss=;
        b=gL5Ki3oyEcRYg2K9YcIyO7mDsHp395HfNaGcZwxQSEDC+oLPOWMV/QqZ6O9iGCv7g3
         SMDuMSBqrlAfQU6vNX7kmFHSorLnxZCeppnYSL4YLIJjo1VLZefWt+bGWeM37vvSVHFg
         4k0K3U+1lE5z4FDXoQlspXdyBZj/YvAHeF/a5VMf4FPCo6m9hrb30yj2VtkcERCm08Nz
         CFTOf9zmha/kCcD9J4EkhRJqLiV74Z3TSnXwyVKeMS2/m6SWVPdwLCZGsPfCOZfA36B8
         G/hPlCN+SwdQ9lWmOc0dCS4TYacD7k2i6k6EQAxn9NQyAx84fV4Z420k28uYYX/RYHgF
         QHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6+WR1uwuV0i0Iq+DKPi7PgfoqZSQU4jsf5mUNsYLuss=;
        b=PIW1LWxwTNEC8yFWj+DXc1GVI8PTxQDYVTPBm6ALmjpHD2Mco2AxyPayuqltqPCyNA
         G907uZHpYkf+4OgAV7feWOtkonGCvySax6MdlkWSCMzKQJAbvzvIrB5yFyoeKMP7IOq+
         SYVBKBAVooywxW2fWaGRwuP9WVPSs2Z5LkTrhmkp7gINXrx9u1YI1P/JI9do1gdFnoca
         bVapX2bmc6yYHXyjiBE0TGANqVq+LNm4gKCHDXRDohCY97C1NWPej8fu+PkJI+NnOOa3
         tb3yOZXO6z+aBVSyyWPFpXXr7RIttcgDH5mroW070udHXYHseOwMNmkcwtm+E8w6e+2o
         ZSMg==
X-Gm-Message-State: AOAM533wHnMUCgCPp6HIr7zn0AwNZhkZyQ+MXBEuDFtv2bcHxuT5aE2G
	eJuD3yVwAUNXf35jkCmbXhYwWNYboJTnFw==
X-Google-Smtp-Source: ABdhPJwaaFNdXkgVaGe/nelGcYBdGuDzkzxQwt4TwcgyA6gIXrvsPJZ4A31W3gB+1CRly1Wvc+bXzA==
X-Received: by 2002:aa7:8d04:0:b029:1ed:2328:f677 with SMTP id j4-20020aa78d040000b02901ed2328f677mr192384pfe.26.1615228680844;
        Mon, 08 Mar 2021 10:38:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:e039:b4fe:1680:1244? ([2601:646:9200:a0f0:e039:b4fe:1680:1244])
        by smtp.gmail.com with ESMTPSA id gt22sm89031pjb.35.2021.03.08.10.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 10:37:59 -0800 (PST)
Subject: Re: [OE-core] any reason for "cmake_" prefix on cmake_runcmake_build()?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <b0117e87-c17f-e22f-c2b9-868dd12ea09@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cf23928e-ea00-6f4e-78b3-82bed1658fc1@gmail.com>
Date: Mon, 8 Mar 2021 10:37:58 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b0117e87-c17f-e22f-c2b9-868dd12ea09@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/8/21 3:22 AM, Robert P. J. Day wrote:
> 
>    collecting some examples of inheritance of class functions using
> EXPORT_FUNCTIONS, and ran across this routine in cmake.bbclass:
> 
>    ... snip ...
>    cmake_runcmake_build() {
> 	bbnote ...
> 	eval ...
>    }
> 
>    cmake_do_compile()  {
>          cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
>    }
>    ... snip ...
> 
> what puzzles me is that the routine cmake_runcmake_build(), despite
> having a "cmake_" prefix, is not being exported with EXPORT_FUNCTIONS,
> so while that's a perfectly respectable function, it's not clear why
> it would have a "cmake_" prefix. is there some value to that prefix,
> or is it just arbitrary?

it does not intend to provide a default function like do_compile 
do_install exporting it is not necessary

> 
> rday
> 
> 
> 
> 
> 
