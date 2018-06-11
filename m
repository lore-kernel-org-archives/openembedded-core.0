Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3725A78C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 22:17:32 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id l15-v6so24710254oth.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nE9MnX6ZZCX6a+rWJVp97TwQbyx5mAMMQUMCdkpCcTg=;
	b=VUpktMui2BLYPGlsgbO1jQleJrgVgkAxsyNPrLTTdQ56Xd2fhMechM9XsvuTwsWuf8
	pPym7nk00GfrjN3DarFnPZqkHtSc4Vnt7tnkXsL8PegRwPP9EA0UCQd/OFA+2/kyad2I
	6ZXpwwnwFFwCbqeG+tQiGz/IQ9QdjM5mKIIuZVNw6xctADxtk1lG6o8syAzn6J3vo0tM
	iRf4w2LYnZLBNLpvcIas3yjkTgv/JX3nVKzsOFc2bDyLeHKc3zZhr+2/H4zMcmbF4dPc
	zyhYhQOkhSpr313dOPfc0cPUkx+bbayCwpbbiThJemhFgHfnRxotuNZ/jrtyZTDF6Kyo
	6sAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nE9MnX6ZZCX6a+rWJVp97TwQbyx5mAMMQUMCdkpCcTg=;
	b=jIasiln7XJ8VewUvDoFZvVhHpouMO6sLjEhGAqk01G2cYmOmVnfiulQYgZENHFjPRq
	y89vQtP1e0ngv54So/WiYtWGhft8BiVaNG9f7xmXKhx+lJ+XUgeBZHwymv+qSKw1gQxX
	Oj1xZ4nFd3k+FBBWY0IoQzibv0Kw96MnDyed9OAYovbdqEmLaEVSJdZOaXNytBc1hpIL
	A7msWTKZaFm5Mu92troSHh6PwMYoLqIRzOL0/qe88hEIg/LDJj5Ay04FX366TV4KxHN/
	VPQVB1q73cXsEwGRizic6ETJHLOGnf97vH2w7udafxu0yuML/MBgH0tpxxEAxtDwYpvD
	XnaQ==
X-Gm-Message-State: APt69E2kXFsELiNI7vdezuvEqtNw0V51nmU5g/DjQmKIdLlJImAhxWnZ
	aQkGz8DosO5Z2FAKRM8Sdf8p2NXUd7rZg6QfeGLgpQ==
X-Google-Smtp-Source: ADUXVKIJjQG1tNZVvLszEOVs6u2fxLWdrQUZvlvuFPk9LiyhRBnOugvHENl7zLsT5EA8jDPZWZ5nKD8kbqPu/BowOoo=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr660266otz.135.1528755454216; 
	Mon, 11 Jun 2018 15:17:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 15:17:13
	-0700 (PDT)
In-Reply-To: <CAJ86T=U9SjuBJ07aNq_ATukCxCQoEuAo6g4mUso6f71W-sU8cA@mail.gmail.com>
References: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LYtc4Cdo1zUzc-UK-BOO-J0dA5iQLGEn6vn2zfGhnbRxg@mail.gmail.com>
	<CAJ86T=U9SjuBJ07aNq_ATukCxCQoEuAo6g4mUso6f71W-sU8cA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 23:17:13 +0100
Message-ID: <CAJTo0LZPfg6AX_1UF08LrnYp=vtQtJZRrRxLpDCtVPC6jEud5Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: remove myself as maintainer.
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
X-List-Received-Date: Mon, 11 Jun 2018 22:17:33 -0000
Content-Type: text/plain; charset="UTF-8"

They get the AUH upgrade mails, and will be the default assignee for
bugs in triage.

For something like busybox this isn't a huge amount of work.

Ross

On 11 June 2018 at 23:13, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jun 11, 2018 at 3:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Do we have anyone willing to take over?
>
> Does having a designated maintainer actually achieve anything in practice?
>
>> Ross
>>
>> On 11 June 2018 at 23:03, Armin Kuster <akuster808@gmail.com> wrote:
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  meta/conf/distro/include/maintainers.inc | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>>> index 628edac..08d7e1b 100644
>>> --- a/meta/conf/distro/include/maintainers.inc
>>> +++ b/meta/conf/distro/include/maintainers.inc
>>> @@ -85,7 +85,6 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
>>>  RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>  RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>  RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>> -RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
>>>  RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
>>>  RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
>>>  RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

