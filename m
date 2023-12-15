Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65EAC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:00:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.45347.1702598450948259978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bsKmYQYy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c69403b3eso1129865e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 16:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702598449; x=1703203249; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C3JHiAQz6/DflRCG+6Bqkja+7JTUJSMkI28IwWcHNmI=;
        b=bsKmYQYyU0dbI8WvaP6Fe8Y1I07NdXMDYKyWNTf59ApIzDgEYQjfJcoLxNQmEhRA0K
         QvNCazLcdNv13zeARiWiCPS/UJx2VMBikZfYkSeQyzO7yjEzzaJBw1w9tLJvGdtX5CLQ
         X++DipRd4Nx64n7J2/IU45YUqv1+aLI4Gu3Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702598449; x=1703203249;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3JHiAQz6/DflRCG+6Bqkja+7JTUJSMkI28IwWcHNmI=;
        b=Wa1ltIUzpvCGRU2NVj5upXF7O75ME3JukdGwKVZTsSGxBapvlrddSMoHmw1xsc04Oa
         egty1tpE5N6dBin8ZoVMMF2kW6iw2hJfwsOXrNI25xi7kYjziuxwOUDkenKtOQ99TP5f
         qM7C8E+EvS6lX2i+pFJoQuenCjknZL2HebUMb9CBNx6/jtS7pKz9d8gKr8gegE7PYERw
         RSBG6/iS2msxwFCGdhyxP/NjuHlPqLkepXFOYzoE9w8PBSUeXsClvIp5N6xzVRe/cIc0
         pHgULgFpXH/Lb7QAHEoR68RQeenkkUvQshG2TkYIdNUr5hz+zdhGzTPVFwlnvP4GbX1k
         hD2w==
X-Gm-Message-State: AOJu0YwbgTA90xylLnElpPqXUUcHIc58rQ55rzUBIQ/pBJ5oVKjAL/yZ
	mM3u8k5/42pjz40r++4H0LNdBA==
X-Google-Smtp-Source: AGHT+IEJtEKP+bvO51iAV29nE3qyI/6E95rsTCXsa7dh0wQRhWO+jfqo2pNCa6TKeleEprh6yuAuVg==
X-Received: by 2002:a1c:7210:0:b0:40c:3ea4:c0fe with SMTP id n16-20020a1c7210000000b0040c3ea4c0femr4442469wmc.100.1702598449175;
        Thu, 14 Dec 2023 16:00:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a04:9eb3:3437:42f8? ([2001:8b0:aba:5f3c:a04:9eb3:3437:42f8])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b0040b397787d3sm22964650wmb.24.2023.12.14.16.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 16:00:48 -0800 (PST)
Message-ID: <89e37363ea3dff5ff5ad807912531b74c53831d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 1/1] login.py: Proof of concept for
 screenshot testcases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Fri, 15 Dec 2023 00:00:48 +0000
In-Reply-To: <20231214164651.1107120-1-pidge@baylibre.com>
References: <20231214164651.1107120-1-pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 00:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192410

On Thu, 2023-12-14 at 16:46 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> This takes the work rburton did on image screenshot testing and
> expands it.
>=20
> Right now this only works for qemux86-64. Some standardization
> of screensize/resolution needs to happen with runqemu params for other
> machines.

I suspect that we don't want to make everything the same so we may need
to allow the code to adapt to the sizes we have, I think there are only
a small number of different ones. The annoying part may be just working
out the clock mask sizes for the different ones since we can easily
have different machine specific references.

>  There is an issue in qemux86-64 (and possibly others) where
> the screenswitch/home icon is only half present. This causes the test to
> fail. I'm unsure if this is a QMP/qemu issue but I've certainly seen
> the half-rendered icon, so it's not Imagemagick.

These are the kinds of issues we want to start catching and why this is
important!

