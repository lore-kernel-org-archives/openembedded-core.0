Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8087F7C719
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:29:51 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m1so16489585otf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=gHrHHD+CnkSlEl35W2KwNxSnVdxdfxgOBuu6r5vQK3E=;
	b=hvW++GXNSP5CL3XV6UB0HVBBo2m+YRK6gRIKvuGfti75gBh3jR3xWgjfEUrMsQ0lRd
	swgJZyUKGnpsjIegcbi3DXimu++HGQfY9aGIzhJIkz4Rv/Qk1r4OLRJrJxGGbTsh0WJC
	gAND6ALVG3FMPCcvd5Kn6WdylRIjshidSPeCUvZJK/HPvm6/9TIYfbEELYjNn36oDl7n
	W92ReDMEyz4bM5i8GkEKqaLBT+oyL7vsqt8cOdkAFAnfSHVorycohTXy9TYbYxSLusS5
	rgzFpRbY6+4m/F7/W/fZHCKrC4CQyuQ+V7JujSjkDVOHcfDSRpamvn1AnN0qs8/4Xwvg
	+Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=gHrHHD+CnkSlEl35W2KwNxSnVdxdfxgOBuu6r5vQK3E=;
	b=uTevBPqRkZbW20A148GR0z6lgOuIHkZITS9spSLw2ljcixlPAXAMmaMsQnb9IXCJ2h
	kGlxN/MERAodbSEkcr8S+aro1ehsylHz6smr7iikf0KdOXVUQDnnpbmQyCbfSRMPCjAH
	OvdzlBp+C3wFtJC01agUjYrPCmZnqveozl1sDxomba/8OoR8qvglsWceSzz5MNkgMhFL
	/388roEsR9m9jKGYzPky1j22itRn5k7otkHXxVQDdcjmloc1zce9GGRu1EG8jk4GLuwH
	XMPUOPzi9GJJKkgqydOCPkmO1caqgFBuwAycNKTMVdEFWfoCf5483ji6EBMWLESUm4jP
	cUWw==
X-Gm-Message-State: AHQUAualN0zYN77HIqYpXGudHk8S5jqbvQWdphIphSzl/ZtmFeRvj5Ci
	UrD4wie00khlowjDwFPxEHld+Q34/YDRcA==
X-Google-Smtp-Source: AHgI3IYcrbd2K7IzFc9igRsz203I5L1iOfVIHnGscnZvEFzmOfo6+1XM+NnhMaN0T3d/0Rx+0Hi+uw==
X-Received: by 2002:a9d:4ac:: with SMTP id 41mr5531645otm.344.1550237392202;
	Fri, 15 Feb 2019 05:29:52 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
	[209.85.210.47]) by smtp.gmail.com with ESMTPSA id
	z15sm2173546oib.23.2019.02.15.05.29.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 05:29:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f47.google.com with SMTP id 98so16541678oty.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:29:51 -0800 (PST)
X-Received: by 2002:aca:4307:: with SMTP id q7mr5506412oia.105.1550237390597; 
	Fri, 15 Feb 2019 05:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
In-Reply-To: <CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
Date: Fri, 15 Feb 2019 11:29:38 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrP3jXE95Z84ne6y0CMOj30g8Jz+53rWX0ikNmJHYoqLg@mail.gmail.com>
Message-ID: <CAP9ODKrP3jXE95Z84ne6y0CMOj30g8Jz+53rWX0ikNmJHYoqLg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:29:51 -0000
Content-Type: text/plain; charset="UTF-8"

Alex,

On Fri, Feb 15, 2019 at 11:26 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 15 Feb 2019 at 14:21, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > In my opinion, there is no relation with an update and change build
> > system, once we can use mesa 18.3.3 without meson.
>
> Please see:
> https://www.phoronix.com/scan.php?page=news_item&px=Mesa-19.0-Deprecates-Autotools
>
> We might as well switch to meson now. The patches are ready and
> (mostly) working.

I am NOT against the switch. I am against in a single commit doing
multiple changes at the same time.

So AS MAINTAINER of the recipe, I nack this commit.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

