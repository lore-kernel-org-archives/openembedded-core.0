Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id D376A612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 18:49:16 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id zm5so20894737pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1QbLEsgoMWQwxhvzJMiqktv6jYUV4hrxGNXjZqI8ORU=;
	b=oLBE/UVPZsLPdz4k4ZK8Vj2Enp4v+KvrZ51KXPinAnyP2TncTsXTu1r+PqfgHBih/j
	xpHHIgJ2NNzWZNXk7NbQknuC2uQLd5K1rcGEuNkRfg6FA3Dxp45RI2jyq4isJ5Lb2CcS
	hkqwsfaUXWF0Khls4SdFF8CNxiLI/KYHT8eONwuI2UJ4lgDyj6LIWRFty3qWbQ+hyGWf
	Qi1OcQrnt/3Bap8tJw2DB3gwT5HR7kzTvDf4cCuRXCTbecoTZOV6EJ87DG1VLZiSTG/f
	9ULDB3xzhz5E0Ln45zaKhNBwEwrv+ROXzI7Oinox2FLML1n0vfU+iA0LbL/fmg+7bvD/
	mgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1QbLEsgoMWQwxhvzJMiqktv6jYUV4hrxGNXjZqI8ORU=;
	b=crmA5aKJ2yFDVLF0UUqNY1+KvSP0dVt+OTalN1o7uCpvpLrOIRK92Hoia3XPPQ+cVO
	AjioXphhbgUrNN4+2RMveyDMK6Pw6l8idW3W0sAqrTvyee2UJzVKX5biNmJ4+bBewsEz
	AkgVKpJMnAFnQBvyXgExIkxpCqd/Eu59SUpGY/y/NmiDFH7tLu1oLyJaQ+ytoHyaOaOZ
	NzEqJ6CuNN8b7u41U0eiAgmm63oqWhdi351CdMxg9wh966VbbjUOZ7jbBTGbbkCsoIje
	EZjDtSH/o8zwQshihtnXwe10bywn1AXEO1G4sWh0HGGGH0ZI8K/gkPsGGD5+xIlKXuub
	xing==
X-Gm-Message-State: AD7BkJI4RGPv46TbfcIlGbhY5JQwbwizvgMNpJ7jfrDrN3IRDk+KTncPikaY4m96bxYPbg==
X-Received: by 10.66.193.6 with SMTP id hk6mr5853544pac.3.1459277356735;
	Tue, 29 Mar 2016 11:49:16 -0700 (PDT)
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com.
	[209.85.220.42])
	by smtp.gmail.com with ESMTPSA id 82sm52374pfb.64.2016.03.29.11.49.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 11:49:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f42.google.com with SMTP id zm5so20894086pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 11:49:15 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.176.139 with SMTP id ci11mr5913038pac.68.1459277354666;
	Tue, 29 Mar 2016 11:49:14 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Tue, 29 Mar 2016 11:49:14 -0700 (PDT)
In-Reply-To: <1459271456.3476.211.camel@pbcl.net>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<56FAA65F.9060300@windriver.com>
	<1459271456.3476.211.camel@pbcl.net>
Date: Tue, 29 Mar 2016 15:49:14 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrdi09oFKji0jb-yu5q=3drJjT7mCZMGVJTvQP0zM5TZg@mail.gmail.com>
Message-ID: <CAP9ODKrdi09oFKji0jb-yu5q=3drJjT7mCZMGVJTvQP0zM5TZg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Tue, 29 Mar 2016 18:49:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 29, 2016 at 2:10 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2016-03-29 at 18:59 +0300, Dragomir Daniel wrote:
>>
>> arch-arm8a.inc add now support for armv8-A processors which support 2
>> states:
>> 32-bit and 64-bit states. It makes more sense to have support for
>> both states
>> in the same inc file because both refer to the same arch.
>
> OK.  And I assume you feel this is a greater benefit than having the
> 32-bit ARMv8 bits in a single file that could be shared by ARMv8-R and
> ARMv8-M, right?

For now, I think it is indeed better. When we add R and M flavours we
can move the 32 bit for another file if we see the need but we ought
to make it simple now.

>> So, you say that we should not use aarch32 and aarch64 for armv8a,
>> but to use something like armv8a64 and armv8a32?
>
> That would be my preference, but of course it's not my decision to
> make.

I like this as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

