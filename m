Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171B2C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 07:10:21 +0000 (UTC)
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
 by mx.groups.io with SMTP id smtpd.web10.66661.1723533016581313035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 00:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=d9Zzf/IN;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=d9Zzf/IN;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.188, mailfrom: andrej.v@skyrain.eu)
Received: from [172.25.231.43] ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id dlfZsO9QFRhHFdlfZs4jxl; Tue, 13 Aug 2024 09:10:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1723533014; bh=plRGEAs8t1VRZtjih4We8Uz6kIUkubeAw1CAGtRO7e8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=d9Zzf/INVVGbtG/jtG+IYxgIj7t7QJDV9RHXvrMuOanTXZlEWcrsFzi+GKAWZcHp2
	 FCNCqztc5RlYdmmbIxm8u26XfF3EPmte4RyP3m+7tbQoBtrZ8qTF6+p517XwQoY1+t
	 87E08+soB8bIwanep55o8bAmxlYqqwsbDF29wQo+nI4il8Sajk+45IaDgLLKZS6LqR
	 CLffXrsu6q6b+XNgLqcn8FNk5ApfptRZmZeXalOMmImMWmMjOpYWmpsFxbdyyL3p21
	 aFWQfizXkH83QhPXkDfzUditstFXQoMLimK/MYs6D/UVM8LwhPnykGOKCLpWi3McL/
	 eVw8+M2fveLTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1723533014; bh=plRGEAs8t1VRZtjih4We8Uz6kIUkubeAw1CAGtRO7e8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=d9Zzf/INVVGbtG/jtG+IYxgIj7t7QJDV9RHXvrMuOanTXZlEWcrsFzi+GKAWZcHp2
	 FCNCqztc5RlYdmmbIxm8u26XfF3EPmte4RyP3m+7tbQoBtrZ8qTF6+p517XwQoY1+t
	 87E08+soB8bIwanep55o8bAmxlYqqwsbDF29wQo+nI4il8Sajk+45IaDgLLKZS6LqR
	 CLffXrsu6q6b+XNgLqcn8FNk5ApfptRZmZeXalOMmImMWmMjOpYWmpsFxbdyyL3p21
	 aFWQfizXkH83QhPXkDfzUditstFXQoMLimK/MYs6D/UVM8LwhPnykGOKCLpWi3McL/
	 eVw8+M2fveLTA==
Content-Type: multipart/alternative;
 boundary="------------Ks8DeWNoH2p10hqibqHgikJq"
Message-ID: <91fe4ff4-c7cb-483c-9279-ef487c9891ca@skyrain.eu>
Date: Tue, 13 Aug 2024 09:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [oe]printhello
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com
References: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
 <CANNYZj9v2KksePBij2yF64OX+yQCR6M+RGfcgqhS7AC5dfVXJw@mail.gmail.com>
 <d3b8c889-9cd2-4f8b-8f9b-c80f63ccabd6@skyrain.eu>
 <CANNYZj_1L9FFWzEsSV-Bi1GDO0ef3Y8XKb-oTB5VPD+vnfraHA@mail.gmail.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <CANNYZj_1L9FFWzEsSV-Bi1GDO0ef3Y8XKb-oTB5VPD+vnfraHA@mail.gmail.com>
X-CMAE-Envelope: MS4xfGHCWEKCUO7FRvxP1KjKu4NN/HrxHEz5gnuuCKku5zugF50GlbJDYVxvTGH5d/Hb11TfmLKKDkQXVQXPEy7JcqGoLliea5gzv7lHcn684VgOm74YH9Sw
 BoZ2H+qDbwttNLdSliH4bbOQgkhKImYKYe8nhoteRQK9shKfNnPGNrQWuWBg9ies5HCnAZWu+pYlqqTIWhWIl5x6Wqq7gHGudICW3MAaN12rF1ABDEfaPVB1
 ZazcnQ9FZ4EBXbt/kSmcI8T7KUH5Le9xIQMlId+HyOMboS/iBotj/V7X0lbtDdOP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 07:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203255

