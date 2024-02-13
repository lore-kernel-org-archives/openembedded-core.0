Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813DDC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 09:23:03 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.7939.1707816176433496847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 01:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=hXJOSoQX;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 95A589C4408;
	Tue, 13 Feb 2024 04:22:55 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id r31MwH0GmmtY; Tue, 13 Feb 2024 04:22:54 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7CD819C44B0;
	Tue, 13 Feb 2024 04:22:54 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7CD819C44B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707816174; bh=p77hVepSxRa+h3NSutDWXHHlDZSxDM0OcrutZqnPHps=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=hXJOSoQXbgD2K2D7M/1vfWYBEB0xBAkWbPY4ny2yJMCaGnu6ctfdTxl6DQc8XtwVY
	 HVEHBlK8ImWwqA9Uyfe+lXA79+57xXyEXurAjHeha3UJRpPGK7V+fOgQXiE3Ma7aDk
	 imDkuAbX9gXd1OHNWJNHkBIikHHOpUZvbFB6zL7XlbxCy2rsTGCWQLdoYSSnJ6WOGz
	 tuOAK5QHzqo5zecf4opOmTicUc82lZ4CuT0q8zl6obCl2nSdTgbb2RdX+8DlLmG8Xt
	 i4/5WacaeB8bBPXMtFETyTmSuLWMLr6H9CSlk2zkSi6w91HWVuIWmzNhB2va3YbKsg
	 789pd3cfJpkHA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ef5U3kBAfVA4; Tue, 13 Feb 2024 04:22:54 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 22EB79C4408;
	Tue, 13 Feb 2024 04:22:54 -0500 (EST)
Message-ID: <6b9ae9b0-980a-4beb-9daf-c6272662825b@savoirfairelinux.com>
Date: Tue, 13 Feb 2024 10:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
 <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
 <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
 <8ed89336017da50392be926a152a10901c8ceea7.camel@gmail.com>
 <62436f79-ff09-4084-8e94-55e055198b6a@savoirfairelinux.com>
 <41652303df50bbbe33931faf78515af5a8667993.camel@gmail.com>
Content-Language: en-US
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <41652303df50bbbe33931faf78515af5a8667993.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 09:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195378

Hello Adrian,
> Hi Enguerrand
>>
>=20
>=20
> My first solution was too complicated. After re-thinking it, I replaced
> it by a much simpler implementation: The new implementation is about
> extending the templates which are already in poky.
The new template mechanic is neat!
  - It provides a new way for layer maintainers to share VSCode=20
configuration, including when setting up multi-layer workspaces.
  - It can be used for other build tools like kas, crops... (which I test=
ed)
  - It works better than the previous config for plain poky. The config=20
will be valid, whether the user creates the build directory inside poky=20
or in a parent directory.
  - It won't corrupt existing manual settings
>=20
>> What I like with your new script is that it produces a seamless
>> equivalent to the previous static config. If the static config cannot
>> be
>> versioned (I still didn't understand why), then yes, creating the
Make sure to notify us on GitHub if you come with git conflicts or=20
errors, or versioning problems with the way the extension edits=20
settings.json ;)
>> file
>> seems like the way to go. However, I have a few concerns with the
>> current implementation:
>>  =C2=A0 1. If the user has different settings, they may be corrupted b=
y the
>> script when running oe-init-build-env. My suggestion would be to not
>> generate anything if a settings.json is already present.
>=20
> Yes, that's simple and exactly what the new implementation does.
>=20
>>  =C2=A0 2. Would just having the static file somewhere and simply copy=
ing
>> it
>> work rather than assembling it? What other dynamic configurations are
>> addressed with your script?
>>
> Yes, that's more or less what the template does.
It is much simpler now indeed!
>=20
>> I'm not sure I understand what kind of users and workflows are
>> targeted
>> by this script and how it connects with the documentation guiding
>> flows.
>> Should we rather edit the plugin's guide example configurations for
>> poky?
>=20
> I think it should just work out of the box at least for the default use
> case which is also documented in the Yocto quick setup guide. And
> that's what it does with the few lines of code which I just pushed to
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/vscode-yocto=
-plugin
>=20
> What do you think?
I think the current approach follows the traditional VSCode=20
configuration experience:
  - How to configure the extension should be explained in the=20
extension's README (we already have that)
  - There should be a mechanism to share .vscode settings for=20
developers. Usually this is through having .vscode at the root of the=20
git folder. But as you have explained, this is not the best solution for=20
Yocto because we may have multi-layers workspaces, and also the=20
settings.json edits. Your template approach satisfies both and follows=20
the existing templateconf mechanic.

I'm very happy with this iteration!

Just a few minor remarks on the code:
	if command -v code > /dev/null; then
In the experience I describe just above, developers usually clone the=20
.vscode settings even if they don't use them. I think we could remove=20
this condition and always produce the VSCode settings. It will also=20
encourage new users to try out the VSCode extension if they weren't=20
aware of it, which will also be helpful to them.

You should remove the indentation in the messages "You had no=20
.vscode/*.json file". cat heredocs will keep the indentation so the=20
message appears indented in the output.

You also removed some the editor settings the extension edits from the=20
template. I'm ok with this since the file is no longer versioned. You=20
could also remove the Python analysis paths which are inserted by the=20
extension. (Also it uses ${workspaceFolder} relative paths which are=20
portable.)

Thanks,
>=20
> Thank you and best regards,
> Adrian
>=20
Enguerrand de Ribaucourt

