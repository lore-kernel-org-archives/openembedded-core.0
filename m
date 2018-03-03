Return-Path: <matt@madison.systems>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 941C078A63
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 17:23:04 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id 70so17606364lfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 09:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/dcxCFeUFHUD/xZslrwBMt8CfCex9gk8JRoyVswPrTM=;
	b=mULLd8rjWZ7zEzCe0YtC5KjD5UkLgYZKRUlV09FHUUBXl+NlsaUCWwAfVKI83sbp7Q
	EGbPMCav3Vqc8gDUH8gFZqWP/3EAxMviCMqp+EudDO1p8xLDsZmviXJH1FZaiiQxZQ9X
	hrBaftsCRZ5rA3law058kvhlSwo6K3r0QbgbxoKOU+r5WnYpjNEWprKO9hNkFov2MyUU
	zZZHYPUOoySAp0cAPMdlBpxwhayfrWDn9g+rjXif7xBi890PJkW/QSqseF8vrEKMWKvi
	fWQMdy+R346HEk58L/eaEgA65ZnyP0D/Sk/bjPCn5V0B9QP5O6rqWzOuS0h+JfP8Rag0
	QAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/dcxCFeUFHUD/xZslrwBMt8CfCex9gk8JRoyVswPrTM=;
	b=iJYHaS5Ef8RzWnaEj4FlXF3kodb0hO1DdhgHtuakPw0mDjX8eEtYS9MqlZW3xUm45q
	/3luvO4mDMiIel5ze9ejwgq6+GdIYYNNCvzO+QJFVpGBNPIQXNW+csr1QJ2hxaJMpcZw
	ExJ4shazOR0/3MtZN1YFewzhxKWKVZ/1BmesCNx/1Nu907oMQgsGH91BbgDexareMASq
	nQvEjd6X+NWv4QLMF5I/jrhb4OA9gJFb9OQ8pYOwt6VOph+uN+WuMrYdGWid8RAEUSkV
	NMxRXxZn19x074uNBXSpNwKDrqBatUsbBdFzvLkiG+dWIn76/LpKsCSSxpaVn9RMReNc
	tjFw==
X-Gm-Message-State: AElRT7Fz/Ipqm4kA0cEk8VMMhVIUDBAUxB4OSegwgLZU2+dPDYyj+gSl
	uKI1DlUilZbV7tK4+dxQU5M1CVvG5FBfLF+d/j3WOA==
X-Google-Smtp-Source: AG47ELuxC9M7kjNjdp9PvepMXyS/PkPaqPQ0HfuKNDD53rRs+LE4qxZ1tneQecjLqQUitGGKIbMVnzysf5sOgHOa530=
X-Received: by 10.25.208.196 with SMTP id h187mr3663286lfg.107.1520097785036; 
	Sat, 03 Mar 2018 09:23:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.131 with HTTP; Sat, 3 Mar 2018 09:23:04 -0800 (PST)
In-Reply-To: <1520096037.3436.59.camel@linuxfoundation.org>
References: <20180302203314.32737-1-matt@madison.systems>
	<1520096037.3436.59.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Sat, 3 Mar 2018 09:23:04 -0800
Message-ID: <CAGgRHJrhCgN3YoZRpnfbHSU-ASkpgMo-qiCSNEnHW7-sAtzq5Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sat, 03 Mar 2018 17:23:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 3, 2018 at 8:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-03-02 at 12:33 -0800, Matt Madison wrote:
>> New in v4:
>>     * updated the go source patch to protect
>>       GOROOT to defer generating an error
>>       until a build action would try to update
>>       something in GOROOT
>>     * updated go.bbclass to compile for both
>>       static and dynamic linking, similar to
>>       go-runtime
>>     * fixed missing sign-off
>>
>> New in v3:
>>     * reduced one of the go source patches,
>>       eliminating an unneeded change (thanks
>>       Otavio)
>>     * Added bbclass and recipe patches to
>>       handle SECURITY_CFLAGS settings if
>>       they're enabled
>>     * Added go-runtime-staticdev to target-side
>>       SDK, needed for go static builds (fixes
>>       test case failure in oe-selftest)
>>     * two more minor cleanups
>>
>> New in v2:
>>     * Fixed Upstream-Status line in go patches
>>     * Added GOTMPDIR to do_configure[dirs]
>
> I think there may be an issue still lurking somewhere with the PIE
> changes:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/871/st
> eps/Running%20oe-selftest/logs/stdio

Yes, I see.  Works OK if security_flags.inc is included, but not
otherwise.  Will fix.

Thanks,
-Matt
>
> Cheers,
>
> Richard

