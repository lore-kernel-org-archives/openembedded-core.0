Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id C95576C0BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 16:25:12 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id i145so4521783ita.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hQzMeR1tCesbKU1YMLNHb/Yk3HEL1nWzuu7KDHPQOwM=;
	b=D9MmsW7w4FxQTjldr7dfoMLOF+x4UlMvpx2wUxQt+TwF1Sj10d+GAuBRiSlb/rAgEm
	kt/O5/zcmOgpIN0CMVDWNhmd/4GoqnQyj+GLrjKN28s0jUMYdjTWyfVv1+g4GCnKoQpZ
	MoCR6XDfRim9MNX8zsiFRRoWkQJ/BNxWy0LXu7BJV2vqXOiC3WGnHfOnihhHAZVi+W+h
	Oe2K8KUkXggD4ezYdXjc4cpvJF3xhD3lM+rprMhWLNZ3k7dleAU9Z3RwiSFgQTEq0G6R
	OcgvuYOx7nAnEzQIlo0hAM38YwUdNU8w1WOBElWxU5uc5sccOGXCP3Y5yvip0vgivwJU
	je4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hQzMeR1tCesbKU1YMLNHb/Yk3HEL1nWzuu7KDHPQOwM=;
	b=SZF1ahjzqJjSKS/BR9L+IfSgWw5cQ0sO3+yeldKbwWoypZw1OCeJqAacsTymaGIh8W
	ME9sXt/OUgBYqSzme7kd3ZtqT1yQhZFjZBSkmsh8BvkOuRqwocGBZ//YFUvXATMeeb9X
	LHFCzUvUJLcsmc8CB7h9ysu3wq+WXglp21x3acoF4DXypHY1wempH/uKzA/hp79LCk9N
	j4106Gkj0t/zqv+gxIuO9p9kaOuN34+9XHSlNSMM+kaI5HK0z3ETgSsUPPqijbm6Au1/
	g5Gd+bEl7Wnc9q/r/25yl2oQxV2hF/gQgfD0IXBvm5CpxDSJNzbUwAg38AaVp1OureqS
	I9DQ==
X-Gm-Message-State: AA+aEWY7yjBj5PqmXs3Mh+jtuyQkiazaAVRFLdwzINY9OziYsbCUMWsW
	W+L5fQ0sV9OEaU0FVR+dfBuzAUxPpDjwuPz2zv6zJrP1
X-Google-Smtp-Source: AFSGD/VdDoSndQ1/NjCwg8ev/omJcflpWZhzhZDpXOy6TDPaGmUPDEMX1TUax1NUCYVj3nA2GcDK61LWGMaxoWNnwkE=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr24112955jal.31.1544718313764; 
	Thu, 13 Dec 2018 08:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20181213141312.14587-1-andrea.adami@gmail.com>
	<CAJTo0LYO+o2erx14U1QVHB2YjAL3qNwELM-5ZSMyBoww5gV0LQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYO+o2erx14U1QVHB2YjAL3qNwELM-5ZSMyBoww5gV0LQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Dec 2018 16:25:02 +0000
Message-ID: <CAJTo0LZurjPRtuPd2cv97-u_58sqOjf2HY0xhA1UgwCx9ori=A@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 16:25:12 -0000
Content-Type: text/plain; charset="UTF-8"

Also, why does this appear to be powerpc-specific?

Ross
On Thu, 13 Dec 2018 at 16:23, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 13 Dec 2018 at 14:13, Andrea Adami <andrea.adami@gmail.com> wrote:
> > +SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"
>
> Whilst this is musl specific it doesn't break glibc, so apply it universally.
>
> Also seems that assuming !glibc == musl isn't safe, is there a better define?
>
> Ross

