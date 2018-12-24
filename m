Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id B79346BE38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2018 04:52:39 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y20so12098083qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2018 20:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=we3DaurGxi8eU4BsrfLMBRNLo3Jfa9obe9ZNeguf7H0=;
	b=ubGqLjohYq7Z/4WUOb6gXrQ9lJcE63S21aByoF9rnieAXk57x480gXpi3sRbVHxU+O
	1FU/Cm495A3J/kWwBoYn5uS9v+pbFq+KtgCln3NTGdER1hSsv6Of8j3Z+G8K+748twjm
	kI4ORfz9Hunbkfgt20xsmQ/P2Gx2mgDz/4qQvYGgZoV8tAG/VkeZ8Gg+sIp6cuJf47gx
	P6fRcMXVP2ZICYPKO42/Fqj6ygJt8OUtbiHNIpGAs+NEXJ3gSDwm+TpOtSwmBziFSiLD
	fGLfQEI8ksNf+zNx8UY6jkEaK+vA6Cfty/tTefJZhOIjhHA/byV7Zr/xKolLosMTcrEl
	XMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=we3DaurGxi8eU4BsrfLMBRNLo3Jfa9obe9ZNeguf7H0=;
	b=JXyQjzUcG75fygNOZ0AHVOw+cQiD4ZTYYK/Dg8e8BwxieZaHysV6+dDDDzdiJFxhl/
	KwqO4Kwlne2EawpDKHjb/wspv+pTXFzHMNKgZPqi6auuRFfZ5BwJuTT8y5sgI8g3zpgE
	I7j0/wGnxDQCjqYscqIg/6zTVXwvu6UY519wo/AG0k9PzjNNxWJlUTkWr2sixatOGiDo
	BTheaT6FV2kwA14akQ+nzxAt2cxTpuPH6oPEAP6/2pgW0byRb4im5Rim7okA9T0vc1G5
	f6RdDLt3df45EG4V8xsjYt/VEBCstJu8Wr937RpiVCgOBQ3FmA/XL3MuY61colSbCi5i
	02fA==
X-Gm-Message-State: AA+aEWZX3t3HS8EpZJx76beMUXVqHuWyunl/vZ/DrmULMJzAeJJ5KRSP
	7OLAKnE6MoRn+9BT6baDGyOelavSFXhRpCE9e5A=
X-Google-Smtp-Source: AFSGD/UEIBa+n/9l7xyTpOOnIFPuhrPUErzW68zDCJregspfNhUB1G7zTNTugbRzl0UcvdZue2sg6GNQAX/OBUm8lIY=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr10594519qtn.254.1545627160474;
	Sun, 23 Dec 2018 20:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20181222182512.6831-1-raj.khem@gmail.com>
	<CADkTA4Od8ixW4XqZV9kWvQ0fA1B1cYzE3WxCht7NYbx4sR2d5g@mail.gmail.com>
In-Reply-To: <CADkTA4Od8ixW4XqZV9kWvQ0fA1B1cYzE3WxCht7NYbx4sR2d5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Dec 2018 20:52:14 -0800
Message-ID: <CAMKF1srP5ibA5hwbbcE2j5qZCtNxx=Gcdzpz+00CrARtATw4Og@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Update to latest master
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
X-List-Received-Date: Mon, 24 Dec 2018 04:52:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 23, 2018 at 8:50 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Sat, Dec 22, 2018 at 2:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > * sync APIs from  kernel v4.18
> > * Misc bug fixes
>
> Khem,
>
> I have the 4.19 libc-headers and aarch64 api patches staged locally. I
> didn't quite get them sent out before heading for the holidays. Do you
> expect any patch or build issues with this bump ?
>
> What I'm wondering is if I should test against this before sending out
> my libc-headers series ?

No you dont have to. The current status quo remains the same, when the kernel
patches land then these changes will become effective and all of
packages using ptrace
APIs will start to build and work on aarch64/musl

>
> Bruce
>
> >
> > Full logs
> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=39ef612aa193cc6e954ac5a01574300ccd4b7ef9..21a172dd36cae7a08492fd3a7500d7bf0daee13e
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index 046a08aec2..33d6e69130 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
> > +SRCREV = "21a172dd36cae7a08492fd3a7500d7bf0daee13e"
> >
> >  PV = "1.1.20+git${SRCPV}"
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

