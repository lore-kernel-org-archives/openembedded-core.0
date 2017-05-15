Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4A671CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:51:07 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f102so80464191ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=5FIgoJu8yxEy3ljR0ch/kQ+V5ABRBQDKu97h65ENWr8=;
	b=VR0vEVHWrFtAcu+g2y06CQZ74TmWpuC/3yalgC/qDwplhgXR/Rfrt5rTJ54djmBEPY
	9LmdyHyOBViubYCMBhfJyb1cX47BfOS2nl1g7HABC6CjXhJERXveMJNV1UR+MyEvZynO
	B6oHc9J3CrV4wa58tLJ5EEmsFnKxG5r3BEF16s7IOj+UR2WM3z1POsV7KKeysRB8BjmD
	kd3bD6u7olFjaAiqTHNF/W8TO5HDJWNAZ6wuFJpJq0geBajwmxzVjp6kpVxadmPa/g7f
	uOxWY2nzR2C7rD6CcAGoKwlm3f8c3ZoYwE1vVlp7uLAHDTn5Dc9xp8dENmyxaMSnKbyC
	BrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=5FIgoJu8yxEy3ljR0ch/kQ+V5ABRBQDKu97h65ENWr8=;
	b=Jqdo/F2ocX450bLkaoiD3SHPXgVoUusCfgszzDU8gZkSWizFm3o2JeGGR4Inrhcmyc
	OmPZsn+LHUFiUGKqILec0/OjkgJ/NLOhiDE2/Ty4dZOjb+iBb4cuizCj4AWTIoutsiGl
	xI6xNj8eXXDn55l884AMA26J3uzYq2c1OMUwu+U59Lp58ypK//7/XaF7bghT1oe/I81Q
	rfC8/J/rqdRuLJCQBUOj7Tse8T5ksBZBnGO5M1TdgR/HnUqBpJm4cAguMK8recKOI9RD
	M+ZxEzonLr3IqBiQCg+UkSGhwKSGfpovy5mvrMSUaUXpE3UyCEUAt1sO4S9w5uGEJCZK
	jl5A==
X-Gm-Message-State: AODbwcBPBP8SzgCbiAYdAJgerAnwdkozoT/BgkYkc4Q9gzivthuBvw3I
	wuaNj0Ru1xnAyCfR
X-Received: by 10.107.20.206 with SMTP id 197mr6908272iou.226.1494877869471;
	Mon, 15 May 2017 12:51:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F79A.dip0.t-ipconnect.de. [93.232.247.154])
	by smtp.gmail.com with ESMTPSA id
	r189sm4999719ita.28.2017.05.15.12.51.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 12:51:08 -0700 (PDT)
Message-ID: <1494877866.1179.266.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 21:51:06 +0200
In-Reply-To: <CAMKF1srM6+insBEWhz2cZXMQyU-n+Qj5esoPx1GfEWB2We-y2g@mail.gmail.com>
References: <1494607799-32105-1-git-send-email-anibal.limon@linux.intel.com>
	<5247c79d-2131-0bff-8970-4c4bcef387a0@linux.intel.com>
	<5919BDFD.5080308@linux.intel.com>
	<CAMKF1srM6+insBEWhz2cZXMQyU-n+Qj5esoPx1GfEWB2We-y2g@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.1.1
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
X-List-Received-Date: Mon, 15 May 2017 19:51:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-15 at 08:47 -0700, Khem Raj wrote:
> On Mon, May 15, 2017 at 7:41 AM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
> >> Upstream is already at 2.9, why this version?
> >
> > Patrick has a patches for enable TPM into QEMU 2.8.x line, but there
> > apply into 2.9.x but the compile fails.
> >
> > I guess there's a need to work on those patches before 2.9.x upgrade.
> >
> 
> its also easier to backport it to pyro since its fresh release. Eventually yes
> 2.9 is going to come into master.

We are working on better patches for qemu master which make swtpm usable
without being root. Those are under review on the qemu mailing list at
the moment.

The part of the code which gets touched by these patches hasn't changed
much. It shouldn't be hard port either the current patches or the new
ones, should that become necessary for 2.9.x.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




