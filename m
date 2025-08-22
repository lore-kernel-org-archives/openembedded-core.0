Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A1DCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:09:45 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11047.1755871775971409602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 07:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5/U65I3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7ace3baso358627566b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755871774; x=1756476574; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZgIFvr5Hsv7Wuce42t5TRxq5BL4ui6FN7uvPF0KM3U=;
        b=Q5/U65I3Ya9oGVB0y7TmY3jULACDCHrgOPHOQVSFg0JfPU4B5JeRE8zrxy3h5vChlG
         r5SVk2ZRGlB+K+MXtR5C+rqYdML7HD4pXxVaD7vZgbDHto8KmAi0axJT3WVFvatHz4tK
         l0vliwmT6ohVooX4uE/oY1x53eeULwWt6nI9hy7DCkdyzj+IlraWjz1bL4bTjaMj+D83
         tOkMRp+3z1bbhw6pSuzDOPWlmFfQjRfJBj3h5DIwuOrIdloztisPiTWFTd0y3mYy1GFS
         icnvIndWDdLv75rlshnhXgFh+IPbZJnDpdQIpkNieUNGSil99NlFUigYS0q6BhMMd3O4
         1amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755871774; x=1756476574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZgIFvr5Hsv7Wuce42t5TRxq5BL4ui6FN7uvPF0KM3U=;
        b=KlD9ewfi+wtvKQsWzvfv9x0Md0pmnXsuY7e3JXU9eu3+7WuOF7VqCEgda3Yaylbnpy
         aG72Sv8ON1nEbuF+Pqzk/o22QJta5sZaUofOkcb19g68JGhDu17iMRGNCTi7hYw25FoV
         uKpxQOAV0i2URCkDyZVTlO43lzo6QwptiWBm0oGayeHMm0f8Roe65n4uHDOh6RSk/44V
         6D81kt8fM+ByDzD9dEcy6aI8QGbCA/QIUQlyiCO0LCV6fwahjcdgsXUgqSmY4GvxPbtT
         3ES57DAFHVliJepW2jyMRdBQQTbBD/OaosBUNJhq1HpU39gvOOimYSj16rtrf3G1rAcL
         +yBg==
X-Forwarded-Encrypted: i=1; AJvYcCW8DIyZLZuMnjKHVbDa3Uy8r2W27xtXAwPg60spY5llkX6WoWm+xrmYqY/3L213GmtNf4mvw3p+e6sBMig5O6zfdQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPC+WDiI+lcYFr52azmnOAYMLrrYSvWlszwGEFDIrb8gqC8alA
	DpGv2vqFtyEcZgdRbMCL/F/L+je8CT4T3tFKaIWJWT5VEBonYJfdB36t
X-Gm-Gg: ASbGnctnV3p0rAw5scuYPd9pE0uZx6ufy/V65qQXMJMlV/T3y8d0pUq2mw1F5fYIFX/
	2AmA6uvKQ+4Xpu5tOlI2Cylxycj22l5AYI0g41g3qhThUdqRGpFOjwIcKyo8LUOlAdXX89WBUwI
	sccT2/AQOe4wKsQzArVJLqlRBu1C3nFsjkvzfYG48LvLwRLKmYW8ejuFKU4H7c0LIL4fFMv3671
	jR8b51+1G2T1Dl5TXAthdpXwP507K7SuNmnbgGISC3i502CtTWSND3T7hlTGkN0qHxxCEyikpaz
	6p9sdFbYXUDI41sQIAebTPqZfp4GPXzVOddEYwaadVB8eBNVQMYIhGpMrngCRYs5Tth7aR94LBx
	cJdwWu+94W/Bb1Imv6HcamHUYFgEiHdk=
X-Google-Smtp-Source: AGHT+IFHy6kZyeGW05n3cH4rygMW3t1Do6iH2uY1FMhy34SZDR1dEIe0LRia/gtpbjNzwdzgmaSzMA==
X-Received: by 2002:a17:907:7e82:b0:af9:709f:970b with SMTP id a640c23a62f3a-afe29549034mr270117566b.46.1755871773853;
        Fri, 22 Aug 2025 07:09:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe0c411a55sm355733166b.100.2025.08.22.07.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 07:09:33 -0700 (PDT)
