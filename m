Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C426CC4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:55:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.30.1702500952011533827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OtPFBoww;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so46437355e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702500950; x=1703105750; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7VrzNBHaR3tDX/kP8oDDzVFca/DxlWhO4PMb7tI8/Xw=;
        b=OtPFBowwwuh7cdxZ5uDtQdBuGSEEFHHxhEyfDQjHfRzNxqOFUw05pPTopNA6mLOwNb
         /FRLQXIfGe6lxYNx+o5lKU0o3bB+hn8KQk1DrjxtkQ3PSPjSJQAjsVYsMlrEVKH8dl/r
         dBlrFJMwSpagXnyIkRPa3DPdC+G/cvxJy3YeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500950; x=1703105750;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VrzNBHaR3tDX/kP8oDDzVFca/DxlWhO4PMb7tI8/Xw=;
        b=SaDECzzOS8OLz7HsYgyuX/uqBGyG62qu2bwt4kYIvUlAjpBVc40hn9iL94khJ6Yghi
         MC6b9WX3d6mSNa78LKS47RiOhp5FTOyopCxH6j7SNLVyh9IU+q8YVZxOCE7/VAZECs3m
         SNOS18wIFZEu7vWZp+YsAeRBBycKxB6K8yi7MaMbFpPVg4kdE7q7gBfyShu9Jf1CLOBd
         4MfXLRQINZCCIrybtGeNVO5bQJYKrfGH9d5X5KP3d5D9EKajqfxOIQfFuuLxI+GsqBFu
         pCmC01lOfRuYUxRQVV51PLPa1tz8HAPDCdaysKOXRPr4ZzxAZj9e3kOvd2V9itg3AjsD
         ef5A==
X-Gm-Message-State: AOJu0YwlDMF4rJDBkoOaYhD/kCJn5Zav1b5WqmSGAcT9B+GK18knADFh
	463M7Ay3zwEwsYXPqnIlJOr5DA==
X-Google-Smtp-Source: AGHT+IEgx/Jv7dI13lejJVXxwgaRD9NHwDGUYnaqo6V5uuZgsNaJKrGLVV9fGYmam3G5U0atHHw4Rw==
X-Received: by 2002:a05:600c:480a:b0:40c:4ece:9654 with SMTP id i10-20020a05600c480a00b0040c4ece9654mr1813834wmo.57.1702500950226;
        Wed, 13 Dec 2023 12:55:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:bb34:6d69:83d3? ([2001:8b0:aba:5f3c:7173:bb34:6d69:83d3])
        by smtp.gmail.com with ESMTPSA id fa17-20020a05600c519100b0040c46719966sm13020441wmb.25.2023.12.13.12.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:55:49 -0800 (PST)
Message-ID: <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 4/4] login.py: Proof of concept for
 screenshot testcases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Wed, 13 Dec 2023 20:55:49 +0000
In-Reply-To: <e43f9d74edb8a9504075964ac9a277dc031560cb.1702499299.git.pidge@baylibre.com>
References: <cover.1702499299.git.pidge@baylibre.com>
	 <e43f9d74edb8a9504075964ac9a277dc031560cb.1702499299.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192322

On Wed, 2023-12-13 at 20:30 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> This takes the work rburton did on image screenshot testing and
> expands it.
>=20
> Right now this only works for qemux86-64. Some standardization
> of screensize/resolution needs to happen with runqemu params for other
> machines. There is an issue in qemux86-64 (and possibly others) where
> the screenswitch icon is only half present. This causes the test to
> fail.
>=20
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
> IMAGE_INSTALL:append =3D " python3-qemu-qmp "
> TESTIMAGEDEPENDS:append:qemuall =3D " imagemagick-native:do_populate_sysr=
oot "
>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> Co-authored-by: Ross Burton <ross.burton@arm.com>
> Co-authored-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylib=
re.com>
> ---
>  .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 bytes
>  meta/lib/oeqa/runtime/cases/login.py          |  34 ++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/files/image-tests/core-image-sato-qemux86-64.png
>  create mode 100644 meta/lib/oeqa/runtime/cases/login.py
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime=
/cases/login.py
> new file mode 100644
> index 00000000000..9e351fdeb29
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/login.py
> @@ -0,0 +1,34 @@
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
> +
> +class LoginTest(OERuntimeTestCase):
> +
> +    @OEHasPackage(['python3-qemu-qmp'])

This only works if we have python3-qemu-qmp in the target? I thought
the monitor was external?

> +    def test_screenshot(self):
> +        if self.td.get('MACHINE') !=3D "qemux86-64":
> +            self.fail

So we're going to throw failures on all other machines? Wouldn't a skip
be more appropriate? Can we provide images for other machines?

Have a look at things like:
   @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently=
")

> +
> +        if bb.utils.which(os.getenv('PATH'), "convert") is not None and =
bb.utils.which(os.getenv('PATH'), "compare") is not None:

This works for nativesdk-imagemagick but it would need convert+compare
in HOSTTOOLS to work for a host binary. I'm torn on the best way to
find that otherwise.

> +            with tempfile.NamedTemporaryFile(prefix=3D"oeqa-screenshot-l=
ogin", suffix=3D".png") as t:
> +                ret =3D self.target.runner.run_monitor("screendump", arg=
s=3D{"filename": t.name, "format":"png"})
> +                # Use the meta-oe version of convert, along with it's su=
ffix
> +                cmd =3D "convert.im7 {0} -fill white -draw 'rectangle 60=
0,10 640,22' {1}".format(t.name, t.name)
> +                proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3Dsu=
bprocess.PIPE, stderr=3Dsubprocess.PIPE)
> +                output, error =3D proc.communicate()

You probably want subprocess.check_result()=20

> +
> +                # Use the meta-oe version of compare, along with it's su=
ffix
> +                cmd =3D "compare.im7 -metric MSE {0} {1}/meta/files/imag=
e-tests/core-image-sato-{2}.png /dev/null".format(t.name, self.td.get('CORE=
BASE'), self.td.get('MACHINE'))
> +                proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3Dsu=
bprocess.PIPE, stderr=3Dsubprocess.PIPE)
> +                output, error =3D proc.communicate()

and check_output()

> +                diff=3Dfloat(error.decode('utf-8').replace("(", "").repl=
ace(")","").split()[1])
> +                self.assertEqual(0, diff, "Screenshot diff is %s." % (st=
r(diff)))
> +        else:
> +            self.fail

Wouldn't:

self.skipTest("could not find convert tool from imagemagick")

be better?

Right now I can't merge this. With skip()s I can at least merge whilst
we sort the other pieces.

Cheers,

Richard




