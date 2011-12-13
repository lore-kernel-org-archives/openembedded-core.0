Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaYeO-0003jl-Cd
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:08:32 +0100
Received: by lami14 with SMTP id i14so26836lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=uRfABZAp/MbhjwasFCPh0ItEA8ffOzvbG6Qt997lRys=;
	b=ZuJMxseyeXTAaYs6ZG12P3aS8Qmnjc97v5iBO/v2dqIDnxVSJF7zatoZK0vIUeQkfa
	hXk+C4pbqkqLaWn9NK4lVjNpn5cL+gxZDpkkIOTaMQZOYx8WiTT0oTZ72GlLj4UGw4pK
	SShAUSgcFkyI9xstkaPE6DRCP4XOTy9b9xGRI=
Received: by 10.152.103.51 with SMTP id ft19mr16363480lab.42.1323806496289;
	Tue, 13 Dec 2011 12:01:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 13 Dec 2011 12:01:05 -0800 (PST)
In-Reply-To: <20111208154840.GD3761@jama.jama.net>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
	<20111208154840.GD3761@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2011 12:01:05 -0800
Message-ID: <CAMKF1spHhLbMLtY9VhgrgQ4QwO06HEcnGSZrWj3mXLuif5gmFg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 20:08:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 8, 2011 at 7:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
> meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"

hmmm will this work if we have armv7-a + hard float ABI ?

> meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:EXTRA_OECONF_armv7a = " --enable-neon "


