Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 58E5D78664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:23:23 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id s62so153596ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=5QU4k88rJ3CFFp+EUOuehjJIJnnOUYe0iG7tDhTsCOo=;
	b=uCliHff8+eXN/wDVR4Odh1R7LktfGJXlJePIDuXHmrruQolTtrDCDde59jE9G9A2Mg
	YstFvdc45Unr7p4Lg7P2mZ8c7iKWPRCetMRHgDzXxPzXmGRUO7ANHcKDAdipHIl7CZ5h
	iQ0t2jjIeuqFk4hUoTwqQLb4nWxM2FGSSXFWlpD1NS4BtJz5TYH6v8dCcyZlKYhPFXRh
	mZMuAoLUYtrv9YB8girHboGcOgZ66QnU3G8RovNK7XH6fVveS9d6eJGTjvLNEEIm4CsC
	UKOZMunMGnw6HUlx+/uybbCg7vvVUNDpIWTSK3E6nNzX9xHs4lhfFvOuba7oNDUjwjF+
	7RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=5QU4k88rJ3CFFp+EUOuehjJIJnnOUYe0iG7tDhTsCOo=;
	b=V5Pc6yZpw0w4jsP4tlKWlhj9wVQYRoHToJ3gade6Wvd/fVPu2rS1GKOvXJ5m21YSWr
	di8QmZRvpmua529LqH1fGFzumK9bmGFMyKkBslSiAatIVup/LXYC0cUXuSMbXFdlE3ZD
	k/PUeQ4KZJ4zkxG99SLJljvD4j5rddyLyE+eyHvGLY5Qhdzif7y5h8nVjUiR4INjS4I/
	7/Zxle4h4J4zGbsuZ7CyuhwsddOsAsow3dSdJZlj50pFcHwNpaC4wr05qwS8S1h10il/
	tzIekCE5mZVqWyRTt94xpjtqdoJZVvH3AE0ie8QDiOUwebbxG4ETSEqZuh2Y2ScvyoiQ
	A6VA==
X-Gm-Message-State: AHPjjUgSfuAbMNeLQfz7kd2ToABsMEUd3/bN3Tu3gN3hHQ2ATB7F12Of
	vSFfrKztTbo8RDDDD6k=
X-Received: by 10.13.235.197 with SMTP id u188mr10069129ywe.349.1505305404152; 
	Wed, 13 Sep 2017 05:23:24 -0700 (PDT)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52]) by smtp.gmail.com with ESMTPSA id
	q131sm4685267ywq.8.2017.09.13.05.23.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 05:23:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id x190so276042oix.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 05:23:22 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDHjjyk9HPU+5xlMPvYXnnOpjo2syZ4DrkBFk25lV5QjCvrkwxlNJYcbLnhQRE5CNt2otaweYquGaA4kyS6blQ=
X-Received: by 10.202.177.195 with SMTP id a186mr5527841oif.32.1505305402078; 
	Wed, 13 Sep 2017 05:23:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.86.129 with HTTP; Wed, 13 Sep 2017 05:23:21 -0700 (PDT)
In-Reply-To: <CAGgRHJoGOnasgdNytjLAv=De1SS=tdPKCi3+wLeehFQzHQB4ig@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
	<CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
	<CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
	<CA+chaQcSMj-47DzgRrwWoUGNyc4WKoGM72bqKSf1YZHO2sskpQ@mail.gmail.com>
	<CAP9ODKocG317bbmcnDvOGp5VJnAUsFy8DbRBVZ51a3akkg5tSQ@mail.gmail.com>
	<CAMKF1sphM28T3CC1hkb9Hi8MbGGweBC-Q9YKQTy3J4jnVt8FGQ@mail.gmail.com>
	<CAGgRHJoGOnasgdNytjLAv=De1SS=tdPKCi3+wLeehFQzHQB4ig@mail.gmail.com>
Date: Wed, 13 Sep 2017 09:23:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp50TJa0_Ln9NMGedxYub42iASA0a2f2SmqZi0GPHFFrA@mail.gmail.com>
Message-ID: <CAP9ODKp50TJa0_Ln9NMGedxYub42iASA0a2f2SmqZi0GPHFFrA@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Wed, 13 Sep 2017 12:23:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 8:09 AM, Matt Madison <matt@madison.systems> wrote:
> On Tue, Sep 12, 2017 at 12:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Sep 12, 2017 at 12:20 PM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Tue, Sep 12, 2017 at 3:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>> Seems like this version was already picked to master-next, so probably
>>>> better to leave as standalone change now.
>>>>
>>>> The version currently in master fails to build for arm with thumb enabled:
>>>> http://errors.yoctoproject.org/Errors/Details/155765/
>>>>
>>>> Is it fixed somewhere in this new patchset?
>>>>
>>>> # github.com/golang/dep/cmd/dep
>>>> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link:
>>>> R_ARM_THM_CALL, are you using -marm?
>>>> WARNING: exit code 2 from a shell command.
>>>> ERROR: Function failed: do_compile (log file is located at
>>>> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/temp/log.do_compile.13531)
>>>
>>> No, it is not.
>>>
>>> It seems that Go, when using CGO, does not play nice with Thumb. Matt,
>>> do you know if there is a known fix for it?
>>
>> Disable CGO for thumb, we have a variable to select cgo
>
> Yeah, I don't think Go handles Thumb at all. Maybe we should set
> ARM_INSTRUCTION_SET to "arm" in goarch.bbclass?

I think we have a problem with dependencies. It is possibly a solution
but not sure it will work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

