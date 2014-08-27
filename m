Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7076A60169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 16:23:26 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id k15so430103qaq.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 09:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JGjBOQ7AVPsQ/FK1UMiLrJmu+BvH1QJrKHBYFQBJ0bc=;
	b=ZOA/umrpYmj1Yk7gCck/ub9K7SJ32bKI16N3ld4HF35JhWbaHjHMxjE+584/VPRT40
	64xyNx3Wts1FoWQ4ybJfZAFijHfn8sMn8fB9w/XkozGqPni1e4Xbao6VyFBPyrnlcdz9
	8KJbuz+fXwxVFOjY4iQ6VEPOrDhzqQmLIOjkh6HPN2xqhRhxbpy93LfqvowHJjt2v0jW
	eZE2bISa1A0KI1f1Ar+sq0BRTEmLQH3BtbM/sbGYRHwHOHWrq1X3J2VeAIwNpW1U3fA0
	kvosv7zrgy/J6CG66JEnZWuxr69fBUqEfq96fFes43IfnOgQrF0YgJnNY4yEZQUMKxtF
	XFiQ==
X-Gm-Message-State: ALoCoQl5PhI8DUk5mkuRNbvEi3gWTPB6Dql0oFcr+OVtc5A9Kcpaj4tpqiehA/vSDbNEavW3CVFR
X-Received: by 10.224.38.10 with SMTP id z10mr60172884qad.52.1409156607238;
	Wed, 27 Aug 2014 09:23:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 27 Aug 2014 09:23:07 -0700 (PDT)
In-Reply-To: <53EF6634.10202@pabigot.com>
References: <53EF6634.10202@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Aug 2014 17:23:07 +0100
Message-ID: <CAJTo0LY7e19LZbs1pmP4LShTYm8VFmEevM6kGRem=0KqKkFdbQ@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: implicit renaming of packages containing libraries
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
X-List-Received-Date: Wed, 27 Aug 2014 16:23:35 -0000
Content-Type: text/plain; charset=UTF-8

On 16 August 2014 15:09, Peter A. Bigot <pab@pabigot.com> wrote:
> Is this intentional?  Is it documented somewhere?  I wouldn't be terribly
> upset if lmsensors-libsensors got renamed to lmsensors-libsensors4 because
> Debian policy expects the SO number to be part of the name, but it's weird
> to have the owning package stripped off like this.

Yes, it's intentional.
http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#ref-classes-debian
is the documentation, it's quite sparse and could be expanded but does
cover the basics.

Some recipes - eg mesa - override the renaming because they want the
origin recipe to be part of the name.

(FWIW, Debian has a source package lm-sensors but the library is libsensors4)

Ross

