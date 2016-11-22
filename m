Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3049A601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 11:10:06 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id j191so8899234ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=qLCjTkULuSEP47GeDgqBkOAvjo5Yqbq+MIPSejMYCq0=;
	b=KTfDy87WG1ytRplBCoTjQqYdZ5hkyr8wfJzHNmmkv8XLVBISiqr0hov91X29I2TAXf
	7WsvpsrCaWQCjN7rPYkO9lyyv13PczDz4N77TQ2IlT5bKEdcFDk2chf8jF1wfUmHa02B
	f5shc05nbPc0owTOnRdh45cPjEAMS9ByS36TR0sXFUgQiDWrw3TQPF0jjfK79TCcYqEy
	emHSkVicA+pnhpAuRW8MsbNQzWhpxpInEsXnJGbuJ/HWNPmGtb5TBqofrx0gjpb8FbR0
	6LKyC06YoiEnYpqg/rBa/26oMwlyDeWCrOnh4s4hTUb8jWgd1jAqcxPhBA1fyWG5Yc2L
	Q6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=qLCjTkULuSEP47GeDgqBkOAvjo5Yqbq+MIPSejMYCq0=;
	b=GDuwAdQ0FtJSRfGeA8Zj+oXhqUnHwicalKAhQhULoRx40C6gEihsXCn+W9u3KcJoHe
	O5FxCH7OfEeU6pqK+XwVP6VwH6XWnjXtdv2ihYdJkxPSx95bNrOuWGwXLAQdmi3Or3VT
	BGeyujEUf21A+OYPrioMtPZ9+nopIxSvpjbQSgly7bd3+stsJeA3ofR06MKeXFNcCfha
	+xQR96DCDKCbaJAnwW9BN37BG/GtC+zbMEoSI6xxNAwx0U72k6Hk7YfCUhIarPhZxEuo
	E5t300PX8BOVW3nXbSmlofCGfUMjtvotOdwQlY2uFKHx6DrxL/Qqw6xTylMkin+Ats/H
	1sWw==
X-Gm-Message-State: AKaTC03299zVgbV1Ur7BDOibYSQ+Ug9NFye9KNsSzbc7/WtDbLhKAsnMP2yf7fxpnqbKtVec
X-Received: by 10.36.129.9 with SMTP id q9mr1894513itd.24.1479813007996;
	Tue, 22 Nov 2016 03:10:07 -0800 (PST)
Received: from pohly-mobl1 (p57A56926.dip0.t-ipconnect.de. [87.165.105.38])
	by smtp.gmail.com with ESMTPSA id y20sm9536556ioy.8.2016.11.22.03.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 03:10:06 -0800 (PST)
Message-ID: <1479813004.3239.19.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>, Eduard Bartosh
	<eduard.bartosh@intel.com>
Date: Tue, 22 Nov 2016 12:10:04 +0100
In-Reply-To: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Tue, 22 Nov 2016 11:10:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-11-22 at 10:05 +0100, Kristian Amlie wrote:
> Hey
> 
> In Mender we are using a dual rootfs partition layout (A/B layout)
> with a persistent data partition on the side. We're using wic to do
> the actual image building.
> 
> However, putting files into this data partition is not a
> straightforward operation ATM. All recipes in OE put files into the
> rootfs only, and we'd like there to be a way to specify that files
> should go into the data partition.
> 
> I haven't seen any straightforward way to do this in OE. Some
> suggestions for how it could be done:
> 
> * A "DATA_FILES" variable (like "IMAGE_BOOT_FILES"), where you can
> list files you'd like to be included. This is very straightforward,
> but has the disadvantage of being a bit hairy when paths are involved,
> and it doesn't allow for much logic.
> 
> * Keep a special "data" directory, something similar to sysroot, where
> recipes could install files into in order to have it included on the
> data partition. We could potentially have a bbclass for use in recipes
> to make this more streamlined.
> 
> * Have a special recipe that users can bbappend, which specifically
> install to the data partition (this might also need a "data"
> directory, like above).

All of these introduce some special mechanism. Let me propose something
that might integrate better with the existing tooling:

The "rootfs" directory gets redefined as representing the entire virtual
file system. When creating a disk image, it gets split up into different
partitions based on the image configuration.

For example, the /home or /data directories in the rootfs could hold the
content that in some image configurations goes into separate partitions.

The advantage of this approach is that the tooling for staging content
for image creation does not need to be changed. The same staged content
then can be used to create different images, potentially even using
different partition layouts.

To implement this approach with wic, wic needs to be taught how to
exclude directories from the main rootfs. Ideally, the mkfs.* tools
should also support that without having to make an intermediate copy of
the files for a certain partition, but initially wic could create
temporary directory trees.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




