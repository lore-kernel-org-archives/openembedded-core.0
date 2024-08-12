Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A46C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:22:23 +0000 (UTC)
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
 by mx.groups.io with SMTP id smtpd.web11.41700.1723450940582894242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=DZnpZIFG;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=DZnpZIFG;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id dQJlsGSWA4k5vdQJmsuJVt; Mon, 12 Aug 2024 10:22:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1723450938; bh=7xIfsvDB88bcIfpr4qipDwE2Nwt/Gl/mcATkQ0+VneI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=DZnpZIFGb31zfZvkgMVCjjG5Door/A2Y7dhRmlkk67gaKwNv/9/N6AcXNdkpKDRIU
	 VR/1QTpwXxRjaPb0kmJE9kkrbMzwUTxAfzPF1ylxosTUx24FvWrIe9nFf3YErqFgeR
	 9VxruwdYa/6pDmzPj/wLBpu49A4gagCV1dKrDVXaO3kv9HlmlB24KgZEyUwKvkZ+rh
	 Jh/GlDHM3mszPL14bfeKmoZzk7RWZxKKP8dhKtd3lnTmz9x8hiFDXDfsPFK3TwSYxb
	 WExTd6/0uyRd+vJ8Gd0suNeJdfFOO7+YJjhQ5bz9j0z5En+iTUa4rkwQGjxP49DwKG
	 4FZn2o+Fx86wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1723450938; bh=7xIfsvDB88bcIfpr4qipDwE2Nwt/Gl/mcATkQ0+VneI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=DZnpZIFGb31zfZvkgMVCjjG5Door/A2Y7dhRmlkk67gaKwNv/9/N6AcXNdkpKDRIU
	 VR/1QTpwXxRjaPb0kmJE9kkrbMzwUTxAfzPF1ylxosTUx24FvWrIe9nFf3YErqFgeR
	 9VxruwdYa/6pDmzPj/wLBpu49A4gagCV1dKrDVXaO3kv9HlmlB24KgZEyUwKvkZ+rh
	 Jh/GlDHM3mszPL14bfeKmoZzk7RWZxKKP8dhKtd3lnTmz9x8hiFDXDfsPFK3TwSYxb
	 WExTd6/0uyRd+vJ8Gd0suNeJdfFOO7+YJjhQ5bz9j0z5En+iTUa4rkwQGjxP49DwKG
	 4FZn2o+Fx86wQ==
Message-ID: <d3b8c889-9cd2-4f8b-8f9b-c80f63ccabd6@skyrain.eu>
Date: Mon, 12 Aug 2024 10:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [oe]printhello
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
 <CANNYZj9v2KksePBij2yF64OX+yQCR6M+RGfcgqhS7AC5dfVXJw@mail.gmail.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <CANNYZj9v2KksePBij2yF64OX+yQCR6M+RGfcgqhS7AC5dfVXJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFmIRNmy1hTeF+UTuJRifD9leYgtUo6Bsczhd+soDxKnb3Fe83b4j4+G6D2oCyNLYtB9H2/f80u7cl6oSLUrX0a5kQojzMSnq7juiC9geo3L44+nUyQn
 RtZ7VZ4TnV3Qdk+DkI3tB5KsOiy6ZwRiiE4OR29ukh7Ndw3WzlGJK+b4GO81zgexY/enXadZF3fef3uTKFQYaoKxG3JZ6Xjz9tTwr5zylHq9zlSvipXWv46o
 pt+djpfftUyEIx+AlJE9zw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203208

Hello Alex,

Here is some more information...

