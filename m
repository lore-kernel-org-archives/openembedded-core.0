Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD837DE36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 08:04:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so16696955wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tz3JVUB2DiW6OM7yycAvYLRKCmRqiZeC79tQNIxdPRM=;
	b=iasi38lCSFJqgT7CZB8+er2D8rhvMLyV3NFH6wzDKhVMz0RTRG/uSKwzkc/NBPY79n
	AbH9arVQxfXI3UCAGmdPHf1g9u0dqzYshL5OTVcwMXVEo1uLWhB9SMgtsN84PSVWfb5J
	cOvZbcuEyDL8AlK7MSnba1lU5Rc+Wncu+1TvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tz3JVUB2DiW6OM7yycAvYLRKCmRqiZeC79tQNIxdPRM=;
	b=Y48q8sjz9eOyY5FwW656b1fBNEcnH7HYcftum+zmOHCf416xlZAoNQCGZoFsMMLn1o
	usJhAhtO88yve5aTEHDGitXDZ46J3DuKHl5QF9+2qi5PICNCxZ4HmtCRfQbuusxo2YaA
	4JD3Y1AfsvZjvtuAOh0scDY2H4xsCE+kuUqaX3dP46SLepeCP6PyPZosHwPrfkNwKj0P
	7blcK2pOfjCZXd+bNHLzNlbQVkTYkUJoCJ8bvtWTZl+ZZHA42yX52KrvYyi+33A9CFCo
	7nfWRsbA/GebPBlYdn5KxBHNhm3A97o4LLaHe8z1ay7m8N9hGGE9kHZQ3Y2Y4MoVA1My
	nAKA==
X-Gm-Message-State: APjAAAXIRNPJbxMd96e6qNsZkCR9omaXN20Ym0aV5KQzMRL5sxtBli5V
	dvzAU4GiO9BRONQZxzmh79bpyA==
X-Google-Smtp-Source: APXvYqzZSGyDUsmy1ZUi308+NGaCvMhwIYx+PYyD6gIldSmLWAQkFAjCz80FGyUTNsT1kh7fS65B3A==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr38095311wrl.130.1561449880264;
	Tue, 25 Jun 2019 01:04:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g195sm1098176wmg.26.2019.06.25.01.04.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 01:04:39 -0700 (PDT)
Message-ID: <e1f16895a2b9d138b13b672df19ea50b79d55ae3.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: He Zhe <zhe.he@windriver.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jun 2019 09:04:37 +0100
In-Reply-To: <5997ba72-f7b6-fbd6-4e84-42c3f2b34e48@windriver.com>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<CADkTA4PEz-0ZuFCStXLSXYYwKDgXUuVHUUdMDSrUF0Bx+71d9g@mail.gmail.com>
	<5997ba72-f7b6-fbd6-4e84-42c3f2b34e48@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Tue, 25 Jun 2019 08:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-25 at 15:59 +0800, He Zhe wrote:
> 
> On 6/12/19 6:57 AM, Bruce Ashfield wrote:
> > On Tue, Jun 11, 2019 at 6:50 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
> > > > From: He Zhe <zhe.he@windriver.com>
> > > > 
> > > > For the moment,
> > > > 0001~0004 are on master branch only.
> > > > 0005~0007 are on stable-2.11 branch, but v2.11 has not been
> > > > released
> > > > yet.
> > > > 
> > > > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > > > ---
> > > > v2: Correct a typo in SOB for 0001*.patch
> > > I just discussed this with lttng upstream maintainers a little.
> > > We're
> > > going to have continual tension between keeping lttng-modules up
> > > to
> > > date and new kernel versions.
> > > 
> > > How about we also have a git version of this particular recipe
> > > which
> > > has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
> > > PREFERRED_VERSION when using newer kernels?
> > > 
> > > That should keep people using very recent kernels happy, let us
> > > use a
> > > stable release version and avoid us adding/removing large
> > > patchsets on
> > > a semi regular basis?
> > > 
> > > Would you be willing to try/submit such a git recipe?
> > This makes sense to me as well, since I'm one of the folks that
> > runs
> > into this issue the most. In fact, I've been carrying a local _git
> > version of the lttng recipe for over a year, since I didn't feel
> > like
> > getting into the _git versus release tarballs debate. This solution
> > should avoid that debate and keep all the different versions of
> > kernels moving along.
> 
> Hi Bruce and Richard,
> 
> BTW, how about using git for all cases so that people don't have to
> maintain a
> tarball locally? Though I don't have the background knowledge of that
> git vs
> tarball debate mentioned above.

The overhead of tarball releases is much lower than git trees for each
piece of software so I'd prefer to have tarball recipes where we can,
it does lead to faster builds.

Cheers,

Richard



