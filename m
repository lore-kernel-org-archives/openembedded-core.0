Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id E07C7766A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:50:51 +0000 (UTC)
Received: by iofh134 with SMTP id h134so22342159iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=wJA4xNpHhiDbpRxKjeSxgjFfnGbi0uLOZeh5AefZbDI=;
	b=YBUSSyYWkPupvZ0HI2kiCwsuTXO9PIym4U9kVxsJXeQx9Hu8M+0yXDYO6OFJ2lWU+f
	6/+/BGcEM/Sfw6g0GRCNz0XoE0+0aGyZVHvPpBwBsv0mwRdpot7RkRfcXrEUzZrZRI4S
	3AkzJbxp4fVZ5ciqrXKUUD2dHyPj/9pg3rXRPnRZyVs8ty4Td6qMdOIqXMRvHryORyd8
	azvcuTiCmebeNWEoAlJFj55eviLncWQUd/meZphkcZC4CixrSEIoWUSZtWLN/bmjqJq7
	j2K7glHX2zVvkUiR7N3ngQIo62NtvUMH45Q2/eEsLTmRHa/NEImUUeyKgmpZUmFxIgr4
	4ssA==
X-Gm-Message-State: ALoCoQnmnY29S85MZtoD4XbgeYt97OjiOnDmzb6dI/kq//4ysHcwRvI2cp7yFeKJINZ3KHD3Gy76
X-Received: by 10.107.10.103 with SMTP id u100mr6839616ioi.182.1442497851204; 
	Thu, 17 Sep 2015 06:50:51 -0700 (PDT)
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com.
	[209.85.213.178])
	by smtp.gmail.com with ESMTPSA id kr9sm4217185igb.1.2015.09.17.06.50.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 06:50:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so56660228igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:50:49 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.102.4 with SMTP id fk4mr6736623igb.46.1442497849128; Thu,
	17 Sep 2015 06:50:49 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 17 Sep 2015 06:50:49 -0700 (PDT)
In-Reply-To: <CAHiDW_FKgyMNr37KSBEy=C2KJHGhRM2tJPDQgD9RRz-Vb0mi4A@mail.gmail.com>
References: <cover.1442494048.git.jussi.kukkonen@intel.com>
	<f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
	<CAP9ODKqRyVK1mrOA4ofZVN+iS8fY48dovQ8VihBPQFZT8F7DWA@mail.gmail.com>
	<CAHiDW_FKgyMNr37KSBEy=C2KJHGhRM2tJPDQgD9RRz-Vb0mi4A@mail.gmail.com>
Date: Thu, 17 Sep 2015 10:50:49 -0300
Message-ID: <CAP9ODKoQPSstHGQ7uScmKp-A4niftb91jEVH_9Wjrv7ESX_=CQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xinput-calibrator: Add a dummy calibration file for qemu
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
X-List-Received-Date: Thu, 17 Sep 2015 13:50:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 17, 2015 at 10:36 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 17 September 2015 at 16:23, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Thu, Sep 17, 2015 at 10:00 AM, Jussi Kukkonen
>> <jussi.kukkonen@intel.com> wrote:
>> > This prevents xinput_calibrator from popping up on every boot in qemu.
>> >
>> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>> Why you don't provide a valid calibration for it instead?
>
> xinput_calibrator does not actually work for xorg drivers: it fails to write
> the values in xinput format for xorg devices. I was planning on looking at
> that as well but since I know very little about these drivers I was going
> for the low hanging fruit first...
>
> Also, Ross pointed out that I should just add the file into
> meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput
> and then the recipe changes become unneeded.

This is a workaround, not a fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

