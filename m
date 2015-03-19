Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2797665CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 16:54:55 +0000 (UTC)
Received: by wetk59 with SMTP id k59so62359151wet.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=RwdNbGPo/m79jqQhIud2el0aGTyUGDaMB3+nTknt4CU=;
	b=UTuFHQJxGzg5+O1DsjKwjftsXwrsvVEvQQUwG88HTSTqpYOD3PpNILAF+2OWlAS55U
	Ou7whaAmw5VreCZOQUGp8Woa4k4oq6b6I2GP2acDUvU2ULtJIE2qWNxaeQixNnbPuLg/
	B4d0WZ03s5/XxmEsXc7BZ+UpPZ8f88H9HyeR8vPktFpfvQpQXeddKv00nMWJtTsJiFQ7
	yRGjCG8cXv/nlpY670/+GW0dvcAR+LApw19LY6FG3uolIiaMS9fN2JjcMTANqfaHit+n
	ejRpli+VVhLvOQUhzW8pHx6NQyl8wGVrI9pEb4iTsPBjHHawnm+M2X7tqrc1Rk0o9u2m
	34xw==
X-Received: by 10.194.5.37 with SMTP id p5mr155490138wjp.20.1426784096495;
	Thu, 19 Mar 2015 09:54:56 -0700 (PDT)
Received: from [10.53.92.192] (089144230192.atnat0039.highway.a1.net.
	[89.144.230.192])
	by mx.google.com with ESMTPSA id a13sm2675402wjx.30.2015.03.19.09.54.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Mar 2015 09:54:55 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <B83906C4-D2EF-4D2A-80FD-C8CBF3AEA6B3@gmail.com>
References: <1426764810.29168.49.camel@linuxfoundation.org>
	<B83906C4-D2EF-4D2A-80FD-C8CBF3AEA6B3@gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Mar 2015 17:54:50 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <44B0A5F7-418B-47EC-A1B0-10E1AD9D1E0A@gmail.com>
Subject: Re: [PATCH] runqemu-internal: Add cpio support for qemux86 so that we can boot poky-tiny images
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
X-List-Received-Date: Thu, 19 Mar 2015 16:54:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 19, 2015 5:39:12 PM GMT+01:00, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
>On March 19, 2015 12:33:30 PM GMT+01:00, Richard Purdie
><richard.purdie@linuxfoundation.org> wrote:
>>poky-tiny generates cpio.gz images, add support for these so we can
>>boot
>>them using runqemu.
>>
>>Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>>diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>>index 6594dc3..2db5566 100755
>>--- a/scripts/runqemu-internal
>>+++ b/scripts/runqemu-internal
>>@@ -408,6 +408,11 @@ if [ "$MACHINE" = "qemux86" ]; then
>>KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw
>>mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>>QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS
>>$QEMU_UI_OPTIONS"
>>     fi
>>+    if [ "${FSTYPE:0:4}" = "cpio" ]; then
>
>Is that positional handling mandated by the POSIX-1003.1 2008 shell?
>
>Otherwise case $FSTYPE in ..
>Would cleanup the rest if the mess below..

of the if, even ;)

I didn't see :n:m ranges in http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02

but maybe I didn't look at the right spot?

Thanks,
>
>With that clarified it changed
>Acked-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>
>Thanks,



