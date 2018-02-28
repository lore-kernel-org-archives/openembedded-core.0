Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5720D78255
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 11:42:49 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id c12so1518959oic.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=SwsxFPUwD6ZoXztz0Ko0pZXmSDMp9jtGfGUJhVNdlL0=;
	b=Mv8evTfIHwUP7RzuN2gZ81/o6k4/X+CMKatVav18dO+99MPLwFJUX6wNNrmRY0HHt/
	RMF7vJCtWALtjjXXPm3NSCvzjzISqK+sWuOOpojY7hkpopJe0Vsm6RwVICZ10JlFdCLb
	sq9UjnjKDY9WJDzHn2JxR0BlGcqcrCUhP2xBqgGcWPwDaRTrZkRTGruRrOKuBmDwJMrL
	YGljgdN8cF9l+xfJbFimn5w66HFmhQRPSl4zLRLPCM64SWddcDMFB03j9AgYLRNbnjfN
	WjxGEo2TmfO9kLlcv9FaJStLTQjsKdEZeD/f4/mxH+CesJ7Mmap/tY8s1738yRzrcpWS
	l/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=SwsxFPUwD6ZoXztz0Ko0pZXmSDMp9jtGfGUJhVNdlL0=;
	b=sGIZKn5XSXMXydfhM/rHS9D+OaxXsIuNBvYPfUlNlEgDGgT4EaOz2iPk9NWL4h6LqY
	ciQyi0zR8NJUppJQF3wIcrjxKHjIppQc7yeKVl9OF9gW2qSDBqedVCHI3uHtpzT9w++d
	E6Gcm4ubXx+XslIFcX6lSCaXoicsgGNMTFP9MTwfpjI0Y9G4FudmXrcjQW1HdzqLdYwZ
	63Gcc3lGV1vUvVVeMYmqC+TmELCWJmbFUuAcIGPgN2Ng+VSDlNMvn99oyFLwqf29GMAu
	UeBZZqhDYixPF9w/OSr4MSmR1R5lAleHwcHLLfI5utab8BgxI0j1Ul2a7QH99NG/ys0N
	VJ+w==
X-Gm-Message-State: APf1xPDm9oYXlRqna2sWs+0X9RSqEUMHtVpcIk9Mud2sT+XBC+2BLJTH
	vmbL3GNskbZQMQUvaAGt0g6/Ff42
X-Google-Smtp-Source: AG47ELtwcrg0O+94f+TFKDQPumlanU+Gh3lk69QYsGx2+8DBBXBdP1xyblK34ELFM7lYRkuRLxT78g==
X-Received: by 10.202.208.214 with SMTP id j83mr11405595oiy.95.1519818170706; 
	Wed, 28 Feb 2018 03:42:50 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50])
	by smtp.gmail.com with ESMTPSA id q47sm701846ota.39.2018.02.28.03.42.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Feb 2018 03:42:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id c83so1537346oib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:42:49 -0800 (PST)
X-Received: by 10.202.235.12 with SMTP id j12mr10825296oih.284.1519818168853; 
	Wed, 28 Feb 2018 03:42:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Wed, 28 Feb 2018 03:42:48 -0800 (PST)
In-Reply-To: <1519817857.3436.4.camel@linuxfoundation.org>
References: <20180227123634.2812-1-matt@madison.systems>
	<CAP9ODKpB38Kpfj3EUdGNM+dL_A0VM03mP0isV4Vg_0DZ8Jw14w@mail.gmail.com>
	<1519814861.3436.1.camel@linuxfoundation.org>
	<1519817857.3436.4.camel@linuxfoundation.org>
Date: Wed, 28 Feb 2018 08:42:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKox=QJKUuuvSGb7dRebKG17oFCUVOdQVNQ1vOfm5KxiZQ@mail.gmail.com>
Message-ID: <CAP9ODKox=QJKUuuvSGb7dRebKG17oFCUVOdQVNQ1vOfm5KxiZQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/8] go1.10 update and misc improvements
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
X-List-Received-Date: Wed, 28 Feb 2018 11:42:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 28, 2018 at 8:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-02-28 at 10:47 +0000, Richard Purdie wrote:
>> On Tue, 2018-02-27 at 14:16 -0300, Otavio Salvador wrote:
>> >
>> > On Tue, Feb 27, 2018 at 9:36 AM, Matt Madison <matt@madison.systems
>> > >
>> > wrote:
>> > >
>> > >
>> > > New in v2:
>> > >     * Fixed Upstream-Status line in go patches
>> > >     * Added GOTMPDIR to do_configure[dirs]
>> > >
>> > > Updates to the go recipes and bbclasses for go1.10, which
>> > > moves the bulk of the toolchain bootstrap and build out
>> > > of the 'make.bash' script and to the 'dist' tool.  This
>> > > required a rework of the patches.
>> > >
>> > > go1.10 introduces significant changes to the go build
>> > > tool as well, requiring some further patches to make
>> > > it work for OE builds.
>> > >
>> > > See https://golang.org/doc/go1.10 for a complete list
>> > > of new features and changes.
>> > >
>> > > Following the update are some cleanup/improvement
>> > > patches.
>> > I tested those patches and they are working fine. I pinged Matt
>> > specifically about one patch that seems that could be simplified.
>> > So
>> > please wait until we get back on this before merging it.
>> >
>> > If possible to put this on MUT so we see if any issue is raised up,
>> > it'd be good as well :-)
>> I tested it in -next, one issue:
>>
>> FAIL: test_go_dep_build (gotoolchain.oeGoToolchainSelfTest)
>>
>> from https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds
>> /8
>> 57/steps/Running%20oe-selftest/logs/stdio
>>
>> (can reproduce with oe-selftest -r
>> gotoolchain.oeGoToolchainSelfTest.test_go_dep_build)
>
> Also: https://autobuilder.yocto.io/builders/nightly-world-lsb/builds/791/steps/BuildImages/logs/stdio
>
>
> Summary: 6 tasks failed:
>   virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_compile
>   virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-devtools/glide/glide_0.13.1.bb:do_compile
>   virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_compile
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_compile
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-devtools/glide/glide_0.13.1.bb:do_compile
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_compile

Just to confirm, was it using v2? I had problems with v1.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

