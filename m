Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C29EE7FC0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 20:31:55 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t3so32182353qtr.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 12:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=duxuzVtcYcmS8LD9RK5fqHglXHjUkrJvZ3U1E/X2cXY=;
	b=ki/TwR4NjaV1Bcu++FOdBoqgxJMhjvjZqxgD9gkZTHT1/eAmIvcnbwzSwbqeLeVG2b
	MzEPSuKe2oz3jayUGmBU4+bJf1Q7c3fg9tBagj0IoA/35AB8j4EVERWNrgq50X0HTHN9
	2UrJc94SoriUOSYkbw0sk7v+OJbYWyPmcXDSFzWIZYz04PHBzOee5qaoX8I9dK2IL7Sq
	2EmLz8q26V6nfTalTD6E9/YBoGDRQpRGUbZo6+i5bLL149QTyLL/n82JTABNt232xNpA
	1v0FVmsenaRdPD2N4dEawjzWE66+j75cyx3M9MbkYBEMOo43f5JvzRFC/HfPZX8wzowg
	qSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=duxuzVtcYcmS8LD9RK5fqHglXHjUkrJvZ3U1E/X2cXY=;
	b=nAC9xOjcnpuH5AiblBJMQ0I5rAwWlEtd5p2EPJOtSrm+9NTjmNrcSeXRm7vAUFntmK
	4G1F9SwlTn1YM9EXKhxg4DADdXgf9tXzaJc4H0aS9fXdzkCjsRRt2WHo2p/jTh5e2EtS
	cEU2IQrJIbxYCkGtgp1U+fEdKIRnVy7uHaZs4bl0YWKAsrI0EtZ0Xz9pJ7zfV+8fuTCS
	/CQTUcd7eMnOm19X7iExqLHyjJYBdpGeuQKy4ujJkz2dE/EomQswdSD+ATQE3nyczse2
	wAEo3wC1H2KhcHjNaa+ZBJEk/lKl6oJdeHvNVEH0N8Ke1cQnqEkYgV4IxA5YHZ+bv5bq
	o9rQ==
X-Gm-Message-State: APjAAAWpmCLlf3ofNwbnxYpXDWXuj51zucgtyfY79in5B+4mfmn2Iz0m
	Q+GjbuhlUxj6oQ9SEFuhEi3GOX+uL8s9pK0xZFg=
X-Google-Smtp-Source: APXvYqxT9swKrumx1u2bemRXHnoHNKNLbnmgTwJkBw8Ien2XIxPIU7sKcImuABZWbbnqLUtoCaB1NGjcZ2YEIwkWHu8=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr38386982qtd.80.1577824316286; 
	Tue, 31 Dec 2019 12:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20191230205941.1878175-1-JPEWhacker@gmail.com>
	<20191231190657.2411408-1-JPEWhacker@gmail.com>
	<CAMKF1srq0Y67L7bKRSCREfjJ6G23M+UuxVJh=C69ugt3CUjrXQ@mail.gmail.com>
	<CAJdd5GaWnVcSteVPQjsJjON5_un-T5wdZ2oKAqACfW9MkDyqMQ@mail.gmail.com>
In-Reply-To: <CAJdd5GaWnVcSteVPQjsJjON5_un-T5wdZ2oKAqACfW9MkDyqMQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2019 12:31:30 -0800
Message-ID: <CAMKF1sqdNu_tg-MX3MNkSHQGqVP7U0v=J8_ufx_vK-eNqhp_Og@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: RDEPEND on libgcc
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
X-List-Received-Date: Tue, 31 Dec 2019 20:31:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 31, 2019 at 11:25 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Tue, Dec 31, 2019 at 1:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Dec 31, 2019 at 11:07 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >
> > > Python uses features of glibc that require it to dynamically load (i.e.
> > > dlopen()) libgcc_s at runtime. However, since this isn't a link time
> > > dependency, it doesn't get picked up automatically by bitbake so
> > > manually add it to RDEPENDS.
> > >
> > > There is an outstanding bug in Python to make it explicitly link against
> > > libgcc at link time which would remove the need for this. See:
> > > https://bugs.python.org/issue37395
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/recipes-devtools/python/python3_3.7.5.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
> > > index 137b540dba..78312b05f3 100644
> > > --- a/meta/recipes-devtools/python/python3_3.7.5.bb
> > > +++ b/meta/recipes-devtools/python/python3_3.7.5.bb
> > > @@ -306,6 +306,8 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
> > >  PACKAGES =+ "libpython3 libpython3-staticdev"
> > >  FILES_libpython3 = "${libdir}/libpython*.so.*"
> > >  FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
> > > +# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
> > > +RDEPENDS_libpython3 += "libgcc"
> >
> > while this is glibc specific change depending on gcc runtime, it seems
> > we should only apply is when we use gcc runtime and glibc
> >
> > glibc part is easy just use libc-glibc override for gcc runtime piece
> > perhaps, its good to introduce, virtual/compiler-runtime and let
> > libgcc
> > provide it by default, but let apps depend on virtual/compiler-runtime
>
> I'll use the libc-glibc override so that it's specific to glibc, but I
> think the virtual/compiler-runtime might be a bit premature, unless
> you know of a usecase where it would currently be necessary?
>

eg. one might use compiler-rt to provide built-ins and use
llvm-libunwind for unwinding info not rely on libgcc, one can say it
can then provide libgcc and substitute it. However, it will be better
if it was in design to be able to do that from top.

> >
> >
> > >  INSANE_SKIP_${PN}-dev += "dev-elf"
> > >
> > >  # catch all the rest (unsorted)
> > > --
> > > 2.23.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

