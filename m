Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id D1CAB7821B;
	Mon, 28 Aug 2017 15:31:54 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id t3so2477667pgt.0;
	Mon, 28 Aug 2017 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4r8qGlkQQnHUtbPzQM/JicQfgJDga/kQpawjlSA++08=;
	b=gIviRjgzXiM2oWTwHsq6FS8R6QK+XNmtzaDe9X7kTPCpJqW0+Yzqm2UJ+cY6EnhpLl
	PTCqW2fqfx/l9IwCbWkXuPrDz8bh5kV8tf+YktXwzzQ0KPYCEdxmV+/jD6HGC1VD82nz
	FjsIHJjtQn4iNuqdvy+GYm7IgoB79y7sVQkdv3d6O+DNGSdRmIczbnF5Q1tg7DpjzA02
	nbf8sugg1N+KKZ845CoF2BqhnXeHd67TruGxbwLHuSxhfwEMTRcproyHTZp4RcJCwehw
	71G1zNr7uv80wlHiy78HVAorVktAlFu9iqH/Gdyt8erdhRcHSwot/ynQVTbKUuMgvTKj
	tllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4r8qGlkQQnHUtbPzQM/JicQfgJDga/kQpawjlSA++08=;
	b=QJtDqJbOb2p8T1GY8FdYNsbxfpR+YODEpc9FtVodoRc1m6Z7VPILbo2vF9fnxG7xxG
	ZYNVSe8Soq+VKDJPjU/e+oFNm3WxfFiL1zUfKFjBv6CP4hXq/IWFtgxZrila4mEt24eX
	DrSQC/QWKHuM58xUIOS/yFwUKQcIxJycEY13SSrYOo9xNwoAPCtdOenFU0Lz3oSbmK+9
	Bk3OpbhvgLJJPHIaxGi/BQK2Te2aNySK2nSObWiJbS5SJnyU0Z/Ln3xhuCvSq66Kj9V0
	DJGDwA1pIWBcKlJ85TaqogoTghI+8rq0GJbVOe2AEeHlRAh2myI1qP6Jm92ujmupiOOm
	7fpQ==
X-Gm-Message-State: AHYfb5jmjzUAKMa+ZzubILgqRyh48K+pCo6vHPIU5zBGHVKYXiyedhSL
	AZ1bEYvjIJPCxOkPM9a2sKmk6hcEcA==
X-Received: by 10.84.210.200 with SMTP id a66mr1075420pli.161.1503934315890;
	Mon, 28 Aug 2017 08:31:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 08:31:25 -0700 (PDT)
In-Reply-To: <1503933912.27472.227.camel@linux.intel.com>
References: <1503933912.27472.227.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 08:31:25 -0700
Message-ID: <CAMKF1srChtUATL3_GFx4hzUz81y7SxVM8UbXsahKJwYVJ0iLqw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded List <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Usage of "elf" IMAGE_TYPES
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
X-List-Received-Date: Mon, 28 Aug 2017 15:31:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 8:25 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Folks,
>
> I know it's late in our 2.4 cycle, but we recently discovered that
> mkelfImage fails due to a recent upgrade to binutils. In doing some
> research, mkelfimage was removed back in Oct 2014 from the coreboot
> repo. It was replaced with cbfstool.
>
> Unless I hear otherwise, I recommend that we mark elf Images as
> deprecated for 2.4 and remove them in 2.5.
>
> I have not yet dived into exactly what binutil change triggered the
> failure.
>
> Further thoughts?

you should describe what the errors are, maybe then we can make further
inroads into problem. As far as removal is concerned, I support that

>
> Sau!
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture

