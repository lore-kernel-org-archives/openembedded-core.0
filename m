Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0195FC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 09:43:08 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.3277.1707730978650267599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 01:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=BjpGUMc+;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 06AC09C322F;
	Mon, 12 Feb 2024 04:42:57 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mcorxOdZS7FH; Mon, 12 Feb 2024 04:42:55 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C5D309C44F1;
	Mon, 12 Feb 2024 04:42:55 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C5D309C44F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707730975; bh=8PcAYURR0MVoay5Y1Pl9xNcQOC9BFsNHoB7QPfzqoO4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=BjpGUMc+EWuNokaDNeOZ8ewSj8KRWeUp5jersCRcEGnia4Bl//z1BB3zIWIbPAFVZ
	 q82LUcAbmEvhJilFADyfYaSxQORir9vZ21rn9VO+31SceUrdP9A1XTX04UX1Mxv3W6
	 KoExYYVM/FqN7llPvqtpJUW54y/leBRFPAtapkLSSQqJs0E8H3KWvWVpX9Tfz8/xfn
	 8ap/+GT7TpYfGH+qoO9LOhdJjwqVqMNNJnCORId26SZ9b1fALZyGhia3Pm7O4wTgEy
	 jWGbBLerMm4eWiyEVBDUuSiUttgOqs8Lq8rMMyrpxzES9FYYxVVMi4lTYYIy+tGHGd
	 wd5+Fj0phWBBg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4p0YbEcQ71To; Mon, 12 Feb 2024 04:42:55 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 24F639C322F;
	Mon, 12 Feb 2024 04:42:55 -0500 (EST)
Message-ID: <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
Date: Mon, 12 Feb 2024 10:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>,
 Mohammed Raza <mohammed.raza@savoirfairelinux.com>
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
 <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
Content-Language: en-US
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195305



On 11/02/2024 16:24, adrian.freihofer@gmail.com wrote:
> On Fri, 2024-02-09 at 23:43 +0000, Richard Purdie wrote:
>> On Fri, 2024-02-09 at 21:30 +0100, Adrian Freihofer wrote:
>>> There is a new official bitbake plugin:
>>> https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.y=
octo-bitbake
>>>
>>> This plugin automatically updates the .vscode/settings.json file.
>>>
>>> Having the settings.json file in git and a plugin which modifies
>>> this
>>> file is not ideal. It can lead to anoying situations especially
>>> when
>>> working with git. For example a git stash reverts the settings
>>> which are
>>> automatically applied by the plugin. While git stashed the
>>> settings.json
>>> file the plugin immediately changes the file again and tries to run
>>> bitbake based on the newly generated settings. When git does a
>>> stash pop
>>> the restored settings.json file conflicts with the new
>>> settigns.json
>>> file which has been generated while the git stash took place.
>>>
>>> Removing the settings.json from git would lead to other issues as
>>> already described in the commit message of 5ff688fe29. Until VSCode
>>> or
>>> the plugin supports multiple config files like bitbake does with
>>> the
>>> site.conf and the local.conf files, there are probably some use
>>> cases
>>> and workflows where the plugin needs to be disabled.
>>>
>>> This commit aligns the default settings.json file with the default
>>> settings.json which gets generated by the plugin. This is a
>>> workaround
>>> for the issue described above. But it works only for the default
>>> build
>>> configuration with one build folder named "build".
>>>
>>> Discussion is here:
>>> https://github.com/yoctoproject/vscode-bitbake/issues/95
>>> ---
>>>  =C2=A0.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++--
>>>  =C2=A0.vscode/settings.json | 28 +++++++++++++++++++++++++++-
>>>  =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
>>
>> I am very worried about this as we can't mandate a layout. There are
>> many people who use different locations for bitbake and others who
>> use
>> different directories for builds. Even our own test runs do change
>> the
>> build directories.
>>
>> I don't think we can solve this like this unfortunately.
>>
>> Can we inject something into build directories when we create them?
>>My opinion as a maintainer of the VSCode extension:

The extension's users have wildly varying setups for running bitbake.=20
They have divers sources and build directories layouts. They can open=20
each layer in a VSCode workspace separately, while other open a parent=20
directory with everything in it. Some users will use wrapper scripts=20
like kas, or custom crops docker containers. There is currently no=20
initiative to automatically provide initial configurations for the=20
extension for these reasons.

I'm not sure to understand the application of the poky/.vscode=20
configuration now. I used to see it as a way to quickly demo the VSCode=20
functionalities for poky developers or beginners who have just the poky=20
layer. The new patch which updated poky/.vscode was properly doing that=20
IMO. A new user who downloads poky to get started with Yocto will=20
directly get a .vscode to play around with the various machines and=20
recipes in poky.

The majority of users who are using multiple layers and all the various=20
configurations I mentioned will have to configure their own .vscode but=20
I don't think they will be mislead into using poky's example=20
configuration. From the user feedback we've had with the extension, I've=20
never heard of users opening poky as their workspace, since most of them=20
should not be editing poky in the first place.
>=20
> Here are some patches:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/vscode-yocto=
-plugin
>=20
> I will send them as V2 after I have tested them some more. (There are
> already oe-selftest)
>=20
> @Enguerrand your review would be appreciated.
>=20
> Regards,
> Adrian
>=20
>> Cheers,
>>
>> Richard
>=20

Thanks!
Enguerrand de Ribaucourt

