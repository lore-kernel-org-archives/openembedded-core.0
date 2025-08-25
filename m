Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F82C8303F
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 18:31:30 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.46193.1756146681489115994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 11:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaNR/7dZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7acfde3so699093866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756146680; x=1756751480; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ/IzvVPDEQZnDrNd1E4nCE9Dij0Y95az0au5HmauQc=;
        b=JaNR/7dZgWwgaAU38U3aVU75Y2enio/56LrEXYlRmN+Lu1omW/3MX4QKt6oN1ugtZN
         S9njFl/nbGkw4ijbIvwOKr+y1mR47aQCCtKGMrdybrELvQQubtL5iBMqMslwXcfLhAp/
         dlY1E5SLfGd9B/Br9SgHAr0byniU6HyERxaFibRk4sohUkcL/QYYbsfOgo9eGq+0sKd4
         JSxGfl1jquK/QyrQVl6JuMj/jEDJDKzod7bn7QYFV1Ipt15Javt2uZVY3k8MN6rgE1QO
         aToKQEBnHolHsoM64h4ytpSaZfVYQ6SqLId98srr0kOfm0bB4ENEKhJSZCiUdBrHkRNt
         oi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756146680; x=1756751480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ/IzvVPDEQZnDrNd1E4nCE9Dij0Y95az0au5HmauQc=;
        b=eXn9AI1v+R+oHlGGzmW7sF8Yfqz31Vgz3SLldxnQ5Me4FrrvfRPhwn2IHbrggQ+bpU
         Rqlssoyot/FuAsDBIfCJnpVlGq1qEUUi9YBFi0zptBawMRWMG8Jd83cUSYJjZZDzGFjz
         6IgfMQ1WfZ5eunFACTWOqDBBWk58h9fLZ5s+KYko8dyNzzNZxTM7nvkY7aLaOQPKve2J
         jhwOWXjlL/zbu0hi+AlASvcCC1OvCADwkY+NGTptWsKToKPvW8DJVnk4rAUU6YMoOH+R
         GGm42VFxC3BUk2pe0qZPNoww+fff0CkYX/DUEauvQaxZA1YIk6fNzZ+JZiX7jRkZYry+
         DkQw==
X-Forwarded-Encrypted: i=1; AJvYcCV7mBNn+R0j3+5dDB9ymM1a/YuWUBy5/TxMuCepg+FncPA/B3aBaaNVjjR++/fN+7P/spoZzSEEkBflhm1eJ3FA4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxw9GWG++81TnZeecG0He7J30KFko6HviC4FZJsKP5uXNCJnzX9
	yRK3wcMCDPqK/i+M/yWhAsldWp0E7Ev8FrAq6ami0p3wlBKiuGTSuLl/
X-Gm-Gg: ASbGnctVnopUrogWyerLnK2XxPIx72xHD6sYYmnwzNS4ZkByRzZptvF2r04ivMkBcOa
	5wJOGOs4qBgsiw8Z6UcjgMzii94zXrfzYmzMuYM6JY4B3jZQukxDDcoY4jtbllBFvNchDXUvmQe
	3ZPw3C5BI9Th3lUzS91gWWR2LTpN2jhcz9xFpxzm2MUkdm69e2k62AUZwndVWzTzJNs0sRfB5eM
	66jD49xgOTAKRQ4FXOVVUxQ57DbRge6Xs8wCV3U06tOy/AXiqh9m98KLOG6amsapjLg4905G5Cp
	yhCKMmJsAvUg8nH4XuxxeQGdSKHQ935a18bHLm3mU5r8MeiBDm/XMpfV2FhbaF+xgoABSSkEd1h
	Tli4mS6sBjJ3p4tqfwqoCaD5zMxF3hV4=