This is a multi-part message in MIME format.
--------------Ks8DeWNoH2p10hqibqHgikJq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Ah, ok, I wasn't sure, that the example is incompatible with core layer. 
After re-trying with pure bitbake it works fine.

Loading cache: 100% |                                           | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time: 0:00:00
Parsing of 1 .bb files complete (0 cached, 1 parsed). 1 targets, 0 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100% |#######################################| Time: 0:00:00
NOTE: No setscene tasks
NOTE: Executing Tasks
********************
*                  *
*  Hello, World!   *
*                  *
********************
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and all succeeded.


Basically I can use 
poky/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb as an 
example including poky layer, right?

Regards,
Andy

On 12.08.2024 10:38, Alexander Kanavin wrote:
> The example in bitbake manual assumes a pristine bitbake environment
> without poky or oe-core. When you pull in oe-core, it makes all sorts
> of changes, including making do_build non-executable.
>
> Alex
>
> On Mon, 12 Aug 2024 at 10:22, Andrej Valek<andrej.v@skyrain.eu>  wrote:
>> Hello Alex,
>>
>> Here is some more information...
>>
>> /home/projects/Yocto/poky/build/tmp/work/all-poky-linux/printhello/1/temp$
>> tree
>> .
>> ├── cve.json
>> ├── depsig.do_create_runtime_spdx -> depsig.do_create_runtime_spdx.60015
>> ├── depsig.do_create_runtime_spdx.60015
>> ├── depsig.do_create_spdx -> depsig.do_create_spdx.59805
>> ├── depsig.do_create_spdx.59805
>> ├── depsig.do_deploy_source_date_epoch ->
>> depsig.do_deploy_source_date_epoch.59329
>> ├── depsig.do_deploy_source_date_epoch.59329
>> ├── depsig.do_package -> depsig.do_package.59461
>> ├── depsig.do_package.59461
>> ├── depsig.do_packagedata -> depsig.do_packagedata.59740
>> ├── depsig.do_packagedata.59740
>> ├── depsig.do_package_qa -> depsig.do_package_qa.59807
>> ├── depsig.do_package_qa.59807
>> ├── depsig.do_package_write_rpm -> depsig.do_package_write_rpm.59806
>> ├── depsig.do_package_write_rpm.59806
>> ├── depsig.do_populate_lic -> depsig.do_populate_lic.59330
>> ├── depsig.do_populate_lic.59330
>> ├── depsig.do_populate_sysroot -> depsig.do_populate_sysroot.59462
>> ├── depsig.do_populate_sysroot.59462
>> ├── depsig.do_recipe_qa -> depsig.do_recipe_qa.59251
>> ├── depsig.do_recipe_qa.59251
>> ├── log.do_cleansstate -> log.do_cleansstate.59169
>> ├── log.do_cleansstate.59169
>> ├── log.do_collect_spdx_deps -> log.do_collect_spdx_deps.59311
>> ├── log.do_collect_spdx_deps.59311
>> ├── log.do_compile -> log.do_compile.59435
>> ├── log.do_compile.59435
>> ├── log.do_configure -> log.do_configure.59429
>> ├── log.do_configure.59429
>> ├── log.do_create_runtime_spdx -> log.do_create_runtime_spdx.60015
>> ├── log.do_create_runtime_spdx.60015
>> ├── log.do_create_spdx -> log.do_create_spdx.59805
>> ├── log.do_create_spdx.59805
>> ├── log.do_cve_check -> log.do_cve_check.59262
>> ├── log.do_cve_check.59262
>> ├── log.do_deploy_source_date_epoch -> log.do_deploy_source_date_epoch.59329
>> ├── log.do_deploy_source_date_epoch.59329
>> ├── log.do_fetch -> log.do_fetch.59299
>> ├── log.do_fetch.59299
>> ├── log.do_install -> log.do_install.59451
>> ├── log.do_install.59451
>> ├── log.do_package -> log.do_package.59461
>> ├── log.do_package.59461
>> ├── log.do_packagedata -> log.do_packagedata.59740
>> ├── log.do_packagedata.59740
>> ├── log.do_package_qa -> log.do_package_qa.59807
>> ├── log.do_package_qa.59807
>> ├── log.do_package_write_rpm -> log.do_package_write_rpm.59806
>> ├── log.do_package_write_rpm.59806
>> ├── log.do_patch -> log.do_patch.59309
>> ├── log.do_patch.59309
>> ├── log.do_populate_lic -> log.do_populate_lic.59330
>> ├── log.do_populate_lic.59330
>> ├── log.do_populate_sysroot -> log.do_populate_sysroot.59462
>> ├── log.do_populate_sysroot.59462
>> ├── log.do_prepare_recipe_sysroot -> log.do_prepare_recipe_sysroot.59303
>> ├── log.do_prepare_recipe_sysroot.59303
>> ├── log.do_recipe_qa -> log.do_recipe_qa.59251
>> ├── log.do_recipe_qa.59251
>> ├── log.do_unpack -> log.do_unpack.59302
>> ├── log.do_unpack.59302
>> ├── log.task_order
>> ├── run.base_do_fetch.59299
>> ├── run.base_do_unpack.59302
>> ├── run.BUILDSPEC.59806
>> ├── run.create_source_date_epoch_stamp.59302
>> ├── run.debian_package_name_hook.59461
>> ├── run.do_cleansstate -> run.do_cleansstate.59169
>> ├── run.do_cleansstate.59169
>> ├── run.do_collect_spdx_deps -> run.do_collect_spdx_deps.59311
>> ├── run.do_collect_spdx_deps.59311
>> ├── run.do_compile -> run.do_compile.59435
>> ├── run.do_compile.59435
>> ├── run.do_configure -> run.do_configure.59429
>> ├── run.do_configure.59429
>> ├── run.do_create_runtime_spdx -> run.do_create_runtime_spdx.60015
>> ├── run.do_create_runtime_spdx.60015
>> ├── run.do_create_spdx -> run.do_create_spdx.59805
>> ├── run.do_create_spdx.59805
>> ├── run.do_cve_check -> run.do_cve_check.59262
>> ├── run.do_cve_check.59262
>> ├── run.do_deploy_source_date_epoch -> run.do_deploy_source_date_epoch.59329
>> ├── run.do_deploy_source_date_epoch.59329
>> ├── run.do_fetch -> run.do_fetch.59299
>> ├── run.do_fetch.59299
>> ├── run.do_install -> run.do_install.59451
>> ├── run.do_install.59451
>> ├── run.do_package -> run.do_package.59461
>> ├── run.do_package.59461
>> ├── run.do_packagedata -> run.do_packagedata.59740
>> ├── run.do_packagedata.59740
>> ├── run.do_package_qa -> run.do_package_qa.59807
>> ├── run.do_package_qa.59807
>> ├── run.do_package_rpm.59806
>> ├── run.do_package_write_rpm -> run.do_package_write_rpm.59806
>> ├── run.do_package_write_rpm.59806
>> ├── run.do_patch -> run.do_patch.59309
>> ├── run.do_patch.59309
>> ├── run.do_populate_lic -> run.do_populate_lic.59330
>> ├── run.do_populate_lic.59330
>> ├── run.do_populate_sysroot -> run.do_populate_sysroot.59462
>> ├── run.do_populate_sysroot.59462
>> ├── run.do_prepare_recipe_sysroot -> run.do_prepare_recipe_sysroot.59303
>> ├── run.do_prepare_recipe_sysroot.59303
>> ├── run.do_qa_configure.59429
>> ├── run.do_qa_patch.59309
>> ├── run.do_qa_sysroot.59462
>> ├── run.do_qa_unpack.59302
>> ├── run.do_recipe_qa -> run.do_recipe_qa.59251
>> ├── run.do_recipe_qa.59251
>> ├── run.do_unpack -> run.do_unpack.59302
>> ├── run.do_unpack.59302
>> ├── run.emit_pkgdata.59461
>> ├── run.extend_recipe_sysroot.59303
>> ...
>> ├── run.package_convert_pr_autoinc.59461
>> ├── run.packagedata_translate_pr_autoinc.59740
>> ├── run.package_depchains.59461
>> ├── run.package_do_filedeps.59461
>> ├── run.package_do_pkgconfig.59461
>> ├── run.package_do_shlibs.59461
>> ├── run.package_do_split_locales.59461
>> ├── run.package_fixsymlinks.59461
>> ├── run.package_get_auto_pr.59740
>> ├── run.package_name_hook.59461
>> ├── run.package_prepare_pkgdata.59461
>> ├── run.package_setup_pkgv.59461
>> ├── run.package_setup_pkgv.59740
>> ├── run.patch_do_patch.59309
>> ├── run.perform_packagecopy.59461
>> ├── run.populate_lic_qa_checksum.59330
>> ├── run.populate_packages.59461
>> ├── run.read_shlibdeps.59461
>> ...
>> └── run.write_specfile.59806
>>
>> cat log.task_order
>> 20240812-101439.615459 do_cleansstate (59169): log.do_cleansstate.59169
>> 20240812-101445.329720 do_recipe_qa (59251): log.do_recipe_qa.59251
>> 20240812-101445.392736 do_cve_check (59262): log.do_cve_check.59262
>> 20240812-101445.432053 do_fetch (59299): log.do_fetch.59299
>> 20240812-101445.481892 do_unpack (59302): log.do_unpack.59302
>> 20240812-101445.482591 do_prepare_recipe_sysroot (59303):
>> log.do_prepare_recipe_sysroot.59303
>> 20240812-101445.537083 do_patch (59309): log.do_patch.59309
>> 20240812-101445.541476 do_collect_spdx_deps (59311):
>> log.do_collect_spdx_deps.59311
>> 20240812-101445.609294 do_deploy_source_date_epoch (59329):
>> log.do_deploy_source_date_epoch.59329
>> 20240812-101445.609743 do_populate_lic (59330): log.do_populate_lic.59330
>> 20240812-101445.739420 do_configure (59429): log.do_configure.59429
>> 20240812-101445.817208 do_compile (59435): log.do_compile.59435
>> 20240812-101446.131607 do_install (59451): log.do_install.59451
>> 20240812-101446.234228 do_populate_sysroot (59462):
>> log.do_populate_sysroot.59462
>> 20240812-101446.237527 do_package (59461): log.do_package.59461
>> 20240812-101446.696560 do_packagedata (59740): log.do_packagedata.59740
>> 20240812-101446.828025 do_create_spdx (59805): log.do_create_spdx.59805
>> 20240812-101446.834945 do_package_write_rpm (59806):
>> log.do_package_write_rpm.59806
>> 20240812-101446.836504 do_package_qa (59807): log.do_package_qa.59807
>> 20240812-101446.995964 do_create_runtime_spdx (60015):
>> log.do_create_runtime_spdx.60015
>>
>>
>> and grep -R "World" showed nothing... .
>>
>> Of course it will work after these changes:
>>
>> do_configure() {
>>     bbwarn "********************"
>>     bbwarn "*                  *"
>>     bbwarn "*  Hello, World!   *"
>>     bbwarn "*                  *"
>>     bbwarn "********************"
>> }
>>
>>
>> but I was expecting something like point 12. from
>> https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-hello.html#the-hello-world-example
>> :)
>>
>>
>> Regards,
>> Andy
>>
>> On 12.08.2024 09:51, Alexander Kanavin wrote:
>>> On Fri, 9 Aug 2024 at 08:41, Andrej Valek via lists.openembedded.org
>>> <andrej.v=skyrain.eu@lists.openembedded.org>  wrote:
>>>> Dear community!
>>>>
>>>> I know this could be a funny question, but I wanted to use the
>>>> "printhello" recipe as a basic example. But looks like, that is little
>>>> bit "out-of-date".
>>>>
>>>> I know, that I can crate a custom recipe, but I wanted to use something
>>>> "standard", so I took
>>>> poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and
>>>> created an "printhello.bb" out of it. I made some modifications to try
>>>> to make it working.
>>>>
>>>>     DESCRIPTION = "Prints Hello World"
>>>> +LICENSE = "CLOSED"
>>>>     PN = 'printhello'
>>>>     PV = '1'
>>>>
>>>> + inherit allarch
>>>>
>>>>     python do_build() {
>>>> -   bb.plain("********************");
>>>> -   bb.plain("*                  *");
>>>> -   bb.plain("*  Hello, World!   *");
>>>> -   bb.plain("*                  *");
>>>> -   bb.plain("********************");
>>>> +   bb.warn("********************");
>>>> +   bb.warn("*                  *");
>>>> +   bb.warn("*  Hello, World!   *");
>>>> +   bb.warn("*                  *");
>>>> +   bb.warn("********************");
>>>>     }
>>>>
>>>> +SSTATE_SKIP_CREATION = "1"
>>>>
>>>> Even if I made these modifications nothing has been printed in terminal.
>>>> So the question is how good is the example?
>>> You need to look into ${T} where the logs for the recipe tasks are. Is
>>> there anything noteworthy there?
>>>
>>> Alex
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#203203):https://lists.openembedded.org/g/openembedded-core/message/203203
>>> Mute This Topic:https://lists.openembedded.org/mt/107804007/3619876
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [andrej.v@skyrain.eu]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

