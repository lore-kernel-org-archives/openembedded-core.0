Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id E69236007A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 12:23:05 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id z18so7094908vso.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 04:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fnPOvXtjPMpq136GO+CWvKgYpmDvs6pkdLCVvIky/GY=;
	b=kotpz9WWwBgZO6G5CWKnoGqvshbt/JodKNOysvElzX2Xv7A/rNOS8/W5dY3/v0QR7D
	cOJK5vfUOMgUgjm84gW30mEO9ccwUu8wAwMnnbshgZTY+ibrzOa8VKZCHmzmQfZeYjfh
	qgrO+IPGEeC39fqaa4i8F7objtHZ9A8YIzsjMVa/kMr4uMd9Q+XVSboaWcpzrhF/o3zK
	GWgxzB8ALqSQfxqiPC/XNcg8GIA5SxHtV9MrvUcZOs1g3Adb5kG7fp4zGgoq/IHIbTrz
	P0O02WnieBOCD0dXOA/Sx1++m0RzcbJ6lfZFnfSLcRCtm7dERqFvQ6vw1o78Ck7uXKha
	YE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fnPOvXtjPMpq136GO+CWvKgYpmDvs6pkdLCVvIky/GY=;
	b=lyCq4OIIU2d+n/83/OzZW0Xn7U1PKcORx3XkrrkF86hdWqeeqveAv6wa7xHTt6x5vp
	cdPHZ+AvnKBLNuVdX0mBMtP7Ze/y90U1xvRWqmLxVN8d5bh1UMD76WNCcIeyEH9ITr2Y
	bpK3OVCNxlbSU+q8rgT3pBuy6gEzskN2LMNLPft9GVG0MY9eLXPoeLGQALpYl9Un4INo
	hghLzi845GKmgFVmZ3F6jLaXgPZWixrPP+6xqcE5+k7PR45zh5de+SEepJkuq1DE0XQ6
	MscmzkH5teIUMSqK0cV64rY3A8MKxNP+Dxu2sHhczWnAKMxz1PijjRZZRhzcWg/2cPLi
	d1/Q==
X-Gm-Message-State: AHQUAuZPM/83srNtf8jMgftBdJMAG9gvBuwO2BKIB4udZEEbJARJ4tUQ
	LYZlnYhk34ow8JyC+hb68lNw4WI4OqTlg4/IByY=
X-Google-Smtp-Source: AHgI3IY6eYzaUjmFAsKH+uY4jpuY0CUTr/HLIecmL4VIdwip/UysonuUkJyx5zL7Uj3OWykoBKZEBhNWA0WXxmKyC6g=
X-Received: by 2002:a67:7d06:: with SMTP id y6mr7691938vsc.22.1550319786640;
	Sat, 16 Feb 2019 04:23:06 -0800 (PST)
MIME-Version: 1.0
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<76d71f8af98a4ebe6154ff5b7ebb59ccf989408b.camel@linuxfoundation.org>
	<CAO5Uq5R=cFd3h4QLmF_b=5iJORG2C2Zo3BXwtDL2MkR+PfucCA@mail.gmail.com>
	<689a3e6f6f81d9f9e300ea5d0d0e9641f753d87b.camel@linuxfoundation.org>
In-Reply-To: <689a3e6f6f81d9f9e300ea5d0d0e9641f753d87b.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 16 Feb 2019 12:22:55 +0000
Message-ID: <CAO5Uq5Q=GWBrsUGpk=uMGRrBapcnmB31XwYLve7OuhiXNOvp7g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Sat, 16 Feb 2019 12:23:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 16, 2019 at 11:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-02-16 at 09:25 +0000, Alex Kiernan wrote:
> > On Fri, Feb 15, 2019 at 11:16 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2019-02-14 at 21:09 +0000, Alex Kiernan wrote:
> > > > bmap-tools 3.5 was released August 2018 but has no release tarball,
> > > > so
> > > > switch to using the git fetcher. Also pull in the fix for
> > > > StopIteration
> > > > being transformed into RuntimeError for Python 3.7.
> > > >
> > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > >
> > > Unfortunately this triggers a selftest failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/236
> > >
> > > (ignore the virtgl piece, that is something else)
> > >
> > > oe-selftest -r wic.Wic2.test_bmap_short
> > > and
> > > oe-selftest -r wic.Wic2.test_bmap_long
> > >
> > > should reproduce. Might be as simple as a missing RDEPENDS.
> > >
> >
> > Looks like it's gained a dependency on six. And thanks for the
> > reproducing steps - I've never got to grips with that stuff before.
> >
> > That said I'm struggling to get the tests to actually pass. I've
> > added
> > in python3-six to RDEPENDS, but it still fails with
> > `ModuleNotFoundError: No module named 'six'`?
>
> We appear to have walked into spools of razor wire :/
>
> This is an open bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10113
>
> which I'm struggling to know how to fix.
>
> What does appear to work locally is adding something like:
>
> # We need the native dependency on python3-six at runtime
> # See bug 10113
> EXTRASYSROOTDEPTASK = ""
> EXTRASYSROOTDEPTASK_class-native = "do_populate_sysroot"
> do_populate_sysroot[rdeptask] = "${EXTRASYSROOTDEPTASK}"
>
> Whether this is the right thing to do I'm less sure about.
>
> It may be an idea to start introducing these dependencies where we need
> them to fix bugs, until we can sort the problem properly in
> native.bbclass.
>

Thanks, that seems to work... I'd have been here forever trying to find that.

I'll send a v3 with that change in it.

-- 
Alex Kiernan

