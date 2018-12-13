Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDD96C474
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 16:49:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w73so1371545pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 08:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UmZJBh468pipIzoE/p9/9vO33bPl9d4QXcU4it07wO8=;
	b=VGQ7l5ncjiTnbLcEfISMiKiW9zag5kda+eTDVE+dZCFVo8D+39FrTt6eWoeTvmw07+
	vVz4sbPN5AhKtg7cF2aJE/W4ggyueie6HVRSZCykxUFMk2TdtjCuK1z4PEkLytnW7Dof
	dj7wcrds2iOl0BYhB50gclWqGGmehvJyA6L7tWowQSkKuRPZ1desoent++2B5Ntnt5rn
	hpMMsZVoh/JB6otiMzyfnFXSe3TfU0qDKWTT3ZZcHs/xyqovGcUgHEDpc+8HTSuncHME
	6GK4+S1K9OdQ5N1o3odH/AtpiutIVJ7Iq98dHggFrE462Oi2BfWzUEfw2JQKWNVJ8x5o
	Yu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UmZJBh468pipIzoE/p9/9vO33bPl9d4QXcU4it07wO8=;
	b=kT3D7Oi/Es4Uvb3LYgeOc1IjjciRpocPwcKnTow1o0k/XjYOkNfSgFXQtdtgBtTJJe
	eWXnPQGqtgG0txZJYfLqHeX9bXtrEG8Eixn5ewWmPKxcVSv6RmfB8nbsov9BXB10/zM5
	uxTgZmcc2xDuy346YpAXm5wvCYP+7xixJy5YqLSVvRWjrUv+L7Li8JR/TIiKOdnp/ffy
	K+hrj4dkq5ninBz/r9ctxlSGX8Nt7OQL/GIJOZEN4QkT48j/0hZMOCk0il7pl1fR/DRF
	HtXvpLjaw0eS3rud9UeO/5Lvr+CRIl96UGUAQ8SvmELfoKJDKMlXM6i8q/2oZGCG/YBB
	ojVw==
X-Gm-Message-State: AA+aEWb5lYlQDFY35TJV+I6umc95McZq40x1vRXAFGw8GIROOoEZgN/a
	XXGfnn7vYYAGuxUwXleNdSqHa6yEc0v8K0zdPqs=
X-Google-Smtp-Source: AFSGD/X7R99MhisbXfE+5RwME8aKbVbasp6EPFkS1TNeIIyVygWCld87GJOM0WEKkiKffTw3uqIzKa8wb5i2qdyQzkA=
X-Received: by 2002:a62:4d81:: with SMTP id
	a123mr25555760pfb.122.1544719761520; 
	Thu, 13 Dec 2018 08:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20181213141312.14587-1-andrea.adami@gmail.com>
	<b7c0b17395606a87550133d858b00f76d354d1d0.camel@linuxfoundation.org>
In-Reply-To: <b7c0b17395606a87550133d858b00f76d354d1d0.camel@linuxfoundation.org>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 13 Dec 2018 17:49:08 +0100
Message-ID: <CAAQYJAv-bETMDSAmeUnOnMseaLWkThfRvXg+NY1x+xzXcsqnZQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Thu, 13 Dec 2018 16:49:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 13, 2018 at 5:26 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2018-12-13 at 15:13 +0100, Andrea Adami wrote:
> > Add the missing triplets (not considering uclibc) for do_configure.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  .../python3/powerpc-musl-triplets.patch       | 43
> > +++++++++++++++++++
> >  meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3/powerpc-
> > musl-triplets.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-
> > triplets.patch b/meta/recipes-devtools/python/python3/powerpc-musl-
> > triplets.patch
> > new file mode 100644
> > index 0000000000..477d049858
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/powerpc-musl-
> > triplets.patch
> > @@ -0,0 +1,43 @@
> > +Using musl libc the task do_configure fails on powerpc*.
> > +
> > +  checking build system type... x86_64-pc-linux-gnu
> > +  checking host system type... powerpc-oe-linux-musl
> > +  checking for python3.5... python3.5
> > + ...
> > +  checking for the platform triplet based on compiler
> > characteristics...
> > +  powerpc-linux-gnu
> > +  configure: error: internal configure error for the platform
> > triplet
> > +
> > +Fix this by adding the musl triplets.
> > +Note: uclibc is purposedly not considered (unsupported in oe-core).
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > +
> > +--- a/configure.ac   2018-12-13 14:44:55.414309610 +0100
> > ++++ b/configure.ac   2018-12-13 13:22:37.546497547 +0100
> > +@@ -831,14 +831,22 @@
> > +         or1k-linux-gnu
> > + # elif defined(__powerpc__) && defined(__SPE__)
> > +         powerpc-linux-gnuspe
> > ++# elif defined(__powerpc__) && !defined(__GLIBC__)
> > ++        powerpc-linux-musl
> > ++# elif defined(__powerpc__)
> > ++        powerpc-linux-gnu
> > ++# elif defined(__powerpc64__) && !defined(__GLIBC__)
> > ++#  if defined(__LITTLE_ENDIAN__)
> > ++        powerpc64le-linux-musl
> > ++#  else
> > ++        powerpc64-linux-musl
> > ++#  endif
> > + # elif defined(__powerpc64__)
> > + #  if defined(__LITTLE_ENDIAN__)
> > +         powerpc64le-linux-gnu
> > + #  else
> > +         powerpc64-linux-gnu
> > + #  endif
> > +-# elif defined(__powerpc__)
> > +-        powerpc-linux-gnu
> > + # elif defined(__s390x__)
> > +         s390x-linux-gnu
> > + # elif defined(__s390__)
> > diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
> > b/meta/recipes-devtools/python/python3_3.5.6.bb
> > index cd7991e7f8..2e8ae711d5 100644
> > --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> > +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> > @@ -44,6 +44,7 @@ SRC_URI += "\
> >              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-
> > 2305.patch \
> >              file://run-ptest \
> >             "
> > +SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"
> >
> >  inherit multilib_header python3native update-alternatives qemu ptest
>
> Do we need to make the patch application musl only? This tends to make
> it more painful for recipe upgrading and we should only do that if the
> patch would have an adverse affect on non-musl. Would also be good to
> get tweaks like this submitted upstream...
>
> Cheers,
>
> Richard
>

If you prefert I add it unconditionally.
This error with musl is not seen for other archs, I could not test the
ppc64 but imagined it would suffer as well.

Does your autobuilder succeed?

Cheers
Andrea