/home/projects/Yocto/poky/build/tmp/work/all-poky-linux/printhello/1/temp$ 
tree
.
├── cve.json
├── depsig.do_create_runtime_spdx -> depsig.do_create_runtime_spdx.60015
├── depsig.do_create_runtime_spdx.60015
├── depsig.do_create_spdx -> depsig.do_create_spdx.59805
├── depsig.do_create_spdx.59805
├── depsig.do_deploy_source_date_epoch -> 
depsig.do_deploy_source_date_epoch.59329
├── depsig.do_deploy_source_date_epoch.59329
├── depsig.do_package -> depsig.do_package.59461
├── depsig.do_package.59461
├── depsig.do_packagedata -> depsig.do_packagedata.59740
├── depsig.do_packagedata.59740
├── depsig.do_package_qa -> depsig.do_package_qa.59807
├── depsig.do_package_qa.59807
├── depsig.do_package_write_rpm -> depsig.do_package_write_rpm.59806
├── depsig.do_package_write_rpm.59806
├── depsig.do_populate_lic -> depsig.do_populate_lic.59330
├── depsig.do_populate_lic.59330
├── depsig.do_populate_sysroot -> depsig.do_populate_sysroot.59462
├── depsig.do_populate_sysroot.59462
├── depsig.do_recipe_qa -> depsig.do_recipe_qa.59251
├── depsig.do_recipe_qa.59251
├── log.do_cleansstate -> log.do_cleansstate.59169
├── log.do_cleansstate.59169
├── log.do_collect_spdx_deps -> log.do_collect_spdx_deps.59311
├── log.do_collect_spdx_deps.59311
├── log.do_compile -> log.do_compile.59435
├── log.do_compile.59435
├── log.do_configure -> log.do_configure.59429
├── log.do_configure.59429
├── log.do_create_runtime_spdx -> log.do_create_runtime_spdx.60015
├── log.do_create_runtime_spdx.60015
├── log.do_create_spdx -> log.do_create_spdx.59805
├── log.do_create_spdx.59805
├── log.do_cve_check -> log.do_cve_check.59262
├── log.do_cve_check.59262
├── log.do_deploy_source_date_epoch -> log.do_deploy_source_date_epoch.59329
├── log.do_deploy_source_date_epoch.59329
├── log.do_fetch -> log.do_fetch.59299
├── log.do_fetch.59299
├── log.do_install -> log.do_install.59451
├── log.do_install.59451
├── log.do_package -> log.do_package.59461
├── log.do_package.59461
├── log.do_packagedata -> log.do_packagedata.59740
├── log.do_packagedata.59740
├── log.do_package_qa -> log.do_package_qa.59807
├── log.do_package_qa.59807
├── log.do_package_write_rpm -> log.do_package_write_rpm.59806
├── log.do_package_write_rpm.59806
├── log.do_patch -> log.do_patch.59309
├── log.do_patch.59309
├── log.do_populate_lic -> log.do_populate_lic.59330
├── log.do_populate_lic.59330
├── log.do_populate_sysroot -> log.do_populate_sysroot.59462
├── log.do_populate_sysroot.59462
├── log.do_prepare_recipe_sysroot -> log.do_prepare_recipe_sysroot.59303
├── log.do_prepare_recipe_sysroot.59303
├── log.do_recipe_qa -> log.do_recipe_qa.59251
├── log.do_recipe_qa.59251
├── log.do_unpack -> log.do_unpack.59302
├── log.do_unpack.59302
├── log.task_order
├── run.base_do_fetch.59299
├── run.base_do_unpack.59302
├── run.BUILDSPEC.59806
├── run.create_source_date_epoch_stamp.59302
├── run.debian_package_name_hook.59461
├── run.do_cleansstate -> run.do_cleansstate.59169
├── run.do_cleansstate.59169
├── run.do_collect_spdx_deps -> run.do_collect_spdx_deps.59311
├── run.do_collect_spdx_deps.59311
├── run.do_compile -> run.do_compile.59435
├── run.do_compile.59435
├── run.do_configure -> run.do_configure.59429
├── run.do_configure.59429
├── run.do_create_runtime_spdx -> run.do_create_runtime_spdx.60015
├── run.do_create_runtime_spdx.60015
├── run.do_create_spdx -> run.do_create_spdx.59805
├── run.do_create_spdx.59805
├── run.do_cve_check -> run.do_cve_check.59262
├── run.do_cve_check.59262
├── run.do_deploy_source_date_epoch -> run.do_deploy_source_date_epoch.59329
├── run.do_deploy_source_date_epoch.59329
├── run.do_fetch -> run.do_fetch.59299
├── run.do_fetch.59299
├── run.do_install -> run.do_install.59451
├── run.do_install.59451
├── run.do_package -> run.do_package.59461
├── run.do_package.59461
├── run.do_packagedata -> run.do_packagedata.59740
├── run.do_packagedata.59740
├── run.do_package_qa -> run.do_package_qa.59807
├── run.do_package_qa.59807
├── run.do_package_rpm.59806
├── run.do_package_write_rpm -> run.do_package_write_rpm.59806
├── run.do_package_write_rpm.59806
├── run.do_patch -> run.do_patch.59309
├── run.do_patch.59309
├── run.do_populate_lic -> run.do_populate_lic.59330
├── run.do_populate_lic.59330
├── run.do_populate_sysroot -> run.do_populate_sysroot.59462
├── run.do_populate_sysroot.59462
├── run.do_prepare_recipe_sysroot -> run.do_prepare_recipe_sysroot.59303
├── run.do_prepare_recipe_sysroot.59303
├── run.do_qa_configure.59429
├── run.do_qa_patch.59309
├── run.do_qa_sysroot.59462
├── run.do_qa_unpack.59302
├── run.do_recipe_qa -> run.do_recipe_qa.59251
├── run.do_recipe_qa.59251
├── run.do_unpack -> run.do_unpack.59302
├── run.do_unpack.59302
├── run.emit_pkgdata.59461
├── run.extend_recipe_sysroot.59303
...
├── run.package_convert_pr_autoinc.59461
├── run.packagedata_translate_pr_autoinc.59740
├── run.package_depchains.59461
├── run.package_do_filedeps.59461
├── run.package_do_pkgconfig.59461
├── run.package_do_shlibs.59461
├── run.package_do_split_locales.59461
├── run.package_fixsymlinks.59461
├── run.package_get_auto_pr.59740
├── run.package_name_hook.59461
├── run.package_prepare_pkgdata.59461
├── run.package_setup_pkgv.59461
├── run.package_setup_pkgv.59740
├── run.patch_do_patch.59309
├── run.perform_packagecopy.59461
├── run.populate_lic_qa_checksum.59330
├── run.populate_packages.59461
├── run.read_shlibdeps.59461
...
└── run.write_specfile.59806

