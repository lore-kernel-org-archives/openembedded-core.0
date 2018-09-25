Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9096003C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 15:22:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s12-v6so13906777wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OETUr9bbqAuZHY0w8ZYlmnWsUMo/SWZ8JumVew17DZo=;
	b=OamWdhKjQ9K4kAgqre0M9L9N5/tHRA4feCOfYoXWSnE2AMOleCSCLOGlG0gkITYf21
	zZ2JTfxCIYW4JJep69s3E36T6RH0LfCggOwqhWTTKselNPXia9XxrbUKXM6TBtEW42L/
	IEizMOGltOetIRqG14wy4A9NVq0F+d/M+HrXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OETUr9bbqAuZHY0w8ZYlmnWsUMo/SWZ8JumVew17DZo=;
	b=ZrK1cLmyv1DA/i25OKJRKDJId59wSr2uej2cMemZfn+upVedOV++hINJ/PvkRm1Ecu
	ehbQ24V6FhoVldjPPcj0r6cQcY6iaMHW5nkU+TzLgrSaAnKtqLXYJVOAryGl2uiIutDP
	utc+8SOIUFrn1ui1J2d6GygHxBxfRehp/8lmvzW717sCGO2pEdLNeCwLqf/bT2xf59pl
	2p91dfB+Mtrd7ArcjyhPesXnqggNM/CLacmS/xkZ4G+liRlyONhftOx9afqu9qcYfcHS
	V4jzPAAribuGH11uAvt8DSz2sr1K2X6rXLAxgioKUOThIi70IcjvLIrrBNHNoQP84H4g
	y8Qw==
X-Gm-Message-State: ABuFfojRthvb3nVKfA9p3b/YdcAl6P9So40/0znqEIcB/L2n+FjH5DiM
	JWILRCBsdJy/ZICrfY/QNB/ssQ==
X-Google-Smtp-Source: ACcGV602fgskqV3jLxjtyHgqIxWiZzhGtvrvqJBKVpdfj+xcISWaQ5qyTFx80XbMdkJC7STX/Tz7uA==
X-Received: by 2002:a1c:1203:: with SMTP id 3-v6mr1269916wms.46.1537888976883; 
	Tue, 25 Sep 2018 08:22:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w192-v6sm9428wmf.33.2018.09.25.08.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 08:22:55 -0700 (PDT)
Message-ID: <b747d8c76cefee96ac29304de59799b4f5da0050.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrej Valek <andrej.valek@siemens.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 16:22:54 +0100
In-Reply-To: <711648b8-d33e-3f5d-1ce2-c130ce066166@siemens.com>
References: <711648b8-d33e-3f5d-1ce2-c130ce066166@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: bluehills7@comcast.net, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK and out of tree modules
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
X-List-Received-Date: Tue, 25 Sep 2018 15:22:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-25 at 16:51 +0200, Andrej Valek wrote:
> I have seen, that You have been supporting someone with the similar
> problem.
> So, I would like to ask you as question about current status of
> failing task for kernel-devsrc recipe. I have found similar thread
> about the same issue, but without final solution
> (https://lists.yoctoproject.org/pipermail/yocto/2018-July/042007.html
> ).
> 
> I wanted to run populate_sdk_ext on my image (tested on qemuarm and
> another arch) with included kernel-devsrc package. It showed me
> warning
> message:
> WARNING: image-sdk-1.0-r0 do_populate_sdk_ext: Manifest
> build/tmp/sstate-control/manifest-allarch-kernel-
> devsrc.populate_sysroot
> not found?
> 
> Mentioned directory has these files:
> build/tmp/sstate-control/manifest-qemuarm-kernel-devsrc.package_qa
> build/tmp/sstate-control/manifest-qemuarm-kernel-
> devsrc.package_write_ipk
> build/tmp/sstate-control/manifest-qemuarm-kernel-devsrc.packagedata
> build/tmp/sstate-control/manifest-qemuarm-kernel-devsrc.populate_lic
> 
> But the file "manifest-allarch-kernel-devsrc.populate_sysroot" is
> missing. I guess, due to do_populate_sysroot[noexec] = "1" in
> kernel-devsrc recipe.
> 
> Isn't possible to have this package included in image for populate
> task?
> Is it somehow fixed?

Is this with master? I did resolve a number of sdk manifest warnings
recently so before I start looking more closely I'd like to check this
was seen with latest master.

You're right that the noexec would likely cause this issue.

Cheers,

Richard

