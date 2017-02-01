Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D765D77342
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 16:13:42 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 203so20002695ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=JpHVRT6NEv1nQADiwk1EIDwK9481+7azfn/NejA91HQ=;
	b=DTb7q671dCqA9nQpiKXk3QGBLb1oZoQPm/mNTYMsPK/QzaljCrmAmRrEAduZI/bjIe
	kHCDEbvpxBfOAJkzIn9FaBuG/pHqwLoLz9J2wtIAiBCUOpT2nMRsI41CoU2AUiniEKOS
	VFSjC8+hhp1odW0UDK+BzqqUYlUCa5qsSKnFFF2rA5DupJ913iexhJJ7HqN7r3e4uyEM
	oh4K5HQyWeqWwob4lv1sxAori20juNk5dlfb3FA5lJ4ZsWIERmnFes4ugb8dnTSO6vW6
	pMjqDl60kzyK2Nv4olOmx+nL68c7YbO6s6pPUbx6+du7AT3W794GXTZpBHKHXui1EBUa
	O/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=JpHVRT6NEv1nQADiwk1EIDwK9481+7azfn/NejA91HQ=;
	b=tAhGuxuRIQq+qdN3W2EPdZIfb2PhKT//KMireBGgumRfbUZasN8qrVA+tcZDgTmshK
	hHEJeeaqEdCd9NQJM8PULobmEJl6Px4lMvuQCVQOOnFZ6JdvaOb3pqFuPUS4394ppnpB
	4GtgJSPsmpG5A49aUPMV7O78hLULDUqXWbdKe/itZYbhbTl/RUZTjKcYKm/VPuk2K2qJ
	zpJSjJP618tD3XnVZ0aHUgwXcBEKhIDPBVtIRFVbWm0MzADMbRaLTulHAvSH6xs/dQgc
	oTA+YaxpJcKx1rA2jlYaKxYZXkxmoN+6bOMaUe7xSZYmLP0/gyFi1LlNOxAr2b98xtDW
	//6Q==
X-Gm-Message-State: AIkVDXK5qHI6GpTHBuOWEXxXrNyXOpOIm6xxqAMRE/4zXTLMOJeLq6wmoNRELFpTybV293xE
X-Received: by 10.36.178.21 with SMTP id u21mr2692786ite.103.1485965622712;
	Wed, 01 Feb 2017 08:13:42 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DF4F.dip0.t-ipconnect.de. [93.232.223.79])
	by smtp.gmail.com with ESMTPSA id 78sm6735989ity.7.2017.02.01.08.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 08:13:41 -0800 (PST)
Message-ID: <1485965619.14889.2.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 01 Feb 2017 17:13:39 +0100
In-Reply-To: <c3a990d7-237d-e433-ae02-8bfe7214c162@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1485904618.14144.19.camel@linuxfoundation.org>
	<c3a990d7-237d-e433-ae02-8bfe7214c162@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] selftest/buildoptions: use a thinner image to test 'read-only-rootfs' feature
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
X-List-Received-Date: Wed, 01 Feb 2017 16:13:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-01 at 09:02 -0600, Leonardo Sandoval wrote:
> 
> On 01/31/2017 05:16 PM, Richard Purdie wrote:
> > On Tue, 2017-01-31 at 16:50 -0600,
> > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> >> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> >> -        bitbake("core-image-sato")
> >> +        bitbake("core-image-minimal")
> >>           # do_image will fail if there are any pending postinsts
> > Whilst this is certainly going to be a touch faster, I believe we do
> > want to test read only rootfs with a larger image like sato to make
> > sure the postinsts really do work with a read only system?
> 
> I don't get it. What would make the test different using a larger image?

The postinst of each component installed into the image must work
properly in a read-only rootfs configuration. So the test is partly for
image creation, partly for the components, and thus more comprehensive
when using a larger image.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




