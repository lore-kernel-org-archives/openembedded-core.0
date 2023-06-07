Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E74C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:33:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3622.1686126799298012115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=YmZWL1be;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so29499835e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686126797; x=1688718797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0qjP7lyLuWfGTCEhTgnteXv0MsOkjLGPqLCnCKoJkfU=;
        b=YmZWL1beGTyzgeUA8Y+S/AWstXVgQaha3K1gYRTV1bPKbiV4YDa+9rWqcfnV+514PN
         3gJLq4W/x04P/kCdF4bN5v13vV+B8Ein+c2+p27Mi1lHBeau8/U9uGuEfCsmaTPA6RbA
         g5mcuWcIY1Zv8FehOlNsabB48uLDVL6eFMObc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686126797; x=1688718797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qjP7lyLuWfGTCEhTgnteXv0MsOkjLGPqLCnCKoJkfU=;
        b=RXB+Q96MmYPX1HsJr7oSn3rdfjI5uoNIfnFdFRWM0eTXmf2fdlWgOyqH7VKl77JQcd
         ywy4sy8wcExnHwhWLgEm3eYc6rpAyO2dwYE99w+JPY75hCUHqSJ+mpdcwLqxVvC+AziR
         nAGDTxISFH7Al52UkSFgaTOBYXBAyRMiy5jv4EkLJogJ2pZ3W/1pBtnqVQn1GDNrANoj
         08vRAPm2uWi/C78YrOnd0ISdsMNion2FwSFJevTFl0Zk3xeZS/VT528eyTKHzuM0t+mH
         AR+k3wN1xhgOkQlom+cAQTs/6BrJFvvMHFFFcDL71S1gOFBlvvTwiAdz8EHVa2UHvR3C
         ujgw==
X-Gm-Message-State: AC+VfDyGg252leEhUVd4saKP1jjMQcgk4B1fcrxy8Z5ufnbQzJLy7Nw8
	x6ml/MZzm87JT9QbvwSZPjQyJg==
X-Google-Smtp-Source: ACHHUZ5iAmYY4U0WVHT6uJaf8uEyU2AJnIJWRWj8hqT5OKpYDfsmN3q84YjokfvlgRNw2QR/tXvIbw==
X-Received: by 2002:a05:600c:286:b0:3f6:69f:75e0 with SMTP id 6-20020a05600c028600b003f6069f75e0mr4110414wmk.25.1686126797519;
        Wed, 07 Jun 2023 01:33:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:247f:a475:41f0:cfdc? ([2001:8b0:aba:5f3c:247f:a475:41f0:cfdc])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003f7ea771b5dsm1363638wmi.1.2023.06.07.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:33:16 -0700 (PDT)
Message-ID: <6e5c91bd39f886a6e72be22999e7e5902916b623.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] qemu: Split the qemu package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Jun 2023 09:33:16 +0100
In-Reply-To: <50c86734-7c3d-5d99-9a64-1a1c89498c3d@windriver.com>
References: 
	<CADkTA4NXhx1h5znY-Ayemm1BAnpuMeFV+GO5v1b56Gv1JmR9Qg@mail.gmail.com>
	 <20230602023657.309867-1-mingli.yu@eng.windriver.com>
	 <CADkTA4P19O3EHGZpSPBaTKjQXpWuV8hF1T-pWiKzuNiVgnc5eA@mail.gmail.com>
	 <35cfabc97e3639a0722f477949ee42bc3e259998.camel@linuxfoundation.org>
	 <50c86734-7c3d-5d99-9a64-1a1c89498c3d@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 08:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182461

On Wed, 2023-06-07 at 11:09 +0800, Yu, Mingli wrote:
> Hi Richard and Bruce,
>=20
> On 6/2/23 21:19, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Fri, 2023-06-02 at 09:08 -0400, Bruce Ashfield wrote:
> > > On Thu, Jun 1, 2023 at 10:37=E2=80=AFPM Yu, Mingli <mingli.yu@eng.win=
driver.com> wrote:
> > > >=20
> > > > From: Mingli Yu <mingli.yu@windriver.com>
> > > >=20
> > > > Currently all files as below packaged into one package such as
> > > > qemu-7.2.0-*.rpm. After the qemu package installed on the target,
> > > > it will take up about 464M which includes not only the one matches
> > > > the arch of the target but aslo all available built qemu targets
> > > > which set by QEMU_TARGETS.
> > > >=20
> > > >   # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bi=
n/
> > > >   qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
> > > >   qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-sy=
stem-x86_64
> > > >   qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
> > > >   qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
> > > >   qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
> > > >   qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
> > > >   qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
> > > >   qemu-riscv32    qemu-system-arm      qemu-system-mips64el
> > > >   qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
> > > >   qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-syst=
em-sh4
> > > >=20
> > > > Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-aarch64-7=
.2.0*.rpm,
> > > > qemu-system-x86_64-7.2.0*.rpm and etc. And let user can only choose=
 the
