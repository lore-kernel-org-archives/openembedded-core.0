Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81C5960589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 20:07:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so110787wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H85ce7pRxPgB+WxG9FrcvP51s8XCjc8cp+i1S1nBuQI=;
	b=cZRn5VeduLXJizzkbkZ/Zk4jGVmGNCxFtXeCvRKN61TY/82BwYzkN1jFrA+SjKGOd1
	s619icYvTqSTlS36gUFdoYFLBUmUj65sJVLumx+m/XKt6HN11BSy9SafmA1R5Q2hdp9q
	ODepCBZ2SbtJ2w3zmrGOFwp6KHZekZBJzwbmLxujkrZRZtSIrdxUFD1hwayCLxB8LTOT
	xP8sFldWAlQb/iCpL8qx1hwbtEFi6D7v7S3iAAfEathQydWzggG0AyiNzXyU6n0Ibr68
	X5evUQuJIuALUMxPOlH3EbOYydWcqWAkm6EGKd4pxv/rVpppuB7UKOMB+Qk0cylV/1m5
	PHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H85ce7pRxPgB+WxG9FrcvP51s8XCjc8cp+i1S1nBuQI=;
	b=lhHxn/7O/YyDyA66M8e/mdOliVoS2EgyVCU3E3s1TMgMzgjWwZAaQmXrHp7u77B8oG
	3RWLGubdG1fHh6aJl/xjTWXDh2YRD+AUtR60/0AxVHIhlRgHUq/pfBJxPFpbczy7gV+7
	Kz7E4CjbgFfFc05rt+0SA5kc65BUR9otOleEuoIu/qjrSmwG6ZTaxEVALeR9A8JW1ln9
	lPBxq2MxmJblkveb3SP9Yqg0ED/mNv6IT3neFC0vUlA9a6qEhWr+vYaNhnHSQoYjgMFi
	kcM/Bq+pbNaQYdnMztUzAqJB3b5c1z8/SOhnegxAjENwRtT2qUSK45/wJ453NcmEaCnC
	JSdw==
X-Gm-Message-State: ALyK8tIqkvY8lXh+mOCn9GTEdZ3KfXP7yup1Im+vbSwjrGx2L5EA7k7eIC2Ho2oZk1uKgg==
X-Received: by 10.28.158.87 with SMTP id h84mr137947wme.43.1468872455663;
	Mon, 18 Jul 2016 13:07:35 -0700 (PDT)
Received: from Saturn.local.all (212-41-108-41.adsl.solnet.ch. [212.41.108.41])
	by smtp.gmail.com with ESMTPSA id
	le1sm2904865wjb.15.2016.07.18.13.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 13:07:34 -0700 (PDT)
Message-ID: <1468872453.3253.9.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 22:07:33 +0200
In-Reply-To: <1459719934.7348.141.camel@linuxfoundation.org>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 18 Jul 2016 20:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Sonntag, den 03.04.2016, 22:45 +0100 schrieb Richard Purdie:
> On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:
> > Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
> > 
> > Source files deployed with the *-dbg packages are owned by the user
> > running bitbake leading to warnings as the one below.
> > 
> > WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc
> > -dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by
> > uid
> > 1000, which is the same as the user running bitbake. This may be
> > due
> > to host contamination
> > glibc: /glibc-dbg/usr/src/debug/glibc/2.23
> > -r0/git/include/monetary.h
> > is owned by uid 1000, which is the same as the user running
> > bitbake.
> > This may be due to host contamination
> > glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h
> > is
> > owned by uid 1000, which is the same as the user running bitbake.
> > This may be due to host contamination
> > ...
> > 
> > The files are copied as part of the do_package task.
> > The patch chowns all file in packages/usr/src after cpio copied
> > them
> > into the
> > package directory.
> > 
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> > 
> > 
> >  meta/classes/package.bbclass | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/meta/classes/package.bbclass
> > b/meta/classes/package.bbclass
> > index bdbe96d..d9ef62c 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
> >      # and copied to the destination here.
> >  
> >      import stat
> > +    import subprocess
> >  
> >      sourcefile = d.expand("${WORKDIR}/debugsources.list")
> >      if debugsrcdir and os.path.isfile(sourcefile):
> > @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
> >          if retval:
> >              bb.fatal("debugsrc symlink fixup failed with exit code
> > %s (cmd was %s)" % (retval, cmd))
> >  
> > +        # cpio --no-preserve-owner does not create the destination
> > files with
> > +        # owner root even when run under pseudo, chown them
> > explicitely.
> 
> How about passing --owner=0:0 to cpio? 
> 
> I'm a little worried about why I don't see this failure on my own
> local
> builds.
> 
> We have a few cases where things sometimes seem to work out and
> sometimes don't and I'd love to get to the bottom of how to reproduce
> it and to understand why its different for different people.

I finally got enough time to investigate further.

I found cpio -l (i.e. createing hardlinks) under pseudo does not set
the owner to root, neither width --no-preserve-owner nor width -
-owner=0:0.

The file ownership in yocto is corrected later with fs-perms.txt.
Angstrom does provide its own fs perms configuration which disables the
oe-core fs-perms.txt. But due to a bug the angstrom file is not active.
Patch sent to the angstrom ML.
http://article.gmane.org/gmane.linux.distributions.angstrom.devel/7856

Max

> Cheers,
> 
> Richard

