Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53C746C230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:39:37 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id t24so3030428otl.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eRphs9203MolXg/kOYAn7SVvQN8nRZXv+uoIEnC1LCY=;
	b=QPtHztucVVLcsodWhYs3JpGYFAB3AYLJxehGbVRGBYbqeIF2aPPqxQLVGGbRzKyj+x
	74cZCbDT/lLlHzRYX1VyJ2D+rGMX8SWeyr89YgfMVZFAMYwUXs7fMLHlqcm08kjsVyDh
	5bqvquuiaoRjZDrKhvDqYBd+yYpML0ZrgCzMCcKgKFFcEqAuDgvJUsxcWfS1DZGalL2z
	lSfUNBX6tIjhY4vi4KqNR/eTGbahENJPO7U9F+vL7ABoNM/BJkOOiecrDUuG+p3ANmXb
	gmgCag0/lXVKZqIDGKhXydocBQQHlU6evclnYC+EONMfvo0MDDfCq2tfGIxzM8CO5plA
	5psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eRphs9203MolXg/kOYAn7SVvQN8nRZXv+uoIEnC1LCY=;
	b=cZg8WBBZ7UDgh/H9ZrlczlcKOCbAzAXcKa+qQ7eKSXxqgyHUdtJdl8fkZZth0jDQkl
	Cl3VG+LMfjJMuTQcRzZPnINEG8KcT8qsuaeDRslRE39GVsrkNGPMmWpUu6uSIMtIfBB5
	ONXotO/D1L7i5OWhYflP20YCR5rwnhIx2MBjCkqLAY4tzGDRmQd9gipU3r/jilIzxdJL
	SbFEHEcCtUb38ICipVfOM/cfCENVJL1fQeZQot5SePxmnNCV3xd1acTY5mIVhu/KgxfK
	P4fi1M8eHpIkaMD4N0zQTDqWdc30Kz02P3Z4MqhKajEdcRaf3MGP16JfcPz+NdDp9r+Y
	ro9w==
X-Gm-Message-State: APjAAAWpp4XIPXLxBAX7TnXv97ySf0VHCzJAeJMxhhKabGXNpARM2pGt
	nxkAkxLD+SjKYmhfD/pI/C/tQ93jLNsZcxbQCK4=
X-Google-Smtp-Source: APXvYqzLCErn0B4HrIjbCCT8ziq5PCcLMufogCXHavau9f/FhbuNxyeBC5u6yTX0Qfj5V4JO1Zg5uE7L8mPDi0jdLsU=
X-Received: by 2002:a9d:6209:: with SMTP id g9mr17074584otj.153.1557754778263; 
	Mon, 13 May 2019 06:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
	<20190508135459.84886-3-alex.kanavin@gmail.com>
	<000386a97aab0dc593e908b4d7f50f1c8a079be9.camel@linuxfoundation.org>
In-Reply-To: <000386a97aab0dc593e908b4d7f50f1c8a079be9.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2019 15:39:26 +0200
Message-ID: <CANNYZj8WQasbaiPZnifQ474QMPyNS-YZC3fgqbK7eMZSWCenig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] webkitgtk: update to 2.24.1
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
X-List-Received-Date: Mon, 13 May 2019 13:39:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 13:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-05-08 at 15:54 +0200, Alexander Kanavin wrote:
> > Add a patch to address a missing format string error.
> >
> > Disable the recipe on 32 bit x86, as SSE2 is now required
> > unconditionally.
>
> Unfortunately this isn't quite that simple since just disabling it
> triggers:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/445
>
> (errors in world builds)
>
> It might be time to optimise qemux86 slightly more which would help
> avoid this?

Yes, we should certainly move qemux86 to something less vintage than
the original Pentium CPU. I'll make a patch.

Another issue is 'packagegroup-self-hosted' including epiphany, and
build-appliance-image pulling that packagegroup in. Tracing back the
history, it seems that epiphany is there because long time ago Hob UI
made use of a 'web browser' for some tasks. With Hob long gone, and
its replacement Toaster accessible across the network (or from outside
the VM), I think there is not any more a use case for including a web
browser into the image?

Alex

