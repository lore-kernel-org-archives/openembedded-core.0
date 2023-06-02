Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F1AC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:19:18 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.12613.1685711951186493750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=PLYbF5Xi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4eed764a10cso2681189e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685711949; x=1688303949;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dxD81+p0wsUgdMyLcddaLDAxbIWJhyjZLvaUyW8t9hc=;
        b=PLYbF5XiTXEowkRi9Mf+3dcCFetNkjp+SNkW0k+12Tg8XCtEP44yISZZ26wlXEKRZc
         a4o3iSMHMzCsIKwJonQHKWqBMFQm0AxtSa43NUqXogNFCBo9+3BObqjCFtBqS/YAGH2Z
         YKxTqH0+s92V88MogPulPUvOZlovPLkejnOYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711949; x=1688303949;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxD81+p0wsUgdMyLcddaLDAxbIWJhyjZLvaUyW8t9hc=;
        b=bo57hY9V9jvvdQjkEpCW6zh0iWW0Z8rnLMvezzb0pPpEw71ibHu+5RwZW+7z+DaenK
         fFZjKqBTKaKUomhBtSSBewPOXyO+tjC9ju0NJV7sbcq0w6kSNL+mjwUaKAVTZjHSQ7Qs
         COIejL8UsmMbnsfioPucSUq48E/E22sHxzU2rxc+u974hZmhC5Wv4h08k6ukKBxrU3FD
         LsR5BNzbjQxZLFL37SLCACv3Y6xTWevVUiRJUXaff2R8bRNcSTVPBtjecPYEKiV6rmFV
         UBc914WVa+0RvomuSoBXJZzKrgFl7NC0ZmYYAu2KiDGlghHElw09B4bqgq+j3Chd/L7G
         cYfw==
X-Gm-Message-State: AC+VfDyRIYfqDdWGynO2jtVheYVoVOL+sOm0bccrJWTBGTjF8G2gfBmc
	MB1C8+/hi9YO0FWTFEr2fUVBBQ==
X-Google-Smtp-Source: ACHHUZ4ztWO5RwpRmwFzkOUoGWYeWXf/KwfLjW9c6yz18ygbklIeiz8bhQjjmjzpZrkzew9IO8TTPQ==
X-Received: by 2002:a19:ae0e:0:b0:4f6:8eb:50ca with SMTP id f14-20020a19ae0e000000b004f608eb50camr1656679lfc.33.1685711948971;
        Fri, 02 Jun 2023 06:19:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z6-20020a7bc7c6000000b003f17eaae2c9sm1973550wmk.1.2023.06.02.06.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:19:08 -0700 (PDT)
Message-ID: <35cfabc97e3639a0722f477949ee42bc3e259998.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] qemu: Split the qemu package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Yu, Mingli"
	 <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 02 Jun 2023 14:19:07 +0100
In-Reply-To: <CADkTA4P19O3EHGZpSPBaTKjQXpWuV8hF1T-pWiKzuNiVgnc5eA@mail.gmail.com>
References: 
	<CADkTA4NXhx1h5znY-Ayemm1BAnpuMeFV+GO5v1b56Gv1JmR9Qg@mail.gmail.com>
	 <20230602023657.309867-1-mingli.yu@eng.windriver.com>
	 <CADkTA4P19O3EHGZpSPBaTKjQXpWuV8hF1T-pWiKzuNiVgnc5eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182318

On Fri, 2023-06-02 at 09:08 -0400, Bruce Ashfield wrote:
> On Thu, Jun 1, 2023 at 10:37=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriv=
er.com> wrote:
> >=20
> > From: Mingli Yu <mingli.yu@windriver.com>
> >=20
> > Currently all files as below packaged into one package such as
> > qemu-7.2.0-*.rpm. After the qemu package installed on the target,
> > it will take up about 464M which includes not only the one matches
> > the arch of the target but aslo all available built qemu targets
> > which set by QEMU_TARGETS.
> >=20
> >  # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bin/
> >  qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
> >  qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-system-=
x86_64
> >  qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
> >  qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
> >  qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
> >  qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
> >  qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
> >  qemu-riscv32    qemu-system-arm      qemu-system-mips64el
> >  qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
> >  qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-system-sh=
4
> >=20
> > Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-aarch64-7.2.0=
*.rpm,
> > qemu-system-x86_64-7.2.0*.rpm and etc. And let user can only choose the
> > corresponding qemu arch package they want to install should ease the co=
ncerns
> > who cares much about the size in embedded device as it decreases the qe=
mu rpm
> > (qemu-7.2.0*.rpm) size from about 65M to about 19M and the size of the
> > extracted qemu RPM decreased from about 464M to about 248M.
> >=20
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index a87dee5c99..c6fd39aab6 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -230,6 +230,11 @@ INSANE_SKIP:${PN} =3D "arch"
> >=20
> >  FILES:${PN} +=3D "${datadir}/icons"
> >=20
> > +python populate_packages:prepend() {
> > +    archdir =3D d.expand('${bindir}/')
> > +    do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system=
-%s', 'QEMU full system emulation binaries(%s)' , prepend=3DTrue)
> > +}
>=20
> I don't see a v3 changelog, but that does look like the unnecessary
> default runtime dependency is gone, but what would be the method of
> installing the packages if I have an image where I'd like the old
> non-split functionality ?
>=20
> Either a meta packages (qemu-system-all ?) or a way to override the
> functionality (a variable around the do_split call ?) are options to
> enable that sort of thing. As I mentioned before, there's a different
> expected split of the packages in some scenarios, and it would be
> ideal to not break those use cases.

This is quite a common need for things which call do_split_packages,
I'm starting to wonder if it should support some kind of "common"
package as a parameter which it would add dependencies to?

Cheers,

Richard

