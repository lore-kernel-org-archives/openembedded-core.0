Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C66A6719A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 23:42:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c17so32213428wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=upv7UjJE8gZatlwMbRsYaC7g0bQdHYsLAAN0+tzcxiw=;
	b=IPNLUn6YhkzJsCFW8Zau0h/WaIgy6u0eeWj1lCJ5l3FdBJ6lYV4NDHSN0y5h3HH8UG
	dEll9Av728SlxfEto9aAgdyeH8jr5Zm7Gn+KVNQ4cXjv8smPJl9+Tbg7LA1ndYziP7mC
	oCCWvgD+LkHq2N23+7AxAWjO0z46nP8q3Jz8p4bY1sL2pSdn4TS6VPRsYE4m0xFcRUko
	QeJdhRceQtVyp421VW6sCKfmcWPcRD68MIkCuBpWVn9BSInqDcaD88xrwfiejmuCN0L1
	79H8VlrL0x134UnTVV7iPRbVrL7lALcVh5wAbLom3ZM16M3volYUlMflEsTzPWicUASh
	XRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=upv7UjJE8gZatlwMbRsYaC7g0bQdHYsLAAN0+tzcxiw=;
	b=i1WDgmE8aiH1w7IO1mUWyumXVzteZ7grvlFt1S/I2h0nFL2ErZxR9pr4ieLuvfajBv
	NtpWpGEEpsNK/DMWjqVXwrgK39WuEDb7SgnCtNlHB8kdLhZrL9fhYU/XUfOHv//xihhn
	Uv4sH0t6iGceFUkMqr1bEx/O188iz3ZUYIwfZU1EACxui58HLMBhQfU/tMkuic0ZybaU
	tmtYnFZjJaqqkWSHsZkA40wBlNL5wBpEhPeVc6Huo9HZzy6O3/VYNusdFbLFrS0qxQZQ
	+13y+ifAFvbBDBY36vaiNrI4ae3TEtfc+/fNaUawSTo8MFRSjn3Bz4xouVh6NPJWBzZZ
	RKhw==
X-Gm-Message-State: ABUngvdm5qn+3v1zV33OytzclVrFsCKp684g4sm+BS738rSDydqueTqeiiT9EuOqp/10J/FkDn0zI3eunT7aQQ==
X-Received: by 10.195.30.165 with SMTP id kf5mr1809787wjd.41.1478734950508;
	Wed, 09 Nov 2016 15:42:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Wed, 9 Nov 2016 15:42:29 -0800 (PST)
In-Reply-To: <20161109180854.130d6804@nuc.betafive.co.uk>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
	<CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
	<CADkTA4NmhstuGn7cZLD-MGB1OdNbAFLkiOKrf20Bri0KSEsuQA@mail.gmail.com>
	<20161109180854.130d6804@nuc.betafive.co.uk>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 Nov 2016 15:42:29 -0800
Message-ID: <CAJ86T=XNd_ypY_aBc+eVGpJ4ntUUecT7Umdg37hUrNqZNAw_6g@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Wed, 09 Nov 2016 23:42:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 10:08 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On Wed, 9 Nov 2016 08:09:09 -0500
> Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>> On Wed, Nov 9, 2016 at 5:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> >
>> > On 9 November 2016 at 02:23, Bruce Ashfield <bruce.ashfield@gmail.com>
>> > wrote:
>> >
>> >> I can ack this patch, since no defaults change .. there's no risk to
>> >> existing users.
>> >>
>> >
>> > Saying that of course doomed the patch:
>> >
>>
>> interesting.
>>
>> Paul: obviously you were building with this in place, and my local test did
>> work here
>> as well .. so any idea to the difference ?
>>
>> Let me know if you want any help looking into it.
>>
>> Cheers,
>>
>> Bruce
>>
>
> The reason for this patch is that I'm using a tarball for the kernel
> sources in the new meta-arduino layer. That tarball doesn't get
> extracted to ${STAGING_KERNEL_DIR} and so it needs to be copied over to
> there. Looking at kernel.bbclass, it looks like the logic to do this is
> present:
>
>
>     # Old style kernels may set ${S} = ${WORKDIR}/git for example
>     # We need to move these over to STAGING_KERNEL_DIR. We can't just
>     # create the symlink in advance as the git fetcher can't cope with
>     # the symlink.
>     do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
>     do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
>     base_do_unpack_append () {
>         s = d.getVar("S", True)
>         if s[-1] == '/':
>             # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
>             s=s[:-1]
>         kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
>         if s != kernsrc:
>             bb.utils.mkdirhier(kernsrc)
>             bb.utils.remove(kernsrc, recurse=True)
>             if d.getVar("EXTERNALSRC", True):
>                 # With EXTERNALSRC S will not be wiped so we can symlink to it
>                 os.symlink(s, kernsrc)
>             else:
>                 import shutil
>                 shutil.move(s, kernsrc)
>                 os.symlink(kernsrc, s)
>     }
>
> The problem is we can't set S to anything unless we can override it.
>
> I've now looked into this futher and it seems to be working for some
> kernel recipes but not others. The issue may be that we have an
> assignment for S in bitbake.conf:
>
>     S = "${WORKDIR}/${BP}"
>
> That's obviously overriding the 'S ?= ...' assignment when my patch is
> applied where S isn't also explicitly assigned in the recipe, some
> other class or include file.
>
> I'm not sure on how precedence is determined if a variable is assigned
> using '=' multiple times.
>
> I'll have another look into it and see where I get. I have a workaround
> in place for the meta-arduino layer for now so it doesn't need an
> urgent fix.
>
> However, if it turns out we can't reliably override S in a kernel recipe
> then should we still have that comment and base_do_unpack_append() in
> kernel.bbclass?

The solution I use (learned the hard way) is to ensure that "S = ..."
comes after "inherit kernel" in the kernel recipe.

> Thanks,
> Paul
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