X-Google-Smtp-Source: AGHT+IHcnhFhaAAs2h3ZkbUvPvRaLW7swKL2DwbGkFZqhqM4pQb0EX2FCVWd5Rfwa3VJx/F9XIsf5A==
X-Received: by 2002:a17:907:97cb:b0:afd:d9e3:953f with SMTP id a640c23a62f3a-afe296b14edmr1366765666b.63.1756146679472;
        Mon, 25 Aug 2025 11:31:19 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe9b5f56c3sm31906066b.24.2025.08.25.11.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 11:31:18 -0700 (PDT)
Message-ID: <04c6893d-f69b-4fc5-ae6b-de17ee8a835e@gmail.com>
Date: Mon, 25 Aug 2025 20:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race
 issue
To: Tony Rex <tony.rex@ericsson.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
 <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <CANNYZj_DaekmJt8W1g-nc+QsB7TnY-yyWwmGSR_GOYRORLhRCw@mail.gmail.com>
 <PAXPR07MB847086B08E52F2405CB530B3E430A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <2583ed72-5988-4d0c-8403-eab3eac4bcac@gmail.com>
 <DB9PR07MB847431FEA99FEA8D6225C062E433A@DB9PR07MB8474.eurprd07.prod.outlook.com>
 <185D8414DCE1B6A2.6947@lists.openembedded.org>
 <2b78e257-858c-4f36-857a-37da1049360b@gmail.com>
 <PAXPR07MB8470DD260278F69AF67061ABE432A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <62995efc-cd6f-412e-bbde-2c5a90e1cf85@gmail.com>
 <PAXPR07MB8470E5D2CBEC300F2B5F7866E432A@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <PAXPR07MB847086AE094116D316E3B4A0E43DA@PAXPR07MB8470.eurprd07.prod.outlook.com>
 <12003df3-64b9-4333-bd18-5a69a1dc99c4@gmail.com>
 <PAXPR07MB84705B5738FD248E245FC8C8E43EA@PAXPR07MB8470.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <PAXPR07MB84705B5738FD248E245FC8C8E43EA@PAXPR07MB8470.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 18:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222418

On 8/25/25 17:49, Tony Rex wrote:
> It is the full error output that is in the mail thread, there is nothing more I think.
>
> But can you please try to reproduce the error by doing the changes in meta-selftest layer described below and evaluate the outcome.
> I think the key is the +BBCLASSEXTEND="nativesdk" line.

I can confirm that I can reproduce it. I don't think that your proposed
patch is the correct solution, but your bug looks real.