Message-ID: <12003df3-64b9-4333-bd18-5a69a1dc99c4@gmail.com>
Date: Fri, 22 Aug 2025 16:09:32 +0200
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
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <PAXPR07MB847086AE094116D316E3B4A0E43DA@PAXPR07MB8470.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222331

On 8/22/25 13:26, Tony Rex wrote:
> So to me it looks like the fetcher_hashes_dummyfunc makes it possible to catch any faulty or unwanted setups in the parsing stage.
>
> It seems hard to reproduce and expose this error on a common target, but I can reproduce it easily in the local setup.
> So I share my observations instead and hopefully you can make some sense out them.
>
> The error that I'm seeing is that when fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}" is executed the PV is not set, nor is the PN.
> So it seems that if the git ls-remote check happens to quick and early all variables are not set properly.
> The repo in this case is small (140K) and I believe that the access to the git server is fast (don't know of it matters) the git ls-remote check does not contain the
> right information if for example, the tag in the SRC_URI contains the PV value.
>
> When doing printouts from get_hashvalue the revs variable is empty and PN = defaultpkgname and PV = 1.0 has default values so the variables doesn't seem to be
> properly set yet and gives this error:
>
> ERROR: ExpansionError during parsing .../generic-if.bb################################   | ETA:  0:00:00
> bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Unable to resolve '${TAGNAME}-1.0' in upstream git repository in git ls-remote output for gerrit...
> The variable dependency chain for the failure is:
> fetcher_hashes_dummyfunc[vardepvalue]
>
> ERROR: Parsing halted due to errors, see error messages above
>
> The patch that is provided fixes this issue, but there might be other and/or maybe better solutions to this matter.
> Another workaround for this problem that I have tested and that also seems to get around this issue is to set the SRC_URI with := or ?=
>
> This is why I consider it to be a race condition during parsing and the git ls-remote check.

Could you please share the _full_ error output, and the recipe that is
causing it? Feel free to change confidential things to placeholders, but
the more parts would be available, the better it would be.


>
> Tony
>
> -----Original Message-----
> From: Tony Rex
> Sent: Thursday, 21 August 2025 17:48
> To: Gyorgy Sarvari <skandigraun@gmail.com>; Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
>
> I'm not sure how to run your (Gyorgy) code inside a recipe to test it, but in a bash script it works, of course.
>
> The thing that I'm looking at now is  a bit confusing, when commenting out the fetcher_hashes_dummyfunc function from the base.bbclass it seems to work properly.
>
> I don't know what the real purpose of this function is, am I missing something here, like a certain setup or a corner case?
> It seems to work both on whinlatter and scarthgap. Can someone please help out and clarify.
>
> git diff classes-global/base.bbclass
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index 6c08870571..83f82b2a4d 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -128,16 +128,16 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>
>  # We can't use vardepvalue against do_fetch directly since that would overwrite  # the other task dependencies so we use an indirect function.
> -python fetcher_hashes_dummyfunc() {
> -    return
> -}
> -fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
> +#python fetcher_hashes_dummyfunc() {
> +#    return
> +#}
> +#fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
>
>  addtask fetch
>  do_fetch[dirs] = "${DL_DIR}"
>  do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
>  do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
> -do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
> +#do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
>  do_fetch[network] = "1"
>  python base_do_fetch() {
>
> Tony
>
> -----Original Message-----
> From: Gyorgy Sarvari <skandigraun@gmail.com>
> Sent: Thursday, 21 August 2025 09:30
> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
>
> On 8/21/25 09:10, Tony Rex wrote:
>> Yes, I get the same or similar error if the patch is not applied.
>>
>> ERROR: ExpansionError during parsing .../generic-if.bb################################   | ETA:  0:00:00
>> bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Unable to resolve '${TAGNAME}-1.0' in upstream git repository in git ls-remote output for gerrit...
>> The variable dependency chain for the failure is:
>> fetcher_hashes_dummyfunc[vardepvalue]
>>
>> ERROR: Parsing halted due to errors, see error messages above
>>
>> How does your mytest_get.bb look like? Since I have had problem with reproducing the error on in a common setup maybe it can be done with your bb file.
>>
>> Tony
> The failure I reproduced is not recipe dependent. As some diagnostic test, try this script a few times with your failing git repo (change the repo placeholder):
>
> for i in `seq 50`; do
>   git clone $GIT_REPO_URL target_folder
>   git -C ./target_folder ls-remote
>   if [ $? -ne 0 ]; then
>     echo ls-remote failed, iteration: $i
>     break
>   fi
>   rm -rf ./target_folder
> done
>
> If I haven't made a typo, the script should clone your repo, do an ls-remote inside it, delete the folder, and do the same again.
>
> If your problem is the same that I reproduced, then I would expect the above script to fail sometimes - if it does, then the problem is with the infrastructure (network, remote git server, etc... something is flaky).
>
> Just for the record: the script generates a small amount of successive requests which some network admins might consider flooding.
>
>
>
>> -----Original Message-----
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: Wednesday, 20 August 2025 18:12
>> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin
>> <alex.kanavin@gmail.com>
>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>> parsing race issue
>>
>> [You don't often get email from skandigraun@gmail.com. Learn why this
>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 8/20/25 17:44, Gyorgy Sarvari via lists.openembedded.org wrote:
>>> On 8/20/25 13:53, Tony Rex wrote:
>>>> It was introduced by this commit:
>>>> https://git/
>>>> .yoctoproject.org%2Fpoky%2Fcommit%2F%3Fid%3Debfa1700f41b3411aec04014
>>>> 4
>>>> 605166c35b8dd14&data=05%7C02%7Ctony.rex%40ericsson.com%7C7b5c099d170
>>>> 0
>>>> 43080cca08dde004478d%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63
>>>> 8
>>>> 913031194171335%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi
>>>> O
>>>> iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%
>>>> 7
>>>> C%7C%7C&sdata=iYvLGK1DwJk78tEvmL%2FPOL2olj7iNL87eXqdsEraxLw%3D&reser
>>>> v
>>>> ed=0
>>>>
>>>> Maybe "not allowed" is a strong wording, but that was how I interpreted it. Sorry, my bad if I misinterpreted it.
>>> In my understanding (which could be wrong), this is more to avoid
>>> working on a repository, where the exact work-revision can't be
>>> determined. But in your example, it can be determined, if your patch
>>> is not applied.
>>>
>>> Some extra ramblings, which may or may not be unadulterated garbage
>>> from
>>> me: Your initial commit message mentioned an expansion error. I
>>> looked into that a bit, and is it possible that the repository that
>>> is causing this issue has some access rate limit? The only thing that
>>> can fail sometimes in that code path seems to be "git ls-remote".
>>>
>>> Now, when I noticed this, I compiled a git version for myself that
>>> randomly throws an error with "git ls-remote" command, and when I
>>> used it with bitbake, I got this:
>>>
>>> ERROR: ExpansionError during parsing
>>> /home/meee/stuff/ptest-images/poky/meta/recipes-core/ell/mytest_get.b
>>> b
>>> bb.data_smart.ExpansionError: Failure expanding variable
>>> fetcher_hashes_dummyfunc[vardepvalue], expression was <etc etc etc>
>>>
>>> Is this the same error you got?
>> Sorry for the spam, one thing I forgot - the error on my end also contains details about the command that failed, pointing to git. If it's not the same as you get, do you have a copy of the full bitbake output you get when you see this error?
>>
>>>> Tony
>>>>
>>>> -----Original Message-----
>>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>> Sent: Wednesday, 20 August 2025 12:18
>>>> To: Tony Rex <tony.rex@ericsson.com>; Alexander Kanavin
>>>> <alex.kanavin@gmail.com>
>>>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>>>> openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>>> parsing race issue
>>>>
>>>> [You don't often get email from skandigraun@gmail.com. Learn why
>>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> On 8/19/25 23:10, Tony Rex via lists.openembedded.org wrote:
>>>>> Hi Alex and Mathieu!
>>>>>
>>>>> Ok, so the patch fixes a bug and then the floating tag/branch function is in place again.
>>>>> The floating tag/branch function is broken due to the bug and the patch fixes it.
>>>>>
>>>>> The mail from Mathieu below might not fully reflect the issue here, since it seems to create a recipe with the help of devtool.
>>>>>
>>>>> To verify:
>>>>> 1. add layers/oe-core/meta-selftest to conf/bblayers.conf 2. run
>>>>> bitbake gitrepotest -c fetch
>>>>> result:
>>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
>>>>> 3. run bitbake gitrepotest -c cleanall 4. edit
>>>>> ../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotes
>>>>> t
>>>>> .b
>>>>> b
>>>>> add tag=2.12 in SRC_URI
>>>>> SRC_URI =
>>>>> "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;tag=
>>>>> 2
>>>>> .1 2;protocol=https \ and comment out SRCREV #SRCREV =
>>>>> "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
>>>>> 5. run bitbake gitrepotest -c fetch
>>>>> result:
>>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
>>>>> The fetch goes through although this is not allowed according to the floating tag/branch error statement if not d.getVar("__BBSRCREV_SEEN"): in git.py.
>>>> Could you point to a commit/email/etc about this "no floating tags
>>>> allowed" statement? AFAIK tags without specifying revision is
>>>> allowed and supported. Not recommended, due to mandatory network
>>>> access, and because git tags are not immutable, but I'm surprised to
>>>> hear that they are not supposed to work (which of course can also
>>>> mean that I just missed a memo)
>>>>
>>>>> 6. run bitbake gitrepotest -c cleanall 7. apply patch
>>>>> 0001-base.bbclass-Fix-the-recipe-parsing-race-issue.patch
>>>>> 8. run bitbake gitrepotest -c fetch
>>>>> result:
>>>>> ERROR: gitrepotest-1.0-r0 do_fetch: Bitbake Fetcher Error:
>>>>> FetchError("Recipe uses a floating tag/branch '2.12' for repo
>>>>> 'git.yoctoproject.org/git/matchbox-panel-2' without a fixed SRCREV
>>>>> yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).",
>>>>> None)
>>>>> ERROR: Logfile of failure stored in:
>>>>> .../build/tmp-glibc/work/cortexa53-wrs-linux/gitrepotest/1.0/temp/log.
>>>>> do_fetch.1254999
>>>>> ERROR: Task (.../layers/oe-core/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb:do_fetch) failed with exit code '1'
>>>>> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
>>>>>
>>>>> Error is the expected result when only having a tag set.
>>>>>
>>>>> Tony
>>>>>
>>>>> -----Original Message-----
>>>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>> Sent: Tuesday, 19 August 2025 10:53
>>>>> To: Tony Rex <tony.rex@ericsson.com>
>>>>> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;
>>>>> openembedded-core@lists.openembedded.org
>>>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>>>> parsing race issue
>>>>>
>>>>> [You don't often get email from alex.kanavin@gmail.com. Learn why
>>>>> this is important at https://aka.ms/LearnAboutSenderIdentification
>>>>> ]
>>>>>
>>>>> You need to make things a little bit easier for maintainers and try to save their time.
>>>>>
>>>>> I would suggest that you provide clear steps to observe the issue.
>>>>> Attach the recipe file that would demonstrate the issue, and provide clear steps to trigger it. What is confusing right now is that you say here's a recipe that builds ok, but then you 'apply the patch' and then there's some kind of failure. So which patch needs to be applied?
>>>>>
>>>>> Alex
>>>>>
>>>>> On Fri, 15 Aug 2025 at 17:29, Tony Rex via lists.openembedded.org <tony.rex=ericsson.com@lists.openembedded.org> wrote:
>>>>>> Hi Mathieu!
>>>>>>
>>>>>> I think that this is how it is intended to work, bitbake does not allow floating tag/branch anymore.
>>>>>> Please correct me if I'm wrong @Richard Purdie (who implemented
>>>>>> this for security reasons I think.)
>>>>>>
>>>>>> The patch that I have makes sure that the parsing and setting of
>>>>>> the variables in the recipe are done before executing the do_fetch command, and as a side effect the floating tag/branch protection is working as intended again.
>>>>>>
>>>>>> How does the recipe look like?
>>>>>> devtool add kernel-module-hello-world https://git/.
>>>>>> yoctoproject.org%2Fgit%2Fkernel-module-hello-world&data=05%7C02%7C
>>>>>> t
>>>>>> on
>>>>>> y
>>>>>> .rex%40ericsson.com%7Cde1ae2aceeda470b381608dddefdd730%7C92e84cebf
>>>>>> b
>>>>>> fd
>>>>>> 4
>>>>>> 7abbe52080c6b87953f%7C0%7C0%7C638911904005151487%7CUnknown%7CTWFpb
>>>>>> G
>>>>>> Zs
>>>>>> b
>>>>>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
>>>>>> O
>>>>>> Ij
>>>>>> o
>>>>>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=jyCicRQT%2FLtb1YxiFHK
>>>>>> g
>>>>>> w5
>>>>>> B
>>>>>> nNktN4t9IciiyxtsEwO4%3D&reserved=0
>>>>>> The one I get looks like this:
>>>>>>
>>>>>> cat
>>>>>> build/workspace/recipes/kernel-module-hello-world/kernel-module-he
>>>>>> l
>>>>>> lo
>>>>>> -
>>>>>> world_git.bb
>>>>>> # Recipe created by recipetool
>>>>>> # This is the basis of a recipe and may need further editing in order to be fully functional.
>>>>>> # (Feel free to remove these comments when editing.)
>>>>>>
>>>>>> # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are
>>>>>> best guesses - it is # your responsibility to verify that the values are complete and correct.
>>>>>> #
>>>>>> # The following license files were not able to be identified and
>>>>>> are # represented as "Unknown" below, you will need to check them yourself:
>>>>>> #   LICENSE
>>>>>> LICENSE = "Unknown"
>>>>>> LIC_FILES_CHKSUM = "file://LICENSE;md5=7b785be6433a2e4af6a641cc7f0330d1"
>>>>>>
>>>>>> SRC_URI = "git://git.yoctoproject.org/git/kernel-module-hello-world;protocol=https;branch=master"
>>>>>>
>>>>>> # Modify these as desired
>>>>>> PV = "1.0+git"
>>>>>> SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>>>>>
>>>>>> S = "${WORKDIR}/git"
>>>>>>
>>>>>> inherit module
>>>>>>
>>>>>> EXTRA_OEMAKE:append:task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"
>>>>>> EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
>>>>>>
>>>>>> And it contains SRCREV = "b66f0f2bd559a1df81fc1bda240eba07a2ecdd2b"
>>>>>>
>>>>>> Tony
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>>>>>> Sent: Friday, 15 August 2025 11:26
>>>>>> To: Tony Rex <tony.rex@ericsson.com>;
>>>>>> openembedded-core@lists.openembedded.org
>>>>>> Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe
>>>>>> parsing race issue
>>>>>>
>>>>>> [You don't often get email from mathieu.dubois-briand@bootlin.com.
>>>>>> Learn why this is important at
>>>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>
>>>>>> On Thu Aug 14, 2025 at 7:23 PM CEST, Tony Rex via lists.openembedded.org wrote:
>>>>>>> It seems that the race condition happens when doing do_fetch on
>>>>>>> really small repos and it can be difficult to reproduce so below
>>>>>>> the other case with floating tag/branch that is easier to verify.
>>>>>>>
>>>>>>> To verify the floating tag/branch issue have s simple recipe
>>>>>>> hello_1.0.bb and set the SRC_URI to SRC_URI = "git://<repository>;protocol=https;user=${USER};branch=master;tag=v1.0"
>>>>>>>
>>>>>>> run command bitbake hello everything builds.
>>>>>>>
>>>>>>> Apply the patch
>>>>>>>
>>>>>>> run command bitbake hello
>>>>>>> ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error:
>>>>>>> FetchError("Recipe uses a floating tag/branch 'v1.0' for repo
>>>>>>> '<repository>' without a fixed SRCREV yet doesn't call
>>>>>>> bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>> hello/1.0/temp/log.do_fetch.3289932
>>>>>>> ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'
>>>>>>>
>>>>>>> Tony Rex (1):
>>>>>>>   base.bbclass: Fix the recipe parsing race issue
>>>>>>>
>>>>>>>  meta/classes-global/base.bbclass | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>> Hi Tony,
>>>>>>
>>>>>> Thanks for your patch.
>>>>>>
>>>>>> It looks like this is breaking some builds with the following error:
>>>>>>
>>>>>> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testsdkext/environment-setup-core2-64-poky-linux > /dev/null; devtool add kernel-module-hello-world https://git.yoctoproject.org/git/kernel-module-hello-world;' returned non-zero exit status 1.
>>>>>> ...
>>>>>> ERROR: Bitbake Fetcher Error: FetchError("Recipe uses a floating
>>>>>> tag/branch 'master' for repo
>>>>>> 'git.yoctoproject.org/git/kernel-module-hello-world' without a
>>>>>> fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in
>>>>>> PV for OE).", None)
>>>>>>
>>>>>> https://auto/
>>>>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F68%2Fbuilds
>>>>>> %
>>>>>> 2F
>>>>>> 2
>>>>>> 284&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b38160
>>>>>> 8
>>>>>> dd
>>>>>> d
>>>>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040052
>>>>>> 0
>>>>>> 90
>>>>>> 0
>>>>>> 3%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
>>>>>> M
>>>>>> CI
>>>>>> s
>>>>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
>>>>>> a
>>>>>> =m
>>>>>> P
>>>>>> UXMdb%2FYOyGIm0rnncaWgcqtwkUIh8364IP3eYDPe4%3D&reserved=0
>>>>>> https://auto/
>>>>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F30%2Fbuilds
>>>>>> %
>>>>>> 2F
>>>>>> 2
>>>>>> 199&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b38160
>>>>>> 8
>>>>>> dd
>>>>>> d
>>>>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040052
>>>>>> 2
>>>>>> 74
>>>>>> 3
>>>>>> 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
>>>>>> M
>>>>>> CI
>>>>>> s
>>>>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
>>>>>> a
>>>>>> =R
>>>>>> 0
>>>>>> HFameGl2LmIVMT9ml%2BDMnj%2FMbG6SW0%2F3yNZHQu2js%3D&reserved=0
>>>>>> https://auto/
>>>>>> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F16%2Fbuilds
>>>>>> %
>>>>>> 2F
>>>>>> 2
>>>>>> 247&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda470b38160
>>>>>> 8
>>>>>> dd
>>>>>> d
>>>>>> efdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C6389119040052
>>>>>> 4
>>>>>> 53
>>>>>> 8
>>>>>> 7%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
>>>>>> M
>>>>>> CI
>>>>>> s
>>>>>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
>>>>>> a
>>>>>> =N
>>>>>> S
>>>>>> FhEupwMkgqUAhpRgFbKnyFl%2FsY%2B4UJMhVQHhqOaNM%3D&reserved=0
>>>>>>
>>>>>> Can you have a look at this error please?
>>>>>>
>>>>>> Best regards,
>>>>>> Mathieu
>>>>>>
>>>>>> --
>>>>>> Mathieu Dubois-Briand, Bootlin
>>>>>> Embedded Linux and Kernel engineering https://boot/
>>>>>> lin.com%2F&data=05%7C02%7Ctony.rex%40ericsson.com%7Cde1ae2aceeda47
>>>>>> 0
>>>>>> b3
>>>>>> 8
>>>>>> 1608dddefdd730%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638911
>>>>>> 9
>>>>>> 04
>>>>>> 0
>>>>>> 05263327%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL
>>>>>> j
>>>>>> Au
>>>>>> M
>>>>>> DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
>>>>>> 7
>>>>>> C&
>>>>>> s
>>>>>> data=oyi7YWsXDVHn7QB4fDdG1sBp7gQsfGWcJTWtX1CjAw4%3D&reserved=0
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#222190):
>>> https://list/
>>> s.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F222190&data=05
>>> %
>>> 7C02%7Ctony.rex%40ericsson.com%7C7b5c099d170043080cca08dde004478d%7C9
>>> 2
>>> e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C638913031194226137%7CUnknown
>>> %
>>> 7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4
>>> z
>>> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=WbB87ExjlYOSm
>>> q
>>> I0%2BEee6LbpupPfWxzk0vNYlbCUP5g%3D&reserved=0
>>> Mute This Topic:
>>> https://list/
>>> s.openembedded.org%2Fmt%2F114706197%2F6084445&data=05%7C02%7Ctony.rex
>>> %
>>> 40ericsson.com%7C7b5c099d170043080cca08dde004478d%7C92e84cebfbfd47abb
>>> e
>>> 52080c6b87953f%7C0%7C0%7C638913031194241729%7CUnknown%7CTWFpbGZsb3d8e
>>> y
>>> JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
>>> p
>>> bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=bHfsli%2Fba3g8lov%2Bxmfovaal5
>>> C
>>> uBGuFnZVXs8AjHGIY%3D&reserved=0 Group Owner:
>>> openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:
>>> https://list/
>>> s.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=05%7C02%7Cton
>>> y
>>> .rex%40ericsson.com%7C7b5c099d170043080cca08dde004478d%7C92e84cebfbfd
>>> 4
>>> 7abbe52080c6b87953f%7C0%7C0%7C638913031194543958%7CUnknown%7CTWFpbGZs
>>> b
>>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>>> o
>>> iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=gy4aai6oflVendGBp8nbYAL8
>>> K
>>> CGj77ObOMy2rYDnGN0%3D&reserved=0 [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


