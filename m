Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF11B6079F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 04:06:54 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u8so29879127iom.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 21:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ECnZpdITgFG8nURCabt9oGz5WIxdFTjsNr9Hx8PmHmk=;
	b=U0eMcP0vHpzjPML/TBSvCPaalQCyrrdV80T6x9mHN+83oX2aZdCTO5KHyyru5M7w/X
	0JvBukfH7aRRD/wxyBPakXGwIedwVfme02zOgysr+k5A+lFtIdsyiWiIPAOdePCza4FH
	Hx7mye4RPs71wC+nFgYl0VbYdh4IYC+3rzInLT68q+9iGK4mZinwduZcagg++hnx7bGS
	WhwBClto6P8v4OFHaxnheMKAkWouZbDobTNvDw/mzLlJ1tvhLuc3KtSWCkRd3ZZh5rhf
	3uiJ/d9w0ON7ikcmyMxX+/1xtVChnKnB5KJBba6WR88R8u1aVOcA+W0CNKlvLq2PDNng
	jD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ECnZpdITgFG8nURCabt9oGz5WIxdFTjsNr9Hx8PmHmk=;
	b=KBFr8S030MNg5PxkSE6GOO+AHkDGvOIAy+2ieAYCx1apF6aSxbPgPMCRBQlJRK3/9x
	7jqavJUmj948H559yNvsfee0mcoHCLO/Xl3YO2wc/9kibPs1nhYvM+olGOIihSCabJxi
	g191IxaWZHZPXpfeCqFVDn6vNBg3d+B2j0NO5a5DjJscozr+nHF4yVWhHbCKbGXgXDnF
	O21vl0VzE5DNGnErW0Wx4K0zCV6xcF6tNtu9ZquCgfHNlDcxTPSXeLf5UwqX2Df6h25w
	G22o/KWlqQw2GSRlbRyYnzssEfEo7g+GobpawHXh76KwNDKPNZFNkXGvu2YHBlzdL5V4
	ZlZQ==
X-Gm-Message-State: APjAAAUoHoosyylZe7vtjkhn74qT4ZeCQu1emstAoC7pDLza01PuBdNb
	mNdwdbTJATfK5gDAZf5mT6UAeR8PucIBQ+bnpr8=
X-Google-Smtp-Source: APXvYqx1WQ72T87xQPPmDC7ClhHOhNSjlj2PLLv+bw/iYzKL5G8KlvZnDnsfG4N17Q99hxtEdZYxtCYPosou70bELW8=
X-Received: by 2002:a5d:8d13:: with SMTP id p19mr2742709ioj.306.1570939615663; 
	Sat, 12 Oct 2019 21:06:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Sat, 12 Oct 2019 21:06:54
	-0700 (PDT)
In-Reply-To: <ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
References: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
	<ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 13 Oct 2019 15:06:54 +1100
Message-ID: <CAA=hcWRXoyXKyZqh-3dXxF6rPSMe2meejtGXK7xQ8ZZB+=-0-g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Failed to build zImage-initramfs
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
X-List-Received-Date: Sun, 13 Oct 2019 04:06:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On 10/13/19, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, 2019-10-13 at 12:14 +1100, JH wrote:
>> Hi,
>>
>> Apologize if it is not right mailing list for helps, please advise
>> which mailing list I should go.
>>
>> I have been trying to build zImage-initramfs, according to the
>> oe-core/meta/classes/kernel.bbclass, I defined following variables in
>> local.conf:
>>
>> INITRAMFS_IMAGE = "zImage-initramfs"
>
> this should be the rootfs image that you want to bundle into kernel and
> not the name of final kernel as above. Put something like core-image-
> minimal-initramfs or somesuch here.

Thanks for the response, could you have more specific what I should
change? From kernel.bbclass, without defining INITRAMFS_IMAGE and
INITRAMFS_IMAGE_BUNDLE copy_initramfs() and do_bundle_initramfs ()
won't be called, am wrong about it?

Anyway, I followed your instruction to define the rootfs image in
local.conf, it did not work, please correct me.

$ vi local.conf
IMAGE_ROOTFS += " core-image-minimal-initramfs"

Thank you very much Khem,

Kind regards,

- jh

