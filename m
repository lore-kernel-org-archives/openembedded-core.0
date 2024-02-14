Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08044C48BEB
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 09:24:11 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.38145.1707902645990380973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 01:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=W0jJmGil;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DA9849C4607;
	Wed, 14 Feb 2024 04:24:04 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id REdr1pIKzPWf; Wed, 14 Feb 2024 04:24:03 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 086DC9C45C6;
	Wed, 14 Feb 2024 04:24:03 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 086DC9C45C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707902643; bh=LXi4GpDU34/UgKkzoA+lLTTvvhuYi9cWd3QtYcK0+D0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=W0jJmGilbJWdtIMmciMnRvPjKGGo7oYKMFugmjDdSNNklOVfLgRjlzeiyBRTUV/gx
	 jG4fPR0Tr9UIms3QLuJULf0f4KoCqHjULvxkke7Gow0+B5c9zSy5s3ABT0HD/upbg1
	 /OelhXo3s0xUOX4l2Sp0Eq0fQCxbhQl6N/Wu9MvJ4hV3qVu4TPNKsRPN79Rese5Uwc
	 FYKltWa9mSg6KDU5pvEPYjTAN/LxGljIqscse7FZuf1LLIW+ca9p1i6qDKc5TX2UeQ
	 xWkUNvJRK12jm1g7oo8JLkuVodnjI6l3nkaIArCE/NKzT5Ja5S6yWu8judaEhBnTYW
	 DsR/+qsir6MLg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id gjl1VWxyhBRd; Wed, 14 Feb 2024 04:24:02 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5032D9C45A3;
	Wed, 14 Feb 2024 04:24:02 -0500 (EST)
Message-ID: <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
Date: Wed, 14 Feb 2024 10:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VS Code plugin and multiple build directories
Content-Language: en-US
To: adrian.freihofer@gmail.com,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195456

Hi Adrian,

