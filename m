Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 885AD60579
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 21:31:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r7so3291022wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=a4qTvRcOhNIMu8kF5qLFbwdw+eQfulNb8ehkCgzBTV0=;
	b=U9hBMCZtxwIKAvIZOCeGG5Rpn3Hlxs0GD8ONWknsncchlJMVQA7bFISkmpyc9KA0SN
	q2S3izEvSPcQQyriW/kiaACsZS9yFuDcnOjANvBdxhV2U0K6MoF3oLl0ZuT6VmSYVGmi
	hc1PxnBsMSehFcxKVCphI8Bxtflytce9EYSI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=a4qTvRcOhNIMu8kF5qLFbwdw+eQfulNb8ehkCgzBTV0=;
	b=LsowUH22ohuZYWv0GA2o1EnQTnW7xTpjhQ6thF6zvgwzf1kk3fPY+omiaxZtQixH7j
	1C9r5t5kQvwy/Nr1DGkFPzOf3IytUnVpPkDxmvM5Z730g7fC0A44NuJRXWvP2ffOZ5fa
	/owrrb76MyYInVFh4XZXeGXq4VNE2jC0k1qJykgovcyRP7JIjC5QVoK6v9UcR/Es8bgq
	80NVLA1M890pb8+XM6tFcKc4SMkO2vqzKQ13fjaHN80pVIAM/2eWFflYNl7656sJO3B2
	1HPCbY424V9SFw8nPrn2Qh0MTcgQTqldd+tPkxqhkwuuTs/uFMxPYBsuhzP8+o5JaFfC
	7Iwg==
X-Gm-Message-State: ANhLgQ1zKoQ2XwqPGWQizHYkzeRZohNinJJFLLUYybcVx9UJ+f+TbfXS
	IvjOeDMPe4hIj3B2wV6Ak4m7xQ==
X-Google-Smtp-Source: ADFU+vtP+SHScyiWG57/o6yowsobxN1kPNkKFnsaKR+XLNS4kQIOjYT65Efv9EI/xh/FjqrJqJvc8A==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr7433159wmi.48.1584567116727; 
	Wed, 18 Mar 2020 14:31:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k9sm159417wrd.74.2020.03.18.14.31.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 14:31:55 -0700 (PDT)
Message-ID: <5839fa696c78f06c668fe8cb8dbd0a80732c7bbd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Mar 2020 21:31:52 +0000
In-Reply-To: <CANNYZj9eiLf7n=Cu7X5A4z+YYz5upiW_9pjTgSPCX_2x2egSvA@mail.gmail.com>
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
	<23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
	<CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
	<d415671888365ca180bcfb72000bcd394f0e7b24.camel@linuxfoundation.org>
	<CANNYZj_RZ=Q1Me7_Ye+N4NmQBvW+fE2yDiRdsYu_XnCOGY_+nA@mail.gmail.com>
	<CANNYZj9eiLf7n=Cu7X5A4z+YYz5upiW_9pjTgSPCX_2x2egSvA@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] piglit: move to meta-oe
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
X-List-Received-Date: Wed, 18 Mar 2020 21:31:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-03-18 at 14:49 +0100, Alexander Kanavin wrote:
> On Sat, 29 Feb 2020 at 14:42, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > > > I'm not sure about this. The intent was to use piglit as a way
> > of
> > > > > improving our graphics testing, particularly allowing it to
> > > be
> > > > > automated.
> > > > > 
> > > > > Whilst we've had to focus on getting the basics right, I'm
> > > not sure
> > > > > that objective isn't still a worthy goal over time?
> > > > 
> > > > Piglit is meant for testing and validating OpenGL drivers for
> > > real
> > > > hardware. While we can put it on top of software Mesa driver or
> > > > virgl, I am not sure there is much value in that? Software
> > > rendering
> > > > might even be too slow to run in practice.
> > > 
> > > OE-Core is meant to be usable for validating BSPs amongst other
> > > things
> > > though. Testing virgl does prove the graphics stack is working
> > > too from
> > > a software perspective so does have some value.
> > 
> > Right, I can put Piglit on top of virgl and see how well that
> > works. It would be good to enable virgl ‘out of the box’ at some
> > point, I’ve been proposing that for a while :)
> > 
> 
> I found an old ticket where piglit was proposed for the core image
> testing, and the idea was rejected due to its huge install size, so I
> won't be pursuing this further.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10047
> 
> Would you still say it's worth to keep the recipe in core? Python-
> numpy (that piglit and only piglit needs) isn't trivial to maintain
> either (for instance, update to latest version needs cython to be
> added to core).

That bug is for piglit as a default in testapps. We decided that was a
bad idea, not that testing with piglit was a bad idea overall.

Cheers,

Richard


