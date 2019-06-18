Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5941D7E90F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:55:31 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so31085455ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EwVt6DWP6gFhvSTl+xWyaBCqDWX9Z0yTB8ppRBqrDBc=;
	b=pD1epZ3TWq1Z8/8Wrwmts0lSsyzRRj4r9MPpwIPVT3yH9Z2JN5F8cPlVkkwXmIFbFd
	lKxG8J+OVWaIxTkprlM2hhIEYFrbLXbLJ5XDS0d8ZNsvB2UL2Kdy7ukbpggLSNOStTRQ
	fULLOU9RimvrKX6GJCxAJkadSPJsRt0vASfsUmXzM4YhFyH3LDXCLXWpL4c/KjJuY5Vh
	bMlWJFiKwe1oSTfNXoHOtBvmx/6uOGcesC5ly5G2z0tcZYHEQKH4TiQdjfWD7gzapX2s
	HwTtCndr2AJc61xXwp4OR3IgSAnSQpFYVCyK/dCfAmx9543G+lzjI+H5narlcfyEWZId
	z+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EwVt6DWP6gFhvSTl+xWyaBCqDWX9Z0yTB8ppRBqrDBc=;
	b=cnCmBNMNxmh25+JqafVA0RI7PiPPRe4q6B5m4UkNizPBdbUhVfZSRemahx+bzkaaxM
	3rHl6Yd+P7+817ZI2/BGNcWghJNkAtrxTvEAg7uOzagXqqfhaJ2hQ75y4xDlvDD1HPmu
	kn3VwBSR3C77DBVZ8TFIIErpZC+1hldECrk4kCMKKc1rH6gR29iK8Hlns21u5MVwZ7vi
	1ZHHl+wVtgtBu4mhlytvAwoNbrMxne2P9hmnl8LmGxeu7SUtA++j5giy5AByenwrTsQP
	t/+8XAldlj4n23hU5plH2a0J8RJ7b8tqz+P5NpF+0J9MNC8KafdzhbOqUL0YquwwqBCL
	rNVw==
X-Gm-Message-State: APjAAAU1EQjirhtjyyF3xk7TAQ9ycnZPZwKqKjzbrY15W3wwhIVBFdOS
	PegNyAqo5BANmJ4+m/9pZdtwR1xnazTwl8nVP9etgg==
X-Google-Smtp-Source: APXvYqzUI2K4Gu8bCN7+nR+uzflWoKraFqCRe+k2Fvywc/RoH8I0iqZduuDhCznJWdKbRQr3GItO9EsQj4Hy7xxL9mI=
X-Received: by 2002:a6b:8bce:: with SMTP id n197mr5227499iod.299.1560873332426;
	Tue, 18 Jun 2019 08:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190618104735.25849-1-ross.burton@intel.com>
	<CAMKF1spb0ouiuW+44jvXqbBYOa5TAw2cbabmQmuTo0z4n9BLZQ@mail.gmail.com>
In-Reply-To: <CAMKF1spb0ouiuW+44jvXqbBYOa5TAw2cbabmQmuTo0z4n9BLZQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2019 16:55:20 +0100
Message-ID: <CAJTo0Lbd2r1enJ63_ubhXp6Ny77dgvrUqhiCPSfeqNYV-pL3zA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binconfig: don't try to fix up .la files
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
X-List-Received-Date: Tue, 18 Jun 2019 15:55:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jun 2019 at 16:51, Khem Raj <raj.khem@gmail.com> wrote:
> while I agree, are there assumptions in the recipes using binconfig on this ?
> especially packages outside oe-core ?

I suspect that everyone is using remove-libtool, because that's one of
the default inherits.

Ross

