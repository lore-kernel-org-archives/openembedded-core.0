Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id E109165C5C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 09:25:35 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id f92so77515245qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XiJFbxaLlXSZ6xlMckXvJE7gOkhqv7nlA7rg0Oc+Ubc=;
	b=Irz0LTxuF6hSrdTCmUFsL6WMEFjWgA/6EXKAZw5H39xHqS0PFCRI3+BEZP2MNzwzrb
	EvXkvFMgbIMtVksF46WjdrcvBqkAj7NWSAAt4eNxIP6GUKrskWj3K48QAy4HsHtSBax1
	VEuQx2IiRfzslXNSrbOp72cc5epCUccmTK0vLj8GWzV4TVGjE7yw9wUf3QkB5phUtYBH
	bGJp3dt2QfR8f1MM/sjJV1ojDFhwEow00DvWFT61uGet8+5R4YM/TPGPEjOr+pC972NS
	mTgFLGBXtgZ6brLDq5UW9j1hJVvUbM/N3HmQJs9NNxoXK952f1dc4I07t3rJe4LmX1wb
	iPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XiJFbxaLlXSZ6xlMckXvJE7gOkhqv7nlA7rg0Oc+Ubc=;
	b=QD7/xQwCGhaIxOwszKBMTITcRGlxVgjjr7ZawjW8l9XgJrkagIhXLNQvw1CVRQXrVD
	URoak19kEiO/wNfoV99BskdVeeuB2PPahHODzMadt6HI+1/KbvQ+IhK0k/LtYy6gEP3h
	a6Y9Wu5IXe0vcJ+vd3iHnZnjznpEHpM5tKf3doubUjvcAjZxFk1rGxjAuVyo9I0oVjYI
	SL44m/ifywoyDf95pTSPFH3WTR2yMOuHgjl9L1gOvOQ/CQp+1IkEEFPjcEKKq2IPNeB8
	i4IBhGWCkl759cez6SR7CWswRKCsoVlkLWdbTLcJ0yRb90dq8D80fmWFs7UvRhKoMwu0
	fs0Q==
X-Gm-Message-State: AOPr4FVCOrMB0Lw4CaAnoATbMXwdLItUryAgnHkfDdFXSjdh1ke84Cipv2tQGrMi3Gn7y+9h+O5N1hC0MIY6tQ==
X-Received: by 10.140.150.20 with SMTP id 20mr24832972qhw.98.1463304335912;
	Sun, 15 May 2016 02:25:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 15 May 2016 02:25:06 -0700 (PDT)
In-Reply-To: <1463295824.9746.152.camel@linuxfoundation.org>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 May 2016 02:25:06 -0700
Message-ID: <CAMKF1spXkA9+x62pzj9ukt0uKdmmWW3BMcKPCbpRgVC7Qbve6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Sun, 15 May 2016 09:25:38 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 15, 2016 at 12:03 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-05-13 at 09:46 -0700, Khem Raj wrote:
>> gcc 6.1, glibc 2.24, gdb 7.11
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/distro/include/tcmode-default.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> I'll merge most of this series however before we can move to gcc6 by
> default there are some remaining issues:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
> uilds/788/steps/BuildImages/logs/stdio
>
> qt4-x11-free fails to compile

This can be fixed easily. I will see if I can cook up one.

> linux-yocto 4.1 also fails

I am sure if we upgrade to latest point release of 4.1 then most of
fixes may be available.
but there are more than 1 fixes that would require backport

>
> (on qemux86-64, qemux86, qemuppc, qemumips, qemuarm)
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/7
> 78/steps/BuildImages_1/logs/stdio
>
> linux-yocto 4.4 fails on ppc
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/bui
> lds/768/steps/BuildImages/logs/stdio

This patch https://patchwork.ozlabs.org/patch/614548/ is required and
I gave pointers for that to Bruce
and was hoping that with
http://git.openembedded.org/openembedded-core/commit/?id=f1c75b93a4e11425e595c5ce043fbb0276a41931
the above fix is bundled in but Bruce might be able to conform.


>
> non-GPLv3 on elfutils and diffutils

Yes, now, I wonder if we can backport fixes from newer versions and
still call it GPL-2 without getting
consent from patch authors. This is going to be a bit twisted.

>
> (There may be other failures too, the build hasn't completed yet)
>
> We'll need to come up with a plan to address these issues (possibly
> upgrades for some of the kernels?) before we can change the defaults.
>
> Cheers,
>
> Richard
>
>

