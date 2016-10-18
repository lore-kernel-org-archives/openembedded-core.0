Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 12C1B6FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 14:54:40 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m5so156051522qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s+dqgaXxJv1BUKCQ1ikJHLiABxWYLqwlPJjvKAF9g2s=;
	b=fw15CbKTkBAbWjY4ab+unXfAv7WBGAvgPbz5xu4sWM1nbOrN5F9VKx8CITvC2yTfS3
	HNk7wdmRYSbJGuEypwV/n3Prz1DHgXsZuBNunkz/7MCOHDbMq5NjTdhh3QxA/XYbsEku
	1lfHWknQ+MHRT5oeCwlYl8yUGEroIS2uz7rwksWnldT9KwungwcJnNWu177i9Z6Pp9g+
	2MNYsrMnz4IZzaeUXRxl6O/6PNGFolEb4m5nn0qWIoFahgCepSJtue6eNZ7TtIpdUP4Z
	6bGIx7CA6WexUL7SgyATi84GQ2UG219pSRCJtO7B4fFVK0agme6g1vRnVMiL2QGv6H2T
	lQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s+dqgaXxJv1BUKCQ1ikJHLiABxWYLqwlPJjvKAF9g2s=;
	b=iCtj9HOrj+pjCY7I4xV9V/OPRvpjxUZoGX1C4+KDRfki+U5ArxsXPkEXDrilciR6NV
	jF/3xWh7fj2YvsqS/2qvbs07r7cQ4YBFant+Bj1i1XepNq2B0aCit5lmwp0PMQ2bqOOA
	RXA02lLUblqtN2P3uve6E0AnenWr0uvrG8EPg6pBupbUGEJVvUmqKwXrn5y2Xv6Gvck3
	b4xXxiV9sjO01HfXHoJkLg+8e6oHdwPdxf7maAbX0DD3LkanHzgJQbRC5JWEsf+Q58wH
	CLjPAUuLRHWKmpkQJRZ6i7ZC72ver3o227gYtTV9KUY5ceZy/cU/OfZPmyyn5trjlF5y
	pzHw==
X-Gm-Message-State: AA6/9Rl165XKNo/x8ECeRgGL4sUsrB1ZmdfGoJELMK7u0jmRUDH4LPaGWFLd75CnW5BHnTLtYc5rDTZUWbxHvg==
X-Received: by 10.28.7.134 with SMTP id 128mr961262wmh.42.1476802481175; Tue,
	18 Oct 2016 07:54:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Tue, 18 Oct 2016 07:54:20 -0700 (PDT)
In-Reply-To: <20161018142409.GA10576@linux.intel.com>
References: <20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
	<CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
	<20161018092748.GA18050@linux.intel.com>
	<CAD4b0_Ji4ai5XXEdiiO87ELxwEuZRrYfG=Vg6aOyebc9ZBqtGw@mail.gmail.com>
	<20161018101703.GA18747@linux.intel.com>
	<CAD4b0_Ky2N44v8XJXoF0LZm04PKpp6=r9PKk-Y4nHd_YZe7DgQ@mail.gmail.com>
	<20161018110557.GA12819@linux.intel.com>
	<CAD4b0_LAjiTOdma6TCcuAm09G3bNNg3sTGyRbf6o+wV_XjVsZg@mail.gmail.com>
	<20161018142409.GA10576@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 18 Oct 2016 16:54:20 +0200
