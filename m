Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9A560103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:06:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q124so1135977wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 04:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KK8MgC6kmcrLv/RGj9uum/lKizJKz+Z+Fp+5kO0A/9M=;
	b=IA8DyZ7CZ1Qzzq5NQT7TI7IEElLa1gWNAODux0yEIosuFnb6qGfYVs6Is77E8h5mfv
	lq9AFwcp/hKqWrRLq5oDfTgMI6OfJFUnFaAMAR4ffla2OfmZT87H8a01udrrve2vWg1+
	L4tEK22JMLK83Olk0Zm46T6tNhLjft1z1CHdPQCkIDxh9ioc1Atu7UVbbbYkKPfL4R5N
	uBXcmM2/J/MErEnKt08daGyJSVBeAcAoD4UHK/VLt1mnEyrLO3UUvgi5aTg9P1+NKOgs
	5mT3t2t4grR5ewiMDPiIRkgGeEDzmfn1diSQvQ9bLC9Tzc/8JdNYHFpW+VGnI/LRlzFi
	bQ3A==
X-Gm-Message-State: AMCzsaVloljWFIXpniJipiIE5aw2d4t1G/rFH6REVDE2b99Iqc014vd5
	6PavMOorSBAFe/QtjZqhWKFgVrPw
X-Google-Smtp-Source: ABhQp+Qz5We1rG9OtCjSVLwqxQ9yVoIGPc9ukTL/R81JO4psjxXXsdpHfp7jrALUmFOt4BqLQDHamQ==
X-Received: by 10.28.52.5 with SMTP id b5mr1516866wma.135.1508929589759;
	Wed, 25 Oct 2017 04:06:29 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id e6sm2129029wrg.53.2017.10.25.04.06.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 04:06:28 -0700 (PDT)
Message-ID: <1508929587.13607.68.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 12:06:27 +0100
In-Reply-To: <1508926407.13607.53.camel@andred.net>
References: <20171025073248.24161-1-thomas.perrot@tupi.fr>
	<1508926407.13607.53.camel@andred.net>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][PATCH 1/2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 11:06:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-10-25 at 11:13 +0100, André Draszik wrote:
> On Wed, 2017-10-25 at 09:32 +0200, Thomas Perrot wrote:
> > - Bad image type replacement for aarch64
> > - Fix DTB path in fitimage.its
> 
> It doesn't look like the DTB bit is still relevant in this commit.
> 
> > - Ignore fitImage type in do_bundle_initramfs task because the packaging
> > is made by do_assemble_fitimage_initramfs
> > - the images for arm64 are not compressed the linux_comp variable must
> > therefore be none
> 
> I think it would also make sense to split this into multiple commits, as
> your aarch64 fixes and fitimage fixes aren't directly related.

To be more clear, your fix to kernel.bbclass is independent of everything
else and doesn't apply to aarch64 only, so it should be a separate commit.


Cheers,
Andre'


