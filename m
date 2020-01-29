Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 509D660974
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:34:59 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r14so2584362lfm.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tSs2g6IvN5RdOE1jp8/DVafikgUFvL+BhD/GQmOs7lI=;
	b=krutRiYXTTeDe8PoYnMyH7fYuzKIsK/hMpmFLZxg8I+BYObZ+ttkuL10snF59WYooT
	sfN8tll3r68Id66aCJKQuPRmHEm02y6duycIG9Pp9dqy/bsDwKIzaFLo9FMooJvDx4bi
	U2Kxg1JgsH/t0HZW8Fx8l6IX2LarIdFP46GWhussvGkeF7et9YhmKqDO01hJR8MTujId
	aBjof628HyNl2gjr8gAQ+Pd5td9nrsNi+FLO24B19+GjMbkM6+j58FzNzE0ElhgkC9m8
	bGxSI9xrtypT0nUA2VNLDUdIe2G9hanGAiljoUCPVcaqQ3sjpQic4dQbHVebsGbT02gn
	YbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tSs2g6IvN5RdOE1jp8/DVafikgUFvL+BhD/GQmOs7lI=;
	b=oIqYGlvW+M4NV6PZKpUc9DlAEHOJGyHxeON9Vn5BETyxgarVDAFL8450xMdBeb57lR
	s8Olb2/fXolEbkw7jtz+8cd+hb2J9sjNSnxSfqiCoHY77b2bufQ2wuS5wZq5B49Nx0hA
	xCT7DOCgiLzWfU6XFSDPEDR9iixSgZRmRPAHqO7jpf0znFI98A8YOSNUe4L22OiEnKw9
	Vk/U69gxCIRyUhfo409ODCgaUkCrI77UxcWDsR/8uwXqZba2+l09+r/415cEtq4hEBwh
	aVh8bjPOZ/8GjB77oxroa+htOacYV6byUxTKL30OBojv5Aqhn4gP4WG8iU7Bt852QY0c
	FmOA==
X-Gm-Message-State: APjAAAWb9Y2h7x94T+ywS/Z/Me6/q/fUrl43k+mHUCUvyfPfqrI1wL9M
	yQfvmmwNF86kFEVxikNb1JVeF+fiX1XAqwtxg7mz/KHt
X-Google-Smtp-Source: APXvYqwyvm2axz+XPw880aVbtHc6rEZ96zmxhN8S1LD0BZtFnBtR8N+ZPWjimNygLRZttSfCZUdIjbxl+to+lPyKUN0=
X-Received: by 2002:a17:906:4bd1:: with SMTP id
	x17mr7416451ejv.181.1580302112846; 
	Wed, 29 Jan 2020 04:48:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<CANNYZj_O7cMwJs_ND_MOwADb7PCc2XKJq3b1gQ0xaO7SbBr58g@mail.gmail.com>
In-Reply-To: <CANNYZj_O7cMwJs_ND_MOwADb7PCc2XKJq3b1gQ0xaO7SbBr58g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Jan 2020 07:48:21 -0500
Message-ID: <CADkTA4PZm6X0duFUx0prC4-kz=RUjsmO5vK_6Ox6w5GSGhJ0wQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2020 09:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 29, 2020 at 2:31 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can these issues be bisected? That's how the two kernel regressions (both found last year via ptests) were tracked down to specific commits.
>

mips64 was already bisected, and reported upstream, not much help
there .. I've already reached out to some more hardcore mips folks for
more help, so hopefully that works :D

The musl one didn't bisect in my attempt(s), but in that config it is
an easy issue to trigger. I'm out of time to debug it for the next two
weeks, hence why I'm broadcasting to see if others want to take a
look.

Bruce

> Alex
>
> On Tue, 28 Jan 2020 at 23:14, <bruce.ashfield@gmail.com> wrote:
>>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Hi all,
>>
>> I just wanted to send these to the list, so everyone could see the
>> reference kernel that we are planning for the upcoming release.
>>
>> I have other patches to drop 4.19, 5.2 and make this the default
>> kernel for the various reference platforms as well, but I'm not
>> sending them, since we still have two outstanding issues:
>>
>> 1) mips64 init is segfaulting after / during some self tests.
>>
>>    https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
>>
>> 2) x86 musl is getting a gpf on many commands:
>>
>>    https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
>>
>> I've looked into both, and don't have any great ideas on how to debug
>> or fix them.
>>
>> So if anyone has ideas, or wants to poke at these, feel free to follow up.
>> But as of now, we still can't merge the v5.4 kernel as the reference due
>> to these remaining problems.
>>
>> Bruce
>>
>>
>> The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
>>
>>   bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>>
>> Bruce Ashfield (3):
>>   linux-yocto: introduce 5.4 recipes
>>   kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
>>   kernel-devsrc: update to v5.4+
>>
>>  .../kern-tools/kern-tools-native_git.bb       |  2 +-
>>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
>>  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
>>  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
>>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
>>  5 files changed, 136 insertions(+), 4 deletions(-)
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
>>
>> --
>> 2.19.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

