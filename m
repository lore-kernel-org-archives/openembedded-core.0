Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id A7D7060088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 18:59:11 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so105469682igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 11:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=5yc/62xSAbLJVt3WvyinznoYpYFc7RBV6RTl6nVS2DY=;
	b=HhIlFx2ugRFVHx+P84S0er3Dg7WGdYT3RTE4i6pXoKErJue/gkrl9/a9Nhaq4JdKkC
	g0YjJO9HqDQtY5E7MqtKt+H90cOH45xENHlfYjY5TsuXG7HHs+DZETIwKirWPtB02Avn
	DdnO/2Uf+vDGFkcDg1RSOIUnhSm7ChZa2CpsUH9lqctDLIAHGHHwPrEZOXfa2oreXlBo
	ZGIRdQ1gxN9rIS3IhQ+rdO/a3AWUCmVvmKDAeWNckQBFHzdjHE/muERLjJPmQvEZNSep
	ICIrsyJizk2hfjUpnSBMA9ukeBbQI3OxVup93u75TDfqp0uLosBRGGSSvhtQXss+HICZ
	rMoA==
X-Gm-Message-State: ALoCoQkfDS/RUPgQKLM+WcMhwY63MSuFkiFVeuhFeuPG44urmvpqwEQMeWtOswQ8rmor7y5QtNiV
X-Received: by 10.50.103.99 with SMTP id fv3mr33130744igb.69.1445453951270;
	Wed, 21 Oct 2015 11:59:11 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176])
	by smtp.gmail.com with ESMTPSA id n3sm12620151iga.0.2015.10.21.11.59.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 11:59:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofz202 with SMTP id z202so67815723iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 11:59:09 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.17.18 with SMTP id z18mr5061453ioi.28.1445453949605;
	Wed, 21 Oct 2015 11:59:09 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 21 Oct 2015 11:59:09 -0700 (PDT)
Date: Wed, 21 Oct 2015 16:59:09 -0200
Message-ID: <CAP9ODKoCAjfYrb+w_MV3aopjxBEd2iCdRq6wwH=BwVCy_iAbig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: sysroot referencing old machine
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
X-List-Received-Date: Wed, 21 Oct 2015 18:59:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Our autobuilder has catch a failure[1] which seems to be related to the GCC 5.2.

1. http://ci.ossystems.com.br/job/fsl-community-bsp-jethro_wayland-imx6dlsabreauto/1/console

I did a grep in the sysroot and got:

jenkins@builder:~/workspace/fsl-community-bsp-jethro/build-wayland/tmp/sysroots/imx6qsabreauto$
grep cgtqmx6 -R 2>/dev/null
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/usr/lib/libc_pic.a
matches
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/usr/lib/libc.a
matches
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/lib/libSegFault.so
matches
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/lib/ld-2.22.so
matches
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/lib/libc-2.22.so
matches
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/lib/ld-linux-armhf.so.3
matches
Binary file usr/include/glibc-locale-internal-cortexa9hf-vfp-neon-poky-linux-gnueabi/lib/libc.so.6
matches
Binary file usr/lib/libc_pic.a matches
Binary file usr/lib/arm-poky-linux/5.2.0/libgcov.a matches
Binary file usr/lib/arm-poky-linux/5.2.0/libgcc.a matches
Binary file usr/lib/arm-poky-linux/5.2.0/libgcc_eh.a matches
Binary file usr/lib/libc.a matches
Binary file usr/lib/arm-poky-linux-gnueabi/5.2.0/libgcov.a matches
Binary file usr/lib/arm-poky-linux-gnueabi/5.2.0/libgcc.a matches
Binary file usr/lib/arm-poky-linux-gnueabi/5.2.0/libgcc_eh.a matches
Binary file lib/libSegFault.so matches
Binary file lib/ld-2.22.so matches
Binary file lib/libc-2.22.so matches
Binary file lib/ld-linux-armhf.so.3 matches
Binary file lib/libc.so.6 matches

Do someone have any guess where to start looking?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

