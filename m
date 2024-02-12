Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7B0C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:58:40 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.11693.1707757110321942065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 08:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=XKLKux+z;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id ED0219C44A2;
	Mon, 12 Feb 2024 11:58:28 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id tHjD2m56MJFZ; Mon, 12 Feb 2024 11:58:27 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 02DEC9C44B0;
	Mon, 12 Feb 2024 11:58:27 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 02DEC9C44B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707757107; bh=HvUpw7jl5wwZtD317tGRgsaOQIcgLZ7cXJDvpS++tzQ=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=XKLKux+zHFhq7gZm+sazHM+bQF14hpZpiWK95lD8h8WXGKVDYaTax/RDimMaQcddt
	 U7ROBhvBoQtaMRQCfHZzVrn0Pn+QfzRMT8Fy/nxb3jE9D/muI649Rt9hyZWFnai/2R
	 pbH3lcJ6hPq0kGPKpwhynVFsXNdg324LkE3E2uCgNnjAE/eIlZsC9jzwYh/bF+dK23
	 jj0iGpvQjrWhVx9zzi7oqp97EVXo4YBdaJaYT+GdzoAVP7RvL1dDJ/ZR7ATOtBX1UM
	 /DSbxuih4eeLC6ewBqt/mvfIa4l8JL6HWiciJDL0Iv4K9/acsI6UAfHHxDnXPdTana
	 y50tzrNFTNUAQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id xaOhZ7JkRnUT; Mon, 12 Feb 2024 11:58:26 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8DD709C44A2;
	Mon, 12 Feb 2024 11:58:26 -0500 (EST)
Message-ID: <62436f79-ff09-4084-8e94-55e055198b6a@savoirfairelinux.com>
Date: Mon, 12 Feb 2024 17:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
Content-Language: en-US
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
 <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
 <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
 <8ed89336017da50392be926a152a10901c8ceea7.camel@gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <8ed89336017da50392be926a152a10901c8ceea7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 16:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195346


On 12/02/2024 16:48, adrian.freihofer@gmail.com wrote:
> Hi Enguerrand
>>
>> The extension's users have wildly varying setups for running bitbake.
>> They have divers sources and build directories layouts. They can open
>> each layer in a VSCode workspace separately, while other open a
>> parent
>> directory with everything in it. Some users will use wrapper scripts
>> like kas, or custom crops docker containers. There is currently no
>> initiative to automatically provide initial configurations for the
>> extension for these reasons.
> 
> But all users who have the build folder in the scope of VSCode have the
> same need for a settings.json that prevents VSCode from indexing the
> build folder and configures the yocto-bitbake plugin correctly.
> 
>>
>> I'm not sure to understand the application of the poky/.vscode
>> configuration now. I used to see it as a way to quickly demo the
>> VSCode
>> functionalities for poky developers or beginners who have just the
>> poky
>> layer. The new patch which updated poky/.vscode was properly doing
>> that
>> IMO. A new user who downloads poky to get started with Yocto will
>> directly get a .vscode to play around with the various machines and
>> recipes in poky.
> 
> Since the plugin changes the settings.json file, the settings.json file
> cannot be in Git. The problem starts at the latest when working with
> git. git and VSCode fight against each other in a very problematic way.
> I was not able to solve this while the plugin was still active.
The plugin does modify .vscode/settings.json but it tries to use 
relative paths and settings that can be versioned. It should put back 
the file as it was once it's done. I haven't produced a workflow on my 
end that led to git conflicts or errors when commiting or rebasing. If 
you happen to know a reproducible workflow that does produce such 
errors, I'd be very interested in trying to fix them!

Untill then I currently don't understand the limitation of versioning 
the new settings.json you proposed some days ago.
> 
>>
>> The majority of users who are using multiple layers and all the
>> various
>> configurations I mentioned will have to configure their own .vscode
>> but
>> I don't think they will be mislead into using poky's example
>> configuration.
> 
> The quick start guide from
> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#building-your-image
> recommends
>    git clone git://git.yoctoproject.org/poky
>    cd poky
>    source oe-init-build-env
> 
> I think just starting code like "code ." from poky or "code .." from
> the build folder is the next logical step which should just work. The
> Yocto/OE reference setup should also be the reference setup for the
> Yocto-bitbake plugin.
Before discussing what the VSCode quick start should be, here's a 
summary the current one:

The documentation for setting up the extension is hosted on it's 
marketplace frontpage. It explains how to point to an oe-init-build-env 
script, and how to prevent CPU overload by excluding the build folder. 
There are now links to it across the Yocto reference manuals in several 
places, next to Crops and Toaster: 
https://github.com/yoctoproject/vscode-bitbake/blob/staging/client/README.md#configuration

