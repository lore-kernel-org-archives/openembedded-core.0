Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 04DDD6B254
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 16:11:24 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so562079vbh.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 09:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=mtlRMjjPKE73LZQbajZJ9zr6oJRFyUztAnXhjQ7Rhj4=;
	b=ozA7shygIZdqzHJJCbbgStIayWy+t5SXL99MTDx+S6B0++b+TyTYcomNuIUZgsNWVu
	H+OqqWGNkl2W4vRCjTqIXR7mK//RORbJvfYRGqZt2Aw1CoWZrIZjGGJtEsy6LJs9zcQd
	duWPSWgLek2265PPT1nomxMKahIZE+3SjXJSRAE0rk4/Yj7RrFqC2PfnHBIBPn3iIB8i
	WfR7LB+VjcJap3gqMssNoyuP3hCvkrOlsgkBg/PJOFQkMWMhOhREVIwE3lM47SGH6Oh/
	W8014tFrFnYeq8NC9OcNqvrt4ORgeNm8ILLgdaovUhf58/iv8rrQUAK6xZCkBOrKz883
	FpTQ==
X-Received: by 10.52.158.136 with SMTP id wu8mr15178055vdb.33.1374768685022;
	Thu, 25 Jul 2013 09:11:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Thu, 25 Jul 2013 09:11:04 -0700 (PDT)
In-Reply-To: <78114fce0d09f10018959859a4ad69d128cbaf80.1374763279.git.ionutx.radu@intel.com>
References: <cover.1374763279.git.ionutx.radu@intel.com>
	<78114fce0d09f10018959859a4ad69d128cbaf80.1374763279.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jul 2013 17:11:04 +0100
Message-ID: <CAJTo0Lbmfaj2sLvOiKvoeuPRnQxcFDOPfct8ZWu1vV4kpFH==g@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQlHae+2RBsui+CU06TLj7drZZIYuaMCV1mHMHhQs9/nNuR33gBWJBDwl6RGPfvWRHG8Y97Q
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 4/6] qemu: Updated from 1.5.0 to 1.5.1
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
X-List-Received-Date: Thu, 25 Jul 2013 16:11:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 25 July 2013 15:51, Ionut Radu <ionutx.radu@intel.com> wrote:
> Tested (displayed the version of qemu installed) on core-image-sato
> on all architectures (x86, x86-64, ppc, mips, arm).

What do you mean by "displayed the version of qemu installed"?

> -SRC_URI += "file://fdt_header.patch \
> -            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch"
> +SRC_URI += "file://fdt_header.patch"

Please explain why this patch is being dropped, and if it's not
required anymore please delete it.

Ross

