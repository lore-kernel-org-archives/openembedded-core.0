Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id DE2937FDC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 22:08:17 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d5so8731479qto.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8ga4NW5vv2FuSLxU5Mm0eq5i+6crPUpeiS4hMDBgQNI=;
	b=KBc+iL3h+GhDYbaQHiaQM5bjM/ldxRTKFAjYZKgjlWaGyesD37Su/aVvHA6DCBIOS2
	4+acdhCoEOP0OgHedWBgTzGC0ylMuRu3vqWjWmc6qsJoAPeUgX9hd1C/QjU1p6LS8fVG
	Guz8ErTDnAQyUK3SZbVmnbWkU5oUokzLwvCK+jjIzWULMO0MhubA9H+zMpHgjRWJh6s9
	kDNd000gsKS2XKi71bECwGQelC31+hQU44Qkqmdo5kpYo0sA/DWmV0a40sunpJRK5N/4
	FAhJ+nEI2aGmTdAkJwIbEBnMhL/piynGtRGimJSDJDCBt6sSiPPEY7SWq6RAPn1k/otl
	/7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8ga4NW5vv2FuSLxU5Mm0eq5i+6crPUpeiS4hMDBgQNI=;
	b=ZIQEKwwe8v1jEPjcFw4EUG/JJSjphtVKNVY3fPIm/M0FePWZ9G4N24G4/fzXrM0Dta
	zHppE+VWLS5fCJyw3h8XjRmfzFM0eYBUSM4s+6xJcGstdcn21bJtQLaG8eXSyyk1mb8v
	QduIVd43MUpB5lpEtKLwXemm5My4apRnitlxKlTlmMJxvvEuBMe0ZjK3X7VoVVbz2Kk3
	DT79PZBc5YzQ1qg9qnfHLR1//d4a95ySV/qzRMdh5fuBTW+Y0sQPMgF2dW/wkC/oCfrg
	5vuLUeygzqvSY2umRjXhpfpZ/cxh4Cr8DvxQ5NyvOvc/CZFlf784W1vsDGhLB6l57U4l
	vdeQ==
X-Gm-Message-State: APjAAAXJ6H4BzO1v1JG3gJFzhz9YEYxKLFxvodp8TrnwhTgd7/9uXQym
	n+29YnVSsIAeKsyEiRWX00Z4OCe52lRJMCHG3ek=
X-Google-Smtp-Source: APXvYqxCs8FqPOD/IML4ZN+qI4KaxyjegzghwWeCeJtO37Agjp7l2qUb71eXec+9+tLFcL4xZ5q8FcFLSaHwoRpry4w=
X-Received: by 2002:ac8:145:: with SMTP id f5mr17876549qtg.194.1580162898444; 
	Mon, 27 Jan 2020 14:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-7-alex.kanavin@gmail.com>
	<CAMKF1sooYU9dr5nkmgoW0cPjd3L_QJYtQBUMOpJAABTJ=mqrzA@mail.gmail.com>
	<CANNYZj8Ak0gFwAnupcWJ9eDXP6_hV2hT0u0E4pastRMt+QanZQ@mail.gmail.com>
	<CAMKF1sp39i6szYyZJe7gyhVyU-jJ+ABX2dboZz7DevjN5DZ5Fw@mail.gmail.com>
	<CANNYZj8d7ByK_Y+=du1GSExD3Zb_kfEyWA=Ljc0fPPxaQfqiVg@mail.gmail.com>
In-Reply-To: <CANNYZj8d7ByK_Y+=du1GSExD3Zb_kfEyWA=Ljc0fPPxaQfqiVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 14:07:51 -0800
Message-ID: <CAMKF1so8fap95y6Uq7ijO2FcS+CCWA2UrHtmg7if2qPkqiYyaw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] core-image-sato-sdk-ptest: use 2G of RAM
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
X-List-Received-Date: Mon, 27 Jan 2020 22:08:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 1:46 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This would be over-engineering; I highly doubt anyone would want to run t=
his in qemu for any other architecture than those two. Without kvm or other=
 HW accelerated virtualization many of those ptests will simply fail on tim=
eout, and if not, they'll still be running when the heat death of the unive=
rse occurs.

I was not aware if this image is only meant for x86/arm64.
I do build the same images as AB for qemumips and boot them, although
tests are not run yet regularly matter of time. But building them
itself catches many build issues.

if these images do not have value for other machines then perhaps some
message or comment in recipe, will save some debugging time for
someone in future who is trying to boot it on other arches.

>
> Alex
>
> On Mon, 27 Jan 2020 at 22:02, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Jan 27, 2020 at 12:56 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > This is only used on x86_64 and arm64 by the autobuilder, so we should=
 be fine.
>> >
>>
>> OK. lets set this for those two architectures for now. The image can
>> be built beyond Autobuilders for
>> other arches as well. Perhaps this setting is a candidate for auto.conf =
on AB
>>
>> > Alex
>> >
>> > On Mon, 27 Jan 2020 at 21:54, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > Particularly, 1G wasn't enough for lttng-tools ptests as
>> >> > half of that went to /tmp, and lttng-tools needs more.
>> >> >
>> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> >> > ---
>> >> >  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 ++-
>> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb =
b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
>> >> > index 7490b773d2e..58c257c49fb 100644
>> >> > --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
>> >> > +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
>> >> > @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR =3D "1.0"
>> >> >  IMAGE_ROOTFS_EXTRA_SPACE =3D "1124288"
>> >> >
>> >> >  # ptests need more memory than standard to avoid the OOM killer
>> >> > -QB_MEM =3D "-m 1024"
>> >> > +# also lttng-tools needs /tmp that has at least 1G
>> >> > +QB_MEM =3D "-m 2048"
>> >>
>> >> perhaps we need to be cautious here and check if all qemu machines ca=
n
>> >> support 2G emulation.
>> >>
>> >> > --
>> >> > 2.17.1
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