>
> git diff
> diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
> index 48ca8464f9..3d83072fb0 100644
> --- a/meta-selftest/conf/layer.conf
> +++ b/meta-selftest/conf/layer.conf
> @@ -12,3 +12,6 @@ BBFILE_PRIORITY_selftest = "5"
>  addpylib ${LAYERDIR}/lib oeqa
>
>  LAYERSERIES_COMPAT_selftest = "scarthgap"
> +
> +TAGNAME:pn-gitrepotest="2"
> +PV:pn-gitrepotest="12"
> diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
> index f1b6c55833..10943584df 100644
> --- a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
> +++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
> @@ -7,10 +7,12 @@ INHIBIT_DEFAULT_DEPS = "1"
>
>  PATCHTOOL="git"
>
> -SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https \
> +TAG="${TAGNAME}.${PV}"
> +SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https;tag=${TAG} \
>             file://0001-testpatch.patch \
>            "
>
> -SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
> +#SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
>
>  S = "${WORKDIR}/git"
> +BBCLASSEXTEND="nativesdk"
>
>
> You should get something like this:
> ERROR: ExpansionError during parsing .../oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb   | ETA:  0:00:35
> bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Unable to resolve '${TAGNAME}.1.0' in upstream git repository in git ls-remote output for git.yoctoproject.org/git/matchbox-panel-2
> The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[vardepvalue]
>
> ERROR: Parsing halted due to errors, see error messages above
>
>
> Tony
>
> -----Original Message-----
> From: Gyorgy Sarvari <skandigraun@gmail.com>
> Sent: Friday, 22 August 2025 16:10
> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
>
> On 8/22/25 13:26, Tony Rex wrote:
>> So to me it looks like the fetcher_hashes_dummyfunc makes it possible to catch any faulty or unwanted setups in the parsing stage.
>>
>> It seems hard to reproduce and expose this error on a common target, but I can reproduce it easily in the local setup.
>> So I share my observations instead and hopefully you can make some sense out them.
>>
>> The error that I'm seeing is that when fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}" is executed the PV is not set, nor is the PN.
>> So it seems that if the git ls-remote check happens to quick and early all variables are not set properly.
>> The repo in this case is small (140K) and I believe that the access to
>> the git server is fast (don't know of it matters) the git ls-remote check does not contain the right information if for example, the tag in the SRC_URI contains the PV value.
>>
>> When doing printouts from get_hashvalue the revs variable is empty and
>> PN = defaultpkgname and PV = 1.0 has default values so the variables doesn't seem to be properly set yet and gives this error:
>>
>> ERROR: ExpansionError during parsing .../generic-if.bb################################   | ETA:  0:00:00
>> bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Unable to resolve '${TAGNAME}-1.0' in upstream git repository in git ls-remote output for gerrit...
>> The variable dependency chain for the failure is:
>> fetcher_hashes_dummyfunc[vardepvalue]
>>
>> ERROR: Parsing halted due to errors, see error messages above
>>
>> The patch that is provided fixes this issue, but there might be other and/or maybe better solutions to this matter.
>> Another workaround for this problem that I have tested and that also
>> seems to get around this issue is to set the SRC_URI with := or ?=
>>
>> This is why I consider it to be a race condition during parsing and the git ls-remote check.
> Could you please share the _full_ error output, and the recipe that is causing it? Feel free to change confidential things to placeholders, but the more parts would be available, the better it would be.
>
>
>> Tony
>>
>> -----Original Message-----
>> From: Tony Rex
>> Sent: Thursday, 21 August 2025 17:48
>> To: Gyorgy Sarvari <skandigraun@gmail.com>; Alexander Kanavin
>> <alex.kanavin@gmail.com>
>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: RE: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>> parsing race issue
>>
>> I'm not sure how to run your (Gyorgy) code inside a recipe to test it, but in a bash script it works, of course.
>>
>> The thing that I'm looking at now is  a bit confusing, when commenting out the fetcher_hashes_dummyfunc function from the base.bbclass it seems to work properly.
>>
>> I don't know what the real purpose of this function is, am I missing something here, like a certain setup or a corner case?
>> It seems to work both on whinlatter and scarthgap. Can someone please help out and clarify.
>>
>> git diff classes-global/base.bbclass
>> diff --git a/meta/classes-global/base.bbclass
>> b/meta/classes-global/base.bbclass
>> index 6c08870571..83f82b2a4d 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -128,16 +128,16 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>>
>>  # We can't use vardepvalue against do_fetch directly since that would overwrite  # the other task dependencies so we use an indirect function.
>> -python fetcher_hashes_dummyfunc() {
>> -    return
>> -}
>> -fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
>> +#python fetcher_hashes_dummyfunc() {
>> +#    return
>> +#}
>> +#fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
>>
>>  addtask fetch
>>  do_fetch[dirs] = "${DL_DIR}"
>>  do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
>>  do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
>> -do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
>> +#do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
>>  do_fetch[network] = "1"
>>  python base_do_fetch() {
>>
>> Tony
>>
>> -----Original Message-----
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: Thursday, 21 August 2025 09:30
>> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin
>> <alex.kanavin@gmail.com>
>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>> parsing race issue
>>
>> On 8/21/25 09:10, Tony Rex wrote:
>>> Yes, I get the same or similar error if the patch is not applied.
>>>
>>> ERROR: ExpansionError during parsing .../generic-if.bb################################   | ETA:  0:00:00
>>> bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Unable to resolve '${TAGNAME}-1.0' in upstream git repository in git ls-remote output for gerrit...
>>> The variable dependency chain for the failure is:
>>> fetcher_hashes_dummyfunc[vardepvalue]
>>>
>>> ERROR: Parsing halted due to errors, see error messages above
>>>
>>> How does your mytest_get.bb look like? Since I have had problem with reproducing the error on in a common setup maybe it can be done with your bb file.
>>>
>>> Tony
>> The failure I reproduced is not recipe dependent. As some diagnostic test, try this script a few times with your failing git repo (change the repo placeholder):
>>
>> for i in `seq 50`; do
>>   git clone $GIT_REPO_URL target_folder
>>   git -C ./target_folder ls-remote
>>   if [ $? -ne 0 ]; then
>>     echo ls-remote failed, iteration: $i
>>     break
>>   fi
>>   rm -rf ./target_folder
>> done
>>
>> If I haven't made a typo, the script should clone your repo, do an ls-remote inside it, delete the folder, and do the same again.
>>
>> If your problem is the same that I reproduced, then I would expect the above script to fail sometimes - if it does, then the problem is with the infrastructure (network, remote git server, etc... something is flaky).
>>
>> Just for the record: the script generates a small amount of successive requests which some network admins might consider flooding.
>>
>>
>>
>>> -----Original Message-----
>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>> Sent: Wednesday, 20 August 2025 18:12
>>> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin
>>> <alex.kanavin@gmail.com>
>>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>>> openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>> parsing race issue
>>>
>>> [You don't often get email from skandigraun@gmail.com. Learn why this
>>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On 8/20/25 17:44, Gyorgy Sarvari via lists.openembedded.org wrote:
>>>> On 8/20/25 13:53, Tony Rex wrote:
>>>>> It was introduced by this commit:
>>>>> https://git/
>>>>> .yoctoproject.org%2Fpoky%2Fcommit%2F%3Fid%3Debfa1700f41b3411aec0401
>>>>> 4
>>>>> 4
>>>>> 605166c35b8dd14&data=05%7C02%7Ctony.rex%40ericsson.com%7C7b5c099d17
>>>>> 0
>>>>> 0
>>>>> 43080cca08dde004478d%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6
>>>>> 3
>>>>> 8
>>>>> 913031194171335%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlY
>>>>> i
>>>>> O
>>>>> iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0
>>>>> %
>>>>> 7
>>>>> C%7C%7C&sdata=iYvLGK1DwJk78tEvmL%2FPOL2olj7iNL87eXqdsEraxLw%3D&rese
>>>>> r
>>>>> v
>>>>> ed=0
>>>>>
>>>>> Maybe "not allowed" is a strong wording, but that was how I interpreted it. Sorry, my bad if I misinterpreted it.
>>>> In my understanding (which could be wrong), this is more to avoid
>>>> working on a repository, where the exact work-revision can't be
>>>> determined. But in your example, it can be determined, if your patch
>>>> is not applied.
>>>>
>>>> Some extra ramblings, which may or may not be unadulterated garbage
>>>> from
>>>> me: Your initial commit message mentioned an expansion error. I
>>>> looked into that a bit, and is it possible that the repository that
>>>> is causing this issue has some access rate limit? The only thing
>>>> that can fail sometimes in that code path seems to be "git ls-remote".
>>>>
>>>> Now, when I noticed this, I compiled a git version for myself that
>>>> randomly throws an error with "git ls-remote" command, and when I
>>>> used it with bitbake, I got this:
>>>>
>>>> ERROR: ExpansionError during parsing
>>>> /home/meee/stuff/ptest-images/poky/meta/recipes-core/ell/mytest_get.
>>>> b
>>>> b
>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>> fetcher_hashes_dummyfunc[vardepvalue], expression was <etc etc etc>
>>>>
>>>> Is this the same error you got?
>>> Sorry for the spam, one thing I forgot - the error on my end also contains details about the command that failed, pointing to git. If it's not the same as you get, do you have a copy of the full bitbake output you get when you see this error?
>>>
>>>>> Tony
>>>>>
>>>>> -----Original Message-----
>>>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>> Sent: Wednesday, 20 August 2025 12:18
>>>>> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin
>>>>> <alex.kanavin@gmail.com>
>>>>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>>>>> openembedded-core@lists.openembedded.org
>>>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>>>> parsing race issue
>>>>>
>>>>> [You don't often get email from skandigraun@gmail.com. Learn why
>>>>> this is important at https://aka.ms/LearnAboutSenderIdentification
>>>>> ]
>>>>>
>>>>> On 8/19/25 23:10, Tony Rex via lists.openembedded.org wrote:
>>>>>> Hi Alex and Mathieu!
>>>>>>
>>>>>> Ok, so the patch fixes a bug and then the floating tag/branch function is in place again.
>>>>>> The floating tag/branch function is broken due to the bug and the patch fixes it.
>>>>>>
>>>>>> The mail from Mathieu below might not fully reflect the issue here, since it seems to create a recipe with the help of devtool.
>>>>>>
>>>>>> To verify:
>>>>>> 1. add layers/oe-core/meta-selftest to conf/bblayers.conf 2. run
>>>>>> bitbake gitrepotest -c fetch
>>>>>> result:
>>>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
>>>>>> 3. run bitbake gitrepotest -c cleanall 4. edit
>>>>>> ../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepote
>>>>>> s
>>>>>> t
>>>>>> .b
>>>>>> b
>>>>>> add tag=2.12 in SRC_URI
>>>>>> SRC_URI =
>>>>>> "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;tag
>>>>>> =
>>>>>> 2
>>>>>> .1 2;protocol=https \ and comment out SRCREV #SRCREV =
>>>>>> "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
>>>>>> 5. run bitbake gitrepotest -c fetch
>>>>>> result:
>>>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
>>>>>> The fetch goes through although this is not allowed according to the floating tag/branch error statement if not d.getVar("__BBSRCREV_SEEN"): in git.py.
>>>>> Could you point to a commit/email/etc about this "no floating tags
>>>>> allowed" statement? AFAIK tags without specifying revision is
>>>>> allowed and supported. Not recommended, due to mandatory network
>>>>> access, and because git tags are not immutable, but I'm surprised
>>>>> to hear that they are not supposed to work (which of course can
>>>>> also mean that I just missed a memo)
>>>>>
>>>>>> 6. run bitbake gitrepotest -c cleanall 7. apply patch
>>>>>> 0001-base.bbclass-Fix-the-recipe-parsing-race-issue.patch
>>>>>> 8. run bitbake gitrepotest -c fetch
>>>>>> result:
>>>>>> ERROR: gitrepotest-1.0-r0 do_fetch: Bitbake Fetcher Error:
>>>>>> FetchError("Recipe uses a floating tag/branch '2.12' for repo
>>>>>> 'git.yoctoproject.org/git/matchbox-panel-2' without a fixed SRCREV
>>>>>> yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for
>>>>>> OE).",
>>>>>> None)
>>>>>> ERROR: Logfile of failure stored in:
>>>>>> .../build/tmp-glibc/work/cortexa53-wrs-linux/gitrepotest/1.0/temp/log.
>>>>>> do_fetch.1254999
>>>>>> ERROR: Task (.../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb:do_fetch) failed with exit code '1'
>>>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
>>>>>>
>>>>>> Error is the expected result when only having a tag set.
>>>>>>
>>>>>> Tony
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>>> Sent: Tuesday, 19 August 2025 10:53
>>>>>> To: Tony Rex <tony.rex@ericsson.com>
>>>>>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>>>>>> openembedded-core@lists.openembedded.org
>>>>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>>>>> parsing race issue
>>>>>>
>>>>>> [You don't often get email from alex.kanavin@gmail.com. Learn why
>>>>>> this is important at https://aka.ms/LearnAboutSenderIdentification
>>>>>> ]
>>>>>>
>>>>>> You need to make things a little bit easier for maintainers and try to save their time.
>>>>>>
>>>>>> I would suggest that you provide clear steps to observe the issue.
>>>>>> Attach the recipe file that would demonstrate the issue, and provide clear steps to trigger it. What is confusing right now is that you say here's a recipe that builds ok, but then you 'apply the patch' and then there's some kind of failure. So which patch needs to be applied?
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>> On Fri, 15 Aug 2025 at 17:29, Tony Rex via lists.openembedded.org <tony.rex=ericsson.com@lists.openembedded.org> wrote:
>>>>>>> Hi Mathieu!
>>>>>>>
>>>>>>> I think that this is how it is intended to work, bitbake does not allow floating tag/branch anymore.
>>>>>>> Please correct me if I'm wrong @Richard Purdie (who implemented
>>>>>>> this for security reasons I think.)
>>>>>>>
>>>>>>> The patch that I have makes sure that the parsing and setting of
>>>>>>> the variables in the recipe are done before executing the do_fetch command, and as a side effect the floating tag/branch protection is working as intended again.
>>>>>>>
>>>>>>> How does the recipe look like?
>>>>>>> devtool add kernel-module-hello-world https://git/.
>>>>>>> yoctoproject.org%2Fgit%2Fkernel-module-hello-world&data=05%7C02%7
>>>>>>> C
>>>>>>> t
>>>>>>> on
>>>>>>> y
>>>>>>> .rex%40ericsson.com%7Cde1ae2aceeda470b381608dddefdd730%7C92e84ceb
>>>>>>> f
>>>>>>> b
>>>>>>> fd
>>>>>>> 4
>>>>>>> 7abbe52080c6b87953f%7C0%7C0%7C638911904005151487%7CUnknown%7CTWFp
>>>>>>> b
>>>>>>> G
>>>>>>> Zs
>>>>>>> b
>>>>>>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk
>>>>>>> F
>>>>>>> O
>>>>>>> Ij
>>>>>>> o
>>>>>>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=jyCicRQT%2FLtb1YxiFH
>>>>>>> K
>>>>>>> g
>>>>>>> w5
>>>>>>> B
>>>>>>> nNktN4t9IciiyxtsEwO4%3D&reserved=0
>>>>>>> The one I get looks like this:
>>>>>>>
>>>>>>> cat
>>>>>>> build/workspace/recipes/kernel-module-hello-world/kernel-module-h
>>>>>>> e
>>>>>>> l
>>>>>>> lo
>>>>>>> -
>>>>>>> world_git.bb
>>>>>>> # Recipe created by recipetool
>>>>>>> # This is the basis of a recipe and may need further editing in order to be fully functional.
>>>>>>> # (Feel free to remove these comments when editing.)
>>>>>>>
>>>>>>> # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are
>>>>>>> best guesses - it is # your responsibility to verify that the values are complete and correct.
>>>>>>> #
>>>>>>> # The following license files were not able to be identified and
>>>>>>> are # represented as "Unknown" below, you will need to check them yourself:
>>>>>>> #   LICENSE
>>>>>>> LICENSE = "Unknown"
>>>>>>> LIC_FILES_CHKSUM = "file://LICENSE;md5=7b785be6433a2e4af6a641cc7f0330d1"
>>>>>>>
>>>>>>> SRC_URI = "git://git.yoctoproject.org/git/kernel-module-hello-world;protocol=https;branch=master"
>>>>>>>
>>>>>>> # Modify these as desired
>>>>>>> PV = "1.0+git"
>>>>>>> SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>>>>>>
>>>>>>> S = "${WORKDIR}/git"
>>>>>>>
>>>>>>> inherit module
>>>>>>>
>>>>>>> EXTRA_OEMAKE:append:task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"
>>>>>>> EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
>>>>>>>
>>>>>>> And it contains SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>>>>>>
>>>>>>> Tony
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>>>>>>> Sent: Friday, 15 August 2025 11:26
>>>>>>> To: Tony Rex <tony.rex@ericsson.com>;
>>>>>>> openembedded-core@lists.openembedded.org
>>>>>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>>>>>> parsing race issue
>>>>>>>
>>>>>>> [You don't often get email from mathieu.dubois-briand@bootlin.com.
>>>>>>> Learn why this is important at
>>>>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>>
>>>>>>> On Thu Aug 14, 2025 at 7:23 PM CEST, Tony Rex via lists.openembedded.org wrote:
>>>>>>>> It seems that the race condition happens when doing do_fetch on
>>>>>>>> really small repos and it can be difficult to reproduce so below
>>>>>>>> the other case with floating tag/branch that is easier to verify.
>>>>>>>>
>>>>>>>> To verify the floating tag/branch issue have s simple recipe
>>>>>>>> hello_1.0.bb and set the SRC_URI to SRC_URI = "git://<repository>;protocol=https;user=${USER};branch=master;tag=v1.0"
>>>>>>>>
>>>>>>>> run command bitbake hello everything builds.
>>>>>>>>
>>>>>>>> Apply the patch
>>>>>>>>
>>>>>>>> run command bitbake hello
>>>>>>>> ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error:
>>>>>>>> FetchError("Recipe uses a floating tag/branch 'v1.0' for repo
>>>>>>>> '<repository>' without a fixed SRCREV yet doesn't call
>>>>>>>> bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
>>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>>> hello/1.0/temp/log.do_fetch.3289932
>>>>>>>> ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'
>>>>>>>>
>>>>>>>> Tony Rex (1):
>>>>>>>>   base.bbclass: Fix the recipe parsing race issue
>>>>>>>>
>>>>>>>>  meta/classes-global/base.bbclass | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>> Hi Tony,
>>>>>>>
>>>>>>> Thanks for your patch.
>>>>>>>
>>>>>>> It looks like this is breaking some builds with the following error:
>>>>>>>
>>>>>>> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testsdkext/environment-setup-core2-64-poky-linux > /dev/null; devtool add kernel-module-hello-world https://git.yoctoproject.org/git/kernel-module-hello-world;' returned non-zero exit status 1.
>>>>>>> ...
>>>>>>> ERROR: Bitbake Fetcher Error: FetchError("Recipe uses a floating
>>>>>>> tag/branch 'master' for repo
>>>>>>> 'git.yoctoproject.org/git/kernel-module-hello-world' without a
>>>>>>> fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV
>>>>>>> in PV for OE).", None)
>>>>>>>
>>>>>>> https://auto/
>>>>>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F68%2Fbuild
>>>>>>> s
>>>>>>> %
>>>>>>> 2F
>>>>>>> 2
>>>>>>> 284&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b3816
>>>>>>> 0
>>>>>>> 8
>>>>>>> dd
>>>>>>> d
>>>>>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638911904005
>>>>>>> 2
>>>>>>> 0
>>>>>>> 90
>>>>>>> 0
>>>>>>> 3%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
>>>>>>> w
>>>>>>> M
>>>>>>> CI
>>>>>>> s
>>>>>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda
>>>>>>> t
>>>>>>> a
>>>>>>> =m
>>>>>>> P
>>>>>>> UXMdb%2FYOyGIm0rnncaWgcqtwkUIh8364IP3eYDPe4%3D&reserved=0
>>>>>>> https://auto/
>>>>>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F30%2Fbuild
>>>>>>> s
>>>>>>> %
>>>>>>> 2F
>>>>>>> 2
>>>>>>> 199&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b3816
>>>>>>> 0
>>>>>>> 8
>>>>>>> dd
>>>>>>> d
>>>>>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638911904005
>>>>>>> 2
>>>>>>> 2
>>>>>>> 74
>>>>>>> 3
>>>>>>> 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
>>>>>>> w
>>>>>>> M
>>>>>>> CI
>>>>>>> s
>>>>>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda
>>>>>>> t
>>>>>>> a
>>>>>>> =R
>>>>>>> 0
>>>>>>> HFameGl2LmIVMT9ml%2BDMnj%2FMbG6SW0%2F3yNZHQu2js%3D&reserved=0
>>>>>>> https://auto/
>>>>>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F16%2Fbuild
>>>>>>> s
>>>>>>> %
>>>>>>> 2F
>>>>>>> 2
>>>>>>> 247&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b3816
>>>>>>> 0
>>>>>>> 8
>>>>>>> dd
>>>>>>> d
>>>>>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638911904005
>>>>>>> 2
>>>>>>> 4
>>>>>>> 53
>>>>>>> 8
>>>>>>> 7%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
>>>>>>> w
>>>>>>> M
>>>>>>> CI
>>>>>>> s
>>>>>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda
>>>>>>> t
>>>>>>> a
>>>>>>> =N
>>>>>>> S
>>>>>>> FhEupwMkgqUAhpRgFbKnyFl%2FsY%2B4UJMhVQHhqOaNM%3D&reserved=0
>>>>>>>
>>>>>>> Can you have a look at this error please?
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Mathieu
>>>>>>>
>>>>>>> --
>>>>>>> Mathieu Dubois-Briand, Bootlin
>>>>>>> Embedded Linux and Kernel engineering https://boot/
>>>>>>> lin.com%2F&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda4
>>>>>>> 7
>>>>>>> 0
>>>>>>> b3
>>>>>>> 8
>>>>>>> 1608dddefdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63891
>>>>>>> 1
>>>>>>> 9
>>>>>>> 04
>>>>>>> 0
>>>>>>> 05263327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
>>>>>>> L
>>>>>>> j
>>>>>>> Au
>>>>>>> M
>>>>>>> DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
>>>>>>> %
>>>>>>> 7
>>>>>>> C&
>>>>>>> s
>>>>>>> data=oyi7YWsXDVHn7QB4fDdG1sBp7gQsfGWcJTWtX1CjAw4%3D&reserved=0
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#222190):
>>>> https://list/
>>>> s.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F222190&data=0
>>>> 5
>>>> %
>>>> 7C02%7Ctony.rex%40ericsson.com%7C7b5c099d170043080cca08dde004478d%7C
>>>> 9
>>>> 2
>>>> e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638913031194226137%7CUnknow
>>>> n
>>>> %
>>>> 7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
>>>> 4
>>>> z
>>>> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=WbB87ExjlYOS
>>>> m
>>>> q
>>>> I0%2BEee6LbpupPfWxzk0vNYlbCUP5g%3D&reserved=0
>>>> Mute This Topic:
>>>> https://list/
>>>> s.openembedded.org%2Fmt%2F114706197%2F6084445&data=05%7C02%7Ctony.re
>>>> x
>>>> %
>>>> 40ericsson.com%7C7b5c099d170043080cca08dde004478d%7C92e84cebfbfd47ab
>>>> b
>>>> e
>>>> 52080c6b87953f%7C0%7C0%7C638913031194241729%7CUnknown%7CTWFpbGZsb3d8
>>>> e
>>>> y
>>>> JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTW
>>>> F
>>>> p
>>>> bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=bHfsli%2Fba3g8lov%2Bxmfovaal
>>>> 5
>>>> C
>>>> uBGuFnZVXs8AjHGIY%3D&reserved=0 Group Owner:
>>>> openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe:
>>>> https://list/
>>>> s.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=05%7C02%7Cto
>>>> n
>>>> y
>>>> .rex%40ericsson.com%7C7b5c099d170043080cca08dde004478d%7C92e84cebfbf
>>>> d
>>>> 4
>>>> 7abbe52080c6b87953f%7C0%7C0%7C638913031194543958%7CUnknown%7CTWFpbGZ
>>>> s
>>>> b
>>>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
>>>> j
>>>> o
>>>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=gy4aai6oflVendGBp8nbYAL
>>>> 8
>>>> K
>>>> CGj77ObOMy2rYDnGN0%3D&reserved=0 [skandigraun@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


