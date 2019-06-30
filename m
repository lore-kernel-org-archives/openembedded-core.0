Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C025E7E6F2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:54:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c6so13822764wml.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4fjFimITPZaP7onp/bXK14yPeXhagdMZ2JGXW+GAyug=;
	b=XPAT7BdXcxlBCWpzVIRNXncQkSVOY4n4+XtKasNv1ePoY97XlpYJIcyP4U1ZS1o/Zn
	fZc/sl4WTykT+2GXHH+lFJudB5mKc1SPH67L0AgVNn7xDjIc4DWrGLWWP6/gSlDo4eT4
	06yJ1hrM0czoTIQzmLtSang6ArCgtXJ0BGQUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4fjFimITPZaP7onp/bXK14yPeXhagdMZ2JGXW+GAyug=;
	b=RwF4U2W8i95xnA/EVGplErhJwtCUgvqXWSEwqCQ1LYSF/5QDZX4XJJKVE59KU52qQD
	XpSVge8lW7VUjaDW8xPu97PZerILoAWFJTyz1qfamb/KewkakVONZ2ZncBvaD9OkHWvU
	ohNuCqrW+ZqOEZnpNxwQ9AEPhtNiHxuMB4gmloQ7HXng3Cnzlvxp4TiI9pQmDS2QHT/2
	FL12wmmFzFq4R7t2xYJXe4b9IHJVay8rqH58dzG3Bm/BQZ6Jh8EnGKUf73smU11/EWxo
	V92IC/zHKChkJ1XQ7obK5Si8WhEzdt/Ls9KloAv5JRGz+pgQlwomjVknUwy9yknURrkb
	7N2w==
X-Gm-Message-State: APjAAAWsGS4/+4XkvS8wklYHjON3E4d6XejCYsElyJu4UlqHxKLg0Jpj
	cgsYs97tGZnSD1yqBYfq8/a+wA==
X-Google-Smtp-Source: APXvYqxAfKNDpctdaifpf8RzaWj9oU2eAiSwweCePxdBktN68PzikW5BR7zCavOcoAfQQPqY+PvnGA==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr14769100wma.78.1561931673379; 
	Sun, 30 Jun 2019 14:54:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f7sm10618177wrv.38.2019.06.30.14.54.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 14:54:32 -0700 (PDT)
Message-ID: <9b521556e6134041d0b5b966dc4d602d74bf8153.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Sinan Kaya <Okaya@kernel.org>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Jun 2019 22:54:31 +0100
In-Reply-To: <879d6ab4-5948-61ac-d783-401d660b0e94@kernel.org>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
	<5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
	<5c9f4824-248c-197c-c3f7-ccd33f023aa3@kernel.org>
	<CANNYZj-Oow=4m4A1a6k+Mcjo6qf5cnCAR5_OGrhitM1-XqZALg@mail.gmail.com>
	<879d6ab4-5948-61ac-d783-401d660b0e94@kernel.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Sun, 30 Jun 2019 21:54:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-30 at 12:56 -0400, Sinan Kaya wrote:
> On 6/27/2019 4:46 AM, Alexander Kanavin wrote:
> >     This issue showed up in thud using core-image-minimal. It was
> > not there
> >     on sumo.
> > 
> > 
> > If you can provide steps to reproduce, it could help. Please start
> > with
> > a git checkout of poky thud branch.
> > 
> 
> Issue in only happening on the build machine with docker using ubuntu
> 16.04 as a baseline.
> 
> I'm having hard-time reproducing on my development machine.
> 
> My cursory web search says that I'm not the only one hitting this
> issue
> and people have mysteriously solved this issue.
> 
> https://github.com/riscv/meta-riscv/issues/26
> 
> The following matches what I see on the build machine.
> 
> "/update_pixbuf_cache: 8:
> /home/riscv-yocto/build/tmp-glibc/work/qemuriscv64-oe-linux/core-
> image-full-cmdline/1.0-r0/intercept_scripts-
> 2c03b46bc7941049a88b6c1719c35aade81b0ce5490421e7cca768bf8beb0d01
> 
> /update_pixbuf_cache: cannot create
> /home//riscv-yocto/build/tmp-glibc/work/qemuriscv64-oe-linux/core-
> image-full-cmdline/1.0-r0/rootfs/usr/lib/gdk-pixbuf-
> 2.0/2.10.0/loaders/../loaders.cache:
> Directory nonexistent"

Knowing which branches (sumo vs. thud) and which layers does help put a
different perspective on this issue and helps us help you!

Is this a difference in dash shell vs bash shell (e.g. for /bin/sh) on
these machines? (if I had to guess that is where I'd start)

Cheers,

Richard

> 


