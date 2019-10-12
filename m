Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DACC7F43B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 09:48:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y18so4911969wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gSg2d1ursHdPaKBHsYsH2K9COYpk8pZqZCUuqGkyDAA=;
	b=FVq1f86J+hl9Tll44JqHBuYYUMxkfmlJ+jWIv9czkulqnjpKTecMjopgh7LeR2Stk7
	Dj1zc0OEhL7KxptbBj4pATg5v4NvAcWs26pUPDmhWo9IlWjGnXsCtNQ8Z/IVyc9irIz7
	xNLAUEqcwUPApKzczVfaFGGd+Q6vx+kDRcwZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gSg2d1ursHdPaKBHsYsH2K9COYpk8pZqZCUuqGkyDAA=;
	b=iWqvS2HIcFTQInI36GRNbqJZc/STIXNFf94+ajDvWP0FHF/Uu78r59iEI6wBzqorc4
	/Dy6B7cwziyAiKPz/cykkoid2/htP0/Ef3LvRRzHWo3OmRxLKkw/QCTdpTykvAdmsZzf
	pstbUuZmX2eVhwCF2QpjKSwUXyImGusn4SU1n9ZIH/APtvkccRgQvGNFsQqbVjtigfTr
	0fHwbCD3hh/oJTNtt0s95by1yiKFX85wdODFx4DZ/nJ2t/wSmdheevg+NFmg8xWg1LpD
	62NqglPZy+x8569UKT+1ftyy/UevGONOahyCJvSzF51K84/8DZuCmR3zrtFtkumVkljq
	Q/Iw==
X-Gm-Message-State: APjAAAXSKljNdNMguwY5QA6q8Ca+pPNMNK+RqcJkIFXnUAEnlVkV5jcB
	YaxoC6D8K+QHSEmDi8lFVS14jw==
X-Google-Smtp-Source: APXvYqy8ytJTvBV8ByrZalC+Uq/mV+eN0276eMpM6Uh5gqCMNbCAxyDatGC9se54RtTGJJRt13b61Q==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr3384654wrr.365.1570873737237; 
	Sat, 12 Oct 2019 02:48:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm12923558wrc.18.2019.10.12.02.48.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 02:48:56 -0700 (PDT)
Message-ID: <dff4f92f917d6fee20aea04e5d505e0aadff40bf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christophe PRIOUZEAU <christophe.priouzeau@st.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 12 Oct 2019 10:48:55 +0100
In-Reply-To: <cover.1570452710.git.christophe.priouzeau@st.com>
References: <cover.1570452710.git.christophe.priouzeau@st.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 00/23] Update BSD license
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
X-List-Received-Date: Sat, 12 Oct 2019 09:48:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-10-07 at 13:08 +0000, Christophe PRIOUZEAU wrote:
> Some recipes use BSD as license while SPDX license reference : BSD-0-
> Clause,
> BSD-1-Clause, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause.
> The goal of this request are to indicate the SPDX license euqivalent
> for recipes
> which indicate "BSD" as license.
> 
> The following changes since commit
> 108ce1447ca5dcb838ef67ef6b9a9d25e993da1d:

Thanks for this. In future if there are more of these I'd like to have
one tweak, specifically the commit message being "Clarify BSD license
variant" rather than "update license" which is a little less specific.

For this series I've just tweaked the commit messages to save reposting
them.

It is good to have these clarified!

Cheers,

Richard


