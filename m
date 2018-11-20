Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3306C115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 14:15:44 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t13so108753qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r6QMyMqgSHV7XTvJGc7Kz2HgNwDsdyx4bD7hyy9Z3Kk=;
	b=ixo/GfhDWll2kQdDPF2b7kNJv9kfxZyd5UbY0lhJFoQQrB8ojHsryc5Ek0mET/yZ4e
	w1vSTU2XRz0f+q5QSWQqUr79APcDV/XvZ2Qtqd6WK1NJvFCtU8jxOSb0pbwknZSByYyn
	InRA9nK0A8+836bw8sll1x04XmSJDnTpYMJthg1MMLGSko6Ybuhg1eS9i4mKT/iQ50+U
	wiXSncUHt9CPRcQ1+oZi8/3tHz9NDJzJ1Bwi3dh5WtJyJPNpcEZUVzfdpB9d083cXJKb
	BEz/P+1XsKa7WfNlhsILCy+s6Fgo6Y19Lh9KcmkrH1UQf3WgshyntmlpVIhOIZdcH5I+
	fuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r6QMyMqgSHV7XTvJGc7Kz2HgNwDsdyx4bD7hyy9Z3Kk=;
	b=LzegQ3EpqNYVYKv8LCkGrB7dI07wV3gmMpYs0mVdS0rCdXSCW9OfIUdDAJ7dmsziXF
	bLmTK5VhoWTsLtVqTECmiiOH9w3hewhNRRvhaycr3Xc1zSkYnM0NPj8E6thb3iXJEBWx
	R5UxWv9tcXdnDBHBFoLcIcBhZnVKpNRMmmfmL6hJdRlyoP+ZaSofifyj4AGnyVBN+JKP
	e7ZgiVYYFRKgPZ9HW2srQ28dkUVQWnjlop16Qe0T7ZU3TfMjKcoyB/NHl6iJHhPSqywJ
	8ybCfolFUqYgCf7HPQks+pyIU7FRHXjIdx404e8g1W1DSmQwSm1gh9ny5ouQuAVDwFrw
	Za4w==
X-Gm-Message-State: AA+aEWaCw2m3wy/6ouQfZFp90TnovdlPXlgtwcoKXhXNTMkGX68FcmyU
	dQriwjvgwTCftYylie4CbvWWnRseNRHqhAW5bxQ=
X-Google-Smtp-Source: AFSGD/W0O88AfyXpoCuBKWbhwoWFd3DqA1aWneAUoqBINqr789YSH4PGaAJx1Efqfa0D43PfGLTHKvnHVkYLhmzI6/k=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr2024406qvj.228.1542723344757; 
	Tue, 20 Nov 2018 06:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20181119172726.23571-1-raj.khem@gmail.com>
	<958150cb-3892-1bd2-87e9-0c527d9f92fb@gmail.com>
In-Reply-To: <958150cb-3892-1bd2-87e9-0c527d9f92fb@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Nov 2018 06:15:18 -0800
Message-ID: <CAMKF1spFggMTxcytFwiyESCrtn3fOY3wgo+1gQfEWOHqEdS_qQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Update to latest trunk
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
X-List-Received-Date: Tue, 20 Nov 2018 14:15:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 20, 2018 at 6:08 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 11/19/18 9:27 AM, Khem Raj wrote:
> > Complete changelogs are here
> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..79f653c6bc2881dd6855299c908a442f56cb7c2b
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index 0d8f8eb2a4..f2b6361446 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
> > +SRCREV = "79f653c6bc2881dd6855299c908a442f56cb7c2b"
> >
> >  PV = "1.1.20+git${SRCPV}"
> still 1.1.20 ?

yes

>
>
> >
>

