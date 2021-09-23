Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web09.172.1632434879121258924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 15:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pYayX0dI;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso2655771oom.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 15:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=AxqMvBW5n/Lav6Mk9/GqpEqqKASjUNIDx2cxOwwSETE=;
        b=pYayX0dId15BnieXiuaSboY2UVljC9eYQ6ogHdtGkhUNTxTvozoLjUV+WfWv1vxAce
         NvhOr5JT4N3PMNmO4LqRiwwwEludLIZl8JxQ2QHukGIdyWPZ6Nv9bhcaKLprlmg2ca93
         h2LwLJwQSjimlDAq5+tvXEZtW2sYC/7tLhO6M99l4ZrWqu8819/q5QXAjX9/cp1rIBJg
         zrFR1vQRZtfG3d+pzHA91DG/bECcWBfHh+hn6NT6JbT5G1cB8KH4ssKFuMzncQ28a0hi
         s1n8YYxVnOhD37cPgU3F5C6mcWBVLH3YA3h391X83o7jtU68XyL1YB2KJpgnRv+/Qzlh
         Yr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AxqMvBW5n/Lav6Mk9/GqpEqqKASjUNIDx2cxOwwSETE=;
        b=c5nte8qYJBQLM+H1yvhm1aR3ELSXHIqvY3i16DyMWbP1X12iOYd+lATZAHAe7Xo+1G
         8HOWlHqH9d5qKh0xs2QXC76swj/tW9BoMB9rcabpPtWVj3UfK9+bk6+l7kFvqEbexBF6
         roDzTqWiPHY1uvH8OajGwqdm9fUbWvQBeeXL1KPL2jhSFtdnXKLqdmoEK3mmMAAmIpiv
         OXsa5xyfixIZk5mpq9U6pISw7oq7gZU0SxJr9CQiBMhMOU5aTNX9u03sukT8Yn3IvV+2
         6aklZ6lvynebmhTbzW+cuN6FMr8T9IMek7a9tXQz8cpr07eS0ustHBswx8NA+vx7vhqO
         9mbQ==
X-Gm-Message-State: AOAM533pRU+XoxnmlGPoxmXx5dItTTkc7am/MjicZaRfdTFO9HD6Uiqd
	yIWSt6+aQMJtMuy1nokGUyZSsIotYTE=
X-Google-Smtp-Source: ABdhPJzZKEosxmEKYoY3WpBnhqZaMZx5FJvmgvdaXb0Qc9ptn96z2D0tMS1JeGMFctbjdT2SqqLZxg==
X-Received: by 2002:a4a:88e2:: with SMTP id q31mr5683157ooh.91.1632434878069;
        Thu, 23 Sep 2021 15:07:58 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id v4sm1469121ott.72.2021.09.23.15.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 15:07:57 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [PATCH v2] create-spdx: Don't collect natives sources
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210923205328.2662727-1-saul.wold@windriver.com>
 <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com>
 <bd23a9da-94ad-4386-1460-8107b7be59ec@windriver.com>
Message-ID: <5e3b148c-9e63-60fd-0a0d-096c73889ae4@gmail.com>
Date: Thu, 23 Sep 2021 17:07:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bd23a9da-94ad-4386-1460-8107b7be59ec@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 9/23/21 4:29 PM, Saul Wold wrote:
>
>
> On 9/23/21 2:05 PM, Joshua Watt wrote:
>>
>> On 9/23/21 3:53 PM, Saul Wold wrote:
>>> Extend the SPDXPackage to include is_native so it can be used later in
>>> the processing.
>>>
>>> When the collect_dep_sources() runs, it collects sources from both 
>>> native
>>> and non-native recipes. Later when the GENERATED_FROM matching 
>>> occurs it
>>> may find the file (via checksum) from the native recipe since it's the
>>> same checksum as the target file. The that are generated DocumentRefs
>>> point to the native recipe rather than the target recipe DocumentRef.
>>>
>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>> ---
>>>   meta/classes/create-spdx.bbclass | 11 +++++++++--
>>>   meta/lib/oe/spdx.py              |  1 +
>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/create-spdx.bbclass 
>>> b/meta/classes/create-spdx.bbclass
>>> index 3c73c21c04..e565f0bf6c 100644
>>> --- a/meta/classes/create-spdx.bbclass
>>> +++ b/meta/classes/create-spdx.bbclass
>>> @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
>>>       sources = {}
>>>       for dep in dep_recipes:
>>> +        # Don't collect sources from native recipes as they
>>> +        # match non-native sources also.
>>> +        if dep.recipe.is_native == "True":
>>> +            continue
>>>           recipe_files = set(dep.recipe.hasFiles)
>>>           for spdx_file in dep.doc.files:
>>> @@ -382,7 +386,6 @@ python do_create_spdx() {
>>>       include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
>>>       archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
>>>       archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
>>> -    is_native = bb.data.inherits_class("native", d)
>>>       creation_time = 
>>> datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
>>> @@ -401,6 +404,10 @@ python do_create_spdx() {
>>>       recipe.name = d.getVar("PN")
>>>       recipe.versionInfo = d.getVar("PV")
>>>       recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
>>> +    if bb.data.inherits_class("native", d):
>>> +        recipe.is_native = "True"
>>> +    else:
>>> +        recipe.is_native = "False"
>>>       for s in d.getVar('SRC_URI').split():
>>>           if not s.startswith("file://"):
>>> @@ -480,7 +487,7 @@ python do_create_spdx() {
>>>       sources = collect_dep_sources(d, dep_recipes)
>>>       found_licenses = {license.name:recipe_ref.externalDocumentId + 
>>> ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
>>> -    if not is_native:
>>> +    if recipe.is_native is "False":
>>>           bb.build.exec_func("read_subpackage_metadata", d)
>>>           pkgdest = Path(d.getVar("PKGDEST"))
>>> diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
>>> index 9814fbfd66..452148f339 100644
>>> --- a/meta/lib/oe/spdx.py
>>> +++ b/meta/lib/oe/spdx.py
>>> @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
>>>       packageVerificationCode = _Object(SPDXPackageVerificationCode)
>>>       hasFiles = _StringList()
>>>       packageFileName = _String()
>>> +    is_native = _String()
>>
>> It's probably not well documented in this file, but this has to match 
>> to the SPDX standard; we can't add arbitrary fields here. When I was 
>> referring to an "annotation" I was specifcially referring to an SPDX 
>> annotation:
>>
> I should have figured that!
>
>> https://spdx.github.io/spdx-spec/8-annotations/
>>
>> We'd need to decide on some schema for encoding the data in the 
>> annotation
>>
> So we need to create an SPDXAnnotation type on spdx.py and define what 
> we want in the AnnotationComment field?

Exactly. We can use the tool field to indicate that this is data we care 
about for a specific annotation, then put JSON or something in the 
annotation itself.

>
> Sua!
>
>>>   class SPDXFile(SPDXObject):
>
