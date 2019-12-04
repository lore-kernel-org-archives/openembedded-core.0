Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 293087D185
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 22:47:32 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id c2so525900qvp.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 14:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PzrttryZrFk1PXp/3oYQh8RVNQvliDx/hUm7Zbpr4g8=;
	b=TFTfSDlD1RrqOq+VylqQSn64lt10kObYEJS13RU4SSEZvCQJaXWCGkoWPYILdlNH4N
	LX1336i96qs+4nZTbrOD2rRqZfT026gPf7D49Gy5f5xvBaea82p4ZSD5bZdvN/w0ysex
	ZIQdkZP03kUGq6Mryy3XdCNB/AkzVQXnF3irzXJnp37F760yEwqh/QJrhMOU1M7AHEX+
	+AtCwzaKt+PpKioDWhnP1m3RT0R81+76P4Jmmffk1HyI7gzAtQfffBjksBht++EMS5KJ
	wCV7S0cToSm+uD9TXAfVlFKqN9Tfzzedj/zIYj3Us0o7DZ0hoyG1cdN3RiOgAL2joPtV
	G01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PzrttryZrFk1PXp/3oYQh8RVNQvliDx/hUm7Zbpr4g8=;
	b=X3+YTsr1miIzuZHG3rULuZDkTYAen1BGbh/ETxBqRA1MIBANBTR9t+xrpTN4opZLu6
	/YY+pXrsgnaI1qmYo0E+bSmdmZ6DMJc8n3vagzWn8csG1Lpnt5FVa4iUeevmqqm/yluG
	m29nUOo5EhlXdDWoYhS3zU0bEkxuVFHUWXJ0sMSan+v5k49XtjsxPlu5Vv2sX+nHx8iJ
	4k2F7kpk/q43/TX20YO1FdEXPQfZH1IpkA20RcCQ7pyBEvAnNUm17I3I5BP/+H5xc1O8
	f4BVocuFydEZWJkgzh8CcMWRlTmgVIkeK7FPt2910eRgDw5hSAUtnoUgKxKDnza9OzD7
	wzfw==
X-Gm-Message-State: APjAAAUz1XjEOUsXUPilaIpHmTGgPvafZ4lvs4LNOnakqc0VfpEM21Sh
	xMyEK37NtUrXmBmN2SqJ9ZOQsoRjmZyjr6N2pvY=
X-Google-Smtp-Source: APXvYqxUiPHmyUlQriKxvplBej8G+aL6Lc8djGM+zjdZx9ak+puP8t8s1+7YaIRjQQpQ5PkG/hVJpvNr6VjyVUu8/3Q=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr4925625qvm.206.1575499653155; 
	Wed, 04 Dec 2019 14:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20191204184028.14813-1-anibal.limon@linaro.org>
	<CANNYZj8dQGgwgOCg_NohqU4H5eLwAK-aFowLa-ywFpf7-YU3ZQ@mail.gmail.com>
	<CA+_Aqitgf4Q+p2C3n7t_GCo=zygsmC5zMEjJnCT3=QDs5Nq8wg@mail.gmail.com>
	<1CD180C7-0F85-4006-BFBC-9AF386C66F66@gmail.com>
In-Reply-To: <1CD180C7-0F85-4006-BFBC-9AF386C66F66@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 14:47:07 -0800
Message-ID: <CAMKF1sq6fy10KdQUUxcvKa3+OLeYr+dwm2vghQTLHc7pW8Q+AQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] meta/recipes-graphics/waffle: Add inherit setuptools
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
X-List-Received-Date: Wed, 04 Dec 2019 22:47:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2019 at 2:07 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> But inheriting setuptools does bring in the target python as well, and it=
=E2=80=99s the target python that fixes the issue, not setuptools.

perhaps setuptools3-native in deps is enough.

>
> Alex
>
> On 4 Dec 2019, at 21.51, Anibal Limon <anibal.limon@linaro.org> wrote:
>
>
>
> On Wed, 4 Dec 2019 at 13:15, Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>>
>> On Wed, 4 Dec 2019 at 20:04, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro=
.org> wrote:
>>>
>>> -inherit meson features_check lib_package bash-completion
>>> +inherit meson setuptools3 features_check lib_package bash-completion
>>
>>
>> I don't think you actually need setuptools3 here, just target python3 de=
pendency is enough.
>
>
> Actually doesn't need python3 it needs python3-native with setuptools, no=
t need to depend of python3 for the target.
>
> Anibal
>
>>
>>
>> Alex

