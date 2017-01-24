Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id C171077230
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:34:07 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id x1so21643393lff.0
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=X+HNzC8hwdZriMc7h9I14ScrSL0TUr2XPQVvxg/hhNw=;
	b=Hqr6LycDIe0Kt/005FqR85b55lbJb3NYr7XYM+a/6PoUw7GPkQf2M9XaAOiNVumQSq
	1P5g4xAOwzQYubajURGrfXD9SdoOg/mC+wHsCygB4uG3sLcU/qjDeh7c9jJOhDNZjtvy
	itS9otBnUdjGhjBHJiwb7F/frTcOI//MmO0CAEpyRxarupWXM6XUM2dGxIbEAd5dn6zq
	dgBj4Vp0wJMnpiO2IjQxtxC9+niwsIFuyqcQ92pnMd4QF6KlT1e9hnlfko3fW7+dYpA6
	Hq8lL4eII/vAONBE41Jr/VmKcdSSTmPViFOP1UBSqHu1rBbQ7zikBS9ZoZY1sXtbmwBs
	ScSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=X+HNzC8hwdZriMc7h9I14ScrSL0TUr2XPQVvxg/hhNw=;
	b=I/rXwfFcKw9HWDjvzc3UdyVofBLQ002FKW2j+j7bckFe+j9KyiMcvzSwLrllKz4ttQ
	TNXgSG6/bAoCeA8NA6C3fSL0rr3FxqJiIRF26nfibbPaab0Oih54DVchFRfwCg46/Wi3
	AGA7GD7/a2Olaetxhw9otE7M5PTbqeA0BLz0l2UI79aGNnhAilkkvJr/DuXagQ/UfOJJ
	WV6Q55cndLgc7EnfPmGJlwhEHYHnLDbmONiz+Tl0LAL40ZaJq8g8YhcQhCVq45b7Hohe
	sZWBZwHIg2OYIs93jlLRjBYTWS1GGG01IOkli+h8GBnK54BSE7gZck4ZTvA02wjUOVMK
	wvcw==
X-Gm-Message-State: AIkVDXJ5Uu0BvQcsyfQNROkO1eWND9oZKKrIpVfrVjAlf/nzHfYfBBD1sG1rVG6ty5cmLA==
X-Received: by 10.25.195.76 with SMTP id t73mr9096548lff.40.1485254046847;
	Tue, 24 Jan 2017 02:34:06 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f25sm7290715lji.26.2017.01.24.02.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 02:34:05 -0800 (PST)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <502e675a-bdaa-3acd-5343-5cb2f40f2a7a@mender.io>
	<CAHiDW_HwmNybt8AuLWBtMSW=8R1SO3GBChRmwtCkWkmq3bFB0g@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <44423ebc-3760-3da5-2cc0-45a95f62ac7c@mender.io>
Date: Tue, 24 Jan 2017 11:34:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HwmNybt8AuLWBtMSW=8R1SO3GBChRmwtCkWkmq3bFB0g@mail.gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroots: New failure to compile Go
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
X-List-Received-Date: Tue, 24 Jan 2017 10:34:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 24/01/17 11:17, Jussi Kukkonen wrote:
> On 24 January 2017 at 11:36, Kristian Amlie <kristian.amlie@mender.io
> <mailto:kristian.amlie@mender.io>> wrote:
> [snip]
> 
>     /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3/pkg/tool/linux_amd64/6l:
>     readsym out of sync
>     | WARNING: exit code 2 from a shell command.
>     | ERROR: Function failed: do_compile (log file is located at
>     /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566)
>     ERROR: Task
>     (virtual:native:/home/jenkins/workspace/yoctobuild/oe-meta-go/recipes-devtools/go/go_1.7.4.bb:do_compile)
>     failed with exit code '1'
>     -----------------------------------------------
> 
>     Note in particular the "readsym out of sync", which appears to be the
>     heart of the problem.
> 
>     Using git bisect I have verified that it is the commit
>     9107d6ca144ac1f6169830dee25dae2dad775333, the introduction of recipe
>     specific sysroots, that breaks the build. However, I cannot see an
>     obvious link between the two, the error looks very internal to Go. Any
>     clue what's going on?
> 
> 
> This could be a symptom of a missing dependency in the go (or
> go-bootstrap) recipe: the recipe specific sysroot only contains the
> specified build dependencies unlike the previous system where the
> sysroot typically contained loads of other things as well.

Probably. I've been looking at the dependencies for gcc-cross, which
should be similar, but no luck so far.

-- 
Kristian

