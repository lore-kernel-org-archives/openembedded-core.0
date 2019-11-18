Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 65F547F8E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 20:11:17 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id i3so3658387qkk.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 12:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6n++6wMPi/Gv/z5VilKPKKl2DxynSQsyz2pb4UTgMY0=;
	b=IcolTb81CYdtTGX9uVYWDUOFNVGLdgNZ5B8nRSCtWkcCY7IISvwJGS4mAm63oS0nxl
	BwkMArH4cH45sJ9h/SiFrjAeJw1muYdP54qJuAOmHrlf36ybrkKCZyIft4IGevJDtxBG
	ney1+2W5jXBheKaBeMC+LtVZbL1+jG9+YpPKWdsyebfVYEGgTXxnhQr137YcoWjzVI7R
	IqV41zI5SorL6K2tETkZduWsOeBTiB+pXPBZcVmM5tHYJz4cjnC0i39AOuzc/j6Jrcx5
	KqZtyiS7AkfETLWC8yqN4vELR+/YhP43r02L8uSTlhu23YBIa+JxFyK9GiyyfHg/PjNR
	JzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6n++6wMPi/Gv/z5VilKPKKl2DxynSQsyz2pb4UTgMY0=;
	b=DhnCknAv4RGorKHccC6ADo8ekodXgp/kU5uTLNg4hWNzV2AEby04aDuMdMEda7tcl/
	pu3Fv0iYsC/XXRIEVFkMzDK8DkVY3ZpyL8v6dISDUoiYbUP5DAGxbCEgdxbhDc7JWp8e
	t4UbxN2afg7wWzQ5Gc8BKuevCFSfBrwT7zmw2SNsbhl5SOt4KLKmDq126IopdCdHU64D
	vGt7Y1zv39BkzvXmdQgluHXsQ/PtYgjrwcQvWvja/RhH1aqePFmH9zFYWu6f++xbbhQd
	UZui4rtXuphGIHwMs/oW/6TYh5G3tNlEn1iqNUb9c0qkmdtJQcT4zMFoewTtmBqaA2xS
	ihoQ==
X-Gm-Message-State: APjAAAWzmKybCjz0WkAZfb9c3KsecOCIyJaY1mQ3zVk2u85iK5pzna0I
	7L8C7NP/SaPhvA7u9bKiVNmJRjdYQM/6iRnBkN4gnr/f
X-Google-Smtp-Source: APXvYqwolhhVpamfW3B89eTlWiD98Nm2NQ3Z+jPJGsAwndKEYrB/imbuJZhwSpMaxcIkuwm+P1xMauK319pfmyD22ss=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr20316119qkg.71.1574107877867; 
	Mon, 18 Nov 2019 12:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20191118171730.153048-1-mark.hatle@kernel.crashing.org>
	<878a811e-0649-e67e-159f-97de89fa5909@kernel.crashing.org>
In-Reply-To: <878a811e-0649-e67e-159f-97de89fa5909@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Nov 2019 12:10:49 -0800
Message-ID: <CAMKF1sqZcHvvdVu-VphF56QKH0Zx6Zr6A9G7uSd-o=+Uq9eqCQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Add PREFIX and EXEC_PREFIX to gccrelocprefix section
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
X-List-Received-Date: Mon, 18 Nov 2019 20:11:17 -0000
Content-Type: text/plain; charset="UTF-8"

thanks the patch in general looks ok. I will give it a try this week as well.

On Mon, Nov 18, 2019 at 9:34 AM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 11/18/19 11:17 AM, Mark Hatle wrote:
> > I have an unusual use-case that requires me to move the location of gcc.
> > As part of this, I noticed that the built-in include paths were not being
> > runtime relocated, while other paths were.  It turns out this was becaue
> > PREFIX/EXEC_PREFIX were being used as defined at build time, but the other
> > prefixes were being used as relocated at SDK install time.
> >
> > The patch set corrects this and adds PREFIX/EXEC_PREFIX to the list.  There
> > is no test case for this, as I'm not sure how we could ever test this with
> > the standard OE SDKs.
> >
> > The way I tested this code change was:
> >
> > bitbake meta-toolchain
> >
> > install the SDK
> >
> > wrap all of the executables in the HOST sysroot with:
> >
> > exec <LDSO> --library-path <LIBPATH>:<LIBBASEPATH> <executable> $@
> >
> > mv the 'installed' version else where and then build a simple hellow world
> > application.
> >
> > Doing this before the change resulted in 'unable to find <stddef.h>', after
> > the change it works as expected.  Use the '-v' to inspect what it was doing
> > it was clear that runtime relocation was NOT relocating the system include
> > paths before the change.
>
> Forgot to mention, I also tested this using the regular approach of sourcing the
> environment file, and compiling using $CC.  :)
>
> --Mark
>
> > Mark Hatle (1):
> >   gcc-9.2: Update the relocation patch to add PREFIX/EXEC_PREFIX
> >
> >  ...le-sysroot-support-for-nativesdk-gcc.patch | 185 +++++++++++++++---
> >  1 file changed, 159 insertions(+), 26 deletions(-)
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

