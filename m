Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 19C4B6BD1C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:44:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y185so4902467wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 06:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=N1ja2iZj6VHmRYNQZe6e75vHVBkUdTZ19pNl+3OtSUI=;
	b=JqMCyBCF9JwegW/dgtUasQUdrnzO2OmvMP0urqQnxoL2ae4IzXfepzgjpU9nqnpxoA
	VwnTRkvdycb1HHs1D+zSaq2cx7V6FyaChymKESRKw9r0FLplXhZoMjN95rmwOYKyZGod
	CHpbCIvUyJvrsQMnc+9mFVgS7Lpb35YDYthE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=N1ja2iZj6VHmRYNQZe6e75vHVBkUdTZ19pNl+3OtSUI=;
	b=XDYImk/s6kklwssr4nmYo82OJups9s+50CyNgn3oVKUuUrnHvCzVrogk72SWqltzEt
	/zOZqdjhB+FXqIEcrQleUpr0N2NHBUZlGhql63OhPBXpF7XsSinYftsDKJtFjy1Hg51s
	6nl/tqum6JuARMibfC92IYTm3GXB38JyjLuU94LTBCXWZ0qRqGpWkjSiwkvhhy8H/MFo
	Dj8eUNMuo90rpd7ccWmlECroEbjvj+plj/TyYEc2a2lnNXasmlmAWGTq6QcgEqFsmYsf
	uCP0itu5p4d+ZW4pr93uLelgSo9PluyiNMsf8QN7MT0NJVNz3smVCrc85/YnqpI6aIcM
	Of0Q==
X-Gm-Message-State: AA+aEWZ0wefqkeJEsigDR6fM0/yVbW2eG17q3A8b0eCRKaB2Sdly5hoC
	C+vsGGfBYFPj2VcWoGDgM1FBTg==
X-Google-Smtp-Source: AFSGD/X8tsCDAqinEhmpZrl8Qs4BRYXQrxvBwuTvTNc4jKniAzLvAAr1yFJUyHFxj/F/VYA3BziCfA==
X-Received: by 2002:a1c:c64e:: with SMTP id w75mr12571926wmf.46.1545057889660; 
	Mon, 17 Dec 2018 06:44:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l78sm54221261wma.0.2018.12.17.06.44.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 06:44:48 -0800 (PST)
Message-ID: <a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 17 Dec 2018 14:44:47 +0000
In-Reply-To: <CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Mon, 17 Dec 2018 14:44:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-12-15 at 20:19 -0500, Jason Andryuk wrote:
> As far as I can tell, pysh is working properly - it's just the
> bb_codeparser.dat which is returning the incorrect shellCacheLine
> entry.  It seems like I have an md5 collision between a pyro core2-64
> binutils do_install and core2-32 python-async distutils_do_install in
> the shellCacheLine.  python-async's entry got in first, so that's why
> binutils run.do_install doesn't include autotools_do_install - the
> shellCacheLine `execs` entry doesn't include it.  Or somehow the
> `bb_codeparser.dat` file was corrupted to have an incorrect `execs`
> for the binutils do_install hash.

That is rather worrying. Looking at the known issues with md5, I can
see how this could happen though.

I think this means we need to switch to a better hash mechanism. I've
sent a patch changing this to sha256 on the bitbake list.

We also probably need to change over the code in siggen for the sstate
hashes too but one step at a time...

Cheers,

Richard


