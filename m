Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id C19CC798BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:31:02 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id h3-v6so1770226ita.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=92dVKNENppFUuTTKiMry2jdWX4BKLinaMOLOxT6rs2E=;
	b=Saz1HeSyUllyiGA+ljOcn4mJCfM9IKBwGKyw4oA/kNbAO5Lg6uLW9t62KuPhaofRjm
	FAM6ab73F0xT8AHIrncqwfBMI4IS8poka8lLGkN12u5IM4C7EGLyS479z9nR4Skm078V
	hMikZ0IRE4V9CcCp9xdxxjuhnUMDMX5q038Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=92dVKNENppFUuTTKiMry2jdWX4BKLinaMOLOxT6rs2E=;
	b=Qy66Ng/pa8d/Rm1z5Ev7F6GlpHe7u6dgaXEbKhBbi60Yz2YWwuvhT7YCV3UZH/hKYW
	TpqvWOypmiH6KmlGBDG2i86xW5dXqSfazYNV9nEztO9xy3/9en+zz4kiAoDDnE93Wbv7
	XUejDj3Bxl/nHopcapWS7MiPc+sqw0iq35FJSg+LKRee8pzuDZEZOfUFnLSyhZwkvv2F
	zXgcI2C74YUViJkFHVqbPqWPegreMefw06862/4IvDSb7e2+KRdzuzabTwL18f/BH0Vc
	DfhQJ62nHKNtYfkfXSQ5OlxB/HvKj5Z1m6qm/i7QKCIIfEHe1Xyb4vUaQf1m9HIQQZfq
	T0lQ==
X-Gm-Message-State: APzg51C57GcEwHJ+qMmsgONYDl19f0ZX+OcfYlVq+/TFrG52UWoiVGuJ
	dJW8nywD/QnmhRy7mIgdcmjVoA==
X-Google-Smtp-Source: ANB0VdZws5BqXh0FfxI8/aqWypQ8mOrl0MQ4kCxf/krqs0eDNPinadghm19SJHg7VP46XpbUT3Ie8g==
X-Received: by 2002:a24:9e87:: with SMTP id
	p129-v6mr5570306itd.112.1537533063753; 
	Fri, 21 Sep 2018 05:31:03 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	y18-v6sm2305640ita.29.2018.09.21.05.30.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Sep 2018 05:31:02 -0700 (PDT)
Message-ID: <8fc9546b42e3a3613fe801184f0bcef7e60a26b4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 05:30:46 -0700
In-Reply-To: <5ec9dd0c-82e5-782f-26ca-bf274944f98d@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
	<f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
	<983d28517b9e9015b590405bbb7f91ffc0d6aa48.camel@linuxfoundation.org>
	<009c3d50-37ee-f2e7-30f4-f9a083233ded@windriver.com>
	<a67901f5659bea6428a41bb3277b2d8e3d4e4110.camel@linuxfoundation.org>
	<5ec9dd0c-82e5-782f-26ca-bf274944f98d@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Fri, 21 Sep 2018 12:31:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-09-21 at 16:09 +0800, Hongxu Jia wrote:
> On 2018年09月21日 11:47, richard.purdie@linuxfoundation.org wrote:
> > The problem I really want to fix is the hang as openssh-server
> > starts.
> > Without the defconfig options above, openssh server hangs at key
> > generation. With the changes I've mentioned applied, key generation
> > proceeds, the server starts and we can ssh into the machine.
> 
> OK, I will workaround the issue by depending openssl10 on qemuarm64.
> 
> But the root cause is the hung of getrandom in kernel

We therefore need to fix the kernel config so it only pauses, it
doesn't hang indefinitely. We do not want to make openssh depend on
openssl10 only for qemuarm64, that does not make sense.

Cheers,

Richard

