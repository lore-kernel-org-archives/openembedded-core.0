Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 45F2B60DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 00:55:21 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f10so5749161yha.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EJRGC1/ImA/Ln6TMY2Dfw2S2o/UJVmd+MFBVU7Y+r+k=;
	b=YHlALVRde/xn7zDh4YoSyAZ9aICx9lZqCZsF6NtZdvs7AIY2FE/3Id4Iu6sSkHp8ko
	SuclewLaCx/XpuN3AodCng6rYARVAEcfd5DbZJA6OpkSPwxrYtWnrvBqr0fGnUyDQvCw
	PMvd8HlrXnbeVNivJUaQQ7BLQBDKRfcdzysAEu5jDU3HjHFuMeMZsPV8Te4+I2UCyekh
	I+Zq61nub6+wBK2WUZZ6bA+fpll+p3AWPUfka9pVtONckYumB3FGvBC55oJERs11Oujf
	m7H47L35pjY2Tgk/7AluPjj8qZ3rq4FVvt5nT//evX3MzZ+4qpvwfZQRTf+YELh65sIs
	XK8w==
MIME-Version: 1.0
X-Received: by 10.236.61.69 with SMTP id v45mr8463332yhc.130.1407718522985;
	Sun, 10 Aug 2014 17:55:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 10 Aug 2014 17:55:22 -0700 (PDT)
In-Reply-To: <1407424632-32649-6-git-send-email-marex@denx.de>
References: <1407424632-32649-1-git-send-email-marex@denx.de>
	<1407424632-32649-6-git-send-email-marex@denx.de>
Date: Sun, 10 Aug 2014 21:55:22 -0300
X-Google-Sender-Auth: ABC9XEaz4pZZybUKkOKgCV1XmxA
Message-ID: <CAP9ODKpjzBqm_cueaXW-JBR-ymjz5z=hFJFhezw2UJv+LfApUQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] Yocto: kernel: Add basic fitImage support
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
X-List-Received-Date: Mon, 11 Aug 2014 00:55:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 7, 2014 at 12:17 PM, Marek Vasut <marex@denx.de> wrote:
> This patch adds support for generating a kernel fitImage, which is
> a a successor to the uImage format. Unlike uImage, which could only
> contain the kernel image itself, the fitImage can contain all kinds
> of artifacts, like the kernel image, device tree blobs, initramfs
> images, binary firmwares etc. Furthermore, the fitImage supports
> different kinds of checksums, not only CRC32 like the uImage did.
> Last, but not least, fitImage supports signatures such that either
> the whole image or it's parts can be signed and then in turn can
> be verified by the bootloader.
>
> So far we only add support for wrapping the kernel image and DTB
> into the fitImage. The fitImage uses the sha1 checksum, which is
> the default.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Could it be reworked and split in a class? it seems the code is quite
big to handle it and I think it will allow for more easy understanding
and development if we can rework this code to be move out of
kernel.bbclass. It does seem to be an image type.

You can take a look how ubifs has been included and do something
similar for FIT.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

