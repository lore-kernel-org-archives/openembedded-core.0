Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1A9C7879B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 09:09:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z3so4967703wme.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 01:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vDHFSKXk+8Fs/WNPQD/wFJljCqq5Q1lbyh8I7BPvQVY=;
	b=SQzv+Hh+d7dBFVlSt8NIwahlKXKEBm1wgD6REbuLXXZ+SFK/t4vaD+gkHHWy20rcF6
	cxcdsjdVnEKe+dikctMH8Kk6V0uRZ+cRDwHdeTQp7ZBIaVd0I/9+wwhUkQelbemu0gOa
	SMJ7PGb4wISce9n5fK1s1Uaki2kr6IGLaDu3lyWQu2V/kzLaMxMxz+SGZFKAM1rRgWyE
	Zk4V7nnJReMbPajygUoQc5wdmTP1zrGkNUiNjDqTTBqrGEkBaHXx+5J0rC9bkBl6HTSA
	JuHh6PleAVt5+bCVGEaPAYjoJWPmBE6xoxc21gDY27h9PV5rLa6AmSdQAf2cXG5l8wd6
	oDMA==
X-Gm-Message-State: AJaThX6PwBcOeI41c9Umqzqrmc9ZHLDZbrNdVRz3xwy2fFgkGcqZRfCU
	SrS/nHnp/fZNatVmwg3SZZg=
X-Google-Smtp-Source: AGs4zMZtGMB/2vIKEEdXMvO2q+Py81fPOlrLq58/6aHeqSpTYeSfeZNRAr0OM6neFHzTPF8esvuBhA==
X-Received: by 10.80.183.193 with SMTP id i1mr6386181ede.167.1510909759457;
	Fri, 17 Nov 2017 01:09:19 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k19sm1366662ede.35.2017.11.17.01.09.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Nov 2017 01:09:18 -0800 (PST)
Message-ID: <1510909757.4049.85.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Nov 2017 09:09:17 +0000
In-Reply-To: <CAMKF1sq31HwJAMyZ-LFyej7Dy4S2k-q-ZCUv-Zg_cQid2qvmiQ@mail.gmail.com>
References: <20171116091639.16549-1-git@andred.net>
	<CAMKF1sq31HwJAMyZ-LFyej7Dy4S2k-q-ZCUv-Zg_cQid2qvmiQ@mail.gmail.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add 'xz' to HOSTTOOLS
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
X-List-Received-Date: Fri, 17 Nov 2017 09:09:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-11-16 at 18:52 +0000, Khem Raj wrote:
> On Thu, Nov 16, 2017 at 1:16 AM André Draszik <git@andred.net> wrote:
> 
> > Files in SRC_URI that are xz compressed can not be
> > unpacked without this, as we'd have no decompressor
> > available.
> 
> 
> I thought we added  xz-native dependency to such recipes

OK, I have no problem doing that instead. Just seems a little inconsistent,
as bunzip and gunzip are available by default for all recipes.


Cheers,
Andre'


