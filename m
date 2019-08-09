Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3CF77F396
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 01:34:48 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id a15so94271635qtn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 18:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mCH1eBgKpZ81eFLjjmD3VWpnsul10EITnU23iUNtyJ4=;
	b=YpE4I5T8R14MgIpe56vKcVk6aeGUmuRfRn4QfYfCcEA8P3vBqL6M82kWk0HAJOgWIM
	EarD/xMECXwQzqeBVt6Fj035XlL0pnKm1Ab21HvLcEe8ic2R0EKb4+FU6GhRNSXr6Gvt
	QKCFNKu2c1vMztnMTmxaxYo6CA27Rrm3YIMUK+cVcMs1V2uomvMx5ALExZe8snvV9reU
	eyyvNvDrtttuIfIg/eoudWony8Mr9XivMAAj7UiHQdslIDIsa2HMzaRsV7v1s5HPZzeC
	hgZQ67NlMLNGjn+LMIe2kRCZy7kolmELez1+SRh2hZU0FRPJbZnlVIBF+0bB8tHWrsr4
	LMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mCH1eBgKpZ81eFLjjmD3VWpnsul10EITnU23iUNtyJ4=;
	b=knWNTA7NtKCSfJUrRQTNiv0XteslG7VJP7EuqHvUscpjV+wzhM8pUY2syZQAC+zrZk
	wzWSuT0oiVIVrXMCKLVSqN5WdBG/gOW6YMzUSRbjHroZDJRTB1+gEC8F8YIiIH/at4G0
	T5mI6ErSfq20cASn6Oe/s5gX4MP5pIossaiaSCp9GZgT5K3Tpt+h2uDfJAHjOhSAI53E
	ANpMRaiSYpYq8GTCttj9YFysLn2nr7zJsEzxAttUlcVBpmzP9w4raS7wdr15ZSRruJJ7
	G0tFS3ZFbnZx0lhVowcs0nU9djG7WmMiOGv1IPdet/10rTwoWV/H2/kBeWWVDg1uDP0u
	5d6g==
X-Gm-Message-State: APjAAAVPgslgluw6yl9Uo77THstdOMXtOB3wJytHejbgWqice83LV0oi
	KYqncocGX/7MBxRg9uFMCBCB7OImXzKSxjWXnKo=
X-Google-Smtp-Source: APXvYqzIENbnj3/M1ApP5GVhzNHd8NuiktiUYyrgH0YFhPlnUv6QcUE+uIb4h1nTo5W87Xmtu76/fvExBYpZV5m7RxU=
X-Received: by 2002:ad4:4112:: with SMTP id i18mr15914391qvp.175.1565314489273;
	Thu, 08 Aug 2019 18:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
In-Reply-To: <CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2019 18:34:23 -0700
Message-ID: <CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Fri, 09 Aug 2019 01:34:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 12:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, Aug 8, 2019 at 8:44 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> On Thu, 8 Aug 2019 at 00:08, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> You might want to have a look at
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/621
>>> and maybe other pieces of that build yet to finish, not sure...
>>
>>
>> I ran bitbake world to check for newly exposed missing dependencies, but gcc-cross-canadian wasn't included in that. Will fix that too now.
>
>
> There are several packages in meta-openembedded which are showing these errors one that I see is net kit-rusers seems to be failing for wrong reason
>
> I will send full list once I am close to computer

here is full list

https://errors.yoctoproject.org/Errors/Build/86513/
all do_package_qa are due to this change.




>>
>> Alex
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

