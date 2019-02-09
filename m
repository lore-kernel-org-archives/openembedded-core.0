Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 23D2E7C5D4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:07:07 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p15so2421578qkl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=75I4vAqOlUVU9LOhkF/GGJgpccLyhoQIw5Q94jH3VwA=;
	b=LBJkeBCrby04TCCtiYgHcj0b0uGQ4SVgl2qYhNcyj0L3p4cJMn3vuvg9VGlFnyGBNq
	NOhQomHeNHYnvyIdxvB+T/vO3lTTQcbZlckU9VcSyFDpVRZKsiFMOAQUBmE1vtdjYHmR
	cWIzvcd26pzlpiovth5HC+qMrBdVybRoPStKEfkH+q13ZYm1H2kMIDi/shI9j0EI0uxl
	/MhAkyb5i2y46y5uq0cyQRiifQWEIg3Frv4bnkH+rOr5IsHAXOorLJLuoPG72g0WhkWU
	8o8nSEvK00XZToiepuDzS0E5m+iFUmrZU4g50eCJQhEp/BK3gWgVgkzdoO/j03a3I+MA
	pQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=75I4vAqOlUVU9LOhkF/GGJgpccLyhoQIw5Q94jH3VwA=;
	b=cOFlnNjE85WxPxsI+ipQMwBkriBR3eqIRMxWEEKOH2JTjUYtPshWsthyu9NvyC/jhX
	efp9VFNJpJ+JhDVtyc/i8+lxwM3AyttIHsJOAzzMiGJzG1qoPvYaDKpkselAJ9ll2ogC
	pfe2m+YlPwgYT+YOpMZB4tuVO6wBm3dL1KfxF8Kd1OZvV5TfJS0YzOZQ7pbYI+KdgXHM
	7RrbzvFJnDDbihWH/WaY9PY7vIGuSVK/T0sn9FFWaljwmvdGI/ZfFOOsRNdw1i6W8km/
	MxAO/5P+aOzHyN25ZrXRS6Twme0RjP8+Q+Zn6gfWcxFPj+9WaJgva/ydADglppFev24q
	lShQ==
X-Gm-Message-State: AHQUAuah/OajzOjKGfpP0uw+mgK+K2sOhvoqM/aCFmPe6A4SwQ8m3QNP
	UVxCqW/d9wV1CR2kiAl2lGdpVJ7M50dm5QfD5QY=
X-Google-Smtp-Source: AHgI3IaQ3IHqEsk0HFaO8S3IEhmmWYizuqbi1S2QHqFmzEJqkMK5VtZYFx74sZ4JDyHkQzdgfpk2YSWhYuCHD+GbaTw=
X-Received: by 2002:a37:a7ca:: with SMTP id q193mr803307qke.102.1549735628822; 
	Sat, 09 Feb 2019 10:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20190209012850.17425-1-raj.khem@gmail.com>
	<CAJ86T=Ug9meGkuDsg2=meaqB=rephcMCkgiu3Dw3Qd476yrsRw@mail.gmail.com>
In-Reply-To: <CAJ86T=Ug9meGkuDsg2=meaqB=rephcMCkgiu3Dw3Qd476yrsRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Feb 2019 10:06:42 -0800
Message-ID: <CAMKF1soN2q6aG4CCCDWMv+FS2SBO8VWLB4oH6CGw9LCWMo2BWQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: Set 70% RAM memory usage limit for xz
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
X-List-Received-Date: Sat, 09 Feb 2019 18:07:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 7:27 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Feb 8, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > when building with opkg backend and huge packages e.g. chromium/llvm all
> > going in parallel, memory pressure causes xz to catapult with
> >
> > do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory
> >
> > since there are many tasks going on in parallel, xz adds to memory pressure
> > and it wants it all, put an upper limit for memory xz can use
> >
> > We add a variable XZ_MAXRAM with 70% of RAM limit and can be customized
> > if builders have more memory one can set it like
> >
> > XZMAX_RAM = "-M 0"
>
> This needs a little more explanation. How does a change to command
> used to create .xz images help when running out of memory in
> do_package_write_ipk? Doesn't the image get created a lot later?

I think I have sent v1 patch which was not the one I intended to send.
will send v2 soon which should be complete.

>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> > ---
> >  meta/classes/image_types.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > index 70bd315306..9c8ea0643c 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -57,6 +57,7 @@ def imagetypes_getdepends(d):
> >  XZ_COMPRESSION_LEVEL ?= "-3"
> >  XZ_INTEGRITY_CHECK ?= "crc32"
> >  XZ_THREADS ?= "-T 0"
> > +XZ_MAXRAM ?= "-M 70%"
> >
> >  ZIP_COMPRESSION_LEVEL ?= "-9"
> >
> > @@ -284,7 +285,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
> >  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >  CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> >  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> > +CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} ${XZ_MAXRAM} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> >  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> >  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

