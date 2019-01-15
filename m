Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id A992D6BE2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 15:06:39 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a11so2714880otr.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 07:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SzuTl/CS+NgV5A+ndhXrSrsq7ubVq7cjjbOYMPW+SWE=;
	b=C0ZETy/cPaGGVXs4m0qGVf0BXoNW5hzuC2KWwKKR7AjyH79pB18g1jUeWiD+RPaV/R
	nJ6E8Rb9cflWpmBvew4yc8+L+PiFpyo0+WwRHA5AxtSKDBLdQ8U2VtDwKFg+ppzW82aC
	plEE8fhyQIBvMHBN7MGplaFr5/Gv/pMttHo0+G8JyErLp0RBppXAT3X148WmieE5bzne
	2GwfgKGFUtD2FV9P5llaV28aAbS2Bo3oO7khLjRH3wNRdLi4w3VHWEIUxR5ItzVjrNyn
	En3sOlZRDx08RMSxbDanET6KWGD+9YvFBO6EwjSplxQk6ziJBZxddtVV2pYaCb/liMEN
	oIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SzuTl/CS+NgV5A+ndhXrSrsq7ubVq7cjjbOYMPW+SWE=;
	b=mNgJKwej8pGUf7WXhSQUmyalN7jyfaoeZZkVQrYgcIgBhAFXPoWyFkLhnbIs0qIhAq
	dR2Ag/9K0Evg/+ee/iqYrXb4+u/0CiR7pnbmG7/dZ374JKuVM5YB1EOHlq70G+/uh+T5
	iwh9Gnt0qzclQxyX0JkLXyc5BsQfzSPACiJtU5zW87Uz9hWfzM2ImvUp0oWbn1JPBmp+
	mBDa37QWwE1MhMH3B25ENoLKE4xLa+mxWqzEaDHvXsvpek+1sCJhADj3qJzOdW2+o5fe
	gG/3vZx/ZDiVrxnxvoowM5jVUADvxYVb01iBlpbFvWuwxVhpNAAuATQ0x5IhynJenfDG
	2n0Q==
X-Gm-Message-State: AJcUukc77ICr70NM6tW3pT6PBJaAXvCg7vOA05xGDTyekjwb1GI9M3ZP
	94N68I3yQuecvGLF3H2BGboPCrWVmlUHc2UnNKQ=
X-Google-Smtp-Source: ALg8bN63MuGN0aPxRs5U2z4Sqr3GWAP0vn3NodQt3F7eJjuO6KKH/dCre/+lKVYYS3dWzB/DuRQ0zVYf/1enh+wUSiE=
X-Received: by 2002:a9d:4c88:: with SMTP id m8mr2695792otf.360.1547564800550; 
	Tue, 15 Jan 2019 07:06:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<7cff741d1306283af05fa88c00ed7f2a084af318.1547477793.git.alex.kanavin@gmail.com>
	<14ddb1b07908b79de700fa528fc608e493fa8dae.camel@linuxfoundation.org>
In-Reply-To: <14ddb1b07908b79de700fa528fc608e493fa8dae.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 16:06:29 +0100
Message-ID: <CANNYZj-pWziynefErqiKt9uh-nbBS5XOdr5AYC2-uu1Zb-N=dw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/23] qemu: add a gettext-native dependency
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
X-List-Received-Date: Tue, 15 Jan 2019 15:06:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 15:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > xgettext/msgmerge is used during do_install().
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > devtools/qemu/qemu.inc
> > index db9c2245df9..6937bbc87b4 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Fast open source processor emulator"
> >  HOMEPAGE = "http://qemu.org"
> >  LICENSE = "GPLv2 & LGPLv2.1"
> > -DEPENDS = "glib-2.0 zlib pixman"
> > +DEPENDS = "glib-2.0 zlib pixman gettext-native"
> >  RDEPENDS_${PN}_class-target += "bash"
>
> gettext is a heavy enough dependency I'm tempted to suggest we do:
>
> do_install[depends] += "gettext-native:do_populate_sysroot"
>
> given how slow qemu is to compile...

I'm going to look a bit deeper to find out why this isn't a problem in
master, but is a problem in my patchset. This was just a quick fix to
get things to build, as I was eager to get to the point where opengl
works :)

Alex

