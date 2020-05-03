Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.25135.1588520952821256379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 08:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C3tqAgSV;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id g4so7263337ljl.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9QoyKPVK9nGYkxpxxEvW/DRgf+YW2N2KdVehslEZ+Ts=;
        b=C3tqAgSVUvji8hmazPFpizfcq/L3WC7q4SifPUppwDpY/0KkGulRlO/hv8Q7C/l0xz
         8vBkdeYbYFKDsaHTXm/ZeV2P5FnNavT0opg8ID6+CPRcE+u6wf2KO+tztrJJec+GkdNg
         uoj451Faec50a0pxX+YIoJYll4Voys6qR1pu8azvQdmDXRSqdfsNurQ4b9d04IW2K7x6
         NaKjVtblD1pfrs9xIk1S6g/0uFyFjzBUuyBLoeMwGshtztXiGNS7W9CnKyoph98MQHBH
         DuhRmFbNXgakb0mqxJzXWOcRGx0MhSiIVALC5DEiENrgrBfW+0c/bOu8ZLuq5BMFdxJi
         t44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9QoyKPVK9nGYkxpxxEvW/DRgf+YW2N2KdVehslEZ+Ts=;
        b=U/6aExTTNH+6fK+nNWLQyAEaZ7o087yDHB2Bv24Vp0PxlSpduA4T3nLh3N6tx9Mlic
         pEgzHLO6oqOt0Yp9Nrq+ruI2XQ4/goaqoWLnbBOb4M5vR458oZuHO83r8lyO5SUCRngd
         V+urUzG+zEO4pk3PjrUVE8XdxVmV0zr14fA5MdQrsOX3k+u7zJtuTXL/HcvcwZmHXyrk
         01shH2/G8r7dUayyK0YD11cmZKP5iPt5yFJbHIKqYDPHNrWWCMxshMBJEdYT2hO62yyP
         Q3i1YjOcyky5WF8hGzhd5hQz+EnAogJ7DE4ARGVTSmlVSfCaz+5HM5/m9D+mWyPryhwY
         1Dzw==
X-Gm-Message-State: AGi0Pua0xNMyKsivKM/wJg6GrVX2V4BsBGWr/5Zt/Uqm0yI60rjI+ijq
	Zoet6j3U1wgjcBALwHSwU2vWGb0P
X-Google-Smtp-Source: APiQypK2ET/pHZCrrh9bVT1i9f+MFO7kfMhWFdJJGUVwnk8PwWkuIMDiPtvBq9Qk4lTi5rWz4tSi2g==
X-Received: by 2002:a2e:8912:: with SMTP id d18mr8228078lji.123.1588520950583;
        Sun, 03 May 2020 08:49:10 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id q7sm6125740ljp.20.2020.05.03.08.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2020 08:49:10 -0700 (PDT)
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_ipc.h: Fix enum typedef
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
References: <20200503042712.1878496-1-jacob.kroon@gmail.com>
 <20200503002852.1273f3a1@seebsdell>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <e8a9982b-1412-087f-b8ac-283b657106aa@gmail.com>
Date: Sun, 3 May 2020 17:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503002852.1273f3a1@seebsdell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/3/20 7:28 AM, Seebs wrote:
> On Sun,  3 May 2020 06:27:12 +0200
> "Jacob Kroon" <jacob.kroon@gmail.com> wrote:
> 
>> 'pseudo_access_t' is a type, so use typedef.
>>
>> Fixes building pseudo with gcc 10 where -fno-common is the default.
> 
> Wow! That's amazing, and yes, that's a bug, and the fix looks right to
> me. I don't know how that got missed all these years. (But don't rely
> on this evaluation too heavily just yet, I haven't actually looked at
> the code more carefully, but this seems obvious.)
> 
> -s
> 

The type has never been used, so an alternative fix would be to get rid 
of it altogether, and just keep the enum identifiers.

/Jacob
