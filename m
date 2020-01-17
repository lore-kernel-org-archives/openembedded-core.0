Return-Path: <sumit.garg@linaro.org>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id F15187FB78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 11:03:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h23so26031251ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 03:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qPS6DiaFCUuyc/Uoc61i/D3keJ7s2unDvypDPhXwP0Y=;
	b=dT7QZuOIWWzstyJLlXQIGHdq7cvRvgDDyTOxKci1jpUWKJbiqdBR7QsMnrIHdbFrlQ
	buhItTyKxQ+ttZIKtAqOfYtopxi+mqTjwL8X7hKGfmgjcJocUC35byVL0ER0SFsROLls
	6dsMB2b1FGACFQw7RSkskDXH4m/Y+fzsHhNLkNfegGXLtzyU7+wcB3FLyBxEnI/H9zEt
	E3tph5zrrgvKcMkFK+PAr4l0L5vkZ7SV+zNcPOerrJVkApPFDnhpDO7ko3K4qViTWBfG
	LDoX2zkBlLNAk4+S3RmosxpI3QE4dIiadtGhLqdTslkVlAito49FVRVGgXMZ5MzYZX2N
	tmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qPS6DiaFCUuyc/Uoc61i/D3keJ7s2unDvypDPhXwP0Y=;
	b=Uls8JwlvlSfSjzRdLOlQiTtvnOt9ceOxrOYNaoTKokvB9LjvrquVRL7Qml1Xseitwm
	yqCdxKiQizo8aqoKewnLne7KlZnE/bXs4ce/jYCrLSO8RrfmKO5jKkKjwLmYw9EoJuY7
	QzqKi23DmA4A/QDpkSn6xLrIcxyHnb81jhxCL4vHpdzOsbB+fW2LQQBpuwmQ6td/bjcJ
	J+oPXYYcTTZMAv7MxUJx7nJ+BZJ00gweAEYJLPEb1WNh82RM65mh0kKJiZKAKAKykRrY
	IV8OXlcdLjQ+xsFmKcXknR8XPl39fd7hD7LP6uYfVNgmH5CuaAWEk6TuT4zLedS7j2SL
	LT6A==
X-Gm-Message-State: APjAAAVkGdtJdVt2oWd5e+GMaGRf8q2Zff2UFnctOmRPzD9m5UO4q/Kg
	Ok4e6X1vO/1mS0pc/t0wy7ojcNdNx23JkbmJ0OmxVQ==
X-Google-Smtp-Source: APXvYqzqX2neob4IDQWVWG44q4AJFJwHyxD9pDKDFja4b3rj1O+SFEqXVE0J0vjABsO4ZjWfzPv0JOoV5I0CoDyZreY=
X-Received: by 2002:a05:651c:327:: with SMTP id
	b7mr5471762ljp.22.1579259039540; 
	Fri, 17 Jan 2020 03:03:59 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
	<CANNYZj-QgS9n7sNS1W0i843DqFyM6imwmZvnvQ2D=S+XAHk0Ew@mail.gmail.com>
In-Reply-To: <CANNYZj-QgS9n7sNS1W0i843DqFyM6imwmZvnvQ2D=S+XAHk0Ew@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 17 Jan 2020 16:33:48 +0530
Message-ID: <CAFA6WYPPgUf1nTY-N8Mw8UcvL9EhSi+ju0SHX=f=94O4OGU3QA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 11:03:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 16:07, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 17 Jan 2020 at 07:59, Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>>
>> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
>> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org/"
>>  BUGTRACKER = "https://bugs.freedesktop.org"
>>  SECTION = "x11/apps"
>>  LICENSE = "MIT-X"
>> -DEPENDS = "util-macros-native virtual/libx11"
>> +DEPENDS = "util-macros-native virtual/libx11 gettext-native"
>
>
> Would 'inherit gettext' do the trick here? Depending on full gettext is undesired as it is slow to build; we ship a minimal gettext to mitigate that.

Yes 'inherit gettext' does the trick. Will use it instead.

-Sumit

