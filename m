Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0931C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:35:58 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10108.1670582156345237004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 02:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BfQ7lAAt;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670582156;
  x=1702118156;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=fu04ew9VN5BAByDSI2wvFqNPYKyMemBrk18ILjuNato=;
  b=BfQ7lAAt8MmCzQSbxBC6ZYSyec78giL3C0CfNZOocoGGp4fkKfddk4Kt
   zdw2PaRTPmPSxPqTgZFmtIGlmbEMsvBn6LaKQwp6ChPMh63KHgu5cVW1S
   Tq/hXyrgZBd8x+G6Jf12rwV+6quzIfzyo4Zvp0gjd2JMSk8RGRZapRa1l
   LpfOTUWPE5YEKbKXDPF7DXrE30MMxNWn0qojieWGOyvX+wHqFmZtyBm0C
   dlqOhgLTvBugyuslxvhXGEdr4ZSDvwQU7KOGUcJoDAV8Jz2tRzA1f4pkc
   evix4QZiMKV/PkqfNDdGGwPOzWfx7hQ0N4kszfqUovBzwokh4rx8CFU34
   Q==;
References: <20221208071136.1967696-1-olani@axis.com>
 <20221208071136.1967696-4-olani@axis.com>
 <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
 <029656ba7b1a8f22d017aa317abba98390ec1507.camel@linuxfoundation.org>
User-agent: mu4e 1.8.8; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
Date: Fri, 9 Dec 2022 11:31:48 +0100
Organization: Axis Communications AB
In-Reply-To: <029656ba7b1a8f22d017aa317abba98390ec1507.camel@linuxfoundation.org>
Message-ID: <jwq1qp8dfud.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 10:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174442


On Thu, Dec 08 2022, Richard Purdie wrote:

> On Thu, 2022-12-08 at 11:00 +0100, Alexander Kanavin wrote:
>> On Thu, 8 Dec 2022 at 08:11, Ola x Nilsson <olani@axis.com> wrote:
>> > +# TODO: Only for 32-bit architectures?
>> > +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
>> > +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
>> > +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
>> 
>> On the contrary, why not set this globally?
>
> The 64 bit architectures don't need this and should "just work" so it
> is probably better just to set this where needed. At the very least
> that will keep the compiler command lines a bit cleaner.

It also changes the hashes for no good reason, right?
Khem suggested using SITEINFO_BITS, I'll see if that works.

-- 
Ola x Nilsson

