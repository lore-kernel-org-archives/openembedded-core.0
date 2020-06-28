Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.1733.1593367117676517350
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 10:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKN4izbS;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id z15so3109838wrl.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i/QUPsf58pnCyIrNGj+fch50jIpepLxa9XCPIh/nvfo=;
        b=LKN4izbSME2YSGsquRtid9FYdbE7kabqBYevGjPeKBjeP1CPDckg7r2DRC0Ff4tJUM
         6whRmTDIHspWf2bVUM8ahwSHw6QtOKnuoBRSJkqJWLdKlUWp2q+RmucthKzSZBoo9jeB
         FluWPrUh7rKYlly4jQGftCb+CwXtTI3RDHFv8uDH+dNUXQfR3Yzl8PNzHBwA9piUU8oK
         fVI+ToyCkEFWCDGPsfp+ZrQFdAwepfflUBfLCFwO/h/R8uFA/gZvhLzEvqZlARIKWDkQ
         IKWOfi+3Rr9M+H9niP/lulI3r2Vub22jw5f+SzthrIIMDX1suIeBDczkqZu3xw1gklOc
         KtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i/QUPsf58pnCyIrNGj+fch50jIpepLxa9XCPIh/nvfo=;
        b=tb1TMz4IhOpc79qJ2MzYiSHRTa73io2rPCFH3icZ+vb6wzHxqVB30kHjwN7y7CGIOZ
         EYfFdMZ0h1vsPZkEW50G3x65bn4QvKMgiQ18oWQ090MD4d6oC91ts4X1PdBS+l9rRrXg
         FmXG8HtsLbMBw8HIjRVKj2wkWBBJVnDxtbcsZRB5ckLrp/6XfL5Yzq8I41r2ddT5iahu
         zS2/Bv8N/HKiU/UadNzPQHu4BGSNGZEW/cOH1RQofOni2XtK2aGssyi/QvUPX9V4cgjP
         wekLVg65LZ9vK/gEii5otFcVSqDSW+NVEgo4wrEmoRXm0M+7+YHLKQyBQ1SD1YB1BCHX
         cXLw==
X-Gm-Message-State: AOAM531VMu5rSOqCr4Mtfi8LLK2UAJgeVGiKXRZ69P39tCIN/L7ipAZm
	4/UZ3ngggYxtdkuhJLcW1tI=
X-Google-Smtp-Source: ABdhPJy5sV6DRhuRFk/tEx43xrY4NO3iaCwYEym6iWZug+d02d0mj9yQIp+dQGNm/W/DkB+W3gusnQ==
X-Received: by 2002:a5d:60d1:: with SMTP id x17mr13563137wrt.293.1593367116091;
        Sun, 28 Jun 2020 10:58:36 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-138-91.home.otenet.gr. [2.86.138.91])
        by smtp.gmail.com with ESMTPSA id x18sm34389264wrq.13.2020.06.28.10.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2020 10:58:35 -0700 (PDT)
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
 openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <f4b1f830-237a-e4e6-a917-6932b88b5a46@gmail.com>
Date: Sun, 28 Jun 2020 20:58:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

My comments are in-line.

On 23/06/2020 19:37, Stefan Herbrechtsmeier wrote:
> Hi,
> 
> because of the changes to the 'GO111MODULE' variable in go-dep and 
> glide, I wonder if Go is ready for use. I would have expected the 
> variable GO111MODULE to be set to 'off' within the go.bbclass because go 
> could bypass the fetch task unobserved otherwise.

Well I guess it depends with what you mean by "ready to use".

I tried it a couple of years ago and now again.

Do you want to build an SDK with the YP and include Golang support?
As far as I saw this kind of works.

Do you want to write a recipe for a non trivial project?

That's fun!

I tried to build from sources telegraf, influxdb and grafana and it's 
great fun for various reasons, among others things depenencies to rust 
and yarn.

I somewhat managed to get influxdb 1.8.0 to compile from sources, but 
only with some hacks and by including some dependencies explicitly, 
which should not need to be included explicitly.

Having said that - I am not a Golang person, so correct me if I'm wrong[1].

[1] 
https://gitlab.com/meta-layers/meta-tig/-/blob/master/recipes-from-source/github.com-influxdata-influxdb/github.com-influxdata-influxdb_1.8.0.bb

... most recipes you find out there in the wild just include prebuilt 
binaries...

There are also quite a few problems with reproduce ability and licensing 
depending on how you write your recipe.

In my recipe I only use the top level license, which is apparently 
wrong. In prebuilt packages it's not much better with licensing.

> 
> Regards
>    Stefan

Regards,

Robert

> 
> -=-=-=-=-=-=-=-=-=-=-=-
