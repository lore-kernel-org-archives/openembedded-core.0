Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56C227E729
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 08:13:11 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so2766401iop.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nIzbuPiXkKiqffcfOeL7qS3risZEojTomtDGoBRtR00=;
	b=tfS3C4LJr+x1CYK69BDgog3HsEILNjXlGqZSirW8SNnO+U+dweBPV9WhYXZE2PWcB6
	VopdrGHs8UnGCL/AGvPE/5UDvon3v2eavORWq4j6krdsmUC9rm9nR1LC4SmjyAk51TKl
	+ffnmWWJUMyidkqHXguv63DcegTA7iznBF+EnEfb0Kbc8pz14GnIC1NDWRstUyYW6kjD
	Ln0pc56OhhAU62FUvwg2C4WkJwDwxSqp3Pg5P/h374+oq/91pcwlyt4wzLoad1gT/X38
	PmHDNY5z9EHLZ0NP82MBoMyXj7Sq74jEs77nbBUsLHx14Cpox7wso0/Y3cJLWv64km+B
	Oo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nIzbuPiXkKiqffcfOeL7qS3risZEojTomtDGoBRtR00=;
	b=dgE1uI61Zt39p72Ho6PKTfROJwfFy6KJs6JGVSrkUAUlLnEv21VkYk6M+6EBsVi0Cx
	4A9xD/tNuJFaY4R8xo7CghxdCQKego0lb0xY1jE3u0PDyjn3tOlF7b5CvgT95MkT8HsI
	lVkwiZhle/5zDIhbhGL8PUQKvWDykXF0taGxOrKcWhwoBLftsCFy8xL2XV+KoZiTY+7P
	INvD7ZZKKfDyfDqVU5BbGXtF57vGGyZIfVXHk3UmTAf4RKZVtTqu3qppKVtN9Fvkb7gR
	eApppJERWOZOQLMigpsyy2bNbzEDCO20ZnXzkqcLiX/Djk9lt9MsPlB0G6orRMpY63jv
	aEYw==
X-Gm-Message-State: APjAAAUMwFaTsIdgJc/QHA7J/GXRzl0udjYQkcw6pA1DxUY06E42RuAu
	B6pauR9YmJ8SOk1EFalFDVT5P6bKpideC+UJPcnS1jjD
X-Google-Smtp-Source: APXvYqxjDSXKhODucYzVD9CAq+BxZcjo3qIZY115FpgWLHYzjxFXLSgn4lBiaR7rCkaRD0NmZRkGuGpx7fXGe+0maY4=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr30143375iot.200.1562141592310; 
	Wed, 03 Jul 2019 01:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190702152248.13678-1-ross.burton@intel.com>
	<20190702152248.13678-2-ross.burton@intel.com>
	<84dceda550ae94d4a899ea42dd0f59c5462baeda.camel@linuxfoundation.org>
In-Reply-To: <84dceda550ae94d4a899ea42dd0f59c5462baeda.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jul 2019 09:13:00 +0100
Message-ID: <CAJTo0LZpGXXh6CK2x4QVyo1banhG-oBX7xQ34w+hD2_7a1X1Jw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] multilib_script: use MLPREFIX instead of libdir when renaming
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
X-List-Received-Date: Wed, 03 Jul 2019 08:13:11 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah discovered that late last night here too.  V2 finalising now.

Ross

On Wed, 3 Jul 2019 at 09:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-07-02 at 16:22 +0100, Ross Burton wrote:
> > Instead of using part of ${base_libdir} to rename scripts, use
> > MLPREFIX.  This
> > is more obvious as MLPREFIX is a common prefix in package names, and
> > as these
> > filenames are hidden behind alternatives they're rarely used
> > directly.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/classes/multilib_script.bbclass | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
>
> This appears to have some issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/794
>
> Cheers,
>
> Richard
>

