Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.21031.1613328590547311059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 10:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fOGulVvE;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id l18so2576872pji.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 10:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9DpyxPSqQbtu6YhuZt23K6ddZcStpf/N5WQGXaPTkz0=;
        b=fOGulVvEJVBzJZdKHyipgvGmphvb6O314zQNipTyIrJEXpNZL5MU3i7TCj26P6aY72
         gvFqQCCBzzyyMiXvr9dOqGTRMCqGLuGJcHlCbLNtuERBH93cj83+2c90D0QbHegGPV4x
         uzoJ2m18DLsVOXJqc0oGCcfXU3id2qIO/sjtTJA9SM1gmHHBLjsWXmO4JG6F459XQsri
         DQGNmFEbpWXq4OVDoVaw+0cILSspm2AAl+2Ah6CKXWqKZQrMYPT+9E6mDKF/TPAQErN6
         B4FVjOT9LskTSVkBektRJXzPYzheyNSkrlB5vnAGzgDAuBrFoUa7eju3vBQcIgV+nOaV
         cgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9DpyxPSqQbtu6YhuZt23K6ddZcStpf/N5WQGXaPTkz0=;
        b=lZFe/0JA9At+JmHHC+A3dRsZ1Yna85W15riKZP9/0bMkME+7uCo/TfHFpdEIzWCnnE
         oi7ia2WOolIqkhQDSXfxXDcKhIEPkgigCdrWqbdiLtct6BBcc3C2GJpQsXde7ThbYxOE
         x6IUycsvJMHSlO6p/dJbZ5o16w3lyVUoyfCzHgjS2LJVrl30uIl/bYiIefe6CfciS/kL
         MkoCezaq1BbQ2HIbr8bBjE3Nx1YQrd7Znqolk9WZAxe3SK7KCqKQi8DSp0RAaJ147qWs
         4vc20YY3YpO0yjRT1utCS55qLXwkXv0ZIw8vYqyao1htAuVkI46SE6zvBYUb8rze+9KQ
         TJxA==
X-Gm-Message-State: AOAM531PGufFrYc1p5+tEVI1RJBt8GiUX8bqDi5WKsi4sAbt+3ULIrwb
	rY2dcfS7U6CGLVMDrqH+N2Vdr1A9wUlMtw==
X-Google-Smtp-Source: ABdhPJz1xcPc+gwu85Eo9UdORYpFQdOATX8REMCC8hQNlKsfu8ZB6LnBXNOcBGVPQzhghHZGqRBN4Q==
X-Received: by 2002:a17:90b:1895:: with SMTP id mn21mr12593132pjb.6.1613328589962;
        Sun, 14 Feb 2021 10:49:49 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d? ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id 73sm15636009pfa.27.2021.02.14.10.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 10:49:49 -0800 (PST)
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: add ${PN}/cve.log
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20210214175942.1981711-1-akuster808@gmail.com>
 <AM9PR09MB46422BBD6C5317F01D038450A8899@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <18970bb8-2406-079e-90a9-35285cb94c1c@gmail.com>
Date: Sun, 14 Feb 2021 10:49:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB46422BBD6C5317F01D038450A8899@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/14/21 10:43 AM, Konrad Weihmann wrote:
>
>
> On 14.02.21 18:59, akuster wrote:
>> Let archive package cve.logs too
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta/classes/buildhistory.bbclass | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/meta/classes/buildhistory.bbclass
>> b/meta/classes/buildhistory.bbclass
>> index 8ed420174e9..a119981d9b7 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -1067,3 +1067,27 @@ def write_latest_ptest_result(d, histdir):
>>                       bb.error('Failed to run %s!' % cmd)
>>           finally:
>>               bb.utils.unlockfile(lock)
>> +
>> +do_cve_check[postfuncs] += "write_cve_result"
>> +do_cve_check[vardepsexclude] += "write_cve_result"
>> +
>> +python write_cve_result() {
>> +    write_latest_cve_result(d, d.getVar('BUILDHISTORY_DIR'))
>> +}
>> +
>> +def write_latest_cve_result(d, histdir):
>> +    import shutil
>> +
>> +    input_file = d.getVar("CVE_CHECK_LOG")
>> +    pkg = d.getVar("PN")
>> +
>> +    output_cve = os.path.join(histdir, 'cve', pkg)
>> +    if os.path.isfile(input_file):
>> +        try:
>> +            # Lock it avoid race issue
>> +            lock = bb.utils.lockfile(histdir + "/cve.lock")
>> +            bb.utils.mkdirhier(output_cve)
>> +            shutil.copyfile(input_file, output_cve+"/cve.log")
>> +
>> +        finally:
>> +            bb.utils.unlockfile(lock)
>
> just theoretically if bb.utils.lockfile raises an exception `lock`
> would be undefined at this line
Good question. I don't know. I just copied that locking from the ptest
handler in buildhistory.

-armin
>
>>
>>
>>
>> 
>>