> This test takes a screendump of a qemu image (for now, just
> core-image-sato for qemux86-64), and compares it to an image we
> have on record. Some normalisation of the different qemu configs
> need to happen to be able to support all machines. Example, the
> qemuarm64 screen size is much larger than the qemux86-64.
>=20
> The image we have on record contains a blanked out clock. We do
> the same blanking out process for the screenshot, so the images should
> have zero differences. If they do, we fail.
>=20
> In order to enable this test, you will need meta-openembedded/meta-oe in
> your bblayers.conf and the following in local.conf:
>=20
> IMAGE_CLASSES +=3D "testimage"
> TEST_SUITES =3D "login"
> TESTIMAGEDEPENDS:append:qemuall =3D " imagemagick-native:do_populate_sysr=
oot "

or HOSTTOOLS +=3D "convert compare"

?

> diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime=
/cases/login.py

I just noticed the name. Does "login" make sense for a desktop
screenshot? I can kind of see the logic but I'd not be looking in that
file for this :/.

> new file mode 100644
> index 00000000000..30074f71b66
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/login.py
> @@ -0,0 +1,42 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import subprocess
> +from oeqa.runtime.case import OERuntimeTestCase
> +import tempfile
> +from oeqa.runtime.decorator.package import OEHasPackage
> +import shutil
> +
> +class LoginTest(OERuntimeTestCase):
> +
> +    def test_screenshot(self):
> +        # Leaving this limited to qemux86-64, until I can get the same r=
esolution
> +        # on all the qemu machines.
> +        if self.td.get('MACHINE') !=3D "qemux86-64":
> +            self.skipTest("")

You mean=C2=A0

self.skipTest("Test only compatible with qemux86-64")

right? ;-)

> +
> +        if bb.utils.which(os.getenv('PATH'), "convert.im7") is not None =
and bb.utils.which(os.getenv('PATH'), "compare.im7") is not None:
> +            with tempfile.NamedTemporaryFile(prefix=3D"oeqa-screenshot-l=
ogin", suffix=3D".png") as t:
> +                ret =3D self.target.runner.run_monitor("screendump", arg=
s=3D{"filename": t.name, "format":"png"})
> +                # Use the meta-oe version of convert, along with it's su=
ffix
> +                cmd =3D "convert.im7 {0} -fill white -draw 'rectangle 60=
0,10 640,22' {1}".format(t.name, t.name)
> +                subprocess.check_output(cmd.split(), shell=3DTrue, stder=
r=3Dsubprocess.PIPE)
> +               =20
> +                # Uncomment for debugging/capturing other machine images=
.
> +                # shutil.copy(t.name, os.getenv('HOME')+"/"+self.td.get(=
'MACHINE')+".png")
> +
> +                # Use the meta-oe version of compare, along with it's su=
ffix              =20
> +                cmd =3D "compare.im7 -metric MSE {0} {1}/meta/files/imag=
e-tests/core-image-sato-{2}.png /dev/null".format(t.name, self.td.get('CORE=
BASE'), self.td.get('MACHINE'))
> +                # We use Popen here because compare outputs the values w=
e care about on stderr.=20
> +                proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3Dsu=
bprocess.PIPE, stderr=3Dsubprocess.PIPE)
> +                output, error =3D proc.communicate()
> +               =20
> +                # In theory this should be 0, however I've seen some odd=
 things with the Home icon/screen switcher.
> +                # We should as some point, log the diff image for debugg=
ing, but for now, just report that it's different.
> +                diff=3Dfloat(error.decode('utf-8').replace("(", "").repl=
ace(")","").split()[1])
> +                self.assertEqual(0, diff, "Screenshot diff is %s." % (st=
r(diff)))
> +        else:
> +            self.skipTest("Could not find imagemagick tools.")

Upon failure do we want to copy to some randomly named file in /tmp/ so
we can at least have a chance to see what went wrong (printing the name
in the test failure message)? I think currently the image would be lost
making debugging hard?

The selftests use OEQA_DEBUGGING_SAVED_OUTPUT but I'm not sure that is
available in the runtime test environment at present unfortunately.

Cheers,

Richard





