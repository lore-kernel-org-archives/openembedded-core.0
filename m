Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64198C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:29:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.28841.1702574987070618107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GRpg7uBI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so78864145e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702574985; x=1703179785; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P2JUgrWIkQMPDB2m3wlW1g9uL+rSAq/AQwXVczyoeb8=;
        b=GRpg7uBItyQb8e9EPirCaWd6icII+CBu0VcVSXYMX11IA7f191HO98QlYJuOL/0pgc
         nqaAnokOepnCYaUKteaOXS2HcMds6W4HaJzfPA2f4dwJFx6i1d3PjNqCWx/PJDfni6d4
         vxhHY7s5QqnozNwjqLXdmrWlQrrl1vCNMVzso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574985; x=1703179785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2JUgrWIkQMPDB2m3wlW1g9uL+rSAq/AQwXVczyoeb8=;
        b=fYhLTgwBQftdEcyQ2rdElS2WdpfY6dVR+MzSs1i3cQKEdPcoKYwGBeg159lZVzl9Ve
         Kpya2U6P1knS8Zpf+TpxfKSs7sWnjl46SJK8d4L7zYX857Fy8KcZ8fhC0vEonC32RdUx
         V7YTVLf0nAKhZe937qShLEeqN3CIyO8il2pvMC6vxpJs/PkuUuvvyKleXoE6JYcQmmKA
         sTE96NRQILwjbqs5r8oPX0rBiIlFPAQYiQ7IawkrB+5jVDQ4/HOe11qdqi32RqiRxr+8
         hPVAIzLSePCyDy72guFsecIiFcLgXnD/kbTGgpPPt0xccb3b5On4x9sKdowsEB0K1z0Q
         a3Iw==
X-Gm-Message-State: AOJu0YxfzUwomvdT6L97AxYJqTl+JWvlLrVLjDs3y96DK6Uf9vWT0FXh
	jbfih+pEH75FsglYDSDU05VP6g==
X-Google-Smtp-Source: AGHT+IG7mugJ/ncox7624YxA0QgwY4vwSrDsJ/devJH+XEDCpXSJMmU95Z+vy5WUBw019LAfqB6kyA==
X-Received: by 2002:a05:600c:22c3:b0:40c:61fe:383c with SMTP id 3-20020a05600c22c300b0040c61fe383cmr368664wmg.198.1702574985474;
        Thu, 14 Dec 2023 09:29:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm28133976wmb.9.2023.12.14.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:29:45 -0800 (PST)
Message-ID: <d82201043114b03ea7b2cdc5fd65da7084b1c443.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 4/4] login.py: Proof of concept for
 screenshot testcases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Thu, 14 Dec 2023 17:29:44 +0000
In-Reply-To: <c5ad4f86-5aa9-4529-9a6d-44641b65600b@baylibre.com>
References: <cover.1702499299.git.pidge@baylibre.com>
	 <e43f9d74edb8a9504075964ac9a277dc031560cb.1702499299.git.pidge@baylibre.com>
	 <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
	 <c5ad4f86-5aa9-4529-9a6d-44641b65600b@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 17:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192397

On Thu, 2023-12-14 at 16:32 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> On 13/12/2023 20:55, Richard Purdie wrote:
> > On Wed, 2023-12-13 at 20:30 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in wrote:
> > > This takes the work rburton did on image screenshot testing and
> > > expands it.
> > >=20
> > > Right now this only works for qemux86-64. Some standardization
> > > of screensize/resolution needs to happen with runqemu params for othe=
r
> > > machines. There is an issue in qemux86-64 (and possibly others) where
> > > the screenswitch icon is only half present. This causes the test to
> > > fail.
> > >=20
> > > This test takes a screendump of a qemu image (for now, just
> > > core-image-sato for qemux86-64), and compares it to an image we
> > > have on record. Some normalisation of the different qemu configs
> > > need to happen to be able to support all machines. Example, the
> > > qemuarm64 screen size is much larger than the qemux86-64.
> > >=20
> > > The image we have on record contains a blanked out clock. We do
> > > the same blanking out process for the screenshot, so the images shoul=
d
> > > have zero differences. If they do, we fail.
> > >=20
> > > In order to enable this test, you will need meta-openembedded/meta-oe=
 in
