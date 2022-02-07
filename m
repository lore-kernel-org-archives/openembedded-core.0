Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0D3C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 20:35:48 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web09.1790.1644266147513195142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 12:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=edPcyfwr;
 spf=pass (domain: gmail.com, ip: 209.85.161.52,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso9738798ooi.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 12:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=z5WEYabcNKeFElxD7cH3RRWqsIpPh3+XydQp358BrsI=;
        b=edPcyfwrmGg47vQ1GruX+vnjw6o8jPvMOGhKAAKSfHwHrA3uCL4Nb+Gz32q3mWaY+A
         TVS4m8NjokKe5K/PxDqPbixhQXn53rLGBv/bj2hVnLJl0YGVyl/pW+h+00HS6m5kmG8D
         H49Fw0HAxXBE4ph3tcEgb8yiP01j4avbkgzaRtpI1m78/h2oPbA9KJBOD4ho9WvM4sbw
         mzdd0KYHQLS/gu5U59jNMrRQ8XWmwRq/33FfG1mSVtmKApy700fqm1PFJMajTdjCrIvl
         w35XYhttnCNgECNkJKRb5j6X/9DCyLOmXorMksBy9SKC1yxVkWGShgSkOwZUZuMRWl35
         KM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=z5WEYabcNKeFElxD7cH3RRWqsIpPh3+XydQp358BrsI=;
        b=wITs0gd9Vx93v9xfd2P9UCoLZJ91EtKTBeOickVyPBtoGoUVorPRh9LyZzBzdRJ+Ju
         xk3cHb8VQE3zZjkwNuJCPDvRKVpGg2mJmVKpm6CHTnBgmu/7Cx9uH+T8M1JTAIrQBci7
         iC8h9Z+IdqPZ2UbW4bfpeZW5+q0Jimtb7WU/U1ADyb/ChGpK993AXRVWUxwaJyPr66+0
         ZK8M3cSbXWP8dx+RJK0t3QzDDwA18JOtvDhDLgCaf4GtxJ5oUt6jq4DsIev9DiFQxbLE
         3xGiSK6VMcjBkOWfwKuEDPkVIie8AWvEowrv5Uaza0aGUUL+xISuIn9RNhf53ht1DMwU
         Myog==
X-Gm-Message-State: AOAM5311BNEJhOlivlurQI2PA8njcFinKG/s0/hWHxBSPKXYAQxYIbPx
	CsH+2UvZRxB/2zYAA8Qo+QAYeIje0Es=
X-Google-Smtp-Source: 
 ABdhPJxv8I/BV0rJBQZwxpu8wjCf4DDicGSLSzqgJr7+DGWMPupD7Y7FNGE99gTAzAKSmt5BfVyjfw==
X-Received: by 2002:a05:6870:8544:: with SMTP id
 w4mr233800oaj.275.1644266146755;
        Mon, 07 Feb 2022 12:35:46 -0800 (PST)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 m7sm4377819ots.32.2022.02.07.12.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 12:35:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
Date: Mon, 7 Feb 2022 14:35:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
Content-Language: en-US
To: Scott Murray <scott.murray@konsulko.com>,
 Saul Wold <Saul.Wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <5aebf892-1a3d-9647-3490-39242941653@spiteful.org>
In-Reply-To: <5aebf892-1a3d-9647-3490-39242941653@spiteful.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 20:35:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161467


On 2/7/22 14:33, Scott Murray wrote:
> On Mon, 7 Feb 2022, Saul Wold wrote:
>
>> This patch will read the begining of source files and try to find
>> the SPDX-License-Identifier to populate the licenseInfoInFiles
>> field for each source file. This does not populate licenseConcluded
>> at this time, nor rolls it up to package level.
>>
>> We read as binary file since some source code seem to have some
>> binary characters, the license is then converted to ascii strings.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>> v2: Updated commit message, and fixed REGEX based on Peter's suggetion
>>
>>   meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
>> index 8b4203fdb5..588489cc2b 100644
>> --- a/meta/classes/create-spdx.bbclass
>> +++ b/meta/classes/create-spdx.bbclass
>> @@ -37,6 +37,24 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
>>
>>   do_image_complete[depends] = "virtual/kernel:do_create_spdx"
>>
>> +def extract_licenses(filename):
>> +    import re
>> +    import oe.spdx
>> +
>> +    lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
>> +
>> +    try:
>> +        with open(filename, 'rb') as f:
>> +            size = min(15000, os.stat(filename).st_size)
>> +            txt = f.read(size)
>> +            licenses = re.findall(lic_regex, txt)
>> +            if licenses:
>> +                ascii_licenses = [lic.decode('ascii') for lic in licenses]
>> +                return ascii_licenses
>> +    except Exception as e:
>> +        bb.warn(f"Exception reading {filename}: {e}")
>> +    return None
>> +
>>   def get_doc_namespace(d, doc):
>>       import uuid
>>       namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
>> @@ -232,6 +250,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>>                           checksumValue=bb.utils.sha256_file(filepath),
>>                       ))
>>
>> +                if "SOURCE" in spdx_file.fileTypes:
>> +                    extracted_lics = extract_licenses(filepath)
>> +                    if extracted_lics:
>> +                        spdx_file.licenseInfoInFiles = extracted_lics
>> +
>>                   doc.files.append(spdx_file)
>>                   doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
>>                   spdx_pkg.hasFiles.append(spdx_file.SPDXID)
> IMO this seems like perhaps either going too far, or not far enough.  If
> we go to the trouble to scan source files for explicit SPDX license
> declarations, but do not go as far as pattern detection like the
> meta-spdxscanner layer does with its use Scancode Toolkit
> (https://github.com/nexB/scancode-toolkit), then it seems there's
> more potential for giving users a false impression as to the completeness
> of the resulting report/SBOM.  Perhaps that can be handled by making it
> very clear that further scanning and auditing is still required in the
> hopefully forthcoming create-spdx.bbclass documentation, but I can
> imagine having to explain this to customers.

Can you given an overview of what meta-spdxscanner does? I'm not quite 
clear what extra processing would be required here.

>
> Scott
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161466): https://lists.openembedded.org/g/openembedded-core/message/161466
> Mute This Topic: https://lists.openembedded.org/mt/88980079/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