--------------Ks8DeWNoH2p10hqibqHgikJq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi all,<br>
    <br>
    Ah, ok, I wasn't sure, that the example is incompatible with core
    layer. After re-trying with pure bitbake it works fine.<br>
    <br>
    <pre>Loading cache: 100% |                                           | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time: 0:00:00
Parsing of 1 .bb files complete (0 cached, 1 parsed). 1 targets, 0 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
Initialising tasks: 100% |#######################################| Time: 0:00:00
NOTE: No setscene tasks
NOTE: Executing Tasks
********************
*                  *
*  Hello, World!   *
*                  *
********************
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and all succeeded.</pre>
    <br>
    Basically I can use
    poky/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb as an
    example including poky layer, right?<br>
    <br>
    Regards,<br>
    Andy<br>
    <br>
    <div class="moz-cite-prefix">On 12.08.2024 10:38, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_1L9FFWzEsSV-Bi1GDO0ef3Y8XKb-oTB5VPD+vnfraHA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">The example in bitbake manual assumes a pristine bitbake environment
without poky or oe-core. When you pull in oe-core, it makes all sorts
of changes, including making do_build non-executable.

Alex

On Mon, 12 Aug 2024 at 10:22, Andrej Valek <a class="moz-txt-link-rfc2396E" href="mailto:andrej.v@skyrain.eu">&lt;andrej.v@skyrain.eu&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hello Alex,