> > > your bblayers.conf and the following in local.conf:
> > >=20
> > > IMAGE_CLASSES +=3D "testimage"
> > > TEST_SUITES =3D "login"
> > > IMAGE_INSTALL:append =3D " python3-qemu-qmp "
> > > TESTIMAGEDEPENDS:append:qemuall =3D " imagemagick-native:do_populate_=
sysroot "
> > >=20
> > > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@bay=
libre.com>
> > > Co-authored-by: Ross Burton <ross.burton@arm.com>
> > > Co-authored-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@ba=
ylibre.com>
> > > ---
> > >   .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 byte=
s
> > >   meta/lib/oeqa/runtime/cases/login.py          |  34 +++++++++++++++=
+++
> > >   2 files changed, 34 insertions(+)
> > >   create mode 100644 meta/files/image-tests/core-image-sato-qemux86-6=
4.png
> > >   create mode 100644 meta/lib/oeqa/runtime/cases/login.py
> > >=20
> > > diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/run=
time/cases/login.py
> > > new file mode 100644
> > > index 00000000000..9e351fdeb29
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/runtime/cases/login.py
> > > @@ -0,0 +1,34 @@
> > > +#
> > > +# Copyright OpenEmbedded Contributors
> > > +#
> > > +# SPDX-License-Identifier: MIT
> > > +#
> > > +
> > > +import subprocess
> > > +from oeqa.runtime.case import OERuntimeTestCase
> > > +import tempfile
> > > +from oeqa.runtime.decorator.package import OEHasPackage
> > > +
> > > +class LoginTest(OERuntimeTestCase):
> > > +
> > > +    @OEHasPackage(['python3-qemu-qmp'])
> >=20
> > This only works if we have python3-qemu-qmp in the target? I thought
> > the monitor was external?
> >=20
> > > +    def test_screenshot(self):
> > > +        if self.td.get('MACHINE') !=3D "qemux86-64":
> > > +            self.fail
> >=20
> > So we're going to throw failures on all other machines? Wouldn't a skip
> > be more appropriate? Can we provide images for other machines?
>=20
> I can get images for other machines, but it's going to take a bit to run=
=20
> everything. I've debug code to grab those images. The other option is to=
=20
> ensure the other qemu machines have something like QB_GRAPHICS =3D=20
> "-device virtio-gpu-pci, xres=3D800,yres=3D600" to normalise the resoluti=
ons

One step at a time I guess but I would like this to ultimately work
with our commonly used machines.

> >=20
> > Have a look at things like:
> >     @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curr=
ently")
> >=20
> > > +
> > > +        if bb.utils.which(os.getenv('PATH'), "convert") is not None =
and bb.utils.which(os.getenv('PATH'), "compare") is not None:
> >=20
> > This works for nativesdk-imagemagick but it would need convert+compare
> > in HOSTTOOLS to work for a host binary. I'm torn on the best way to
> > find that otherwise.
>=20
> Fixed to rely on the imagemagicks provided by TESTIMAGEDEPENDS:append.
>=20
> >=20
> > > +            with tempfile.NamedTemporaryFile(prefix=3D"oeqa-screensh=
ot-login", suffix=3D".png") as t:
> > > +                ret =3D self.target.runner.run_monitor("screendump",=
 args=3D{"filename": t.name, "format":"png"})
> > > +                # Use the meta-oe version of convert, along with it'=
s suffix
> > > +                cmd =3D "convert.im7 {0} -fill white -draw 'rectangl=
e 600,10 640,22' {1}".format(t.name, t.name)
> > > +                proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=
=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)
> > > +                output, error =3D proc.communicate()
> >=20
> > You probably want subprocess.check_result()
> >=20
>=20
> check_output, but yes, that works here.... but...

I meant check_call() since you don't use the output.

> > > +
> > > +                # Use the meta-oe version of compare, along with it'=
s suffix
> > > +                cmd =3D "compare.im7 -metric MSE {0} {1}/meta/files/=
image-tests/core-image-sato-{2}.png /dev/null".format(t.name, self.td.get('=
COREBASE'), self.td.get('MACHINE'))
> > > +                proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=
=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)
> > > +                output, error =3D proc.communicate()
> >=20
> > and check_output()
>=20
> ...doesn't here. In this case, we should probably either use run() or=20
> Popen() because imagemagick returns non-failing output on stderr (which=
=20
> is what we need) as well stdout (which we don't really want). Using=20
> Popen allows us to do this a bit cleaner as opposed to check_output.


You can use  stderr=3Dsubprocess.STDOUT with check_output?

Cheers,

Richard


