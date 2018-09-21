Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E23171B27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:29:59 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n18-v6so11993124ioa.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=07UmLdBETAkmYVGny+g4SuPvBi5JiHXxLQL9GN/TcNg=;
	b=UqH/UcUmH0ZasamHgTLady41LTMt8vxsQqLMrS9qCBnV8WyuARP6kPISaxLrMWp7ap
	C2XB5Sr0EWfF9zwmC6KEA+04ek26eJl4/SqHuMDvEvYmS/21wbQSLy9a3M+q+MUCoONh
	oZQCbX8D1AV6TbTFfVrlOrZtDsL1u5GI3VjXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=07UmLdBETAkmYVGny+g4SuPvBi5JiHXxLQL9GN/TcNg=;
	b=V+aZljNkcWDeUiRxPqaTmroo73n2bFjDOh8QpiYBD/GHLbyBkHog9URTKZbbuqlPid
	mPSTE+XuSV5OwI5f9HDgDWuNlChorA3ZmmvqRh3CV3Xkk+PmlCcdcK8LCmzx+MpMvwCF
	WnB8T31iuFkxU+kVkC3vvYPtqbRLx4F7DQZlSJ3Edk4m1cQBKSiDZwOkmcR0N9fgsn3f
	rLNtemx4E3FeBjbXCSIxzxE4FMQeJ5iUhojOv5cKHHgDheV6YLIJPrWc364WHQ3vMfx1
	q5WOShxB8Bzwzi4zuPLMgaFgWU06JFIvTwY+5lIvhZ/Pet8YNTQ2RianLnZXUsiVbbih
	vIeQ==
X-Gm-Message-State: APzg51BOwNyQ4POz1W17dQegBRSuy54TFAzz+0CKfGs79yM+y1rfoYr1
	92O4cZV9ljQEO2goCPNEttgaAA==
X-Google-Smtp-Source: ANB0VdZCG3Gd7ks7IeWq91Q0snaACtVm6UXSsOJ6SA/O6rCc63DDKPXZ7OEKMpI4u8D5FNfUx9K8qw==
X-Received: by 2002:a6b:3451:: with SMTP id
	b78-v6mr36516114ioa.214.1537533000730; 
	Fri, 21 Sep 2018 05:30:00 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	l21-v6sm9135982iom.8.2018.09.21.05.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Sep 2018 05:29:59 -0700 (PDT)
Message-ID: <eac231a57e5011819b62976589e2be9d6632570c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 05:29:36 -0700
In-Reply-To: <e3c77c41-1e8d-5d49-4747-fc1c6fb9e3f6@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
	<f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
	<983d28517b9e9015b590405bbb7f91ffc0d6aa48.camel@linuxfoundation.org>
	<e3c77c41-1e8d-5d49-4747-fc1c6fb9e3f6@windriver.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 12:30:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-09-21 at 17:08 +0800, Hongxu Jia wrote:
> On 2018年09月21日 01:54, richard.purdie@linuxfoundation.org wrote:
> > We do not want to revert those commits. I think the right solution
> > is
> > to enabled:
> > 
> > CONFIG_CRYPTO_DEV_VIRTIO=y
> > CONFIG_PCI=y
> > CONFIG_PCI_HOST_GENERIC=y
> 
> It should add
> 
> CONFIG_VIRTIO_PCI=y
> 
> Then sshd will hung a short time (50s)
> 
> After crng init done, everything is ok
> 
> [boot log]
> 
> [   65.969600] random: crng init done
> 
> done.
> Starting syslogd/klogd: done
> 
> OpenEmbedded nodistro.0 qemuarm64 /dev/ttyAMA0
> 
> qemuarm64 login:
> 
> [boot log]

Right, this is what we need to see. As long it only pauses whilst the
device randomisation comes up and doesn't hang indefinitely then we can
consider this issue resolved. The other platforms also pause.

Cheers,

Richard



