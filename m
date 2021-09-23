Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web09.246.1632435268155602811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 15:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cjnlWARj;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id z11-20020a4ad1ab000000b0029f085f5f64so2646726oor.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 15:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Z3YItQcmNBWV4zJlfpwyQsGsSG4Mzo9tloree2/TWXU=;
        b=cjnlWARjWzSQ8FqKpGknbGs1Ec1hD5iMK729dWkXgg5GTV/e9wPi/3OV7Js18p+c3y
         AUkvcHHYfrTFTErLm5rQYuX4lCkKh8h8ZOFtQyhME+g8WJ6t4JDiqQvA2SUDnKJ+vpX3
         Rz/9qDWRHxThxDQP/lcTGiL1YNnZ6hoC1AVaK9Tnxa7k+SzchyBsdvDD+Ez9KMtdlD4q
         mQCDMfZ18xxwMW3X0R13qi4sE5DGWEYhuCHbkO1pwBZLY6/P8OzY62JQz47s9xyceQi4
         +WMTpWyG+AkK/Id6TzaxXye8zP432ZzecN7PYo0Svuxhy3BCnnF512RjNXqtuQ5mwhbM
         lzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Z3YItQcmNBWV4zJlfpwyQsGsSG4Mzo9tloree2/TWXU=;
        b=Ai/gcUZPRh1MbJIY9KKChIbSA4oB/W+BvTU5mSV66KNVrkP4OxRyfYpfsI4HvBb1sA
         Y4q2VEO5ssWkpjBbdoNME0XLcBtQmJ3bm6P+rr70bJI3dFQCFbsLWr8hR+V9ElpBFGII
         dV9BuPrNEI84Ei6/4g712D9w2f3Lj6TyMXiEspprTh7Gg0X1S9bzbZ3Rb/281PlVc9Q8
         /20T6hssKS1BiuvORtna6Ek98UMGttQ6atJwWxqJb5GGZGumBfI6r/QoUAeptD+ANPEo
         fYUomSwOMQEXn+UcziPx7eqGNGY6Oq5YEX2Qoz8FphsCZwLvC2/tvJEp9GP5DdeQ3dZG
         0C0Q==
X-Gm-Message-State: AOAM532LsMleRXE44ufWvmVa+ur3rskC+rQ9qECZvORlzlrUGhR14r4r
	06jPd4bwrKi294FsRzB8M+KH4XmJ4sw=
X-Google-Smtp-Source: ABdhPJwKdwWpTdqP+FqAVVM4qZjbgeVmziJFg90UJzACm4AqZ+2GC/iV2OYTdDVo2si0FIvhlJPNfw==
X-Received: by 2002:a4a:da05:: with SMTP id e5mr5844332oou.52.1632435267151;
        Thu, 23 Sep 2021 15:14:27 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id l8sm200850oii.57.2021.09.23.15.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 15:14:26 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [PATCH v2] create-spdx: Don't collect natives sources
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210923205328.2662727-1-saul.wold@windriver.com>
 <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com>
 <bd23a9da-94ad-4386-1460-8107b7be59ec@windriver.com>
 <5e3b148c-9e63-60fd-0a0d-096c73889ae4@gmail.com>
