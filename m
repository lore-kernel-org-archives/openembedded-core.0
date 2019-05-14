Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 005ED7DEBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 09:16:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so484095wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=YHh79fBm9VGPfGbZQV8/frpDbR1htV4waY74Idsj14w=;
	b=hCsXeOx/xSYlcTqX4IuyApngvMea2NFgvmHeAARqo42ADvmRJ126QaUUvXN67PzRCy
	w78eN6qpkOTKF95C+C2ma5tAgsIPr/38tNF2bbGYCGwnK7gmVqFGS1FoYrQnrBNh+sdn
	Q8IHsXUIePQU+TKo/IVImO3rPS0jwjK80WPuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YHh79fBm9VGPfGbZQV8/frpDbR1htV4waY74Idsj14w=;
	b=mQ0Ykmoyph48kMhKSCKxHKnrYlGISLnoL7U6QMBCWm6+H64Amw/9onUotcQkwNhVS/
	IdSPbS7ZjDUtHUpa3TKmgEvC5E1CaQBdX/NYgM2G443BmGDl0oaJi+6VviPUVndk8O+B
	0XGRG+xJAQpyd2x3I93XJGuHAy7i5P0A1Ynl+/YExWDSDyhA/XBQgK5IlJunTmeSzSF8
	k0vxBeAsdePTnkicrNqUP1eHtGqLzaWcIHHd4nk45AISZiSrE+0/tE7036d8qVNdhXOa
	MwZBIpdQQ35MYGMomzv4Z3D0wb+2KbfIgz+qWEfVuYm5A5gFrrsOOxhortfs0f+SNOy5
	0XjQ==
X-Gm-Message-State: APjAAAW2SFkq0omtpleUH8ReKbATWjFj9w+nx/Ib0iGbTupZq2Gxb0ux
	prxug5fyt0bdPmuMIJfRO7JI1g==
X-Google-Smtp-Source: APXvYqzSou/ogrAcbof/XIH4BHEwZF64czoOltCs6RJGR/tk6G/RNFnEFoOAVhSVpP0CnTodna59GQ==
X-Received: by 2002:adf:c98f:: with SMTP id f15mr21382892wrh.279.1557825412624;
	Tue, 14 May 2019 02:16:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s3sm28239187wre.97.2019.05.14.02.16.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 02:16:51 -0700 (PDT)
Message-ID: <f6605ac30b4e5ab7b57cfb2b16b6e443d01d1ee3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Armin Kuster <akuster808@gmail.com>
Date: Tue, 14 May 2019 10:16:50 +0100
In-Reply-To: <20190514083019.GB11298@localhost>
References: <cover.1557809500.git.akuster808@gmail.com>
	<551153b0bd1ebbc05582f6014e3d88b9ce4a46d0.1557809500.git.akuster808@gmail.com>
	<20190514083019.GB11298@localhost>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/23] oeqa: Drop OETestID
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
X-List-Received-Date: Tue, 14 May 2019 09:16:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-14 at 11:30 +0300, Adrian Bunk wrote:
> On Mon, May 13, 2019 at 09:54:03PM -0700, Armin Kuster wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > These IDs refer to testopia which we're no longer using. We would
> > now use the test
> > names to definitively reference tests and the IDs can be dropped,
> > along with their
> > supporting code.
> > ...
> 
> Is this bringing any benefits for a stable branch or was it just a
> cleanup?
> 
> And AFAIR this needs "oeqa/systemd_boot: Drop OETestID" or it might 
> cause a regression.

Yes, this change is more risky. We might want to drop the test IDs but
leave the core class code so that other layers don't break if they
still have OETestID tags?

In hindsight I probably should have done it in two steps in core.

I'm suspecting Armin is doing this to easy porting of other QA
patches...

Cheers,

Richard


