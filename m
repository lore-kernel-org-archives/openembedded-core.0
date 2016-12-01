Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1529F65D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 19:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DADD031C1BF9;
	Thu,  1 Dec 2016 20:42:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id yDMEtfi4AnXK; Thu,  1 Dec 2016 20:42:23 +0100 (CET)
Received: from [172.22.22.61] (55d44d49.access.ecotel.net [85.212.77.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6639C31C1BB0;
	Thu,  1 Dec 2016 20:42:23 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
	<CAJTo0Lbt2APOm5ZfMQqF3Rg16W-AyBPJTYZCdd_OsXPOH-9pDA@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <732d2d88-9aab-375a-bcc5-d9cde762fb5a@opendreambox.org>
Date: Thu, 1 Dec 2016 20:42:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbt2APOm5ZfMQqF3Rg16W-AyBPJTYZCdd_OsXPOH-9pDA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bash: use update-alternatives for the bash binary
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
X-List-Received-Date: Thu, 01 Dec 2016 19:42:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01.12.2016 18:41, Burton, Ross wrote:
> 
> On 30 November 2016 at 18:50, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     Busybox may offer a bash applet. If enabled, the alternatives mechanism
> 
> 
> Wait, what?  busybox can ship a /bin/bash that isn't bash?  That's
> *hideous*!

That's what busybox is all about, isn't it? Shipping things that aren't
the real thing with varying levels of compatibility (think sed, awk,
grep for other tools in busybox that use some kind of interpreted
language). Busybox' ash even supports some bash extensions.

FWIW, using /bin/bash as a login shell with busybox was the easiest way
to get bash-completions working with bash installed in a normal rootfs
(it doesn't work fully in POSIX mode) and get working logins in an
initramfs image at the same time, where bash isn't installed.
/etc/passwd is shared between both images.

Regards,
Andreas


