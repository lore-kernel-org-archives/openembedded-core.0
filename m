Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A043E71985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:41:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so4152542wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 06:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vqy8FlsfhUTOFAhwqWfXbThO4jUzgVKST4epPvmaM/s=;
	b=iF4jvhCmd75SIHLGPZv4Wb9IbYDpI8b6oYVOMWEM8KTaGsmUCC5uioYsCPCYBZEB61
	DCzCw1K3fXEXqx8V4EE2kX/jL5772k1FdzK055oFKpZ9kqRItaPO8KkQKM0u0xhfng9d
	mm07SoXW6Zcs7YBjoZRxXLZzWdbwfMVhErs7IzcqPOxYYc0h6F6YyvmmKCYakP43OeK/
	BdY3SEsJApD1buZc+3G4v+2vuRbz4mhc7u6yoinaTN49uvTwg6T3KrmoZ2ywLMztPQCM
	/MFdwOoUP1K7Gyqm6ZcwGNprAeYUjdhFoMwvJY3Tv9oKm33efINhMTVmBWtHvvKiKREH
	3ZHw==
X-Gm-Message-State: AIkVDXIxSlyW9HC/DElABDpxv1vd2SE4ULWxQUMpaSaKeDITkqT+xs9vnhIeeoPgyb10xA==
X-Received: by 10.194.85.165 with SMTP id i5mr8806692wjz.147.1484232069428;
	Thu, 12 Jan 2017 06:41:09 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id l9sm3477458wmf.18.2017.01.12.06.41.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Jan 2017 06:41:08 -0800 (PST)
Message-ID: <1484232067.7594.32.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2017 14:41:07 +0000
In-Reply-To: <2c9e6f87-d5dc-6a00-cd51-538182565468@linux.intel.com>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
	<1484229650.7594.26.camel@andred.net>
	<b391d833-f6fd-13d6-209e-03c3cf406248@linux.intel.com>
	<1484230587.7594.30.camel@andred.net>
	<CAJTo0LZk0A+un28Andm77ypitNKynUhgHXw2PF5c2dgHxbz3uw@mail.gmail.com>
	<2c9e6f87-d5dc-6a00-cd51-538182565468@linux.intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:41:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-12 at 16:22 +0200, Alexander Kanavin wrote:
> On 01/12/2017 04:20 PM, Burton, Ross wrote:
> >     Looks like it. I'd say you'd have two entries with the same contents
> >     next to
> >     each other in the array after applying the patch.
> > 
> > 
> > How's that series to force the fuzz to 0 going, Alex?
> 
> It's blocked by https://bugzilla.yoctoproject.org/show_bug.cgi?id=8325#c4
> 
> You need to ask this question from Paul.

Actually, I am not sure if fuzz=0 would even help in a case where the
context is exactly the same, and only offsets are different...

Cheers,
Andre'


