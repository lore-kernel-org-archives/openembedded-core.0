Return-Path: <jandryuk@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5A165CE9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 19:30:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b20so5082121lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 11:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jp8oZtAXFtMglEDvhX5hHGvcpUjR4rWhqmYhqITJxCc=;
	b=P9WxUBZqiNEcl54k7gJzoBIKRx4ys9D4zRT/WFLyf7zXY9QNeCr0oUDgdyu3CtN3j8
	UBvpxP7UQK2wXNqLiMT7CPclo1WoJUMXmzyJwDKbznTXuxvHGwgKC1NssIZZ0b/7OjWv
	Rf9SesAR1vwIzHn5UddNjPizVLpDL1m1j9CJnK5kEIuf8OKYlcexpIyH/iC9RIo2i7Ap
	J8Sb1NUMrO1yB4nxeC3GdHm1Zgu1nXqslNNM8SF+pVCpq8MZVxq4qwXkshuENxCKzMg6
	X7/VSI/jo9IA3u6G0dQqF8+k8Fwg4dJh1QxP8Xj/0hb8DaazPHkArpBkWVKg/aOzgBqW
	Z+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jp8oZtAXFtMglEDvhX5hHGvcpUjR4rWhqmYhqITJxCc=;
	b=RokGre1aiT/qHCBZy8Ipx0QmRDmB21p1pKfIAGRAv3HhchI5lEi0W/iEScdHsDYPzL
	uUjfbsL63T76bOrt349fwHDv4I+EDb9fWqUBbG2qRQuzR3zakmXnbJrfal1xQHsPyixu
	WG4ZgvSsHh/O0CFXG/JnuXcXQdy1pzVQ2LfiptY1x0bEKm0Gm+z8o8vI3yE6O76iZl5m
	rvXibhRZ//sKA8cL9v+h11g8jIlpiOsgTFDlprP6MAqzAAmIagoSTubTgMkaTLBHpIk3
	vGhu9vLIFlTZVGteBcGIH4tum5z9Ja1yXHHeo9mnIm1TkiBBhHHjObfns+ePgsCqxq1m
	4WhA==
X-Gm-Message-State: AA+aEWayeoPqkTf2+Cslg2VarX6q8VEzDVwQFwX6q8mzPXT4ifuMf0Z5
	IOcYj1u3w8W7insGCcP9xLIlhk7FqjIKDL1ajOs=
X-Google-Smtp-Source: AFSGD/Xz+51pQr430OMtYigGhTMONGMw5iAVABRkhnFXiGtv8JwEi0Bqce10ggSuy60HoWl0pJgEk9o0lIw3hDm6RN8=
X-Received: by 2002:a19:1d0d:: with SMTP id d13mr2463052lfd.74.1544815850561; 
	Fri, 14 Dec 2018 11:30:50 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
In-Reply-To: <08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 14 Dec 2018 14:30:38 -0500
Message-ID: <CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Fri, 14 Dec 2018 19:30:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 11, 2018 at 10:02 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-12-11 at 08:42 -0500, Jason Andryuk wrote:
> > Has anyone ever seen a generated shell script missing functions?
> >
> > I have an OpenXT/OpenEmbedded setup where I had run many successful
> > builds.  I made a change and then re-ran the build - it failed in
> > binutil's do_install with autotools_do_install command not found.
> >
> > core2-64-oe-linux/binutils/2.28-r0/temp/run.do_install.11776: line
> > 124: autotools_do_install: command not found
> >
> > Sure enough, autotools_do_install is not in run.do_install.
> >
> > I had not changed binutils or any relevant variable, as far as I can
> > tell.  If I run with '-e' I see the full autotools_do_install
> > function in the output.  For some reason, the generated script wasn't
> > including autotools_do_install.
> >
> > I tried binutils -c cleansstate, but that didn't work.  I tried
> > pruning the sstate-cache dir, but that didn't work.  I tried deleting
> > tmp-glibc and sstate-cache, but it had the same error when I rebuilt.
> >
> > Modifying binutils do_install by adding a comment and `true` lets it
> > builds.
> >
> > I saw something similar one other time where the generated script was
> > missing a function.  I can't recall the details, but it was a
> > different package and MACHINE.
> >
> > Any suggestions on debugging this?
>
> It sounds like pysh in bitbake wasn't able to see a dependency on the
> function in question. Creating a small/reproducible test case would be
> how I'd approach it, there are tests on the pysh code in bitbake-
> selftest for example.
>
> Once I had a test case which failed, I'd then use that to debug and see
> if I could figure out a fix.

Thanks, Richard.

I wasn't sure how to tie into the pysh stuff, but that got me poking
around in bitbake/lib/bb/codeparser.py .  Adding debug messages to
parse_shell(), I see that do_install is found in the CodeParserCache,
bb_codeparser.dat, but the returned `execs` do not include
autotools_do_install.  Strangely, it includes a path to python -
...core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python.
It looks like `execs` could be for `distutils_do_install`.  And again,
strangely, python-async is not in my tmp-glibc.  It must have been
built at some point which left the entry in bb_codeparser.dat.

I built python-async, but its distutils_do_install hash value does not
match the one in the cache.

Moving cache/bb_codeparser.dat out of the way, bitbake complains:
ERROR: When reparsing
/home/build/openxt/build/repos/openembedded-core/meta/recipes-devtools/binutils/binutils_2.28.bb.do_install,
the basehash value changed from 80812e0772cf901b51790c205564070d to
493152cd3740c5420d0bf7a5d09df001. The metadata is not deterministic
and this needs to be fixed.

`cleanall` does not clear out the message, but the package builds.

Regards,
Jason