Here is some more information...

/home/projects/Yocto/poky/build/tmp/work/all-poky-linux/printhello/1/temp$
tree
.
├── cve.json
├── depsig.do_create_runtime_spdx -&gt; depsig.do_create_runtime_spdx.60015
├── depsig.do_create_runtime_spdx.60015
├── depsig.do_create_spdx -&gt; depsig.do_create_spdx.59805
├── depsig.do_create_spdx.59805
├── depsig.do_deploy_source_date_epoch -&gt;
depsig.do_deploy_source_date_epoch.59329
├── depsig.do_deploy_source_date_epoch.59329
├── depsig.do_package -&gt; depsig.do_package.59461
├── depsig.do_package.59461
├── depsig.do_packagedata -&gt; depsig.do_packagedata.59740
├── depsig.do_packagedata.59740
├── depsig.do_package_qa -&gt; depsig.do_package_qa.59807
├── depsig.do_package_qa.59807
├── depsig.do_package_write_rpm -&gt; depsig.do_package_write_rpm.59806
├── depsig.do_package_write_rpm.59806
├── depsig.do_populate_lic -&gt; depsig.do_populate_lic.59330
├── depsig.do_populate_lic.59330
├── depsig.do_populate_sysroot -&gt; depsig.do_populate_sysroot.59462
├── depsig.do_populate_sysroot.59462
├── depsig.do_recipe_qa -&gt; depsig.do_recipe_qa.59251
├── depsig.do_recipe_qa.59251
├── log.do_cleansstate -&gt; log.do_cleansstate.59169
├── log.do_cleansstate.59169
├── log.do_collect_spdx_deps -&gt; log.do_collect_spdx_deps.59311
├── log.do_collect_spdx_deps.59311
├── log.do_compile -&gt; log.do_compile.59435
├── log.do_compile.59435
├── log.do_configure -&gt; log.do_configure.59429
├── log.do_configure.59429
├── log.do_create_runtime_spdx -&gt; log.do_create_runtime_spdx.60015
├── log.do_create_runtime_spdx.60015
├── log.do_create_spdx -&gt; log.do_create_spdx.59805
├── log.do_create_spdx.59805
├── log.do_cve_check -&gt; log.do_cve_check.59262
├── log.do_cve_check.59262
├── log.do_deploy_source_date_epoch -&gt; log.do_deploy_source_date_epoch.59329
├── log.do_deploy_source_date_epoch.59329
├── log.do_fetch -&gt; log.do_fetch.59299
├── log.do_fetch.59299
├── log.do_install -&gt; log.do_install.59451
├── log.do_install.59451
├── log.do_package -&gt; log.do_package.59461
├── log.do_package.59461
├── log.do_packagedata -&gt; log.do_packagedata.59740
├── log.do_packagedata.59740
├── log.do_package_qa -&gt; log.do_package_qa.59807
├── log.do_package_qa.59807
├── log.do_package_write_rpm -&gt; log.do_package_write_rpm.59806
├── log.do_package_write_rpm.59806
├── log.do_patch -&gt; log.do_patch.59309
├── log.do_patch.59309
├── log.do_populate_lic -&gt; log.do_populate_lic.59330
├── log.do_populate_lic.59330
├── log.do_populate_sysroot -&gt; log.do_populate_sysroot.59462
├── log.do_populate_sysroot.59462
├── log.do_prepare_recipe_sysroot -&gt; log.do_prepare_recipe_sysroot.59303
├── log.do_prepare_recipe_sysroot.59303
├── log.do_recipe_qa -&gt; log.do_recipe_qa.59251
├── log.do_recipe_qa.59251
├── log.do_unpack -&gt; log.do_unpack.59302
├── log.do_unpack.59302
├── log.task_order
├── run.base_do_fetch.59299
├── run.base_do_unpack.59302
├── run.BUILDSPEC.59806
├── run.create_source_date_epoch_stamp.59302
├── run.debian_package_name_hook.59461
├── run.do_cleansstate -&gt; run.do_cleansstate.59169
├── run.do_cleansstate.59169
├── run.do_collect_spdx_deps -&gt; run.do_collect_spdx_deps.59311
├── run.do_collect_spdx_deps.59311
├── run.do_compile -&gt; run.do_compile.59435
├── run.do_compile.59435
├── run.do_configure -&gt; run.do_configure.59429
├── run.do_configure.59429
├── run.do_create_runtime_spdx -&gt; run.do_create_runtime_spdx.60015
├── run.do_create_runtime_spdx.60015
├── run.do_create_spdx -&gt; run.do_create_spdx.59805
├── run.do_create_spdx.59805
├── run.do_cve_check -&gt; run.do_cve_check.59262
├── run.do_cve_check.59262
├── run.do_deploy_source_date_epoch -&gt; run.do_deploy_source_date_epoch.59329
├── run.do_deploy_source_date_epoch.59329
├── run.do_fetch -&gt; run.do_fetch.59299
├── run.do_fetch.59299
├── run.do_install -&gt; run.do_install.59451
├── run.do_install.59451
├── run.do_package -&gt; run.do_package.59461
├── run.do_package.59461
├── run.do_packagedata -&gt; run.do_packagedata.59740
├── run.do_packagedata.59740
├── run.do_package_qa -&gt; run.do_package_qa.59807
├── run.do_package_qa.59807
├── run.do_package_rpm.59806
├── run.do_package_write_rpm -&gt; run.do_package_write_rpm.59806
├── run.do_package_write_rpm.59806
├── run.do_patch -&gt; run.do_patch.59309
├── run.do_patch.59309
├── run.do_populate_lic -&gt; run.do_populate_lic.59330
├── run.do_populate_lic.59330
├── run.do_populate_sysroot -&gt; run.do_populate_sysroot.59462
├── run.do_populate_sysroot.59462
├── run.do_prepare_recipe_sysroot -&gt; run.do_prepare_recipe_sysroot.59303
├── run.do_prepare_recipe_sysroot.59303
├── run.do_qa_configure.59429
├── run.do_qa_patch.59309
├── run.do_qa_sysroot.59462
├── run.do_qa_unpack.59302
├── run.do_recipe_qa -&gt; run.do_recipe_qa.59251
├── run.do_recipe_qa.59251
├── run.do_unpack -&gt; run.do_unpack.59302
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
   bbwarn "*                  *"
   bbwarn "*  Hello, World!   *"
   bbwarn "*                  *"
   bbwarn "********************"
}