On 13/02/2024 21:52, adrian.freihofer@gmail.com wrote:
> On Tue, 2024-02-13 at 16:27 +0100, Enguerrand de Ribaucourt wrote:
>> Thanks for your feedback!
>>> I normally do not use VS Code, but I actually had a reason to do so
>>> the
>>> other day. After having installed the new bitbake plugin, I noticed
>>> two
>>> things related to the settings. One is the odd defaults where I
>>> would
>>> have expected something that matches the default Poky configuration
>>> (which I guess is part of Adrian's changes). The other is that the
>> Adrian's change will indeed produce better defaults for poky.
>>
>> We could consider changing the extension's defaults if they really
>> don't
>> work for most users. It currently assumes poky is in `sources/poky`.
>> Cloning just poky would result in just `.`. While multi layered
>> projects
>> will often put it in `poky` or `sources/poky`. I'd rather wait for an
>> official oe-layer-setup like tool and structure to be wildly used and
>> align with it rather than guessing the default configuration another
>> way. Changing the default will break some users configs, so I'm also
>> being conservative.
>>
>> I'm really open to suggestions on this.
> 
> If the oe-init-build-env script generates a configuration for VSCode
> and for the yocto-bitbake plugin, this should be solved for all
> possible configurations I can think of.
Great!
> 
> Changing the default configuration can then be considered unnecessary.
> Whatever the default configuration will look like, it will not fit for
> many use cases.
> But interestingly, we have the exact same configuration as Peter. But I
> have not seen a setup with sources/poky so far.
> 
>>> plugin seems to make a hard assumption that you only have a single
>>> build
>>> directory within a workspace. In our case we typically setup the
>>> environment with one build directory per machine and/or use case,
>>> e.g.,
>>> rather than a `build` directory, I have `builds/foo`, `builds/bar`
>>> and
>>> `builds/bar-selftest`. And while I of course can configure the
>>> plugin to
>>> use one of the build directories, in a typical session I regularly
>>> switch
>>> between the build directories depending on what I am doing at the
>>> moment
>>> and it seems awkward to have to have one VS Code configuration per
>>> build
>>> directory when the source files are the same in all cases. Now, I
>>> am a
>>> total VS Code novice so maybe there are better ways to do it, but
>>> for
>>> now I just configured the plugin to create its own build directory
>>> in
>>> `.VS Code/build` and forgot about it.
> 
> Also this is exactly what we do as well.
> 
>>>
>>> I have no idea what is possible to do with a VS Code extension, but
>>> would
>>> it be possible to make the plugin support multiple build
>>> directories for
>>> one workspace, e.g., by allowing multiple build directories and/or
>>> patterns to be specified? I.e., in our case I would like to be able
>>> to
>>> configure the build directories as `${workspaceFolder}/builds/*`
>>> and
>>> then choose which is currently active from with the VS Code UI.Yes
>>> currently, the extension only manages one build directory and
>> machine/distro config. This is a feature that has been requested
>> quite
>> often. My plan would be to rely on Yocto's multiconfigs since it is
>> the
>> official tool to manage multiple configurations. I prefer
>> multiconfigs
>> rather than an array of bitbake settings.json and different build
>> directories (like you describe). We'd add a picker in the bottom
>> status
>> bar to select the configuration and prefix all bitbake commands with
>> the
>> appropriate "mc:" config.
> 
> These are different things:
> * We use different build folders for different, independent targets.
There already have been some discussions on the need for building 
multiple targets (machines, distros) from the same sources with the 
extension. Most of the time multi-configs have been suggested to me. 
They are indeed made exactly for multiple targets. The documentation for 
multi configs is all about it:

https://docs.yoctoproject.org/4.0.4/singleindex.html#building-images-for-multiple-targets-using-multiple-configurations

I may be mistaken, but from what I understand of your use case with 
multiple build folders, you can do the same thing with multi configs. It 
looks like a more idiomatic way of doing it.
> Typically we have one build folder per distro. Otherwise different
> variants of the same package will be built in the same TMPDIR. This
> can be confusing.
multiconfigs have to specify different TMPDIR.
> Different MACHINEs can share one TMPDIR. All build variants of a
> package should get their own tmp folder if the PACKAGE_ARCH is set
> correctly for all recipes. But of course, having a build folder per
> machine works as well.
> * mc: This is used to have multiple build configurations for one
> target. Multiconfigs are implemented with subfolders in one build
> folder because these configurations have dependencies on each other.
> The argument that multiple build folders are not supported in favor
> of multiconfigs is incomprehensible to me.
I'm considering mc over build folders for these reasons:
  1. They enable selecting different machine and distro build environments
  2. It encourages users to use multiconfigs which is the official tool 
for the job (correct me if I'm wrong).
  3. Users can benefit from the optimizations of multiconfigs compared 
to multiple build folders (shared caches, workspaces, ...)
  4. Some users rely on external configuration tools to use the 
extension (kas, custom scripts). They may not handle multiple build 
directories which is not an official workflow.
  5. Traditionally, VSCode extensions with multiple configurations rely 
on what the tool can do rather than different build directories (like 
vscode-cmake, vscode-cpptools, mesonbuild)
> 
> If the plugin is supposed to support what Yocto supports, it should
> support:
> * Different build folders. What Peter suggests with the * wildcard can
> work. Alternatively it could also look like this:
> 
> "bitbake.pathToBuildFolder": "${workspaceFolder}/build/foo"
> "bitbake.pathToBuildFolders": ["${workspaceFolder}/build/foo",
> "/var/build/bar"] >
> - pathToBuildFolder refers to the active build configuration (as of
> now).
> - Activating one of the configs from pathToBuildFolders should be
> simple and should change the pathToBuildFolder setting.
> * Multiconfigs should be automatically detected in the active build
> folder. The plugin should offer to build the top level configuration
> which depends on all the multiconfigs but also support to build only
> one of the multiconfigs.
My idea is to add a selector in the bottom right status bar with the 
list of auto-detected multiconfigs.
> * Switching the active build folder means reloading the bitbake
> environment by calling oe-init-build-env. Mutliconfigs should be
> buildable like recipes. The user can build one of them without
> reloading the bitbake environment >
> Thank you for sharing your thoughts.
> I will send the template patches ASAP.
Maybe this multiconfig proposal misses some part of your use case? 
Nonetheless, I think it fulfills the need for building multiple targets 
for most users.

Some users will need to migrate from multiple build folders to 
multiconfigs for handling multiple targets. That's to be expected since 
before multi configs, it was one of the logical solutions. For 
comparison, at Savoir-faire Linux we used another approach which we'll 
also need to migrate from. We passed different MACHINE/DISTRO through a 
custom env script when invoking bitbake and always used the same build dir.
> 
> Adrian
> 
> 
> 
>>>
>>> //Peter
>>>
>>>
>> Regards
>> Enguerrand de Ribaucourt
> Best Regards,
Enguerrand de Ribaucourt