cat log.task_order
20240812-101439.615459 do_cleansstate (59169): log.do_cleansstate.59169
20240812-101445.329720 do_recipe_qa (59251): log.do_recipe_qa.59251
20240812-101445.392736 do_cve_check (59262): log.do_cve_check.59262
20240812-101445.432053 do_fetch (59299): log.do_fetch.59299
20240812-101445.481892 do_unpack (59302): log.do_unpack.59302
20240812-101445.482591 do_prepare_recipe_sysroot (59303): 
log.do_prepare_recipe_sysroot.59303
20240812-101445.537083 do_patch (59309): log.do_patch.59309
20240812-101445.541476 do_collect_spdx_deps (59311): 
log.do_collect_spdx_deps.59311
20240812-101445.609294 do_deploy_source_date_epoch (59329): 
log.do_deploy_source_date_epoch.59329
20240812-101445.609743 do_populate_lic (59330): log.do_populate_lic.59330
20240812-101445.739420 do_configure (59429): log.do_configure.59429
20240812-101445.817208 do_compile (59435): log.do_compile.59435
20240812-101446.131607 do_install (59451): log.do_install.59451
20240812-101446.234228 do_populate_sysroot (59462): 
log.do_populate_sysroot.59462
20240812-101446.237527 do_package (59461): log.do_package.59461
20240812-101446.696560 do_packagedata (59740): log.do_packagedata.59740
20240812-101446.828025 do_create_spdx (59805): log.do_create_spdx.59805
20240812-101446.834945 do_package_write_rpm (59806): 
log.do_package_write_rpm.59806
20240812-101446.836504 do_package_qa (59807): log.do_package_qa.59807
20240812-101446.995964 do_create_runtime_spdx (60015): 
log.do_create_runtime_spdx.60015


and grep -R "World" showed nothing... .

Of course it will work after these changes:

do_configure() {
   bbwarn "********************"
   bbwarn "*                  *"
   bbwarn "*  Hello, World!   *"
   bbwarn "*                  *"
   bbwarn "********************"
}


but I was expecting something like point 12. from 
https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-hello.html#the-hello-world-example 
:)


Regards,
Andy

On 12.08.2024 09:51, Alexander Kanavin wrote:
> On Fri, 9 Aug 2024 at 08:41, Andrej Valek via lists.openembedded.org
> <andrej.v=skyrain.eu@lists.openembedded.org> wrote:
>> Dear community!
>>
>> I know this could be a funny question, but I wanted to use the
>> "printhello" recipe as a basic example. But looks like, that is little
>> bit "out-of-date".
>>
>> I know, that I can crate a custom recipe, but I wanted to use something
>> "standard", so I took
>> poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and
>> created an "printhello.bb" out of it. I made some modifications to try
>> to make it working.
>>
>>    DESCRIPTION = "Prints Hello World"
>> +LICENSE = "CLOSED"
>>    PN = 'printhello'
>>    PV = '1'
>>
>> + inherit allarch
>>
>>    python do_build() {
>> -   bb.plain("********************");
>> -   bb.plain("*                  *");
>> -   bb.plain("*  Hello, World!   *");
>> -   bb.plain("*                  *");
>> -   bb.plain("********************");
>> +   bb.warn("********************");
>> +   bb.warn("*                  *");
>> +   bb.warn("*  Hello, World!   *");
>> +   bb.warn("*                  *");
>> +   bb.warn("********************");
>>    }
>>
>> +SSTATE_SKIP_CREATION = "1"
>>
>> Even if I made these modifications nothing has been printed in terminal.
>> So the question is how good is the example?
> You need to look into ${T} where the logs for the recipe tasks are. Is
> there anything noteworthy there?
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203203): https://lists.openembedded.org/g/openembedded-core/message/203203
> Mute This Topic: https://lists.openembedded.org/mt/107804007/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


