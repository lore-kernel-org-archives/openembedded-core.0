Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D59479343
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:34:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u12-v6so19908777wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gG7GDeoQzjla0su0eGrXv3QUYjohkOBMHKr2UbMYC7U=;
	b=hDpP4sPmSf+qRYo0OSIbzVsVH/tKeaU/kv7mF3y8RAyjj02XHKNJTizn4pZmHhrrKL
	r4tgcktf8CoC5KEqiMGsu7i0YXQmlKs7kJ8PRUcdevnTH3Kdlccc+gyrPny64EJlhW/Z
	Wfpxj/EriioWAmKQh7mYxE66SIShakflzOJ3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gG7GDeoQzjla0su0eGrXv3QUYjohkOBMHKr2UbMYC7U=;
	b=E50uRJvbc4m2ESmQ5+QFZXgIXg7R8jKn6Wb7MreuhHTQ/AQwDfgkhM0ATQxUctk+1v
	2V6kBb1eau54z9cbrJRam2pK/BVQCl5aDs2z8JqFhPRXjP44FkexfAn+KzSRqe67d9bK
	lmcWUkNaA8AxOH76D2LAc+MP3eOjk+tZ7ueQbcfvIhu/XxE0QBar15aczC8JfAWD8K8o
	9rj0YdPrh8Om47lohqMNdgv29GiVFaQC/9W+Zmlrbtmpfe2hFVf4ETHzlzVNBaEaev+3
	X21W5MClnVYwNuyCO5u3Tz5T4d1sOthqpkqDjPWXZiuqYAGFNTq21Dnx4RBNxlkWktwP
	rrvg==
X-Gm-Message-State: ABuFfoj3RpDXhAfoR30MCmGwUKEYf1pZXqMYhCDPSdXLT75uHqRmQySW
	C0Vz21PHFHvstckwNWWFqm+dbg==
X-Google-Smtp-Source: ACcGV627LNUAiaSjmh76Lmmu6gLA6vgGfwAnXyfCbR002B+8CkxF7cmmG8dTpyOG5wTJpz4suLHHMA==
X-Received: by 2002:adf:f842:: with SMTP id
	d2-v6mr8837638wrq.172.1537799650906; 
	Mon, 24 Sep 2018 07:34:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j25-v6sm4192177wmc.12.2018.09.24.07.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 07:34:09 -0700 (PDT)
Message-ID: <10f800c6f1427c064abed5b731df6f826800c410.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de
Date: Mon, 24 Sep 2018 15:34:08 +0100
In-Reply-To: <20180924141953.GM9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<CADkTA4OOvw7xqYs0Pd9eOwY3pmELhnk8ThnyuhdermCrhpmRGw@mail.gmail.com>
	<6e907abfede0cad4292c4c44ea74f4f8bbe90093.camel@linuxfoundation.org>
	<20180924141953.GM9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 14:34:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 14:19 +0000, Mikko.Rapeli@bmw.de wrote:
> My only complaint is that it's not obvious in a kernel recipe that
> more than do_install() is needed to export files to sysroot.
> It's easy to miss the sysroot_stage_all_append() step.

I think that becomes a documentation problem. The bbclass helper may
also help?

> Overwriting files from kernel recipe fails when they are used to
> prepare sysroots for user recipes, but not when the kernel recipe is
> build:
> 
> ERROR: linux-image-1.0.0-r21 do_prepare_recipe_sysroot: The file
> /usr/include/scsi/scsi_bsg_fc.h is installed by both linux-libc-
> headers and linux, aborting
> ERROR: linux-image-1.0.0-r21 do_prepare_recipe_sysroot: Function
> failed: extend_recipe_sysroot
> 
> In this case linux recipe added kernel specific headers to
> /usr/include which conflict with linux-libc-headers and this was only
> cought when building the kernel image.

That is true, not sure how exactly we'd detect that earlier either (in
a way which doesn't kill performance or involve special cases). I'm
open to ideas, documentation is the main tool I think we have here.

Cheers,

Richard

