Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD286FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 14:10:07 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id k192so56928637ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=XimoNKeL3wWpHS3XNi+AWUp1h1HLWpFLhtOTHZ1SGZU=;
	b=hMZAAljwfrAmlemSDX3ZyteQCyZJr4fqjUH0cmca6jqPIqPHhZCaXfpmYkYFzMCwMT
	30OQoKLJLZUcv1YFJo59tqzllt/ZozGx1MQ7iLmu03vYHbVbT9O7cRNsHYLouOKsidAd
	ztdKAWcJdy/W8wlnV4nsJqvwFbBv2q0XJT5hjZP3/5M2arhjoklP0hxehI9+KEFdul2z
	fzZahLdDyKpJlMUPXojiNmO0bQjRjPxGVFnAkGX2Z3VM/pWFUijJ0DC1Cb/7skHnhbKA
	uw1ASiz9jQaotcpdNalzztyzCmzepVUyeECYHuHbgALkqDYQm8dFxqZdfyQgrb1e7a7G
	K/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=XimoNKeL3wWpHS3XNi+AWUp1h1HLWpFLhtOTHZ1SGZU=;
	b=GGsXpBT3Fz3VxyNry3rbPDOFsswZuu1CFpKx/sEm1TGe8ove450MX3tbFUZAt/ng0x
	WkgtTUvKzumZh/RsgTMzKrO5lYSjWAehfHMcxTnHYnxDs4jKBQCoV/d7gXJcEYZ/isKP
	OTbwZoTD/eTRGMDPaB/HDfuC+xigtiYrSeb7MDJBCoFtMrGH+ohEFZpWMZ8y8/kxW6QP
	s7OcYLi+OcVkD2swJE6vlooxdT7s0lI1Dpi+o+CsDSjkXs5OSJaC66z6I6AG7Xti3Eq/
	XgK9PaRjPYZbeJlbsK6RuNaoQd9pTdkbAkM+NQAI46r/fPWOkLdNeK+RYqO/kHV8AByZ
	wcCA==
X-Gm-Message-State: AIVw113Wug3Qe/DrBLV+dDxwySZEc8F/AKqnZWjtxyDGnXYBXflGalSa
	IM993S5TpIATCsDY
X-Received: by 10.36.43.199 with SMTP id h190mr8482754ita.29.1499091009428;
	Mon, 03 Jul 2017 07:10:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF7A.dip0.t-ipconnect.de. [93.232.239.122])
	by smtp.gmail.com with ESMTPSA id
	y188sm10504835ity.9.2017.07.03.07.10.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 07:10:08 -0700 (PDT)
Message-ID: <1499091005.5259.84.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Mon, 03 Jul 2017 16:10:05 +0200
In-Reply-To: <20170703124424.GA5790@linux.intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<20170703083602.GA5532@linux.intel.com>
	<1499074073.5259.74.camel@intel.com>
	<20170703124424.GA5790@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Mon, 03 Jul 2017 14:10:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-07-03 at 15:44 +0300, Ed Bartosh wrote:
> On Mon, Jul 03, 2017 at 11:27:53AM +0200, Patrick Ohly wrote:
> > On Mon, 2017-07-03 at 11:36 +0300, Ed Bartosh wrote:
> > > On Fri, Jun 30, 2017 at 10:53:30AM -0700, Alejandro Hernandez wrote:
> > > > When using wic to create an image from a certain build, wic is expecting
> > > > to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
> > > > which is wrong, since the initrd file has not been copied to the final
> > > > directory yet,
> > > 
> > > Is it possible to ensure that initrd is deployed before wic is run by
> > > making do_image_wic depend on initrd deploy task?
> > 
> > Not in this case, because both do_image_wic and do_image_cpio share the
> > same deploy task.
> 
> Now I understand what's going on here. Basically Alejandro is trying to
> use one format of the same image in another. It's like trying to put
> .wic image inside ext2 image or something similar.
> 
> I believe it doesn't fit current design of oe image creation system.
> I'd suggest to use different image recipes to achieve this.

Yes, that is also my preferred solution (see other email from this
morning).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