Message-ID: <CAD4b0_K01usyV3QC5Hc2Lckd2-B1vcTAmaYm2a42EHfmroA_WQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add --reserved-size wks option
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
X-List-Received-Date: Tue, 18 Oct 2016 14:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 4:24 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wr=
ote:
> On Tue, Oct 18, 2016 at 03:59:23PM +0200, Maciej Borz=C4=99cki wrote:
>> >> >> >> > What's the advantage of creating unusable gap over creating p=
artition of
>> >> >> >> > the same size that can be used?
>> >> >> >>
>> >> >> >> Just convenience.
>> >> >> >>
>> >> >> > What's the convenience of having extra space on partition that c=
an't be
>> >> >> > used for data over having it formatted and used?
>> >> >> >
>> >> >> >> > Even if that space is not needed it doesn't harm to have it, =
does it?
>> >> >> >>
>> >> >> >> I have not seen any negative side effects.
>> >> >> >>
>> >> >> > I do. If user needs that reserved space it's impossible to get i=
t without
>> >> >> > reformatting partition. The free space exists, but can't be used=
.
>> >> >>
>> >> >> That's not the point and is not aligned with use case I'm trying t=
o solve.
>> >> >>
>> >> >> My case is rather simple, I'm creating an image for SD card that i=
s
>> >> >> deployed in the field. In that particular case, there's a primary =
and
>> >> >> a secondary (aka. active and inactive) rootfs partitions that are
>> >> >> switched whenever a system update comes in. The update is a file
>> >> >> system image that is copied over to the inactive partition, follow=
ed
>> >> >> by a system reboot.
>> >> >>
>> >> >> What I need is the ability to set a certain size of a partition (s=
ay
>> >> >> 100MB), regardless of current rootfs size (which may be, say 70MB)=
.
>> >> >> The remaining unused space sets an upper limit on how much the roo=
tfs
>> >> >> may grow in the future (in this example case, it's 30MB). RIght no=
w
>> >> >> the best I can do is to describe a partition like this: `part /
>> >> >> --source rootfs --size 100MB --overhead-factor 1`, hoping that if
>> >> >> rootfs grows beyond 100MB I will somehow still be able to catch th=
at
>> >> >> and that the future images remain size compatible.
>> >> >>
>> >> >> The resulting filesystem inside the partition is larger than what
>> >> >> IMAGE_CMD (ex. IMAGE_CMD_ext4) would give me, because of explicit
>> >> >> --size in kickstart. I would prefer to have something comparable i=
n
>> >> >> size just to avoid later surprises, what implies using defaults.
>> >> >> However, using defaults, means that I cannot control the layout
>> >> >> because it will likely change each time rootfs size gets changed.
>> >> >> There is no `--fixed-size` or other option to enforce specific siz=
e.
>> >> >>
>> >> >> Summing up, a simple use case that cannot be currently solved usin=
g wic.
>> >> >>
>> >> >> BTW. actually we're missing an ability to enforce --size (i.e.
>> >> >> --fixed-size?) and a method passing an explicit partition offset
>> >> >> inside the disk image (something useful for `--source rawcopy
>> >> >> --no-table` partitions, currently solved with `--align`).
>> >> >>
>> >> > I undertood the problem and I agree that wic doesn't provide a solu=
tion.
>> >> >
>> >> > However, instead of making unformatted space I'd propose to format =
it,
>> >> > i.e. to have --max-size option that would confict with --size and
>> >> > specify upper size limit for the partition. All partition will be
>> >> > formatted and available for data. This is identical to --fixed-size=
 option
>> >> > you've described. This approach would solve the problem you're
>> >> > addressing and it would also make additional space usable.
>> >> >
>> >> > I'd also suggest to rename --size to --min-size and make --size dep=
recated.
>> >> >
>> >> > Does this make sense to you?
>> >>
>> >> No strong opinions here, just that deprecating --size might current
>> >> users uneasy.
>> >>
>> > By deprecting --size I didn't mean removing it completely. We can just
>> > print a warning suggesting usage of other options.
>> >
>> >> Perhaps --max-size could be a boolean switch? We could just name it
>> >> --fixed-size (bool, defaults to False), with semantics that if
>> >> --fixed-size is provided, the partition will have size --size,
>> >> occurrence of --overhead-factor or --extra-space will raise an error.
>> >>
>> > That would work too, but it looks a bit confusing to me to have 2 diff=
erent
>> > types of size-related options.
>>
>> Ok, but now we would have --min-size (previously known as --size) and
>> --size (or --max-size?). That's still 2 size related options plus a
>> deprecation warning.
>>
>
> I agree, it doesn't look good. Moreover --max-size doesn't make it
> clear that partition will be this size. It rather suggests that partition
> can be this size or less.
>
> So, we have --size which is actually minimum partition size, we have
> couple of options to extend partition size (--overhead-factor and
> --extra-space), but we don't have ability to set upper limit for partitio=
n
> size.
>
> OK, let's agree on using --fixed-size(int)
> Using --fixed-size with any of --size or --overhead-factor or --extra-spa=
ce
> options should raise ks parser error. If rootfs size is bigger than
> --fixed-size wic should raise an error too.
>
> Any other opinions?

Sounds good. I'll try to post a patch in the next couple of days.

Cheers,
--=20
Maciej Borzecki
RnDity

