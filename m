Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (unknown [209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5627A660CB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 May 2014 05:27:01 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl10so1619323igb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fvQUEeDmFe9rdEV09H5Y/dV5oCeLBduaeUQL941Mun8=;
	b=YS1iy/4SLIjRsZ0fStmg1XERAwolUN4xB7YoXh+pZ7JE+qhF5tCAk9T4EDimljdx8q
	2M1ONYN95CNKnyCqZu8JxVgzx5q0OMXoSbF45/1TgdkltAMGNEOzbv/8nl4QPa2ziAbo
	rhfOTmikc7lFMivq+HTL6t71scbOddAcQyXS2GtsApMhTia7apQgcUclLR6ABeojvNOF
	PlD/69TbqDlfmdMCn7jmncU01QXV1Q+CuA1xO95rfRvSeuYd0N6Bpk52CdNtcFIFFJfu
	Esc3XzBm4kzJKu/JIV2LXlBUSGIejXMKUrGJvDYNptRwFZEoCR7Yy58mAGpTeAl7Vsqv
	m1mw==
X-Received: by 10.42.21.207 with SMTP id l15mr20626104icb.8.1400304422187;
	Fri, 16 May 2014 22:27:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Fri, 16 May 2014 22:26:30 -0700 (PDT)
In-Reply-To: <53764764.1010608@linux.intel.com>
References: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
	<CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
	<CAPbeDC=Z8OTCuy7+Lj4Hp_y-j3FcA0Ro0SBNRvTRRxy4Zm+qdg@mail.gmail.com>
	<53764764.1010608@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2014 22:26:30 -0700
Message-ID: <CAMKF1srjuEd=2cmWapfXCTbkBnT8ku6EZLUhLMnYWiQwh+O0sQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libusb1: Update to 1.0.18
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
X-List-Received-Date: Sat, 17 May 2014 05:27:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 16, 2014 at 10:14 AM, Saul Wold <sgw@linux.intel.com> wrote:
> I am supprised you did not see a circular dependency with udev -> libusb ->
> udev, I think we need to disable-udev as default and if there is a need for
> a libusb with udev support we will have to create a new recipe possibly to
> build it after udev is built.
>
> Thoughts here?

udev dependency on libusb seems wrong to me. Do we use usbutils IDs somehow ?
otherwise remove the dep from udev.

