Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.698.1616610497579691094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 11:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ccCRjI1y;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1675593pjv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m6y2Gqg6FIVfSWYChoBQ7Pv78LmvBCxJr7a4bf236Aw=;
        b=ccCRjI1yZhrNtixMAfvFlfUTGK0xCh+BpNxFRC+7U96vizMDtgNKGVINlPcAnp6W3C
         8brHY0A49UJGMG/YyGK4ne2UKGWTtEz0L3Lb0aTtXPsxAsWEdCLOeJVnAz+etN3Zw//O
         1fiLeIKI4Wj2755GhlNMdn6gMfM7kGThRvYL6pyGlmHEwtsdIVxyqTsbGkYh9enCjUkz
         vZeAQlB0PxYaw9x11ODLN+4/tBMvJB1OtgoD9iyZw9r0bPNnS6VNXlIg2eiQBknOQqt8
         HOgh9vwBWmjNJL7EZpkSr6FK/cVvp+IsEW6LvEVsEOrC5O8IpgdhqFUcKLhzisvGWfQJ
         K7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=m6y2Gqg6FIVfSWYChoBQ7Pv78LmvBCxJr7a4bf236Aw=;
        b=bySM4GALXXxwsJ8UXSFhlf7EH7so4ysFKeymxLmIIBYNR/65GvAK8ZlQzRGiKpxFwv
         PwuKqiBLuu1c+AQbgOmpbHSbykQqpJt0zwNdVDWhDB/vwtHOq9iF5OsRBYYx4COQqs0J
         kTEB254w0r+iSroLOxmk5Dv3pjn0H/6TOlHA1sfAcTEqFFp+FV+ulrgNx/I8I9sO6rA2
         TQTp0gxbYmMGDxDvk1LcXMOx8KtFiBTJoGbTQzqQ/QsPijtztvtEFImWRC9292yzjnWo
         w1jjly5I4H9UVQ8pDwoSh/zksHYCFSs0PI2YxTpnMMvMohOnozs+BRAL/lDMvlL/ZsR+
         mpBA==
X-Gm-Message-State: AOAM532dCcaY6Zws8eHnFzrjR9A45uv2HtafuxavjNFzuqOJCq7FnfXc
	70R7eciWH3cXbz5s2HrSX7sX7SjS3I0xcA==
X-Google-Smtp-Source: ABdhPJxZF09hAPyIbx7zVOl63ueUBjDepZOvTMCTs4zZvcjCytCqXfMdhwi/0/oCQjv3TMRS68QuPA==
X-Received: by 2002:a17:90a:5898:: with SMTP id j24mr4690066pji.110.1616610496769;
        Wed, 24 Mar 2021 11:28:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2da1:1afd:1712:ea8b? ([2601:646:9200:a0f0:2da1:1afd:1712:ea8b])
        by smtp.gmail.com with ESMTPSA id b9sm3163595pgn.42.2021.03.24.11.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 11:28:16 -0700 (PDT)
Subject: Re: [OE-core] [poky][PATCH] run-postinsts: do not remove postinsts directory.
To: Steve Sakoman <steve@sakoman.com>, gmouse@google.com
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210321102616.3752416-1-gmouse@google.com>
 <CAOSpxdaWrkdaKgnJDpPCxibMfj9y9ttQ_TCOT839RGYHBaCNdg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <69556966-7994-7866-9766-2124c8e386bc@gmail.com>
Date: Wed, 24 Mar 2021 11:28:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOSpxdaWrkdaKgnJDpPCxibMfj9y9ttQ_TCOT839RGYHBaCNdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/24/21 8:09 AM, Steve Sakoman wrote:
> On Sun, Mar 21, 2021 at 12:26 AM Anton Kachalov via
> lists.openembedded.org <gmouse=google.com@lists.openembedded.org>
> wrote:
>>
>> From: "Anton D. Kachalov" <gmouse@google.com>
>>
>> When running on the systems having read-only rootfs backed by overlayfs,
>> removing the whole directory lead to create a special char device file
>> on the upperdir to reflect directory's removal. Once it is required to
>> upgrade the whole read-only image that might contain new postinsts scripts,
>> it will be impossible to run such scripts with a "deletion mark" file
>> on the overlayfs -- the whole directory will be marked as deleted regardless
>> new files in it.
> 
> Is this something that should be considered for backporting to
> dunfell/gatesgarth?
> 

yes seems so

> Steve
> 
> 
>> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>> ---
>>   .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
>> index f84a7e18c8..95dccb9cae 100755
>> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
>> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
>> @@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
>>                  else
>>                          echo "ERROR: postinst $i failed."
>>                          [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
>> -                       remove_pi_dir=0
>> +                       remove_rcsd_link=0
>>                  fi
>>          done
>>   }
>>
>> -remove_pi_dir=1
>> +remove_rcsd_link=1
>>   if $pm_installed; then
>>          case $pm in
>>                  "ipk")
>> @@ -92,9 +92,7 @@ else
>>          exec_postinst_scriptlets
>>   fi
>>
>> -# since all postinstalls executed successfully, remove the postinstalls directory
>> -# and the rcS.d link
>> -if [ $remove_pi_dir = 1 ]; then
>> -       rm -rf $pi_dir
>> +# since all postinstalls executed successfully, remove the rcS.d link
>> +if [ $remove_rcsd_link = 1 ]; then
>>          remove_rcsd_link
>>   fi
>> --
>> 2.31.0.rc2.261.g7f71774620-goog
>>
>>
>>
>>
>>
>>
>> 
>>
