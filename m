Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C01A6606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:16:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so5258340wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i5/TcR8LCpKgyDsIaIdd4+fUxE/v4l5H2775/aSlbkI=;
	b=ZV+7mJqCAJkULfxwLn7kAfqFpKy/LiY20a2TY4vRvj/JLk1vdCM31ey3ilOvzfiI4g
	jKHZNmkLkbi0qO4AWaSMs16b2ZUdKN54EQ7yMt2kpvzVHlWhB/Nui4rrGD63WI+BIFnP
	YtLNFx/mIEMVX74Jte/Q7q1JRmT+rrguvfhHrt4RjKy7Ll7ZYiouU5xHGzylxDQ7thBq
	X50SxRB6f0XWM2QH7/O2cZVQSFz2b/Uz/D94xW/2RH0j/sq+jTfWb3rZxLdLwpQUkD3/
	Nfzr4/vLhGfQhtnFCHiLKItI2mMDQj2b+fvNOW6dB//3/7PR4lkhqR3DQ2uaqfgMbABb
	6v/w==
X-Gm-Message-State: AEkoousM5VxkXKentMAtNUVd8XZ8lBgLZ8UZ9bYM9Zi1+3HulEgHwF5H0JXgYfZi7ybIqg==
X-Received: by 10.28.4.77 with SMTP id 74mr31726002wme.84.1469607411482;
	Wed, 27 Jul 2016 01:16:51 -0700 (PDT)
Received: from localhost ([185.46.212.66]) by smtp.gmail.com with ESMTPSA id
	c13sm5081811wjx.12.2016.07.27.01.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jul 2016 01:16:50 -0700 (PDT)
Message-ID: <1469607409.14668.23.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 09:16:49 +0100
In-Reply-To: <1FBAD0A9-9F86-4A09-A1A3-15FB78A57BF0@gmail.com>
References: <1469548140-4095-1-git-send-email-git@andred.net>
	<1469548140-4095-2-git-send-email-git@andred.net>
	<1FBAD0A9-9F86-4A09-A1A3-15FB78A57BF0@gmail.com>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] tune-mips-24k: add QEMU_EXTRAOPTIONS for DSP and MIPS16e cores
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
X-List-Received-Date: Wed, 27 Jul 2016 08:16:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Di, 2016-07-26 at 11:02 -0700, Khem Raj wrote:
> > 
> > On Jul 26, 2016, at 8:49 AM, André Draszik <git@andred.net> wrote:
> > 
> > The core emulated by default by qemu-mips(el) just crashes with
> > illegal instruction when encountering DSP and/or MIPS16e
> > instructions - we have to specify a CPU that supports the extra
> > instructions.
> > 
> > This is an issue when generating a rootfs and e.g. running some
> > of the package postinstall scriptlets.
> > 
> > The patch to qemu to add 24KEc as a CPU has been accepted
> > upstream, so let's use that CPU here as well as needed.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> > meta/conf/machine/include/mips/tune-mips-24k.inc | 6 ++++++
> 
> These changes probably belong to meta/classes/qemu.bbclass

OK, I wasn't sure, as core-i7 puts them into the tune-file, and some PPCs
put them into the qemu class.
I'll send an updated patch.

Thanks!
Andre'


