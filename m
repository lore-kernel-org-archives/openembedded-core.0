Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id B1D7A6AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 16:23:14 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id o13so2058649ioh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 08:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jqg7rM/H2GaPqf8remUa5iuFjw8nDp0ZyXeJTduUjgs=;
	b=OkEGbCS41SO8NMDZZFASgeEfylKIpZx62cAlM7RnvZXVHYUkN1b7Ko1e9TnrDKjICf
	S1PGapGWu8A+7s2ou1hG8qzY3Y7/WkuQ+NV4B6Lpqd9xNONM9snKVCATaW6JHTlSdJE6
	eH8mogqStgWQzsuZXs/VGtQxMDg3TnS0BUZEUTvjBSihNnRsLbUlmoCHGvhkjB9Uz4d5
	iKKh8ZpcfcKTbWl6dfQA28gCBv7xLkaGS/v5T4J3WapdgL3W2dbq5e0QTQO/XuLaXGYx
	D8QkYZcMLr+7tnqeEKpcFJUwslOCMoQg+Ciu2D3Ax0SQYEYVu1ipFulsamxXSH5Z3Fw6
	OO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jqg7rM/H2GaPqf8remUa5iuFjw8nDp0ZyXeJTduUjgs=;
	b=GAtLym0FDmTe112I0IBt1uq8zfx97FNRKpWIyjmsR4tIQkgoTySAGAci7euE1EY9PE
	nELjOmSWCU/CosmfrBwh7Rmtro3eJyZZ/SeX7vBfR2W/nXwBKJoCZ0U7wThSY0NbRfg/
	qRsKu84wPn93cuzIAlTL0iN6Lv2t0kMqfbvPteEO8viUwdTpwn3wabebiewZA/mAz8zN
	6JO+z3z+ZFhFxp+qbOR/Z2R8RJZQZ2MU5T46/cT6vx/XClhqKNKELLA3EAXzFaQTQWPL
	WV6nVPoMGr8ZRjppXjwl6H1LQhkEhc9uJthaMXcmY82KSbKuKR/QQNtendEtqIAJImNX
	zGiA==
X-Gm-Message-State: AA+aEWaaRcG49qCSg6x9xUT2aIS3yM/gFjc8ZhFso/I1Aor6Hr49vg8P
	0SAhp7wQc4ppOqnj77Jp1DNTtwvRc0s22Um1yITmZg==
X-Google-Smtp-Source: AFSGD/VVK7a22e8V7xIgMbfB9I4P+f4LvgdOvRxdTDHr6FYN0k8xz9RfLnm1JsAcpWOd8Exd6JiHpH/jZvXpJrHzSh4=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr7916179iog.270.1544718195617; 
	Thu, 13 Dec 2018 08:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20181213141312.14587-1-andrea.adami@gmail.com>
In-Reply-To: <20181213141312.14587-1-andrea.adami@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Dec 2018 16:23:04 +0000
Message-ID: <CAJTo0LYO+o2erx14U1QVHB2YjAL3qNwELM-5ZSMyBoww5gV0LQ@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Thu, 13 Dec 2018 16:23:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Dec 2018 at 14:13, Andrea Adami <andrea.adami@gmail.com> wrote:
> +SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"

Whilst this is musl specific it doesn't break glibc, so apply it universally.

Also seems that assuming !glibc == musl isn't safe, is there a better define?

Ross

