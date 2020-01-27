Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 550AE7FD70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:13:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g1so6148346wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OvtK4mUmNpt6UBLE0/sBwFUpihlXA/ctTdFts2sL+v0=;
	b=HaByDR+jVEtHlyCah+dKgoS0Kw2nV2NGFEGEK5q96Y8ZapPK4RkU3SM2dAbMmFN8LB
	F2N3PQ9XyjcP4+7hXTBrjxXQVsxtAq28VzqWvNzx2SPlEXPapvMbh1p3JGLkHT6283yr
	BYFmW8LldlaI8+nJmcZnHaMs0wgFE+Cg3etTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OvtK4mUmNpt6UBLE0/sBwFUpihlXA/ctTdFts2sL+v0=;
	b=QAPFuEhVix87wgfWyxxmbvmYzKw5gZtAI6/vI5RCnBO4gbzo33ubDsyQ8jSxP2Qz5S
	SfZ+00NxKKK9/xkXiemso9wsddjONDy9hNgx7qxjLFbWrvthJ1gj4rs8hIg+tZNvOrqN
	Oxm7ObBGjkHZA7ePZcB8sUUB220LazpVAEPkl8w/AMKaGnhpLjL9Ol6wnh+6cMy1IRTy
	2iSW7/EZoIdjwcy7xwXvnRUN6mAg7mTUQMmwTYGl4UO8pJ2w2AqnZCAB78xledsfzkTO
	/idpwnTMzy2ZOh7t8PlzAgvmj2O400ckwTv14n/KeZP07FGFScO34YxVmjfhib+fCEu1
	98yQ==
X-Gm-Message-State: APjAAAUtnOG+u96Otkr6YqmYXQErHgDr0Uot88hmlWM+k+e90m1tvKOz
	y1jdbdnT0F0c5qSaaGfXHSMYXRMV3Is=
X-Google-Smtp-Source: APXvYqx6JEpp0Uvwov0B8bj86JAKeudATemXHUfsxedhWeQnKVwtrJrOwOr6me1RI5keKrFbXJSqPA==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr13741926wmi.91.1580120003060; 
	Mon, 27 Jan 2020 02:13:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm22934445wrg.27.2020.01.27.02.13.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 02:13:22 -0800 (PST)
Message-ID: <b97df9ca5093d9131ad82d2cb1250aeea368612d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 10:13:18 +0000
In-Reply-To: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Mon, 27 Jan 2020 10:13:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-27 at 02:00 -0800, Alejandro Enedino Hernandez Samaniego wrote:
> Create HelloWorld examples that run on several of the QEMU architectures
> supported by the build system.
> 
> This recipe can be used by anyone to understand how baremetal applications
> can be built using OpenEmbedded and how the wiring to set them up could be.
> 
> This should also facilitate creating/extending the OE testing infrastructure
> to allow baremetal applications or RTOSs to be tested in the same way that
> Linux currently is.
> 
> This can easily be extended to work on other MACHINES in the future.
> 
> To run this example:
> 
> # Source the oe environment as usual
> $ source oe-init-buildenv
> 
> # Set TCLIBC to either newlib or baremetal
> $ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf
> 
> # Use one of the supported architectures (qemuarm64, qemuarm or qemuarmv5)
> $ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf
> 
> # Build
> $ bitbake baremetal-helloworld
> 
> # Launch QEMU
> $ runqemu
> 
> runqemu - INFO - Running bitbake -e ...
> runqemu - INFO - Continuing with the following parameters:
> KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> MACHINE: [qemuarm64]
> FSTYPE: [bin]
> ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.qemuboot.conf]
> 
> Hello OpenEmbedded!

Looks good.

Should this be in meta-skeleton? That sublayer generally has our
configuration example tests in as far as I can tell...

Do you plan to add an oe-selftest for this?

Cheers,

Richard


