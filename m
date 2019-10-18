Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D12037D39C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 22:19:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r19so7624983wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 15:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=vkZfALEkL6AKN//NRpSTIm4tR0+TzfBdvNMQFa7aojM=;
	b=EPgxMW/IdCwvuwwvYLrWh1EXYivnJAv3CdLb+D0Cq+RRDkDhrVAf84CZ2z5jmyXVNk
	+SKHppfi3ZZTWCNIYADdmeMr0W6hAXzL3tR6dsrpZALGd2yqgD1O7SGIhv0US87ipqmO
	kNYm58sLR3IDXHzj4tnga5KLXBv4IojgxIwyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vkZfALEkL6AKN//NRpSTIm4tR0+TzfBdvNMQFa7aojM=;
	b=B65afCPdizHEyff7mUDjN8VlMNPV4E7bh83EGVGuj9NIeRbXuzkpPCaFJhatV8lBBr
	xtWU6pFjR0tEbi2p+Q4pRPUVmUlTztqMVqd64sRnRlpVi8z/vvCbWvctMMLSShr70kmS
	cIYd0Q24HgjvRel91k0kaFk8xEipqth0NnRWGG+y7s9eOQLaRIAcNDdZ43e+tTfNpZJX
	kJcBTX4FOWhORhBcXxprlt65GlBcFbbZkDIYTbkNjl6MFbhg3yReAXs1Yl21OLgqfcG0
	zrtCdqnQVO/hH1RSllHSU5LxbjwT5ORRUPZUK9AgKmY29GyaiFFZAkrWv9G9gC+dl5Vn
	iEcg==
X-Gm-Message-State: APjAAAVQvQFEySRzMEo5oizVbFrLeN4pVBrPJ3HUHJ8ljSapeDpR9zP1
	8vN9YFKINs+VqOqBzkua1itQDA==
X-Google-Smtp-Source: APXvYqwXfWWt4aNPaOWAoFJkV7Vfrq5ygUCbZoTjQlm79vcksRy6Z05FNE2HbCbpTs+VVQf5UFLCDg==
X-Received: by 2002:a1c:f718:: with SMTP id v24mr8856395wmh.82.1571437142513; 
	Fri, 18 Oct 2019 15:19:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n1sm7485740wrg.67.2019.10.18.15.19.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 15:19:01 -0700 (PDT)
Message-ID: <4eb2959678d946157ea02206ef227ac7d31aab8f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Alexander
	Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Oct 2019 23:19:00 +0100
In-Reply-To: <CALbNGRRujaOdX+9NP-CXphK0xuioC3-+Zowo9YLiJhcCYL-3kg@mail.gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<CALbNGRRujaOdX+9NP-CXphK0xuioC3-+Zowo9YLiJhcCYL-3kg@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Fri, 18 Oct 2019 22:19:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2019-10-19 at 00:01 +0200, Andreas Müller wrote:
> On Fri, Oct 18, 2019 at 8:50 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > I certainly don't mean to ignore those reports, it's just that due
> > to my ongoing health problems, and having to dedicate most of my
> > energy to the day job (https://mbition.io/en/home/), I am not
> > currently able to work on the upstream issues in a timely manner
> > the way I used to when maintaining core was actually my day job (at
> > Intel).
> > 
> > The question of how much effort people who update things in core
> > should allocate to fixing 'other' layers has been a conflict point
> > for a long time. I'd prefer to see more aggressive
> > blacklisting/removal of recipes that no one has an interest in
> > fixing and updating.
> > 
> > Alex
> > 
> First and most important: Wish you the very best to get back full
> health
> Second: If I read meson github issues correctly, there are chances
> that meson 0.52.1 fixes (works around) static library fallout as seen
> on dconf
> Third: Taking this in was sub-optimal but: We are close to release
> which is btw the most smooth I've ever seen since I follow this
> project.
> 
> We're back to dirty master where sh*t happens...

Just to be clear for those not following close, this is only on master
and not on the release branch which did not get this change.

Cheers,

Richard


