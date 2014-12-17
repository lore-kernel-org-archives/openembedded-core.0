Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA647265F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 09:23:36 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id z11so12283524lbi.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 01:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=KLhS8SEkbqqBcSR88FoEiSPAOyS2Qg5okySAbnxS0Mk=;
	b=FczJSIe67fIebEir+xoK7dh0J4Ib0uNhMK+LG+x85RuDUOhr7CGrws8wmAJucbSCRo
	2LyQ9WiwuuqLSBGFIx4DHymF/yxa/nsgGBSgQAqjtiV0QpgjWbkGTK5umXN7gD130LOV
	SiSMVpZIWBIEY2LoU+ex0AhysuV5/Ax2V8py+zewAhw5Mdh8RN9jnmIX22UfIrqbm/q9
	mmH5xXvf2rUF9Od0nhOpXnnqdy0LAO6Wed4TMvW5fwy9+OOopDHgfAVvYRB8Irx7Vnsl
	tL/XOkEYKjTpgFvyLAkbPtpRK4h5eUUAaDUVZ9PlV8ON8gWaP4vL+d3tDvjcxnMmpGu8
	Nfsw==
X-Gm-Message-State: ALoCoQlHr+bRsM4UXzW2wsghHabYot8X872HXBcMq7CsXQ8PT5hfKwxzTu9CiLfS3P0pZqYLVXJ6
MIME-Version: 1.0
X-Received: by 10.152.8.225 with SMTP id u1mr37915971laa.21.1418808216531;
	Wed, 17 Dec 2014 01:23:36 -0800 (PST)
Received: by 10.112.1.101 with HTTP; Wed, 17 Dec 2014 01:23:36 -0800 (PST)
In-Reply-To: <54914493.2030600@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<1a6294d4421862267755ac8cd71ffd91cce16902.1415350038.git.kai.kang@windriver.com>
	<CAJTo0LZqEAbtSdPfpb13VcC+JM99G_Rmv4wbcj=50aT83JRKgg@mail.gmail.com>
	<54914493.2030600@windriver.com>
Date: Wed, 17 Dec 2014 11:23:36 +0200
Message-ID: <CAGNsrLBAhNGxjm8iLkx05PggsNjVo2dzzNo9kqbLRzu=-4Z2eA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/24] libunwind: add aarch64 support
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
X-List-Received-Date: Wed, 17 Dec 2014 09:23:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 December 2014 at 10:53, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2014=E5=B9=B412=E6=9C=8809=E6=97=A5 04:56, Burton, Ross wrote:
>>
>> On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:
>>
>>>    - Support-building-with-older-compilers (fix undefined reference to
>>>      `unreachable' on older compilers)
>>>
>> This patch is missing a signed-off-by header, and considering that oe-co=
re
>> has gcc 4.9 do we still need this, or is it specific to a commercial
>> product that is using an older toolchain?

we still need this.

>
> It is ok to drop this patch for gcc 4.9. I'll do it.

no, it isn't ok to drop this patch. aarch64 support is still needed in
libunwind.

> --Kai
>
>>
>> Ross
>>
>
>
> --
> Regards,
> Neil | Kai Kang

