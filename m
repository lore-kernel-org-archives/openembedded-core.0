Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7907.1587334559078863150
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 15:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=abm5prMb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k11so9834423wrp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2020 15:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lK675DZKY0aH6S9/TuDb/4ozD0B7KUJHGmehocs3HWw=;
        b=abm5prMbQLYeqjf+stRUjTQA4xb/wqXH32wYlqqYwrSn4oly1S9GnWdDfwfmtlfv6B
         BXcfYgvmx0xSIWY7jbQo0KVu7AwJRdEtlQR9kejeDxEoUHgbxAi8S7WVqTUQTL5p/tRT
         n8ITT3GF5Dypg/c1WLRql3l1zCbxWA9hq0Kik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lK675DZKY0aH6S9/TuDb/4ozD0B7KUJHGmehocs3HWw=;
        b=t3OzHBtqFNcHAXWfLt4JvrOB6bSs8stTmd8cxZOKJeluZljVtStZ/hUcPYDgta4AHf
         5Bt1bcySUfl3iWjHk5AWI0i3eFbes7y3p0bMvjcAiea2KPoypidqPS50szfpe3psGitR
         Bd/r782Jxicg3+5qHuF56II+pv/gDb3ExBE2dNCMbrcLwyokwSG7mmFyWA0twFrPkl8b
         +0JG8KiLlwRFg6hmBxtUc6w+6UkWNZafaGL97DbL3ghNY/h+qJ1SJ5C8V3CXv+/aRvph
         fKoVfYysoQQbaa/tAyqQQGcjuHMhTRLjzoWLTfbjGUopWs8FU7jepbFkNxDq8w57w/wv
         aOtQ==
X-Gm-Message-State: AGi0PubTTnciUvNck78hyFVnAXw0+hqwFOYFWOM+sW8/5i1tIWGUtyRV
	uQLlKuofWNxHNDZ0FEhWZaLyPg==
X-Google-Smtp-Source: APiQypJ38ZNTzyF2WbHSByAjOF55fnI7D4R5cztLhigZHWgbY0sAVd1/KY2MXehHrFRj+qtyKXoJUg==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr16713949wrv.103.1587334557528;
        Sun, 19 Apr 2020 15:15:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a205sm17185530wmh.29.2020.04.19.15.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 15:15:56 -0700 (PDT)
Message-ID: <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Apr 2020 23:15:55 +0100
In-Reply-To: <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
	<DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
	 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-19 at 21:58 +0000, Chris Laplante via
lists.openembedded.org wrote:
> One possible work around which I'm using for some prebuilt native
> binaries is to call them with hosts loader (e.g. /lib32/ld-linux.so.2 
> ${STAGING_BINDIR_NATIVE}/my-tool params)
>  
> Ooh, nice. Thanks for the tip! Definitely curious about a longer-term 
> workaround but this is good for the short term.  

I suspect uninative assumes all binaries are for the main system
architecture so its probably trying to change the interpreter to a 64
bit one which clearly won't work in this case.

It would be a question of stopping it for these binaries somehow...

Cheers,

Richard

