Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7526865D53
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:51:51 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id at20so8655757iec.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zyziadUkjSLXFd2e3WfjUy+dy82U2aYRWFtwct+HzL4=;
	b=gJmZUsjAXmZduLJlev3RdNvTqgGzes7Pit2kIml1ChBw07S4BNopA8fujoqHNGjS/Y
	NwFyCYSSwK8tKpdXIJ4QppAKm0f25ktxbyu6Mm//1SZ2/ATB/Jf897JxSfx+6gAkCdmZ
	Dgt+GB8hcrRr0hkBER5PnD948oqwieB5fh3zq//Cs48FZRQde+oMLxMmZ0xxlgylC92B
	KUci6iw1xAP73J2K4rjP9U1nCCD5Y6lM2oF6udZZvIjLQypCPl4OYFrdnIWIuOgxyzkq
	dOvoeOct/i4j2mdNSPJwCz84hDWjH17WVb5VAuIVBjG3ogpSKYZbbuV7rBKb1FJbgYQb
	MstA==
X-Received: by 10.42.25.141 with SMTP id a13mr20826016icc.37.1408924313045;
	Sun, 24 Aug 2014 16:51:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sun, 24 Aug 2014 16:51:22 -0700 (PDT)
In-Reply-To: <20140822193910.GD20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Aug 2014 16:51:22 -0700
Message-ID: <CAMKF1sqb419y9M1hfUt_v6m1vZ1r=t8SYCZkmN9p91zQ+NtjZw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Sun, 24 Aug 2014 23:51:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 22, 2014 at 12:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Aug 22, 2014 at 01:33:49PM -0500, Peter Seebach wrote:
>> On Fri, 22 Aug 2014 10:44:32 -0600
>> Philip Balister <philip@balister.org> wrote:
>>
>> > Can we also move to hard float abi?
>>
>> I'd rather not, just because the reason I care about this at all is that our
>> prebuilt toolchain has a set of binaries for armv7at-neon, but not for hard
>> float ABI.
>>
>> I am reminded, though, of a question I had about all the cortex tunings:
>>
>> Why do they set DEFAULTTUNE to a tuning that isn't one of the ones using the
>> new features they define?
>
> Because it's always compromise between optimizing for given device and
> sharing the same DEFAULTTUNE (and its binary feed) for many MACHINEs supported
> by DISTRO.
>
> Even enabling thumb seems wrong, because ARM_INSTRUCTION_SET is arm by
> default, so this change is only renaming the feed, but still building
> the same binaries (unless distro sets ARM_INSTRUCTION_SET).
>
> Please check this old RFC for more details:
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg28907.html
>

yeah I agree unless we plan to change default code generation to be thumb2
this change is causing packaging nuisance. And if you want to switch
to thumb2 default thats another pandorabox which should be fixed
before this switch can be made default.

