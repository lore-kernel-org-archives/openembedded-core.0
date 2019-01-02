Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3D96BA81
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 19:43:23 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y20so34630101qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 11:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5hqRwQgTT3c9FZRusWBDGQtDPvhkWe883QqxgXE44QY=;
	b=p/fGZfRg0jxPm6vuvikjsVTDJ45EQMw192g38lTX9eniixjokD/0JNLJEzCuLWcXt7
	ZJmF0KHGACLaE3zw208ynHBzlhgsoTbtn6oJU8U0bAWkWDUVsDWGZgitw2TT2zbylMnE
	64TCzbNsBrddoPP4aEJ/PnGdRBga2syMR66b10hEzj+5W8zDd4qxzS1phN7uuhHQGSUm
	5TYnKB022aRTGBDEN3IybxN9gX7NgdfPj/hKyap0TtnPJbRs9ExI+rZGI3TXg3lGWRUW
	XLoq4hqUw+2+hGE1/Q2p3b86mnrnz4Ors5Biu11zuiGBqVD86kACUi34DHTZUOTzkIqn
	X0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5hqRwQgTT3c9FZRusWBDGQtDPvhkWe883QqxgXE44QY=;
	b=JErWrDdOW0YcFvpvpc0PjD+lX62D0ds4JOyw4F9o/zVnh6HfSnEDsh2hHUpFRyXLbX
	IMjtOohRntvPMXzdlmUEJ+VCKzy/ilZ4IgVPxXhNjpdxyP03CuJmWO93uhu/zWazQcqn
	aUCXKpVPbCGX2e6uQ+vc5Iio5cC7PFiOHl5r6oE/U8TTFdCR+X16Gbg8qnbWL4ZYrpwl
	I4vfGtuM12wG2HHfgmQzHiYuI/Hp4+MwzY8V6J7eOWWklAscrc0ArmP1tAiBFmdu2Q8Y
	JYh9F0momRcMJY3aSRxkmQoqIKKaBhztHUhetqJNaaxodNO4aukTTFphFt6e+0yH/jN5
	FO+w==
X-Gm-Message-State: AJcUukdLLwNWn9AV9ZTNwvoujwkAnf1XkHBXmuIa8R/aQ0Zv1g7YeE/T
	d2BwNEfEklqfrOBE2KI3Uwvx69x0Z1m4Q69iR+c=
X-Google-Smtp-Source: ALg8bN65gfyCJvcavbhayCQT9hwNQLG4EE0IMRITUA78vYWTgXpbnJPrk6cdZwE0L58qtZcBEEn5uM1pB35FQ9kSn3M=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr42734068qvd.224.1546458203840;
	Wed, 02 Jan 2019 11:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20190102192111.33587-1-raj.khem@gmail.com>
	<CAPbeDCm6H0C=nKk=z_uB+SAP_3fJya5UDJKKGSQq9oA6wVdJAA@mail.gmail.com>
In-Reply-To: <CAPbeDCm6H0C=nKk=z_uB+SAP_3fJya5UDJKKGSQq9oA6wVdJAA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jan 2019 11:42:57 -0800
Message-ID: <CAMKF1so9UFQCtP_F8HZdopREaR1rp8poUyeCpr7yZj43xESnxQ@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Wed, 02 Jan 2019 19:43:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 2, 2019 at 11:32 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On Wed, Jan 2, 2019 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: pino-kim <sungwon.pino@gmail.com>
> >
> > This fixes RISC-V gdb-cross-canadian cross compile configure failure on missing bison.
> >
> > Signed-off-by: pino-kim <sungwon.pino@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > index 475e4f08ef..e54766bbb2 100644
> > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > @@ -6,7 +6,8 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> >  BPN = "gdb"
> >
> >  DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
> > -           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
> > +           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk \
> > +           virtual/nativesdk-libc bison-native"
> >
>
> Would it make sense to restrict this to DEPENDS_append_riscv32/64 ?

Its not particular to riscv, it just happens to unearth the problem
for us since its building gdb from upstream
master, we are going to land into this problem eventually when we upgrade.

>
> >  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