Message-ID: <02196b6e-af2e-8046-a64b-8fe8b13e3fbf@gmail.com>
Date: Thu, 23 Sep 2021 17:14:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e3b148c-9e63-60fd-0a0d-096c73889ae4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 9/23/21 5:07 PM, Joshua Watt wrote:
>
> On 9/23/21 4:29 PM, Saul Wold wrote:
>>
>>
>> On 9/23/21 2:05 PM, Joshua Watt wrote:
>>>
>>> On 9/23/21 3:53 PM, Saul Wold wrote:
>>>> Extend the SPDXPackage to include is_native so it can be used later in
>>>> the processing.
>>>>
>>>> When the collect_dep_sources() runs, it collects sources from both 
>>>> native
>>>> and non-native recipes. Later when the GENERATED_FROM matching 
>>>> occurs it
>>>> may find the file (via checksum) from the native recipe since it's the
>>>> same checksum as the target file. The that are generated DocumentRefs
>>>> point to the native recipe rather than the target recipe DocumentRef.
>>>>
>>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>>> ---
>>>>   meta/classes/create-spdx.bbclass | 11 +++++++++--
>>>>   meta/lib/oe/spdx.py              |  1 +
>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/create-spdx.bbclass 
>>>> b/meta/classes/create-spdx.bbclass
>>>> index 3c73c21c04..e565f0bf6c 100644
>>>> --- a/meta/classes/create-spdx.bbclass
>>>> +++ b/meta/classes/create-spdx.bbclass
>>>> @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
>>>>       sources = {}
>>>>       for dep in dep_recipes:
>>>> +        # Don't collect sources from native recipes as they
>>>> +        # match non-native sources also.
>>>> +        if dep.recipe.is_native == "True":
>>>> +            continue
>>>>           recipe_files = set(dep.recipe.hasFiles)
>>>>           for spdx_file in dep.doc.files:
>>>> @@ -382,7 +386,6 @@ python do_create_spdx() {
>>>>       include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
>>>>       archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
>>>>       archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
>>>> -    is_native = bb.data.inherits_class("native", d)
>>>>       creation_time = 
>>>> datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
>>>> @@ -401,6 +404,10 @@ python do_create_spdx() {
>>>>       recipe.name = d.getVar("PN")
>>>>       recipe.versionInfo = d.getVar("PV")
>>>>       recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
>>>> +    if bb.data.inherits_class("native", d):
>>>> +        recipe.is_native = "True"
>>>> +    else:
>>>> +        recipe.is_native = "False"
>>>>       for s in d.getVar('SRC_URI').split():
>>>>           if not s.startswith("file://"):
>>>> @@ -480,7 +487,7 @@ python do_create_spdx() {
>>>>       sources = collect_dep_sources(d, dep_recipes)
>>>>       found_licenses = {license.name:recipe_ref.externalDocumentId 
>>>> + ":" + license.licenseId for license in 
>>>> doc.hasExtractedLicensingInfos}
>>>> -    if not is_native:
>>>> +    if recipe.is_native is "False":
>>>>           bb.build.exec_func("read_subpackage_metadata", d)
>>>>           pkgdest = Path(d.getVar("PKGDEST"))
>>>> diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
>>>> index 9814fbfd66..452148f339 100644
>>>> --- a/meta/lib/oe/spdx.py
>>>> +++ b/meta/lib/oe/spdx.py
>>>> @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
>>>>       packageVerificationCode = _Object(SPDXPackageVerificationCode)
>>>>       hasFiles = _StringList()
>>>>       packageFileName = _String()
>>>> +    is_native = _String()
>>>
>>> It's probably not well documented in this file, but this has to 
>>> match to the SPDX standard; we can't add arbitrary fields here. When 
>>> I was referring to an "annotation" I was specifcially referring to 
>>> an SPDX annotation:
>>>
>> I should have figured that!
>>
>>> https://spdx.github.io/spdx-spec/8-annotations/
>>>
>>> We'd need to decide on some schema for encoding the data in the 
>>> annotation
>>>
>> So we need to create an SPDXAnnotation type on spdx.py and define 
>> what we want in the AnnotationComment field?
>
> Exactly. We can use the tool field to indicate that this is data we 
> care about for a specific annotation, then put JSON or something in 
> the annotation itself.


Also, I forgot to mention but I found it really hard to convert the 
normal SPDX spec document into the structure we need for JSON encoding 
in spdx.py. I found it *much* easier to decipher the actual SPDX JSON 
schema document:

https://github.com/spdx/spdx-spec/blob/development/v2.2.1/schemas/spdx-schema.json

>
>>
>> Sua!
>>
>>>>   class SPDXFile(SPDXObject):
>>
