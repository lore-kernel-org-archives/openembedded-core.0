Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 48DF96072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:49:34 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id o126so167297iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 12:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T9kaNxld1Xs3Pl9HfYkBFbZEiSll91pzME8Cq+ZxFgo=;
	b=TX6d3v2NoXRXfVKbf+dalBbQjjjDDksC+OCLk9SBWIKL8SExorfBm+G3LIq0TM6PGY
	06xhDAcZqQ07kYKEQtiZvixY48hpRGq64DJQnX9o/a2jB2DtmllIkiRRpMsdkqvHyPKm
	L/CHo6S0EO4IgDWru/fRselEyrihIDlbk2zf70FkwcGUSsz9Uq5DQUINnsK3IE7LUHsN
	VMbwDFcQP4TZ2N5XtcmBg2TeN60gPAwhQFuACRP0GhUClw2yjyb+SjEKMpsj63JmlnIz
	MOND4FCtfYhQrMWyVxs5Xwo36nozkAUyAiIRlPRlj95xwOeXGT6Xn/7gew+aFvc3T5pI
	bc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T9kaNxld1Xs3Pl9HfYkBFbZEiSll91pzME8Cq+ZxFgo=;
	b=fC3oA5xVHjWyd8PKUwefZgeWJw+WbuAaQLCUZ8B1pzFWKyH9UuVTFEGdDnk3+knc4z
	9zu3amEo6KRy1EwOi6bldQeJty2QBEoufIGaIeKHbyMxksidV/T7Mz/wtF762UKArzSR
	jMhq7nsgk18msJDvu8KvHmRzoG0FqDXvZZOUxMqTj52d8KX8iQoKJioURzDH28FU5PM7
	9EBe2cBh4oEBbvu7OHPa3KE/l7idB8Ssy9fIMHgsm8rUHpsy2Wwk21FdFX+GuEfAg06o
	s6ewMditRPAKp2MnfImNvScE4yS2q77c/7DQWj2AGNUsUD3ysGbWf8SKjOUKC1ujPsPu
	YETg==
X-Gm-Message-State: AD7BkJLyrSbH+mNXHQUo/UK4Nc96A5xsEfKhWMy0mBdKR2d/Mcd/AzzHB3sHwoj/KswKn8A+WUEouU4Etnw/9Cz3
X-Received: by 10.107.135.74 with SMTP id j71mr27811002iod.133.1460404174758; 
	Mon, 11 Apr 2016 12:49:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 11 Apr 2016 12:49:15 -0700 (PDT)
In-Reply-To: <CAMKF1spSxf3UBO=4=R017RYb-gnfRaA8S53nn8-tiN6dvAekQQ@mail.gmail.com>
References: <cover.1460020929.git.Qi.Chen@windriver.com>
	<ca141106b28e9f213b0965de589507300ccbbca3.1460020929.git.Qi.Chen@windriver.com>
	<CAJTo0LZLevMcyDJhgGe9uADDW60PgBXHm+GD1kijm8F6BSnCRw@mail.gmail.com>
	<570710A7.9020306@windriver.com>
	<CAMKF1spSxf3UBO=4=R017RYb-gnfRaA8S53nn8-tiN6dvAekQQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Apr 2016 20:49:15 +0100
Message-ID: <CAJTo0LYY5qA57Gfz=LPrwCo0EyyM=Hr07rVfzHaP1DyZ_N3VEg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub2: fix do_configure failure when largefile is not in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 Apr 2016 19:49:35 -0000
Content-Type: multipart/alternative; boundary=001a113f921810c08b05303ad89c

--001a113f921810c08b05303ad89c
Content-Type: text/plain; charset=UTF-8

On 8 April 2016 at 03:08, Khem Raj <raj.khem@gmail.com> wrote:

> We cache sizeof off_t with out considering lfs support thats the
> fundamental problem. We should probably stop doing that.
>
>
Thanks for reminding me, patch on the list shortly.

Ross

--001a113f921810c08b05303ad89c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 April 2016 at 03:08, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">We cache sizeof off_t =
with out considering lfs support thats the fundamental problem. We should p=
robably stop doing that.</p>
<p dir=3D"ltr"></p></blockquote></div><br>Thanks for reminding me, patch on=
 the list shortly.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a113f921810c08b05303ad89c--
