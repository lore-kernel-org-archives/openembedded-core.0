Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3F30571E4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 17:45:10 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id z132so887126wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x7i0+M/wzjyb2/q82rtyQmCYdnaS5Z+MtHZ5QY0gcII=;
	b=cHWGwiWykXottVM/q/U7OhiNC23jZndoVM5B4TqhR8LWbd8peUCeGAoec2Iz7tc8rO
	rMsfqXD+2Qk/548ME8ChIym9+k/1VMFlyp1b8g1h5l5BCCjA15SbP7PXzIBU1SRTc1aV
	k0pfcdHaNwgA1zRnIauipVhe+9YdGOz0TnT+QGu6KT/k5YX5AlXxWy6P0wvG0i1KRtnT
	ZcwczPJ769msz8qw4UrAkOrrvNHbDGbZYbetKIf3B6toxDW5LNvK4CcOvbld/nEMQirk
	hR7X0G2brbaYr0yh0ZodbqtCdE3hrO7OVXuTPwnI1JGtfHRF0JpiqWnMJ4gsDNCAf1vs
	fPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x7i0+M/wzjyb2/q82rtyQmCYdnaS5Z+MtHZ5QY0gcII=;
	b=nJ1pyZQg0mp0W9yerWfq07EQqTWs2Y26u/qmaFxV6+2lMWCcJHcKP7aIxgcDuGKjuW
	5uQY7ViAy1tqWdAMFTbmvd5HyHQcck800uaopz9Ar3Jync9Zj9TO8bdO+NMqpOWs3L7k
	Iu1aXb0IYZWzKTvsfURDT04LgxsOQ+xtJyChjcihuRjOxYCi4ewn1t7UJf/WNZEMZoCm
	VXZi7GfiJU3L/cCCXwUR4Z5HajWlmUdkqR6Q6WDMyv67IlqxaFV6uiMZApqUbEqGFLzR
	l32ydJ5UvUIRpeGvzSIY9Xte9JK19bpYtXt8g1B/p3RxFDt1lIc9QNV09NuBZTE5OLXY
	aV5g==
X-Gm-Message-State: AHYfb5jldx1H6NtjJNI9Dis4zIWp/dxHjkXhiNhNGWu34XS4TTYp0sTD
	FBKDqhiuWEfp/7vl6JBJ4DWkpBjYgg==
X-Received: by 10.28.182.7 with SMTP id g7mr3889668wmf.66.1503596711494; Thu,
	24 Aug 2017 10:45:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Thu, 24 Aug 2017 10:45:10 -0700 (PDT)
In-Reply-To: <20170824053753.36121-1-jose.alarcon@ge.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 24 Aug 2017 10:45:10 -0700
Message-ID: <CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
To: Jose Alarcon <jose.alarcon@ge.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Thu, 24 Aug 2017 17:45:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
> This patch was a temporal workaround needed with 4.1 kernels.
> Remove it.

OLDEST_KERNEL is still set to 3.2.0

How can you be sure nobody is using 4.1 ?

