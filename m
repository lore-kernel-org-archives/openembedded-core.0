Return-Path: <cjp256@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id A95D478266
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 21:21:29 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t23-v6so8551999ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7NwWvGAy/byzJwlq6C58mDSYwlNpUDCSeA4LqO/tNS8=;
	b=s9FX6MaA6F3IyqjzNPCyp2Y4AlkO4McA3VfL5r1qHT05BGcwzkwE9lgBpBVyEA6/Qp
	1vki4e75t7GwWyN0bQ4y9NKZWx99zVu/ewmZmMGfvpQjMVclG6QeCZh/1cm39eCq7uXR
	q6R5MqiSagg0tvIK4un0VYSmRBM0kv6DWaexOzW0grFclQkEDSVmE06SOqG+MAwKs+Td
	qgx3zJB1W7vGmeZvEO8KSxxbSmQzRR1n0e9xb3drLwkkUMqSskByjwEOtBU/YLfPnlvr
	FdsYTeffNmtg7+Sc2sY3k/wBxHbQ6VbSd5ictc7xOm6+55WGsuIfswn3sIfk3WySaZJa
	Vofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7NwWvGAy/byzJwlq6C58mDSYwlNpUDCSeA4LqO/tNS8=;
	b=olVxe1EVWplQEsO87R+M9Q/GpBrWo8Xa8kW/F6//Hrs3/JzRTA01H7R2X3+/opZGXi
	NNuF8Afmo0sa7ElB69H66l+jWzng/QNLiY2bB4WQ7Sl7qo5OROgTBVZYzFEjIPof/ikg
	E0v6aRE+Z39SzvlnwtKXHkC60+ajclkyvRZOa/BvOUcOr+Lmu3qOBZH4TwXc9PI9evLB
	4pyXX23Nfa6Oar730r0LH4v5QwPmf3j5NtUKSw/KJ6fQh74Cy2slvol+D245c2wFKF5p
	G7Aa4mr/ghHe2ETt3+AFN0drwDYaX06fxND3qusc8fmAdSKFadBeXRXCbYIfWgBxKZxM
	94Kg==
X-Gm-Message-State: ALKqPwfYmYQGz3nDnHfMk0fRCjgok5Y1uXHdpLOep/xH0jwsLTtkthQ9
	WtZSfbU5XWtzXcJnjtAaM44OOgtvlZ5AgI0Gy5w=
X-Google-Smtp-Source: AB8JxZqXPasjaB7wcoy/anXbNyMLuYG+K4h2NNnM9/tiOBKxi0+hcvFkU7V3Hg0cpYneRJPhumaSHy3rWf8po/mt5aU=
X-Received: by 2002:a6b:bd86:: with SMTP id
	n128-v6mr21490iof.221.1526073690223; 
	Fri, 11 May 2018 14:21:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:712b:0:0:0:0:0 with HTTP; Fri, 11 May 2018 14:21:09
	-0700 (PDT)
In-Reply-To: <CABcZANm1CMZkm+fkR+o_9DejzS=3bzj4XvM1zVd_zsVTY1YZAw@mail.gmail.com>
References: <1526056553-31049-1-git-send-email-cjp256@gmail.com>
	<CABcZANm1CMZkm+fkR+o_9DejzS=3bzj4XvM1zVd_zsVTY1YZAw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 11 May 2018 17:21:09 -0400
Message-ID: <CABZSBQeN+mx7Y8oQ8fhPf=xeuqLa2RpjwHLkVAPD2qoSzvzQMg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add gettext to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 21:21:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 3:10 PM, Christopher Larson <kergoth@gmail.com> wrote:
> This is not a correct fix. We have a gettext bbclass for a reason.
>

I did look at that prior to doing this.  It was my initial approach,
but inheriting gettext causes qemu build to fail when it modifies the
EXTRA_OECONF options with the nls flag (that qemu doesn't process).
There are quite a few other recipes using gettext-native in their
DEPENDS, and the reason for one over the other isn't quite clear.

In the other thread (v2), Khem requested it only be added
conditionally if the gtk packageconfig flag is enabled.  Do you think
it would be appropriate to check packageconfig flag, then
conditionally inherit, then resolve (scrub) the unsupported configure
flags? Or modify the class such that modifying the OECONF is prevented
to begin with?

Cheers!

