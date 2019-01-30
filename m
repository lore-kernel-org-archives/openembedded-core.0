Return-Path: <samuli.piippo@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4956F7C240
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:17:26 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s8so18741018iob.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 01:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=92t4WJxKC4kW5PvZU/9IjlAX6bt6t8I8EyGh/ONHt3g=;
	b=cZdiOg13DfBziJapqWB22b5uAaojPiDvlyKh4r0Hnp4K6BfPEhDSf1IxiKi9LcB7Wz
	RojfoWXTr4hHSZ7QVwzzaWchKxw1IBMoG4M8PL7RgeBCfjJgtI6t6pKHvSpvSAUN2vMJ
	qQNzVq1llC/9NdhSE0t+LmFh7HbWSdwQYO4gAmIzcXgVIVgi9HaMino7GUaHeTXR5oh2
	opYmtU7oSfhJQSiXFAA+HJBUadubwbf8WAuCceO5cdO8zYIp4kOLbCFjigNUu4Hxrpu8
	YekoALl4Iqa3VwzBPcLthwKlK9g7ROvPewmEqf3yNDp8LtRMalipUDthyyGQID6gaDks
	vZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=92t4WJxKC4kW5PvZU/9IjlAX6bt6t8I8EyGh/ONHt3g=;
	b=jAbAM5kh0BhWfR+si46p0co8j91KxTUMluEzUTmK7gB35K60HGqb76xGib76WV3amk
	LIkXcNslDWsONy+wrngYVqMEyaqIvxC2UIB4bFIwKnXVxrsVXv/AsT09qJm3OV+E9DYO
	eLR2R53OBRMGflOsMxTnjr5D9UQOXxP+YpMy+3BkcYTKIqG6rfMP0H+4zMzidaavJQa/
	K15Gq1iR95fl4Op7unqCd6mCauOS5JY621PHJbGKcGNzRZWQQHT9BGl5MSIVU8RuxWlj
	OlTbhiPvC9ovRH0nKJWsv+VncxG6iwtEbY0LKZ6aExj11qYXXqG1hO5oimxm+lV94eq3
	YbXQ==
X-Gm-Message-State: AHQUAubZkIWLD3xSIWrshwqX1A8yXbiW7YC+jkHOS0Jd0+WOiwsKBBb+
	XmDTU2/7tS+UDF/YGEHHf3srqr++CoHih3xQQvk=
X-Google-Smtp-Source: AHgI3IYo1fvjYmF531HJZlIBR2Y0euy9qDqNxymifRnvhvFRHgJ72xBManum8hDS+ryaEDrsKXTkLdrckOQAVCV3pL8=
X-Received: by 2002:a5e:8b46:: with SMTP id z6mr16519526iom.7.1548839847020;
	Wed, 30 Jan 2019 01:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20190128124739.9175-1-samuli.piippo@qt.io>
	<CAMKF1soJ1obqx9GyjAHJkdMq3HZdWjiAKRRqea5=HohEj+cUGQ@mail.gmail.com>
In-Reply-To: <CAMKF1soJ1obqx9GyjAHJkdMq3HZdWjiAKRRqea5=HohEj+cUGQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 30 Jan 2019 11:17:30 +0200
Message-ID: <CABXoSoW0aA8D44zekpWqPaS5E=vh8-ELydtkqAgz8DrooaB-3w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, richard.purdie@linuxfoundation.org
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross-canadian: Do not create symlink to real-ld
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
X-List-Received-Date: Wed, 30 Jan 2019 09:17:26 -0000
Content-Type: text/plain; charset="UTF-8"

Sent v2 as a revert patch.

Simple compilation test with mips64 toolchain works fine, as does arm64/armv7.
Richard, would you happen to remember more details where this failed
in the first place?

-samuli

On Tue, 29 Jan 2019 at 20:20, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jan 28, 2019 at 11:19 PM Samuli Piippo <samuli.piippo@qt.io> wrote:
> >
> > real-ld is always used if that is found, which means you cannot
> > switch between bfd and gold linkers using -fuse-ld=gold.
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > index e7c08d3a61..ececec4965 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > @@ -137,8 +137,6 @@ do_install () {
> >
> >                 ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
> >         done
> > -       t=real-ld
> > -       ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
> >
>
> this patch is essentially, reverting
> https://git.openembedded.org/openembedded-core/commit/?id=cdd86896c8d29135f937968e9aa07f919cf543d3
>
> so lets do a revert instead to keep the context clear
>
> secondly, please test with the mips/mips64 as those were primary drivers for
> the patch in first place.  Richard might add more context if he remembers.
>
>
> >         # libquadmath headers need to  be available in the gcc libexec dir
> >         install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

