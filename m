Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id CFF8279158
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 23:37:25 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id h200-v6so51807vke.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 16:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FWJUMJZ3QasyoqTXcFNiiugkRhRnu4uin1vGPYbVCpk=;
	b=JR/ls61G96qdrduHyj7zm3xkd4uULGGTXuuA9ZfG1Ivqy8vd07rv4o/oShATwgKEBV
	Kq9Gfy/TqpOv1mpflZ2zKwbuAROs1GHB8mbh9GtGeX/YbKYe/YL8JqF2QmIFPHctmW2d
	0KwnBKFJGpADkU6bCAixSb6OarKybKF3pbTpYl4UYYMBlczsyghgqrmUGa7I0FY8yq4W
	sUmmNV9xfIF6gS0r9Ewwk99F2a0Mn9QxcV5+ZgSwc4Q1riZmg+cg+ol2pYdQzQ+4dwnb
	E6a/juwnVWfCXH3cAA4++IRTHxisV3HK8miZyl591mdlRZUKfHDTNfuqm9/HV8WAqsG1
	nJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FWJUMJZ3QasyoqTXcFNiiugkRhRnu4uin1vGPYbVCpk=;
	b=brB4rRy8VakYw0sZYuCNugq6AXmaQ6OqtdYZLxLUjMPyS9aPhBiYJU+F5FZ9B9Lyjp
	9O2DjivFyvKy4dJ5uOFt/ehD54/I3Vk4/EsHejzVEg8JZ6Y2mKAUALQEvehsn3RkHepI
	Nk6UeURuKaVpEmaeuF/uJMXARKbi9xP3x+0bMPP6lQI+N0xE2p7EfFXo6FE9/QqLL/SM
	vCrz4i5IAFpG/ZOw1jkk5InWpLpxb5r3H82huP9XP652lKKNh7EFkjukMB81z/q/Z9mB
	+RgS176TD5EzuloTzlf+r0xxicxMxCaqjaJiQ+lbNw1HYi0aHhDFo2HGh1iScti4vtMI
	18BA==
X-Gm-Message-State: APzg51C7tJA2h5wF//TCWcUdOLytggpVO3+m3dRg6NhLZvy9VoLzuC6J
	B8m7sJyb9imEtOBpE1dHEEo/5tJMR3cTWe+6Gr0=
X-Google-Smtp-Source: ANB0VdZAbL/YfQ1L/m5AZp1EZ159atUUDEY9zdBquDaKvtUiyrbNw6d5dr65PHn/FDY2hHUdKyepbLEdv0Sh5Sum9Yw=
X-Received: by 2002:a1f:8b88:: with SMTP id
	n130-v6mr7672539vkd.83.1534894646535; 
	Tue, 21 Aug 2018 16:37:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 21 Aug 2018 16:37:26 -0700 (PDT)
In-Reply-To: <1d41027052aa40659d2d164dc15b38be@XBOX02.axis.com>
References: <20180719085353.4499-1-andrej.valek@siemens.com>
	<20180719113037.6337-1-andrej.valek@siemens.com>
	<3540cc10-ffab-8805-c471-0a7f12b81acc@siemens.com>
	<5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
	<1d41027052aa40659d2d164dc15b38be@XBOX02.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 21 Aug 2018 16:37:26 -0700
Message-ID: <CAJ86T=WXac7+_PavCOcaE9ZkDyhcV=Xpn0dwbJXxxy92TPuPLw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: update to 1.29.1
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
X-List-Received-Date: Tue, 21 Aug 2018 23:37:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 21, 2018 at 3:48 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
>> Sent: den 21 augusti 2018 22:30
>> To: Andrej Valek <andrej.valek@siemens.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v2] busybox: update to 1.29.1
>>
>> On Fri, 2018-08-17 at 10:18 +0200, Andrej Valek wrote:
>> > ping
>>
>> Fails to build on the autobuilder due to missing crypt headers. That is
>> probably a missing DEPENDS
>
> Well, the patch I sent to add a dependency on virtual/crypt will solve
> this, but see below.
>
>> but I'm wondering what changed and if the
>> change was intentional.
>
> The change was intentional, but it should have been conditional.
> libbb/pw_encrypt.c now unconditionally includes crypt.h, but it should
> only include it if ENABLE_USE_BB_CRYPT is not set:
>
> diff --git a/libbb/pw_encrypt.c b/libbb/pw_encrypt.c
> index 86455cd0d..47c20690f 100644
> --- a/libbb/pw_encrypt.c
> +++ b/libbb/pw_encrypt.c
> @@ -6,7 +6,9 @@
>   *
>   * Licensed under GPLv2 or later, see file LICENSE in this source tree.
>   */
> +#if !ENABLE_USE_BB_CRYPT
>  #include <crypt.h>
> +#endif
>  #include "libbb.h"

Do you plan to submit the fix upstream?

>  /* static const uint8_t ascii64[] ALIGN1 =
>
>> https://autobuilder.yocto.io/builders/nightly-x86/builds/1259/steps/BuildImages/logs/stdio
>>
>> https://autobuilder.yocto.io/builders/nightly-x32/builds/1225/steps/BuildImages/logs/stdio
>>
>> and more...
>>
>> Cheers,
>>
>> Richard
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

