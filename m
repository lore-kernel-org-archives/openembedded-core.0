Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 44CEC7F99E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 08:05:04 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l2so21518605lja.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 00:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lg2MSiVLxoT73+P0ERdVR7QWhgQWzqtGYySiBWz6Gog=;
	b=czzGmGEO9tAy+F4hFGSH3D3/65Sse7VqOS3+EGp5JZxnT0n/UyJkEgvS8dhEUKD92G
	T6klzmR1MCse0GhJTOwIAXrLEvNDIixOkMeDHwP8a2a9W9hIJe1RaOkhzzeb9NJZ3vdr
	aZeaFBaojivb8qJt124lPyM+qvk1ntPfwPRZ/pEp3nYDj4eQHAxjQSB+Kr/c7w4LIFfJ
	Kc5ruw021af2NhVYcysFavzbrbEXS3G1Hz5wE2+To1+b9GazPUDhTglHozbIUXD1eleI
	E/qFBl6G37u6AU8vD2Jq4l4L1zg3yy2Mo6Gl++iWbS9c96k0copB3ffhKh+oUwajrrIm
	PVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lg2MSiVLxoT73+P0ERdVR7QWhgQWzqtGYySiBWz6Gog=;
	b=bZfLb/fKxqqDd/6Lhou6kOEYIWiyN7cn/u9n+JBV/GIeIF3be5WLb6AjBv4MBUFGoT
	beaJl2/X7luI13iJVdm4rY4UZv15f7ntysuS8bn9qvmQ7sTD2MiJeVgq9t0NxJBnN9Yf
	E27CGLIQUDIqAi6b92uDnQGGYiOctasl2EOG0VBC32fz+YRP+FMhnlTaJxJhV/w/ckXq
	tuiSx4LATq4fo1d8JzzVGWIEhKHVxQqf5J/5t4vDgFUG2//TPHcK5mEkH8Ld/cazRZJ9
	1N1U5iboLqTcPCtjB7gss4GYfOmHxFpOVgrsQ3OFHQSGfjbNKDVhipO2vSvvffHaBJiS
	4k8w==
X-Gm-Message-State: APjAAAWwlF/HYLKBtV6s75lznuFlGA2mPOJfUS0eL9Ca9DBf45DOTJPF
	GXm35AtcQcG2fGDO5EabYm2oAfm3H6TUpCFcHSU=
X-Google-Smtp-Source: APXvYqyEkkEoZ2mSYJSEcxjbUrxzgdJvFepjsGGOl90mVjdGd13oito8dXwwNtlor15fKIue9TdeEylfKqZO602eIdQ=
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr1503648lji.11.1579161904673; 
	Thu, 16 Jan 2020 00:05:04 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_1C1cqd6qyV_NEMewiYZ2aG-91yDUGzCVwmAKsX7NFwgw@mail.gmail.com>
	<CAM9ZRVsJUJRzsN=cH_y6R2c94tD=DeH91Jp36BOECq6Br_FK8A@mail.gmail.com>
In-Reply-To: <CAM9ZRVsJUJRzsN=cH_y6R2c94tD=DeH91Jp36BOECq6Br_FK8A@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 16 Jan 2020 09:04:48 +0100
Message-ID: <CAPybu_2yQMvrtdE0a-wYw=jspxPro82unkzNjsAyWPZBL2PVJQ@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: Jan Lorenzen <jl@newtec.dk>, ed.bartosh@linux.intel.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Best practices: Multiple images on one partition.
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
X-List-Received-Date: Thu, 16 Jan 2020 08:05:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul

It looks interesting, I guess I can use your code and extend it to
support complete file system instead of just a file. Will come back to
the list with a patch in case someone else finds it useful

Thanks

On Wed, Jan 15, 2020 at 2:53 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Wed, 15 Jan 2020 at 13:05, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> >
> > Hello
> >
> > I am trying to figure out the best way to achieve this. I have a
> > system with a host and a target. The target netboots form the host and
> > have a different package architecture.
> >
> > Usually I was solving this with one partition per image/machine,
> > combined using a .wks file like:
> >
> > part /export --source rootfs --rootfs-dir=target-image  --fstype=ext4
> > --label export --align 1024 --use-uuid --fsoptions defaults,ro
> > --extra-space 400M
> > part / --source rootfs --fstype=ext4 --label rootfs --align 1024
> > --use-uuid --fsoptions defaults,ro --extra-space 400M
> >
> > and then calling wic file after generating both images. ("wic create....")
> >
> > This works fine, but now I need to combine both partitions into one.
> > The reason is that the partition needs to play nice with the current
> > OTA upgrade system.
> >
> > What would be the best way to do this?
> >
> > 1) Implement a new wic plugin, called something like muli-rootfs,
> > where I can specify multiple rootfs and in which directory to unpack
> > them
> >
> > 2) Implement a .bb file that combines the two images in one.
> >
> > do_install() {
> >     tar -mzxf $HOST/host-image.tar.gz  -C ${D}/
> >     tar -mzxf $HOST/target-image.tar.gz  -C ${D}/export
> > }
> >
> > 3) Another way that I am not aware :)
>
> I've recently added the `--include-path` option to wic on master which
> may be helpful here:
> https://git.openembedded.org/openembedded-core/commit/?id=d4cd27a9837426e809190548a83c6c7c76505114.
> My use case was multiple rootfs copies on different partitions, with
> extra files added to just one copy of the rootfs. But it may also be
> useful for this case.
>
> Thanks,
> Paul



-- 
Ricardo Ribalda

