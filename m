Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57A7C6FA86
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 10:31:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.5594.1663842692112135550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 03:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SWJQwbam;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so3603753wmr.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=djwWz63LLCPZ8+NRHYqPY3bXjLbE2gvt1WGoT49dtWc=;
        b=SWJQwbam2of3XSvjKSVi5E9N6TMuFtXqUB4Vt5lk6WuA6AA3dvNrDfSEM1GZaRuGii
         qkexCSkYozb+Zmyzh0+qqkZbqGherp/dVhNFD4No/cfyboqQctdRkSAmjZ3o65F2koqQ
         OhCyvdKau/mOQgWb7/y1elXFR767CenTnVGjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=djwWz63LLCPZ8+NRHYqPY3bXjLbE2gvt1WGoT49dtWc=;
        b=P5kirAqM357ZIvXKKJhHCkoGGZ/YvNSQPeVC6C7FsaWquoN48NTmuGoIcy2gRIRAae
         c8IfnfEETJOoxUsD+SYYz98eJvFkwkRUHUavmdXz+3k+UqZt2zysTdLfggb62dMZsxmb
         ON/UvYUfzNTGFhKobf7mzRQXCE0lUzGOUQuOZnp2iUyt2lJCRGqXPlux22EWIYjbud0X
         /3xxAzMclHCICIx5EqkIB0lSv7n2WaDeCPhtu64Q/L51LXfP6/VdK+wLmHA7IWu+6+DA
         pb39/LPZr6DAOdexv0BJN7b/RoZakWVx/tZ17tDqNvfQtCoStv5Ag5s+5VGReEHyvacN
         0ErA==
X-Gm-Message-State: ACrzQf2j/zZ5Arp6yiKqXR7ZLrBpAAcyxT/Dr1Iqmqqx4PabyJU9CK3b
	lnFW050oSGYuTYoLt3H/jFRROg==
X-Google-Smtp-Source: 
 AMsMyM58kKoNbDQzf8jrkp//rwZ9FjxURuAYXzf2TBMY4ksy3669SoUHgxNSyylZrnx+b/9e2FtECQ==
X-Received: by 2002:a05:600c:24c:b0:3b4:fa20:6f6b with SMTP id
 12-20020a05600c024c00b003b4fa206f6bmr2653423wmj.14.1663842690131;
        Thu, 22 Sep 2022 03:31:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f87:a0ac:e77:378?
 ([2001:8b0:aba:5f3c:6f87:a0ac:e77:378])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a3170a7af9sm7317395wmq.4.2022.09.22.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 03:31:28 -0700 (PDT)
Message-ID: 
 <df90fd55c6b99f1bd2d900a43cccbe265ca9f4e1.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHV2 1/2] mesa: upgrade 22.1.6 -> 22.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2022 11:31:28 +0100
In-Reply-To: <20220921163922.34474-1-f_l_k@t-online.de>
References: <20220921163922.34474-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 10:31:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170968

On Wed, 2022-09-21 at 18:39 +0200, Markus Volk wrote:
> - add PACKAGECONFIG to build vulkan beta drivers
> - add PACKAGECONFIG for zink and build it along with vulkan
> - remove TLS-ELF patch and the associated PACKAGECONFIG. It looks like it=
s unneeded
> - remove swrast_kms backport patch
> - remove the patch that reverts the deprecation of drm_handle as it is no=
t applicable. Still needed ?
> - fix patch fuzz warnings
>=20
> License file has been changed, but no change of licenses
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/e6392fcf3d8b8dd7e3a8427=
755d8be2f2332366a
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

This failed in testing with:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4157/step=
s/14/logs/stdio

Looks like the output changed from:

renderer: "virgl"

to

renderer: "virgl (LLVMPIPE (LLVM 13.0.1, 256 bits))"

so we need something like:

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/=
lib/oeqa/runtime/cases/virgl.py
index 144decdd6b7..f19cdee9f09 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -15,4 +15,4 @@ class VirglTest(OERuntimeTestCase):
     def test_kmscube(self):
         status, output =3D self.target.run('kmscube')
         self.assertEqual(status, 0, "kmscube exited with non-zero status %=
d and output:\n%s" %(status, output))
-        self.assertIn('renderer: "virgl"', output, "kmscube does not seem =
to use virgl:\n%s" %(output))
+        self.assertIn('renderer: "virgl', output, "kmscube does not seem t=
o use virgl:\n%s" %(output))

Cheers,

Richard


