Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3B7789AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 10:06:05 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id s9-v6so2188484wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=o3OK0/V4D9x2iOE5JJnKFZW4aWpasn0wWM3bX+LUMic=;
	b=LbupEG+wQNHzDcwd+XkyACBp3x/VDhq7SGdX7QHyLtGiB0Fh9KwlrkZtaEZg+osSr/
	ZjoABSQcmDLsDfsqM2OfjRf8+/CAFi5MBGSYDb4+YAAt5Q+46ZQiQu7dLAHEv7a4idiZ
	9u7TnqjgIY+il2KM+jz1d4auW3yzA2yOw33+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o3OK0/V4D9x2iOE5JJnKFZW4aWpasn0wWM3bX+LUMic=;
	b=rFA8/5z1/8SIWO4HLHMPAr8AYcy5oohXOwywdX9GiPtxlM/iQNPIIxEx7HC8gzUmXZ
	U6WB6rnO7+e1/5qjjCXYNZj72NJXOwVqZGBHf6MlzYUXTUUtEMv2T5N6dPqz0q/KSl0+
	fWGXqt3ngAb5mIsByI8Ise4tNuUe2Mq5X+2kzeuBIk1ftTj9CiViGi3BiBQ1FvV8Oy+n
	C9Vur5GTeHwR48bWdDvrcqF2lpRxX/Zp7d65slHlEBunazZBw8DceiXbJ6y2Ew1bN574
	9KePoI481vKVtS5z8bGc9vOryGoK0WvfC68SgroRFxQhngmXrzzw4fZqFpbnI6iqeyX1
	/s7g==
X-Gm-Message-State: AOUpUlF9AYxnNQGhSNTkDpDi+6HzOmpq2YWyfSL/fcfchaMc3/WvEfvx
	o9gV/RlXEjk0fUI2XHokrC4N/g==
X-Google-Smtp-Source: AAOMgpeQLwBTmtBdVP8V7uyhDUzzr+JWprCnAdNUvcjFXkQN9Rof8vOT02lgdSs0t4sHPCMwf7uE/g==
X-Received: by 2002:a1c:85cc:: with SMTP id
	h195-v6mr1101841wmd.110.1531908366235; 
	Wed, 18 Jul 2018 03:06:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q11-v6sm8032570wrp.58.2018.07.18.03.06.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Jul 2018 03:06:04 -0700 (PDT)
Message-ID: <b28d69cd983d9193dd83dd6fed92f4dc26836b00.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<ross.burton@intel.com>
Date: Wed, 18 Jul 2018 11:06:03 +0100
In-Reply-To: <CAJ86T=UkYDfv0_oag61tGn9VHfxA-waTBzJ2ZPcieu8tEPztPg@mail.gmail.com>
References: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
	<DB6PR0601MB2133389C83155E102AA5E6C1C3770@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=VVumy=u-OT9voyVJ-SBcO+tW=Pf-M8S5FXxHXzgVycsg@mail.gmail.com>
	<DB6PR0601MB21336F7A8CB14036C06506FCC34A0@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=UkYDfv0_oag61tGn9VHfxA-waTBzJ2ZPcieu8tEPztPg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCHv4] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Wed, 18 Jul 2018 10:06:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-17 at 09:57 -0700, Andre McCurdy wrote:
> On Mon, Jun 25, 2018 at 1:51 AM, Tobias Olausson <TOl@hms.se> wrote:
> > Just wanted to bump this, since I still see that v3 of this patch
> > and not v4 (this one) is in master-next.
> 
> The buggy version of this patch just got merged to master-next, via
> mut.
> 
> It's missing Ross's signed-off-by so it looks like the change was
> originally merged directly to master-next, then mut was rebased to
> master-next, then the change stuck around in mut after being dropped
> from master-next...

Thanks, Ross and I had actually talked about this yesterday and I
believe its now been removed from mut and I made sure not to merge it
in -next.

Cheers,

Richard


