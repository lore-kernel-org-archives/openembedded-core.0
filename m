Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id E7D9579399
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:47:44 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id 13-v6so9624891ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=053Q3IcLPXNuhSC+I0wdYH3YjYCZmfsyYM8fh6AYUXc=;
	b=cA4Gkh5IlTsWTnBcSvBgrmQVi9C00rr5cnNu2kePMm0at1cKmJLZ2AW15jxJrTxdIN
	AWcLpeIphiXa7IwT71qtUY5L3lHUbN9uTRJ+uvrfjhZbyAQN8tNtY83LbJ4M1coKRyM9
	mHVm7Wx/gEj0GP0XK3K7UpFhhfLo5bRjE/FhX9C0zFYoP/saeV6WQQnH/ab2HjYHPy/0
	35j3kVxPHdDUfwHVH7agZFXsxM4YP8BdOSF9BQTPYAypjvFvWedpH5rQDewozVELYpPk
	F+K9mdLd7H67IpUZpLGL4C9tJhKRciLtUJBsmJCMNkYbfXYpugoP8PzBbpJWlEKPhTMn
	rMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=053Q3IcLPXNuhSC+I0wdYH3YjYCZmfsyYM8fh6AYUXc=;
	b=Km6/6iMuGL2+lpyqcD4ux4PlW6tkaJteX1z6MK6qQWeD6zOeELVTtK7KkA6H4aEnbV
	xWBjGlBR2aQ0t7NQzW4Ujq76T5LWvUhpc2nCB07yorudA5voZWG1rQvFQK/eeoIaL9a/
	DHf+8b1VTLmGM/xwpn5oCngYLJy6IUR6WojcqyOYgiad+4p0GQDS8j7zzCpJOcoBNurv
	hpnfB63Y2WnkQ3Q/Az6Y0B7hsj1JEIzzB4GIS76s2eL+aN87q6rEqTCVUZDnexLJSSR5
	Rrqcygg7/UBthV2FUclmfhVxPrUJEbqWUWjc11VbbOMhSSn7WAVfpGQlg/shPEPsuja9
	+grw==
X-Gm-Message-State: APzg51AhXpNLVkKg28HNaFgs3eypKDD2l3v++aKYIZMu3pgPw4+lXU21
	Qz9UxKNONfEnh8CRaOAk42I/1dTO8fH5N1cA03U=
X-Google-Smtp-Source: ANB0Vdbi8z13IIvUG3UkQefhtGrSkovPdTplwX6bZ510BFxnkOxZylBYMu2EzKJEWPQshq5eK97TmTTflcAds++DImM=
X-Received: by 2002:aca:edd8:: with SMTP id
	l207-v6mr3179351oih.65.1535554065848; 
	Wed, 29 Aug 2018 07:47:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Wed, 29 Aug 2018 07:47:45
	-0700 (PDT)
In-Reply-To: <CAMKF1spm5a-Zsv5ygjAwf5omk4ekK=ek=awe6Q1RdG_bVntuGw@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<c971e5fd32f999781ff4174c7c1ca6d0e54dea65.1535451643.git.alex.kanavin@gmail.com>
	<CAMKF1spm5a-Zsv5ygjAwf5omk4ekK=ek=awe6Q1RdG_bVntuGw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Aug 2018 16:47:45 +0200
Message-ID: <CANNYZj8hsVXLe0q59PvMeuVb5=7DPJsndi1r6EqE8bC8RMc3sA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 6/6] ca-certificates: update to 20180409
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
X-List-Received-Date: Wed, 29 Aug 2018 14:47:45 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-29 16:30 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

>> -SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
>> +SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
>
> It fails in do_patch for me.
> Patch 0002-update-ca-certificates-use-SYSROOT.patch does not apply
> (enforce with -f)

Works for me though. I just did a cleansstate and build to double
check. Can you try on plain poky master please?

Alex

