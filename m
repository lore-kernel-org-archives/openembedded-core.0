Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C750A6D6C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 09:04:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w10so15562179wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QR4nZDPYv9FFF5mk94pVOe+JryqP7SpHYVU0nSW8xj8=;
	b=erbWs4ayX1INN2UskIa2pBk+sSjqF5HZUA/ws/G1IwVx0vQ7sANFf6KFzIhKyJIS1j
	RS6wv31rvFWLfthkRznjBobl4XlS7Ivln7sGZfizjR2ql95bZhgMMDpP6481hhvcWW9M
	lyQgU0P+ngydEivfCFMWtRzJwL7pWaoHYdxrf2MOOqY4jDR8QchC9XSW7IBcXZ26V61Q
	Isihm4TfFli5kAIIZ3eMVGEAzL5/+b8IKQaaPYjqDgjYxQPyEFsd73+W0sPxvDCh5e86
	VZDK+C8QZta3PoEBKZsJcxyDMkwqMo+CzcZsTO/3eVz5lu1j+0ZDFnXIoSGToi0Z9KQ/
	W/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QR4nZDPYv9FFF5mk94pVOe+JryqP7SpHYVU0nSW8xj8=;
	b=HDViDbkEox4aOmpxYZgWQxYP5LQgfvkcBsHyOu3nU37fhus8U4RI5Q/hprw0AdWoR0
	dBCbWyc3kEC14PF29bv8SdyPmPF5p+u8+79AZSj9bltW9yYLDxk4Y4GyKHcgSkvpBlEa
	wQhOfwKX5z7ksdkENq2Tu/KHkeVgeYtg8QgcfQx4ImmeEw+GPTivTOT1NRk9hdjhGRh2
	fGpM8VH9zdfsc6cRfW5ZJ+UaG3EpVzFvPsV8dK1ey9DdHWXBk6k7YfdbQX7l/2s4HLuO
	A1MvmfXgfX5wuytAfd2jlQRF05U2P9MLCjAlupISXms5KEKSbIYkK5N8mNsN9JKuxtoJ
	dLUQ==
X-Gm-Message-State: APjAAAVbmuKwNGvw45wfWZ5hFLSCkpGTEkGnZDYb9sZSqBlCutFEhGyT
	GC/l0wDz3zf6Yw/IKd2++FkVC357a1ZYikyMPZAkUQ==
X-Google-Smtp-Source: APXvYqzeWXh/htAw6Gm576Ksv5keYnMHi3Wi0LUcyhwN6ps+wQXPnFiX2/goJkKRZvFB5ZEtoWSd+2F7jWrw012OKNs=
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr41845883wru.104.1554195865516; 
	Tue, 02 Apr 2019 02:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190402082301.3817-1-nathan@nathanrossi.com>
	<B772C969-0B56-49AA-A7DE-29B223EF411C@gmail.com>
In-Reply-To: <B772C969-0B56-49AA-A7DE-29B223EF411C@gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 2 Apr 2019 19:04:14 +1000
Message-ID: <CA+aJhH1ocr9dE0=eRj6gRFwqZ3SoarCkxYShL2vyBbX-1ATcHw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] fatresize_1.0.2.bb: Add recipe for fatresize command line tool
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
X-List-Received-Date: Tue, 02 Apr 2019 09:04:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Apr 2019 at 18:40, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
>
> Should this go to meta-oe though? It doesn=E2=80=99t seem like an essenti=
al tool.

My thinking was to suggest it in oe-core given its relation to parted.
However if it would be better placed in meta-oe/meta-filesystems I can
update this patch and resubmit it there?

Thanks,
Nathan

>
> Alex
>
> > On 2 Apr 2019, at 10.23, Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > The fatresize command line tool provides command line access to the
> > libparted-fs-resize library implementation of the FAT partition
> > resizing.
> >
> > This tool is useful for safely resizing FAT partitions which are
> > commonly found as the boot partition on a variety of SoC targets (e.g.
> > RaspberryPi).
> >
> > The Debian version of the source is used as the original upstream on
> > SourceForge is no longer actively maintained.
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> > The reason for locating the recipe in the parted directory is that the
> > program itself does not implement the FAT partition resizing it is
> > merely exposing the functionality from libparted-fs-resize as a command
> > line tool.
> > ---
> > meta/recipes-extended/parted/fatresize_1.0.2.bb | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> > create mode 100644 meta/recipes-extended/parted/fatresize_1.0.2.bb
> >
> > diff --git a/meta/recipes-extended/parted/fatresize_1.0.2.bb b/meta/rec=
ipes-extended/parted/fatresize_1.0.2.bb
> > new file mode 100644
> > index 0000000000..a2f6b6d131
> > --- /dev/null
> > +++ b/meta/recipes-extended/parted/fatresize_1.0.2.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY =3D "Resize FAT partitions using libparted"
> > +SECTION =3D "console/tools"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > +
> > +SRC_URI =3D "git://salsa.debian.org/parted-team/fatresize.git;protocol=
=3Dhttps"
> > +SRCREV =3D "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
> > +
> > +PV =3D "1.0.2-11-git+${SRCPV}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS =3D "parted"
> > +
> > +inherit autotools pkgconfig
> > ---
> > 2.20.1
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

