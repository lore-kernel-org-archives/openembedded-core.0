Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 27D8861B94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:53:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p2so2223797wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PaB9OCCfYjeyjtgRXReMAfwsO/JCpn9PcHJf++DLGp8=;
	b=QMs2rgCBhdAZJzmRV3ols6qKCSv/VD6c5blOfaV89PFTBR9lxXG4r+VhW6drm+pXWa
	lzQfCyDSBAPXIz8svt0rKaYZ2RhZkcWrcnJBTA7psVfdtjBT0BelEqnxlQl4h4VGNbFK
	96DKNTMUkiKLlhGCiB7U90Nmwaoa4fW/g3u3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PaB9OCCfYjeyjtgRXReMAfwsO/JCpn9PcHJf++DLGp8=;
	b=hu3bBNHRIWzIsy9u+jen35OVMN1u6wqqEXtupT6fx6DuWgfDKBXqmMCFG8fRhbtB03
	aGFrGA8GqDPv+0ovxBAMbBExMH+0q80jbYTmMFgK6SOEcBynYr2ycI+YT0IE0lN1kXmw
	rzk/0kIl8ZlWGGVcqPkYdM/IcSFvOyLfI1uzbJuo/fcDM/bcRaNk0qZrhDJDihaZoVA8
	Ym39wQDiVHuXxw9QMWnrhfGQh9fmPEAPsmta6FwC0AhRh/1CNM+W/+aR1p70gHtUU/8f
	wX67InIaOi1esmqJM5jtQEyQfLthAsL5OilvJm52v0KybuecKJA1WAgCtMBEA1MSCFFc
	C9Tw==
X-Gm-Message-State: ANhLgQ3YrijKHti+hfdsPjh4KzKAh+GJXo0cXVOVO85/CSV5xhMQPzjP
	882Bpujl26n9KRX84alC4dtGsA==
X-Google-Smtp-Source: ADFU+vscSxKE+C7D+JCoWZPed6c26APPMw/K8d+sZpSFlMDiIO4lMIMhWp7npspB/y0Jj9M83FZBrg==
X-Received: by 2002:adf:e307:: with SMTP id b7mr3915199wrj.98.1583927587807;
	Wed, 11 Mar 2020 04:53:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r23sm14862008wrr.93.2020.03.11.04.53.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 04:53:07 -0700 (PDT)
Message-ID: <05d49916fe80df0b5e085113873d678c10270f40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>
Date: Wed, 11 Mar 2020 11:53:04 +0000
In-Reply-To: <20200311115025.56045856@ub1910>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-2-pbarker@konsulko.com>
	<e3d926c01221fdbfe47df3d3b05a54015f3564ca.camel@linuxfoundation.org>
	<20200311113122.48437206@ub1910>
	<1d5f679e2c28e2858b098fde142760edcf0c2708.camel@linuxfoundation.org>
	<20200311115025.56045856@ub1910>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] archiver.bbclass: Handle gitsm URLs in the mirror archiver
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
X-List-Received-Date: Wed, 11 Mar 2020 11:53:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 11:50 +0000, Paul Barker wrote:
> I structured things this way after the discussions we've had previously about
> not wanting to add too many new code paths to the fetcher. I'd also like to
> keep the logic in a bbclass as much as possible so that it can be more easily
> carried as a local backport to earlier Yocto Project releases.
> 
> I do see your point though, this is liable to grow warts over time as special
> cases are added for different fetchers.

I appreciate the previous discussions, but yes, this is my concern.

> The cause of the warts here is that the gitsm fetcher downloads and creates
> mirror tarballs for sources which aren't listed in SRC_URI. The archiver
> would be simpler if we could assume that all sources are included in SRC_URI.
> Perhaps the solution is not to add a "make a mirror copy" API but instead add
> an "expand SRC_URI with any dependencies" API that the archiver can call
> before it iterates over the list of sources.

Yes, that sounds like good insight into the real issue and would make
sense, I think that would improve things and alleviate my concerns.

Cheers,

Richard


