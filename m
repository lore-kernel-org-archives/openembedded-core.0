Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 851E2601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 14:42:19 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id z87so139791078wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 07:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rdzA8F7ThXCChsL6r+rLfieFiVkCBlMsa/nqn2O9UM8=;
	b=YVN+9k33y9r66cDyntrdIcGFCk/F/9M/OJuWMk4TP7GEBtQPHay3FIm13H/hcaHbab
	Xop/Hf2tMXfO2fap58Vfpn2RCug+DrNMeVU4XZhbRJQ+3M8ZwUYhbVVvP+x+yc6vur9x
	UZIyrSHFcMFYT1eHR2FbKg3ee+s7HW/CsKvyBxIzOEh7bktM3eybJwQ73eBW6+gkqSSA
	ljqCNhfuUcLsaw81IAb6Gqxf78rclUfGFVFWlIGSEBbJ4zYGBVf699OTB7s3wxkSw7Wk
	onhzBcsABY937HwHSl+16w8ZaXai6BZ2+VZ6dBrflBRKntuRXNZJc6G1N9qE+CNCPcOd
	X3Rg==
X-Gm-Message-State: ALyK8tLsmh+AUy2XgVyP0HAX9T2hG2LWYeSvkZqiyJuCkWH7ajsiWO//SAm39IK9GDreXQ==
X-Received: by 10.194.80.162 with SMTP id s2mr15169541wjx.116.1464360139651;
	Fri, 27 May 2016 07:42:19 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	i1sm19769963wjm.12.2016.05.27.07.42.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2016 07:42:18 -0700 (PDT)
Message-ID: <1464360133.3815.7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Mark Hatle <mark.hatle@windriver.com>, Ross Burton
	<ross.burton@intel.com>,  openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2016 15:42:13 +0100
In-Reply-To: <a8f703f6-4b7b-d7f0-722f-df7caee70291@windriver.com>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
	<1464346463.28160.45.camel@andred.net>
	<a8f703f6-4b7b-d7f0-722f-df7caee70291@windriver.com>
X-Mailer: Evolution 3.20.2-2 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 27 May 2016 14:42:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-05-27 at 09:21 -0500, Mark Hatle wrote:
> On 5/27/16 5:54 AM, André Draszik wrote:
> > This doesn't work for me (at least on krogoth):
> > 
> >     ERROR: poky/meta/recipes-core/images/build-appliance-
> > image_14.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry
> > 'debugfs_vmdk' - possibly invalid type name or missing support class
> >     ERROR: Failed to parse recipe: poky/meta/recipes-core/images/build-
> > appliance-image_14.0.0.bb
> > 
> > I *instead* am using the attached patch successfully.
> > 
> > Is anybody else facing the same issue?
> 
> Ross's patch should have fixed this.  It ensures that
> IMAGE_FSTYPES_DEBUGFS is
> always set to 'something'.

Yes, and now bitbake is looking for an IMAGE_CMD for debugfs_vmdk according
to the error message. Note that I didn't specify vmdk anywhere, my
IMAGE_FSTYPES is set to .tar.gz only.

> You should check if the patch has been applied to the "krogoth" branch.

I did apply it locally. For me, it only works if i revert Ross' patch and
apply my patch instead.


Cheers,
André


