Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 806A4784F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 10:30:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g141so1710136wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 02:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RZg5wg2jJjPZl6H3FoNhXnSc7Y0CpAycsE+imqt55oc=;
	b=d3L0iaetoddhIJxEMpukk/GQkTL4yE5YaPwLZLRh1297sG8Ntdnns3yIg5h3jhHfAV
	I/bVEsd0JgEReZ3cE0641EPB7/20tiwONPB8JqSpsGD7pSNv1UOj0nyS1COWKj0XaHAA
	FOsK3DaqxUTYq7xjmYh4tdxbwGOMCeVFASuWWfmUJO1QILnH8eIO887aqNeA7o5O5mFw
	FUkmaPd2pUxFXwb0IJW32hhBR7DSQHzyYmOMauszZqW6tiatk4f4tuqv15Uzii4CwQpd
	82yq5cErTpVtEEVmPr+yWeByhPQ0PWvPr8ff0d/fC4LEwZdiBMUeeXmtCbkBBK19eP/3
	9kyA==
X-Gm-Message-State: AJaThX5CptJhPzaKCixR7HICsO5qkR7HzcU/IWiu01uJy5C9yUKzzU6C
	Urz5Y4UEir9gNIB/kt2sGek=
X-Google-Smtp-Source: AGs4zMY75XKzg34sbhZ3A3SmQDFdkYjcKnIsyWxgRFojiiVy0qMfEO6ACl8+arqQvAhLm7d09B3ofA==
X-Received: by 10.80.135.226 with SMTP id 31mr1681701edz.210.1510309857154;
	Fri, 10 Nov 2017 02:30:57 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id c5sm7816590edd.38.2017.11.10.02.30.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Nov 2017 02:30:55 -0800 (PST)
Message-ID: <1510309854.4049.20.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Date: Fri, 10 Nov 2017 10:30:54 +0000
In-Reply-To: <BL2PR02MB21633D3A250997F82D3496E0B9570@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <20171025073248.24161-1-thomas.perrot@tupi.fr>
	<1508926407.13607.53.camel@andred.net>
	<1508929587.13607.68.camel@andred.net>
	<CAGXeWgkSjjXXUSGdZAq1UZH5in15CvPe4dhNPQBgUy+PCcp=Gw@mail.gmail.com>
	<BL2PR02MB21633D3A250997F82D3496E0B9570@BL2PR02MB2163.namprd02.prod.outlook.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 10 Nov 2017 10:30:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Manju,

This one isn't the latest version, but even the latest versions had issues
reported by patchtest. So I guess no.

Cheers,
Andr'

On Thu, 2017-11-09 at 17:28 +0000, Manjukumar Harthikote Matha wrote:
> Hi All,
> 
> Is this accepted in master? We need similar patch in Rocko and I have an
> additional do_deploy failure fix patch on top of this patch.
> 
> Thanks,
> Manju
> 
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde
> d-core-bounces@lists.openembedded.org] On Behalf Of Thomas PERROT
> Sent: Wednesday, October 25, 2017 9:18 PM
> To: André Draszik <git@andred.net>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [meta][PATCH 1/2] Fix some issues in the fitImage
> generation
> 
> Hi,
> 
> I agree, so I cleaned up, split into several commits, then superseded this
> one.
> Best regards,
> Thomas P.
> 
> On Wed, Oct 25, 2017 at 1:06 PM, André Draszik <git@andred.net<mailto:git@
> andred.net>> wrote:
> On Wed, 2017-10-25 at 11:13 +0100, André Draszik wrote:
> > On Wed, 2017-10-25 at 09:32 +0200, Thomas Perrot wrote:
> > > - Bad image type replacement for aarch64
> > > - Fix DTB path in fitimage.its
> > 
> > It doesn't look like the DTB bit is still relevant in this commit.
> > 
> > > - Ignore fitImage type in do_bundle_initramfs task because the
> > > packaging
> > > is made by do_assemble_fitimage_initramfs
> > > - the images for arm64 are not compressed the linux_comp variable must
> > > therefore be none
> > 
> > I think it would also make sense to split this into multiple commits, as
> > your aarch64 fixes and fitimage fixes aren't directly related.
> 
> To be more clear, your fix to kernel.bbclass is independent of everything
> else and doesn't apply to aarch64 only, so it should be a separate commit.
> 
> 
> Cheers,
> Andre'
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.op
> enembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

