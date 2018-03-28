Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE8E60685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 22:55:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n2so362475wrj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1eN5FEyVVLgzBdZ1iIctI5DsLJOXFmgwvyVtDqZaC/4=;
	b=pmTLyFDcg6P6q4llvYcMpL0j0adO3grQ9RUSNfJvjH/Z5RsdWYItVTvWRS687mCwlU
	ZKHK7SN8Q+vjFYIG65oFAmqOxwUeoMqgxanHQvuSREksbRtX1pjkT0YdkkG++J9lLuXl
	I2WeEmveIDstvU1SNBsk4GRWaI7psqrcqxLJugpVqR+JresGIVLsoC/uKorVXZDv4xZd
	gaNo73LtN8A8Olp1ChyJkFrKZfozh9PEGQDabX73ZZuzTT7hfvOlsFBtxb3m1cMQ5+3V
	xIEhdHtHJaiNY4JxNoIqQenaeX+DQwT6tcPiGZsFy5vEo112oqTY8f550DoIg0/J9cBu
	05mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1eN5FEyVVLgzBdZ1iIctI5DsLJOXFmgwvyVtDqZaC/4=;
	b=fw6OgzfCLqPJ+4gDREcuM7Gjv40DT6D0QZet7wPPN9c66iMG7bWVPuitOnC50h7oqf
	YAzBHseI94VhJZ4FsEUKR3N95+Sg6bmFXHLmKXS9nn73RZ3F5dbrAWtvFL+1JQpQHvpO
	N1lG08gqaK3PcHMdtXVfX2wa0Z0cg56CF+dDGDYhBXjp/8S1dX+CzUeY9q5dwPIJuZ/f
	Vrq7/Jow4q1ydmh8/mRwD9XyZS/MXQRzS8tekhZg+UojK3042BU0ktQVhGHY7hDT8Wfq
	PQ1i77yzpMGEL2X1sZe+58yWol6VVH2CmlrukyLGqm28LNV2P05rV0JuCtWQ+7Rc+ZR2
	KFdw==
X-Gm-Message-State: AElRT7FqDIlbvlfCOEmUK5rykKo6Grtt9EaEG5mmAginbAWYU+WP+pgx
	hY6RGjwV2vHysCxF10xPjJbCcnr8A8n9K6XhFLTflg==
X-Google-Smtp-Source: AIpwx4+ZkMYYOjHX4eyC1lXZZ+4ET1pfCfZizUyfZJ6SeYY1gJczYuZFBRoCosXlRfZF221FCeVPmUKR7RKdAqNz/8Y=
X-Received: by 10.223.177.213 with SMTP id r21mr4647765wra.89.1522277755791;
	Wed, 28 Mar 2018 15:55:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Wed, 28 Mar 2018 15:55:55 -0700 (PDT)
In-Reply-To: <CAJ86T=U+mP5KPJBUL+18i3g21nCiMX_JNi0_Ad2mj5iGNqFvog@mail.gmail.com>
References: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
	<CAJ86T=Ur=A8XQH=UJu9NmxE7KmPgYmWN0bLL8X1akvV0vLNA7w@mail.gmail.com>
	<CAJ86T=U+mP5KPJBUL+18i3g21nCiMX_JNi0_Ad2mj5iGNqFvog@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 28 Mar 2018 15:55:55 -0700
Message-ID: <CAJ86T=XqUjHH-1_pBKfozk588wWBmqHTOhOBfT15iEmx8qC7rw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Wed, 28 Mar 2018 22:55:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 8:15 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Feb 21, 2018 at 1:40 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, Jan 23, 2018 at 12:16 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Tue, Dec 5, 2017 at 5:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> From: Ming Liu <liu.ming50@gmail.com>
>>>>
>>>> A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
>>>> the default terminal, when I run any of the tasks:
>>>> bitbake busybox -c menuconfig/devshell/devpyshell
>>>> bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>>>>
>>>> I got a error as follows:
>>>> "Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"
>>>>
>>>> Seems the environment of the process calling Popen is not passed to the
>>>> child process, this behaviour is a known issue in Python bug tracker:
>>>> http://bugs.python.org/issue8557
>>>>
>>>> It could be fixed by using an absolute path instead per test.
>>>
>>> Ping.
>>
>> Ping again.
>
> And again...
>
> It looks like this (and a couple of other patches) made it as far as:
>
>   http://git.openembedded.org/openembedded-core-contrib/log/?h=stable/morty-next
>
> but then got stuck or forgotten?

Ping number four.

As an interesting data point, it's now over 20 months since the bug
was introduced and first reported on the mailing list:

  http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124215.html

