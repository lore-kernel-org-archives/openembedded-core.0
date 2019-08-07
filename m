Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0FD7F44C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 14:16:16 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t16so1444623wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qsOL6DVBI7yT2OtlqUqj+AOau2w7GobGgNdLaETpbS0=;
	b=W8pDFw1l1rk3POmxFIf11xPB2/+n6bVHnPljAxnGbWFtl9VZLDqTlnmjMgxr8GkZWC
	BXhTMsfLz5VP6RWxYbVjia9DOReIvOyhNLOVKtpe8iivy+iylamjtzg/3JMxSQLBFazG
	8c+1eAqk25kf1RNGrpNTuTs4E8s6NasqIX09w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qsOL6DVBI7yT2OtlqUqj+AOau2w7GobGgNdLaETpbS0=;
	b=LcxXIL/TR9u5NBJflaIbdtDjjuMTW/vLvXyBNwqCTxDZbRZukwN8SY6VQYjV5yOO7J
	ZvhPlhvi2qiB3vWVog2LdcAXeguGGhHfoYIm5mI50kzWj3KBY1FeImglTr6PEXaOFeIB
	bib/2DuPUyL8owiFdgAHbiDqlI6xl3fSkquNyjFyJX3/dbEWdSeTIw5Rp1Iwf8yNL+aK
	x5P0dxr9aL/xi6oKEqR64tJhPgosEHZmrp09UYQ19ZyRNTaOwtjo2Q0tYFdZlpUSy/an
	XJKYGqL+pNgKqKnpO3GTCcz1nWOJSLTEqG1FvcgMwkSaMRujERGa/UG49EHUsLKUso09
	CjMA==
X-Gm-Message-State: APjAAAXmrIDd2JrjfvY8VFauH17YjMcSYC7oNTBuxBSmt9nj3KbeGKiJ
	g0NCV4bx4GzBT+PTcFcbmBLNxQ==
X-Google-Smtp-Source: APXvYqw6Sg5Ny3vWhvXzIySZWWAIeasZaMyE9JIUsxq7RiAsyc+xU3/EPGdzGsjXdfF9tE+kEnZd5A==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr11968765wrn.42.1565187376839; 
	Wed, 07 Aug 2019 07:16:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b8sm80127817wrr.43.2019.08.07.07.16.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 07:16:16 -0700 (PDT)
Message-ID: <8c974f0c0f5d98ae66c7add9646c1c840ead7951.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 07 Aug 2019 15:16:15 +0100
In-Reply-To: <36918de5-75f3-b520-2c3d-72c3b9c1ca71@windriver.com>
References: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
	<0fb7aa39fdcdc39f8a12149005f9b09d04074778.camel@linuxfoundation.org>
	<36918de5-75f3-b520-2c3d-72c3b9c1ca71@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] go/go-runtime: use update-alternative for zdefaultcc.go
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
X-List-Received-Date: Wed, 07 Aug 2019 14:16:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-07 at 10:35 +0800, Changqing Li wrote:
> On 8/6/19 6:47 PM, Richard Purdie wrote:
> > On Tue, 2019-08-06 at 14:54 +0800, changqing.li@windriver.com
> > wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > fix below error:
> > > file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between
> > > attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-
> > > dev-
> > > 1.12.6-r0.core2_64
> > > file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go
> > > conflicts
> > > between attempted installs of go-dev-1.12.6-r0.core2_64 and go-
> > > runtime-dev-1.12.6-r0.core2_64
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >   meta/recipes-devtools/go/go-runtime_1.12.bb | 6 ++++++
> > >   meta/recipes-devtools/go/go_1.12.bb         | 7 +++++++
> > >   2 files changed, 13 insertions(+)
> > It seems odd that both of these packages should provide this,
> > perhaps
> > one version should just be deleted?
> > 
> > Cheers,
> > 
> > Richard
> 
> These 2 recipes don't have any DEPEND or RDEPEND relationship, so
> they 
> are independent from the point of recipe.
> 
> Make one of dev packages empty seems not proper ?

Let me put this another way. What is the difference between these two
binaries? When should you use one, when should you use the other? Or
are they the same thing?

Cheers,

Richard



