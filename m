Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RTi2W-0003Om-68
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 23:45:08 +0100
Received: by vcge1 with SMTP id e1so308951vcg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 14:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=+l2P/6bYSXPkHIQbS9b3mVhCfC1OUC6Im+FmiYNdDO8=;
	b=LyTGSl49nwdP+Aj8Zy/cjkIyQ77vVMqYsc2b25f0F8sl4OMYF6vhAtB4/PZCLvz1o/
	Dr8HcXhuBB7jtxhZMraeMXowcPIKJb5OLqdxZ75FPvt24S/290KEgzBvOjOOXBS6IByi
	+9LCIP5YVN08V0UQkOZ0WH7MKn59VkKH1Q7Yw=
Received: by 10.220.107.82 with SMTP id a18mr2608834vcp.79.1322174314072; Thu,
	24 Nov 2011 14:38:34 -0800 (PST)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.20.113 with HTTP; Thu, 24 Nov 2011 14:38:13 -0800 (PST)
In-Reply-To: <20111124173621.GB28572@sakrah.homelinux.org>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
	<CAMKF1srTUc=V9-AV-+3bw3QrR747cK-kfYU4sYq+A04ASD06wA@mail.gmail.com>
	<CAKZ=5EV8Qwh0gzmW6mS+hZB7HpEgDWuscO7_mhDEVsCffWmP2A@mail.gmail.com>
	<20111124173621.GB28572@sakrah.homelinux.org>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Thu, 24 Nov 2011 22:38:13 +0000
X-Google-Sender-Auth: shBEbsDrCKEXpUgI6p6_0MzWYWc
Message-ID: <CAKZ=5EV48wp05vBfewe1vXV7CoZu3ksxgCxugCGSRCaWtX1B=w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: B29882@freescale.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 22:45:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 24, 2011 at 5:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> and we also need multiarch support in gdb recipes as well.
>

Support for Biarch exists in gdb for x86 since May 2009, and it is
enabled by default as far as I can tell.
I managed to dig up the exact commit in the gdb sources:
http://sourceware.org/git/?p=gdb.git;a=commit;h=5d008094095c4a6f5ccc522abac263d6bc52738b

Regarding powerpc, it seems that gdb can only be made biarch when
configured for a powerpc64 machine.

-- 
Julian


