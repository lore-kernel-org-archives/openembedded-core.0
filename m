Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 289FC72F74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:32:06 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id a12so10063959ota.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=KpOs51KAc0HhIuc8aHtUx5pRcwHQLeFF/jxeqpzdTcQ=;
	b=Fzt3NKG9gE+KKU+B9GcPkfyiM19EMFBfG7kYoChsiXFkSraDrnoPtwA23j7UTEWcfc
	CVdQ1ZWUgMc7I8jFMImL41OUgMtEphRknE7JKkg4NVuJxGLVQTTRCyTlfeoxrKOOjZib
	OlaTXMX+UuiRv7sUog7FPwDQsmPQcW/HS29eT2IiMoOu/yKHwDVEFea3n/KbrC7OYlER
	U/cw8lnBWyxo78IOGNAa/fttTjU3Anq8XR6N9Ct9pRB1HqOPi0nob5FL2qFN6a3SC2et
	0QqAxLfLjFRlTiQbZOh4/4mpeCTQO8rkp3qSoNDf/EIGH6L76mTo2jMuqfR2P3p4tniU
	S4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=KpOs51KAc0HhIuc8aHtUx5pRcwHQLeFF/jxeqpzdTcQ=;
	b=MN+/iRZ3f7z0sVwkkxUV69Flamg9hrIpQcH1jwBrqjNmUur7DNjy+qb/TYmDjz6YFS
	THCqzV1+/VJ4CK/yZR1OWzpEbV5bETj35ISVLUGgdl5Yd1qTuVRmQ4dSe1iFZ3dVIBaI
	wHWLAvgnmhwPsR/Bc/s1mi81QzXBrZbh5WxmKoTlHJ/p1Xo0FWjZfb6CDGS4TlbaqZU5
	ew+QYiapZ9QiwYrWGFbAxcNO3rKvjBKhr02TRPf4bntcj/dRGAwIheb/ff1DLr3lt9fq
	fcKbqWpOUUfmQ2qqm/kKS1dKt2akjQh/0kMuIDkcfBcoUuVV5COFi3IvQ/3lAp77qZ/i
	Pkbw==
X-Gm-Message-State: AMke39lIXQ5A+HBPrq6fX0Zsxa/OftIs94ZHKyNu3/VtDA7CrDUaW7qLJr/IP/M2UjtpqA==
X-Received: by 10.157.56.227 with SMTP id k32mr11115132ote.155.1489152727639; 
	Fri, 10 Mar 2017 05:32:07 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178])
	by smtp.gmail.com with ESMTPSA id r12sm4247225oie.3.2017.03.10.05.32.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 05:32:06 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id x37so76610880ota.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:32:05 -0800 (PST)
X-Received: by 10.157.25.140 with SMTP id k12mr11672062otk.174.1489152725605; 
	Fri, 10 Mar 2017 05:32:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Fri, 10 Mar 2017 05:32:05 -0800 (PST)
In-Reply-To: <1489131232.7785.390.camel@intel.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
	<bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
	<20170306190728.GA19275@linux.intel.com>
	<CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
	<1489131232.7785.390.camel@intel.com>
Date: Fri, 10 Mar 2017 10:32:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoVRj+Fqx1W4U=Nr1RgFvQgbvwrzatBpv==PpTJX1P3NA@mail.gmail.com>
Message-ID: <CAP9ODKoVRj+Fqx1W4U=Nr1RgFvQgbvwrzatBpv==PpTJX1P3NA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Fri, 10 Mar 2017 13:32:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 10, 2017 at 4:33 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Thu, 2017-03-09 at 18:11 -0300, Otavio Salvador wrote:
...
>> While discussing this with Fabio here, at O.S. Systems, we ended
>> agreeing that wic touching the fstab is wrong. The fstab should be
>> prepare as part of the image and not mangled during the disk
>> generation.
>
> I agree that it is a hack, and I also would prefer to not have wic
> modify the existing rootfs. That also breaks when IMA is enabled,
> because then the content of the /etc/fstab must match the security.ima
> xattr that was calculated for the unmodified content.

Exactly! the generated rootfs should not be modified. This is critical
for IMA but also for root-only fs and delta-based upgrades.

> However, it's a problem that doesn't have a good solution. The image
> recipe which describes what goes into the rootfs and thus determines the
> content of /etc/fstab has little control over the IMAGE_FSTYPES - that's
> typically set by the BSP or the user.

Yes but the /etc/fstab should be modified by the metadata and not
during the image generation. The format used (ext4, fsfs, wic...)
should not impact in the contents inside of the image.

> Suppose IMAGE_FSTYPES = "ext4 wic", and the WKS_FILE has multiple
> partitions and thus needs more entries in /etc/fstab than the
> single-partition "ext4" - the result of do_rootfs simply cannot work for
> both.

That is the point. If the machine requires to use multiple partitions
the ext4 should have the /etc/fstab ready for use when deployed.

> Right now, all one can do is assume (or perhaps check) that the right
> IMAGE_FSTYPES are set.
>
>> The mangled fstab is disastrous if someone uses an image upgrade. The
>> generated tarball or filesystem WILL NOT be the same running on the
>> device as wic will add entries.
>
> When do you take a snapshot of the rootfs? Is it as another do_image_*
> task, via an IMAGE_FSTYPE entry?

We generally use the pristine ext4 filesystem, for example.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