but I was expecting something like point 12. from
<a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-hello.html#the-hello-world-example">https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-hello.html#the-hello-world-example</a>
:)


Regards,
Andy

On 12.08.2024 09:51, Alexander Kanavin wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, 9 Aug 2024 at 08:41, Andrej Valek via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:andrej.v=skyrain.eu@lists.openembedded.org">&lt;andrej.v=skyrain.eu@lists.openembedded.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Dear community!

I know this could be a funny question, but I wanted to use the
"printhello" recipe as a basic example. But looks like, that is little
bit "out-of-date".

I know, that I can crate a custom recipe, but I wanted to use something
"standard", so I took
poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and
created an "printhello.bb" out of it. I made some modifications to try
to make it working.

   DESCRIPTION = "Prints Hello World"
+LICENSE = "CLOSED"
   PN = 'printhello'
   PV = '1'

+ inherit allarch

   python do_build() {
-   bb.plain("********************");
-   bb.plain("*                  *");
-   bb.plain("*  Hello, World!   *");
-   bb.plain("*                  *");
-   bb.plain("********************");
+   bb.warn("********************");
+   bb.warn("*                  *");
+   bb.warn("*  Hello, World!   *");
+   bb.warn("*                  *");
+   bb.warn("********************");
   }

+SSTATE_SKIP_CREATION = "1"

Even if I made these modifications nothing has been printed in terminal.
So the question is how good is the example?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">You need to look into ${T} where the logs for the recipe tasks are. Is
there anything noteworthy there?

Alex

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#203203): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/203203">https://lists.openembedded.org/g/openembedded-core/message/203203</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107804007/3619876">https://lists.openembedded.org/mt/107804007/3619876</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:andrej.v@skyrain.eu">andrej.v@skyrain.eu</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------Ks8DeWNoH2p10hqibqHgikJq--