> > > > corresponding qemu arch package they want to install should ease th=
e concerns
> > > > who cares much about the size in embedded device as it decreases th=
e qemu rpm
> > > > (qemu-7.2.0*.rpm) size from about 65M to about 19M and the size of =
the
> > > > extracted qemu RPM decreased from about 464M to about 248M.
> > > >=20
> > > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > > ---
> > > >   meta/recipes-devtools/qemu/qemu.inc | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >=20
> > > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-dev=
tools/qemu/qemu.inc
> > > > index a87dee5c99..c6fd39aab6 100644
> > > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > > @@ -230,6 +230,11 @@ INSANE_SKIP:${PN} =3D "arch"
> > > >=20
> > > >   FILES:${PN} +=3D "${datadir}/icons"
> > > >=20
> > > > +python populate_packages:prepend() {
> > > > +    archdir =3D d.expand('${bindir}/')
> > > > +    do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-sy=
stem-%s', 'QEMU full system emulation binaries(%s)' , prepend=3DTrue)
> > > > +}
> > >=20
> > > I don't see a v3 changelog, but that does look like the unnecessary
> > > default runtime dependency is gone, but what would be the method of
> > > installing the packages if I have an image where I'd like the old
> > > non-split functionality ?
> > >=20
> > > Either a meta packages (qemu-system-all ?) or a way to override the
> > > functionality (a variable around the do_split call ?) are options to
> > > enable that sort of thing. As I mentioned before, there's a different
> > > expected split of the packages in some scenarios, and it would be
> > > ideal to not break those use cases.
> >=20
> > This is quite a common need for things which call do_split_packages,
> > I'm starting to wonder if it should support some kind of "common"
> > package as a parameter which it would add dependencies to?
>=20
> I'm trying to improve the package method to try to meet the need for=20
> both the user who cares about the rpm size and the user who want the old=
=20
> non-split functionality.
>=20
> And I just did a little search for the packages which use=20
> do_split_packages and didn't see there is any package which keep both=20
> split and no-split functionality and just only split.
>=20
> So I don't quite understand "This is quite a common need for things=20
> which call do_split_packages".
>=20
> BTW, if we still use the old non-split, is there any suitable method for=
=20
> the user who cares about the rpm size? Any suggestions?

I said we should create a package which behaves the same as the old
situation, not that we should have the same binaries in both. By that I
mean a package you can install with dependencies such that all the qemu
binaries are pulled in together. This is something which many users of
do_split_packages already do.

Taking meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
packaging.inc for example, it has some python which is commented as:

"""
# Go through all generated packages (excluding the main package and
# the -meta package itself) and add them to the -meta package as RDEPENDS.
"""

You can see alsa-plugins does:

    packages =3D " ".join(do_split_packages(d, plugindir, r'^libasound_modu=
le_(.*)\.so$', 'libasound-module-%s', 'Alsa plugin for %s', extra_depends=
=3D''))
    d.setVar("RDEPENDS:alsa-plugins", packages)

i.e. it sets the alsa-plugins package to have dependencies on all the
split packages by using the return value.

Similarly, wpa-supplicant:

split_packages =3D do_split_packages(d, libdir, r'^(.*)\.so', '${PN}-plugin=
-%s', 'wpa_supplicant %s plugin', prepend=3DTrue)
split_dbg_packages =3D do_split_packages(d, dbglibdir, r'^(.*)\.so', '${PN}=
-plugin-%s-dbg', 'wpa_supplicant %s plugin - Debugging files', prepend=3DTr=
ue, extra_depends=3D'${PN}-dbg')

if split_packages:
    pn =3D d.getVar('PN')
    d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packages))
    d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_pack=
ages))


So we have two options. Either we decide the return value is good
enough and just use that to create this package, or we add a new
parameter to do_split_packages so you could call something like:

do_split_packages(d, libdir, [xxx], append_split_packages_var=3D'RRECOMMEND=
S:' + pn + '-plugins')

directly. We might need a better name for the new parameter but you get
the idea.

Cheers,

Richard