Currently the poky quick start guide is IDE agnostic. Users using VSCode 
will stumble upon the link across the Yocto docs, which provides the 
configuration guide. If they install the plugin directly, they'll also 
be prompted with the configuration guide several times. There's 
currently no mention of the poky/.vscode example configuration and we 
rely on the extension's documentation.

Similarly, the plugin guide is agnostic to the repositories setup tool 
(repo, kas, git submodules, oe-layer-setup), and build environments 
(oe-init-build-env, kas, crops, cqfd). We support all of them, the 
documentation explains how to align with them, but none is official or 
has automated setup tools.

 From what I understand, your script extends the previous setup for the 
specific case of `git clone poky` + `oe-init-build-env`. Currently this 
poky quick start, and associated config is not documented and assumes 
the user guesses where to open VSCode on their own.

The larger underlying question is, do we need to improve the quick start 
experience for VSCode users? Should we integrate the example poky VSCode 
configuration in the current documentation flow? Should VSCode be a 
reference IDE in the poky quick start guide?
> 
> 
>>  From the user feedback we've had with the extension, I've
>> never heard of users opening poky as their workspace, since most of
>> them should not be editing poky in the first place.
> 
> All users who work on poky itself need to modify poky. I think
> developing Yocto/OE is a viable use case for Yocto/OE.
> 
> But also all the other uses cases I'm aware of use one VSCode instance
> to edit or browse all the layers in a very similar way like the quick
> start suggest that.
> 
> 
> 
> Anyway, having the settings.json in git does no longer work. Otherwise
> working with git in a layer directory is impossible.
> But leaving the user without any kind of configuration leads to a user
> experience like this:
> 
>    git clone git://git.yoctoproject.org/poky
>    cd poky
>    source oe-init-build-env
>    bitbake core-image-minimal
>    cd ..
>    code .
> 
> - VSCode starts indexing the build folder at full CPU speed until an
> OOM occurs.
> - The default configuration uses the wrong build folder and other
> invalid settings. The plugin is not usable without configuring many
> details.
Yes it's not ideal that when opening a plain poky, the default 
configuration won't be compatible out of the box. However changing it 
now would break users' configs which rely on it. It can be done though, 
with a warning of some sort if necessary for old users.

We could also automatically add settings.json lines to ignore the build 
folders for CPU overload from the plugin. But I'm not sure editing 
settings.json more than we absolutely need is a good idea?

We'd also really like to have configuration snippets like you mentionned 
and stop touching settings.json. But the VSCode team has still not 
prioritized this in years.
> 
> With my patches all the issues would be addressed. The plugin just
> starts showing its real potential with the default configuration.
> 
> It also works for more complicated setups. I'm using it for example
> with these lines in a oe-init-build-env from a custom layer:
> 
> ...
> if command -v code > /dev/null; then
>      OEINITDIR=$(dirname "$THIS_SCRIPT")
>      OEINITDIR=$(readlink -f "$OEINITDIR")
>      OEINITDIR="$OEINITDIR" \
>      VSCODE_EXCLUDE_DIRS="**/a-big-folder/**" \
>      "$OEROOT"/scripts/contrib/oe-init-build-vscode.py || {
>          unset OEROOT
>          return 1
>      }
> fi
> ...
What I like with your new script is that it produces a seamless 
equivalent to the previous static config. If the static config cannot be 
versioned (I still didn't understand why), then yes, creating the file 
seems like the way to go. However, I have a few concerns with the 
current implementation:
  1. If the user has different settings, they may be corrupted by the 
script when running oe-init-build-env. My suggestion would be to not 
generate anything if a settings.json is already present.
  2. Would just having the static file somewhere and simply copying it 
work rather than assembling it? What other dynamic configurations are 
addressed with your script?

I'm not sure I understand what kind of users and workflows are targeted 
by this script and how it connects with the documentation guiding flows. 
Should we rather edit the plugin's guide example configurations for poky?
> 
> 
> Thank you and best regards,
> Adrian
> 
> 
>>>
>>> Here are some patches:
>>> https://git.yoctoproject.org/poky-contrib/log/?h=adrianf/vscode-yocto-plugin
>>>
>>> I will send them as V2 after I have tested them some more. (There
>>> are
>>> already oe-selftest)
>>>
>>> @Enguerrand your review would be appreciated.
>>>
>>> Regards,
>>> Adrian
>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>
>>
>> Thanks!
>> Enguerrand de Ribaucourt
> 

Best regards,
Enguerrand de Ribaucourt

