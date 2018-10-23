Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34C3579327
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 21:20:10 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f17-v6so3223641wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 14:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j6NTumNgUbx+4M37xMHn+p5hTP5wZy4p/c74NmdQuY8=;
	b=LfFxnZaoek6PuQgxXpu3EKL9/qCbvKxEqqIh+fNrKDuGvySTQ+hoialkwpBKl8VD+l
	E7nP9GljnwD3AiT+KO+i86j0x4zJ5rWJpOHi4HAfv/ah/lrL8eYPnGu/FGr/FrhIqYma
	mBGzpgzaDIdxCwhu83ttZkLyPWMFBbCVNxT+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j6NTumNgUbx+4M37xMHn+p5hTP5wZy4p/c74NmdQuY8=;
	b=hsrW/CjhbpRQbdjjgLLqQj7UJSPd6vcs9P2cUQ749raY7/Ad/OS60RnI143+mHu6MB
	5IsynDY0NjH1ndYK53gEw0Ta4R0LYT4aiMkHSpB+WvVFrHJRwA9P7R9hqXMeDisp/K0F
	oLV4OJbL4dlV6+neKwx/sG3uVDCNAF3q/T/RKQRC1mYCUAhC5tE3Q0+zb2yEfEoLyZNK
	upQXBj6OoFN7cI0Rmi4bxM9JiIO5Fc7PwrZhwhoYfwznpcU4KXM89UfbFWXJXHSkXwuL
	hBxoAPfAKDcB0YpbnyDmfVRihySyYkCcK7VVUWvW9JLHgZ0MgW1BtyVMg+vyEussjRLX
	xLzQ==
X-Gm-Message-State: AGRZ1gKsqG5kL/CX7oqDQ9rqy3i5kBiRxNjOStAwe9NstNQH5CpSol9l
	++Dtr433jmBJNPx3uqtEXsBEtw==
X-Google-Smtp-Source: AJdET5c1pfvJ9u5T597WYug8MyDBaQ2w7y4EBRrjhvty/YiAmoqQTzlkaJkRngTkQiCcz1YVD6BjLw==
X-Received: by 2002:adf:f2c8:: with SMTP id
	d8-v6mr7588737wrp.108.1540329610697; 
	Tue, 23 Oct 2018 14:20:10 -0700 (PDT)
Received: from hex ([167.98.65.38]) by smtp.gmail.com with ESMTPSA id
	q77-v6sm3900227wmd.33.2018.10.23.14.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Oct 2018 14:20:09 -0700 (PDT)
Message-ID: <8fef24bd55de580b3d4c968f356473e224a495e5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 23 Oct 2018 22:20:09 +0100
In-Reply-To: <CAJ86T=Ww84U3V5Oghro9Pxz93KHcsOan_wmrTEu8=O9A83esjQ@mail.gmail.com>
References: <1529088192-991-1-git-send-email-armccurdy@gmail.com>
	<9be8087a3d586dd5d372954ddae61db388e39011.camel@linuxfoundation.org>
	<CAJ86T=XB+UgGZvW71x0QHb6QzwadMejBDOLEh+q0yjwO-q3yGg@mail.gmail.com>
	<CAJ86T=Ww84U3V5Oghro9Pxz93KHcsOan_wmrTEu8=O9A83esjQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides
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
X-List-Received-Date: Tue, 23 Oct 2018 21:20:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-23 at 14:18 -0700, Andre McCurdy wrote:
> On Fri, Jun 15, 2018 at 3:12 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > On Fri, Jun 15, 2018 at 2:58 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2018-06-15 at 11:43 -0700, Andre McCurdy wrote:
> > > > Following recent updates to the bitbake, the fetchers should
> > > > now all
> > > > contain safe and correct defaults for the subdirectory within
> > > > DL_DIR
> > > > to use and the base fetch command to run. It's no longer
> > > > necessary
> > > > for bitbake.conf to specify these values.
> > > > 
> > > > This is cleanup which was originally proposed in 2012:
> > > > 
> > > >   
> > > > http://lists.openembedded.org/pipermail/openembedded-core/2012-July
> > > > /064224.html
> > > > 
> > > > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > > > ---
> > > >  meta/conf/bitbake.conf | 12 ------------
> > > >  1 file changed, 12 deletions(-)
> > > > 
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index 3b2ef9f..8588684 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -349,12 +349,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' +
> > > > str(d.getVar('MACHINE'))][bool(d.getVar('M
> > > >  # The persistent cache should be shared by all builds
> > > >  PERSISTENT_DIR = "${TOPDIR}/cache"
> > > >  LOG_DIR = "${TMPDIR}/log"
> > > > -CO_DIR = "${DL_DIR}"
> > > > -CVSDIR = "${CO_DIR}/cvs"
> > > > -SVNDIR = "${CO_DIR}/svn"
> > > > -GITDIR = "${CO_DIR}/git2"
> > > > -BZRDIR = "${CO_DIR}/bzr"
> > > > -HGDIR = "${CO_DIR}/hg"
> > > > 
> > > >  STAMPS_DIR ?= "${TMPDIR}/stamps"
> > > >  STAMP =
> > > > "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-
> > > > ${PR}"
> > > > @@ -661,12 +655,6 @@ SRC_URI[vardepsexclude] += "\
> > > >  #  export DEBIAN_MIRROR = "
> > > > http://ftp.de.debian.org/debian/pool"
> > > >  #     into your local.conf
> > > > 
> > > > -FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-
> > > > server-
> > > > cert"
> > > > -FETCHCMD_cvs = "/usr/bin/env cvs"
> > > > -FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --
> > > > no-
> > > > check-certificate"
> > > > -FETCHCMD_bzr = "/usr/bin/env bzr"
> > > > -FETCHCMD_hg = "/usr/bin/env hg"
> > > > -
> > > >  SRCDATE = "${DATE}"
> > > >  SRCREV ??= "INVALID"
> > > >  AUTOREV = "${@bb.fetch2.get_autorev(d)}"
> > > 
> > > To make this work, we need to force everyone to upgrade their
> > > bitbake
> > > beyond the point where these have been added to the fetcher.
> > > 
> > > We could do that with the minimum bitbake version but I'm tempted
> > > to
> > > hold this for a but until we have another more pressing reason to
> > > bump
> > > the minimum bitbake version and then do this at the same time?
> > 
> > OK. I was assuming that anyone using master oe-core would be using
> > master bitbake too. Delaying the change going into oe-core is
> > certainly safer though.
> 
> Would now be a good time to merge this?

Last thing in 2.6 M4, no. First thing in 2.7, sure...

Cheers,

Richard


