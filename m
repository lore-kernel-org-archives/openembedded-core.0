Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F59060C16
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 06:52:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so1932516wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 22:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3620gU+ya1LIdXYtV5LRIuJ+izgumCOFN/TiooqeoTM=;
	b=ihMgzUP2Z7dzT0JHV1zk2IvZqhjN4lIOaEYunQVqNqIs/EZj/VzS1537x0vip2q6a3
	LkJe3Z7nYOY4t53dutwiHblKVTEOtbJb6GE+ssgHOObZFGT4Ni3Ma+zmgMVTl3z5ufKc
	v3H3fi5m4pf7CuR+HNb26APkdVaxf91R9gkzmYJuoaz3n0YCkQZAwZNGE2L6ZKg5vUSh
	INNUQDEKmK1o1v1EibHdwjwPDZ990EafSrbbTcKHf729i5pE5PFt2nUYI+rtGkgflmgR
	15OmSkLUwY96XqBB2prWb50GHeov5oJEaHYEPZViG4SyIwYl/ISTFVJXBvgQbrPwizW8
	w7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3620gU+ya1LIdXYtV5LRIuJ+izgumCOFN/TiooqeoTM=;
	b=gMo51SK5LB/Zr7G0RrYCQghfgcIBex28HWYCKR3lKvUoANpwt2SXoQbCIAY2WLtn7s
	6/M8e4ay0Jl6sSQl107ZLpHlJiXrp8Ax+p3un1UgbumuJ3c0cQy+ccp1+kfRu+KLkx8B
	YNRg7rDev51ZNS3SMrLlCFAxImzq/BEifUWLvQsJ4MIeEysGKk6lRw4nEx7+oYd/pG+v
	7vtxUWbqYSXgQmiGWVqLa1dXVjKr3JXGQNJ81MLOVhkBFpBY+txs7HuMtb9TDPKOHH8J
	q8n74ty6+/EcXVnR8W9AZSPD3dD4Eo6RH9n/1ML1rWhWAETGVcVV7KKRNPD7jglf6AU7
	A2BQ==
X-Gm-Message-State: APjAAAUOupjznFp4saJJVg4n0f5GBlbo34lXElW//NCMn8K9wXn9VUf4
	UR1pG8avSNB8e0he/7ZyMrKP2/CxDUMZ7WJnYPB2kZSo5UM=
X-Google-Smtp-Source: APXvYqz3HeOHAMHZlW44BqN9MihBh1l2K4X/eP4Yi9spziE3q5A1XzzI26s497p4KiNbgerL1DC9vjKQ9wPSynIDx/0=
X-Received: by 2002:a1c:95:: with SMTP id 143mr3958468wma.65.1580799149046;
	Mon, 03 Feb 2020 22:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20200131233305.118454-1-mark.hatle@kernel.crashing.org>
	<CA+aJhH1nnqrUzwdRuju04NY=YsTfafkQLA7ucMMUUcPyozpEmA@mail.gmail.com>
	<5e6edcb4-8eca-7bb8-5fc4-5c0504d4f130@kernel.crashing.org>
In-Reply-To: <5e6edcb4-8eca-7bb8-5fc4-5c0504d4f130@kernel.crashing.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 4 Feb 2020 16:52:17 +1000
Message-ID: <CA+aJhH3h2DhtUJLKtR8a72kHr9R+oGsfvZe8GRzPsmdsAedmCA@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] microblaze tune: Enable 64-bit
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
X-List-Received-Date: Tue, 04 Feb 2020 06:52:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2020 at 04:36, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 1/31/20 10:50 PM, Nathan Rossi wrote:
> > On Sat, 1 Feb 2020 at 09:33, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> >>
> >> From: Mark Hatle <mark.hatle@xilinx.com>
> >>
> >> 64-bit is not yet available in Linux, but some non-Linux uses exist.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> >> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> >> ---
> >>  meta/conf/machine/include/microblaze/arch-microblaze.inc | 9 ++++++++-
> >>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> >> index 265898b6b6..fb777d929c 100644
> >> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
> >> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> >> @@ -4,6 +4,9 @@
> >>  TUNEVALID[microblaze] = "MicroBlaze"
> >>  MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "microblaze", "microblaze:", "", d)}"
> >>
> >> +TUNEVALID[64-bit] = "64-bit MicroBlaze"
> >> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "microblaze64:", "", d)}"
> >
> > This should probably TUNECONFLICTS with all unsupported versions.
>
> I have no information on what versions are unsupported with 64-bit.  If I
> receive that information, I will add it as conflicts.

It looks like it was added in v11.0 (and unsupported in all prior
versions), according to the microblaze reference manual
(https://www.xilinx.com/support/documentation/sw_manuals/xilinx2019_2/ug984-vivado-microblaze-ref.pdf).

Regards,
Nathan

>
> --Mark
>
> > Regards,
> > Nathan
> >
> >
> >> +
> >>  # Endian
> >>  TUNEVALID[bigendian] = "Use Microblaze Big Endian"
> >>  TUNECONFLICTS[bigendian] += "v10.0"
> >> @@ -26,6 +29,7 @@ TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0
> >>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
> >>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
> >>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
> >> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "-m64", "", d)}"
> >>
> >>  # Disable reorder for v8.30 if pattern-compare is not enabled
> >>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
> >> @@ -48,6 +52,9 @@ require conf/machine/include/microblaze/feature-microblaze-math.inc
> >>  # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
> >>  TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
> >>
> >> +# Add 64-bit to the PKGARCH if enabled.
> >> +MBPKGARCH_SIZE = "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "64", "", d)}"
> >> +
> >>  # Package Architecture formatting
> >> -TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
> >> +TUNE_PKGARCH = "microblaze${MBPKGARCH_SIZE}${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

