Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id AAE9877A57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 23:00:17 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t189so49767527wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 16:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r9zQrvxBoS708fb8K8yf7YQ2QMOBR9pF5d/L/ApPOFQ=;
	b=rGBqtHcymICHwnbzYYDkl9KH8xi/3nobwkp1725RMREbM5FwEtHwyMlrudxZI19f7m
	9zgrEc8HFiQCsyKji2EDuZCY6zfUXfRuBXP8yILtTy2YOlJZI15ee+eBy7DduTvxbeGU
	+zEd1ZrSL3KgSp+PYssPa/aUY1B1U+/06VjxPYWGKMR0joBegdBRKsaIS9pjSvykTvYn
	X1xRTuYUhb45gV9Vfei9s3Jx/I5NXFjd6osCAFG2PRUNGZMpoREieaqg1rt+/o3ZQPNc
	UufO3wBIDJKHbyGz6UkYF8/OwixZG5ooa5YXXoQkMASG2l2Rj5AI1g5Yq6c8tW8dzSU/
	y3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r9zQrvxBoS708fb8K8yf7YQ2QMOBR9pF5d/L/ApPOFQ=;
	b=OesKRsAg+znx/na212WX0Oootx8rNL4KyyKt2uOaQqrxUftIhMjer041VP9LBLvM7b
	Uz6AbuPnY+8M7nTtTqmNAFWrvlUB/kUdNyyQRmjl7p+0oxWHrUvibs6W/cisatWL2Bx3
	Y+dtr4nt7v/ieFRq8agHEAjnNxNw/x4X+56lPtU4TS/oKITk5Um445OGmGXQ/5QQGw+x
	cQsm8B8/Vu6M3REG5lv4H8CKf/CntZG8SmzJjMe8nSn7yLJCasbRlNRwlznKmWRLOlDq
	wVbCuQIOP7lQe/VVXQRgP4/2OimJHa1IBpe6CYwdD/jjaY3PA4pfqtOZaPdA+qPxWZda
	ohmw==
X-Gm-Message-State: AFeK/H0ri5H+osRda+kE+DqV+d2hxZoitM375nbRNrKGa2AoKdrtxDhqIep28vTfCmoBUcX0oCaGNzngnowyPw==
X-Received: by 10.28.224.11 with SMTP id x11mr10475828wmg.98.1490223618177;
	Wed, 22 Mar 2017 16:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.179.24 with HTTP; Wed, 22 Mar 2017 16:00:17 -0700 (PDT)
In-Reply-To: <CAMKF1sq0b7U2wZo=65ox=KZ+JAq1oScfxpzCdiQRT3iC_Y5hNw@mail.gmail.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
	<CAMKF1sq0b7U2wZo=65ox=KZ+JAq1oScfxpzCdiQRT3iC_Y5hNw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Mar 2017 16:00:17 -0700
Message-ID: <CAJ86T=XbcuU0-oWQ4z_t8--HCyQYUKx8P7qzO6rkGcH7C6MN2w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Wed, 22 Mar 2017 23:00:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 2:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 22, 2017 at 2:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Currently native.bbclass clears MACHINEOVERRIDES but leaves
>> MACHINE_FEATURES alone. Is that an oversight? Or is there ever a
>> legitimate reason for a native recipe to have a dependency on
>> MACHINE_FEATURES?
>
> MACHINE_FEATURES is specific to target only.

Right, the question is really whether we should try to enforce that or not.

>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

