Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 553237CBE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 18:07:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y15so4647028wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=EnbDM9FziaavM32fUunmXjoMstd6BgTMsZ2WYU5IEac=;
	b=OvwbocS59VCcA/QSJ9n73b3h49Ar7Dp36g/T6ljqSdzK7BqCO87YbZLl3/mmWcicAD
	9ZEAaWMrf9cw84EAE9ekxIzHyxUw0Mxa+jvnPMuLU17DbBoHEhkVn1/gNBjVnsXXs7j7
	Xz/pFkHNiFPvJUUG9eILCQSweCSSDG8EWNYao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EnbDM9FziaavM32fUunmXjoMstd6BgTMsZ2WYU5IEac=;
	b=nQTk92zr0W/VxttNBM8zx8/z8sj8iPvhybYkfUEPmudABn8l5ab3uZeOABeGqjxx6g
	A/KS0YRa/eYV4xPtdg+oFq+H0mZCO9UuBdo634NoWoZU195YbDuAk9fucD/MULX8xJqs
	hIdvqKdBwTilJwGhOc+gGJTi5C5zuzCtlxU1lXu2NgMvAsL2pqA9W1RBRQlkc5diZihC
	S7lz03gaCnilfbW4SpBSMv2fkNjb4l85d/FhXmiGxksYpDZTKOTO52Rys5YbppQ6VQeA
	jjDitPiHQXJptqObIFHhMn5SDq9mgleWvQM+NwnM8cMBavQgnv3pxFvekgkXyT64k6Ey
	17AQ==
X-Gm-Message-State: AHQUAualQpqbgvbt0lgpll3b+gYvtSTdD5Sa6bYEcWAqqQskJg3lm0VM
	BAVnupSrh0Eulq7AFl/qJ4OgKw==
X-Google-Smtp-Source: AHgI3IaHGLxxs04l1XlpNnztxlfpX4261hecrA5htEz5qQgv4I6nw5XidIvL8Cxxjs9qzqL+8Pd5eQ==
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr6078452wmj.120.1550945267850; 
	Sat, 23 Feb 2019 10:07:47 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 2sm4557044wrg.89.2019.02.23.10.07.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 10:07:47 -0800 (PST)
Message-ID: <b333823bfa0d9a3b34a02fa49d23002048fe12e3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 18:07:46 +0000
In-Reply-To: <CAMKF1sr+UW3vBu3p+5-mWK89VU0LYVHo_O5vzopb7131bQLNBw@mail.gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
	<CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
	<CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
	<CAMKF1sr+UW3vBu3p+5-mWK89VU0LYVHo_O5vzopb7131bQLNBw@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 23 Feb 2019 18:07:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 09:56 -0800, Khem Raj wrote:
> On Fri, Feb 22, 2019 at 11:11 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > Probably this is the very first time virgl is built for mips :-)
> > 
> > Note that it is useful only if you intend to run qemu on that
> > platform, so I wonder if we could just blacklist it...
> > 
> 
> I would have thought world build should have caught it on AB for
> mips.
> Which tells me it could be
> musl+mips specific

The AB does not run world builds for everything. It does them for musl+
qemux86, musl+qemux86-64, qemux86, qemux86-lsb and no-x11 if I recall
correctly.

Cheers,

Richard


