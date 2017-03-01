Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id D63F9774D8;
	Wed,  1 Mar 2017 23:14:04 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id q7so26095162uaf.2;
	Wed, 01 Mar 2017 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JrQ5uNc6Rdt4ybkYxOrbmThL4Gep0PfoISulOHUMIkU=;
	b=J/Jv1kGO0u2IkJYTAQzCf2uABxTRUL//JJ1YnnZ8nBXTRP2Ou5jMth8twLqsI97bc/
	DcaheXqYNmwgrcKtn1IFjAyFp29hTTlX962evW9hFgGaHIYd4NFZfSzDytZzk3bjJXw+
	af3MGUvo0poJOZvVuTwKLGmhe/zGnDT6an5SN0w8a0WlTib4Yl9oNy/7cTUILSwwzu7z
	7tVMqajcpQOnVxAqKkP8zhuSBTQBn/iAYlCW5kVTd5sHmKZS8oqyXNLbpGWDyrnmXXQp
	Dk/VCv9rCd+uYxlCFHVXwZZfYXOP4++4cJeGQrwwH5Q5Un1wZ7G18In566K2dxmfWOjr
	k7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JrQ5uNc6Rdt4ybkYxOrbmThL4Gep0PfoISulOHUMIkU=;
	b=s+99F4kCSFonXveMd5Pn+Qka2bX7mPSoYI872JAThyOKLaOXYAygq9sVuiECFLUZiW
	QPhohZ7JiEGYM6vaxVR+mih3dcjQ59vwK5rafJ0EWauyocyoQ9RNYenLCnAuyLDx0jqi
	5+kMagMz/QIGk9GW5mBZD7GI94gyEr0n4bXp2Z9WlxreEjtVB6vHF2BYaeuHDdoDEWgX
	VM2EIIOSuF2Vx+S/YkkNFwn5UN142IytqU1SRBe1dgQtTLqlaAKiQrB7mwO5XO9xkD4U
	Mun9BIZxbt0lv6lNZRqxw8bNMFujAVtP3CQu2FdaHrwJjfPxWp0Dvo2mDR9m9gPcT37j
	h3dw==
X-Gm-Message-State: AMke39km9vg20WYqPKjTLn7JEm4VGNu2xjMhPVZXZhKec5taneMS0AXSQzr5EIS5vLEdXUVjRn1oESVvp4DUHA==
X-Received: by 10.31.3.83 with SMTP id 80mr1602850vkd.64.1488410045659; Wed,
	01 Mar 2017 15:14:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Wed, 1 Mar 2017 15:14:05 -0800 (PST)
In-Reply-To: <20170301195550.GE3290@jama>
References: <20170301195550.GE3290@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 2 Mar 2017 00:14:05 +0100
Message-ID: <CALbNGRTO37A-tbDj93nuNi0vu6h3fJg7Wg6P6N8asz45e8H9bg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-03-01
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
X-List-Received-Date: Wed, 01 Mar 2017 23:14:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 1, 2017 at 8:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>     * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compile_ptest_base
Before Martin blacklists gparted for dependency :)

1. Autobuilder error log says:

| ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined
reference to 'uuid_generate'
| collect2: error: ld returned 1 exit status
| Makefile:1422: recipe for target 'fs-resize' failed
| make: *** [fs-resize] Error 1
| make: Leaving directory
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/parted/3.2-r1/build/tests'
| ERROR: Function failed: do_compile_ptest_base (log file is located
at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/parted/3.2-r1/temp/log.do_compile_ptest_base.7114)

2. grepping in gparted's source
[superandy@very-old-builder parted-3.2]$ grep -r uuid_generate
configure.ac:AC_CHECK_LIB([uuid], [uuid_generate], [UUID_LIBS="-luuid"],
<...>

I think adding ossp-uuid to DEPENDS will do. My problem: all my build
machines are busy with environments other than master so I cannot
test. Will send out a patch during weekend. If somebody wants to send
sooner: feel free.

Andreas

