Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB027E241
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 10:06:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Y1yN6cgBz8p;
	Tue, 25 Jun 2019 12:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561457165;
	bh=BFvYGUOgqMpG1tb4OUNh4fbdEMdUQUbJiMHMS+GJJIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgHOnRW6ZxM3OTviNwHEtNmNUYwJ2smWy3Ryk217jJGoToSPmenzM0IFgRfS5lf33
	PdCRPU5rOt17n+oiJEIrG4MpvZQUGTJD1JAfaY8HFL69bRFi/Hma3sWmGdhNYapOPz
	5ITf7MvWWWPldSAS8xePfXSyr+vPNy4xfnOfaqSjn2R0yDujMW5RwovUvpcGxFc6g5
	vRgJuY+3leA86UFGJ01udNKuQu8G1/HlLZeST4kfJsu2l6LKtU+fT8vjGm5Vt08F9t
	XMEoMDV81Ecnu2Qqqk08hEEIL24fGYD1VtmnfW/vC0zFeZ0zLPXTMxtJuBJgnvKli/
	v0Zk4L2R3IBoYuy1mlqjESruAOnB2Kaalme8ihMxtm+IA4WQS7XtXXQB0RNEE6sjyi
	1faocJxsCdtj4AQnUnCswj0EAty+9Ih2XaVRyC8DIUy+Xso93oPsn7TIr2LUwluJB/
	n3uFIFV2DtD2T+ZIIw8CrxtE6wTOmlzq+L+aXRiViplbBAMBxlBsjdL52LwLyL6/OO
	ZYEcjN+PD8DeJXPvg+xpBGElHby2J/w47mvrG0mHsh0pVR1B0Nsc7qO/yo9dp86Wqm
	IJ03bEKOCi/SAfy3zsjz/RN8Z+RiNw5CCRqTs3LEx/YVpLbYlQueWLUEemVYSdXLrG
	wRXwWNWwvJa7t891YB1TKpIo=
Date: Tue, 25 Jun 2019 13:06:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190625100601.GA22924@localhost>
References: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scons: fix conflict during do_rootfs
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
X-List-Received-Date: Tue, 25 Jun 2019 10:06:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 24, 2019 at 05:29:37PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below error:
> file /usr/bin/scons conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-configure-cache conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-configure-cache-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-time conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-time-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/sconsign conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/sconsign-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>...

Could this be solved with an RCONFLICTS between the packages?

Installing either on the target is anyways rarely wanted,
the main usecase is the -native at build time.

This would also handle the case if python-scons gets removed from
oe-core but gets added to some other layer.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


