Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id CD03C6D73F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:25:15 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ib11so2152861vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wXEQ+Uzj1RNwfOwZJICB/G7xOusl7jREe0kOskz06Dg=;
	b=RrofSVbH2QL7z2ILVilX930EYRFLvNa8wvNSIdEuAswVqP9V1UnEw0isOaoYnYEn7W
	Pbq2QiUW6vNDzE5T4mr+MgZgROQ5pZX7PNk2gdKKUS8SRxSuJzPpzP4+9obuMGbvCGrj
	sdCEdxL1P1FnYKNpTC3HyKyKyAhUXkUqaoPeiOaDYGF/ZcXS8Cl+nC7FJfeWWOqs1H3H
	prrU5C3kCd7JJ2Yf+jHtqRYcrHYF/YqDbiDr8MtfDEUo1DQNT+zJ2r+RrKzxuBFcvXuJ
	94LpMnLI8e5W/nfyIs15sLBPjUxR0yw7hH5p50gR28Lzn5cZ6G+94EZPui37omm1fxoZ
	BG9Q==
X-Gm-Message-State: ALoCoQmV7M5b3rcKagTQHp6oX5H1LayRqmG5SbUr/KwC4L+g32Bf1pGVQ1j3SyLZDoZ6lt1jdktU
X-Received: by 10.220.182.137 with SMTP id cc9mr312637vcb.62.1384557917306;
	Fri, 15 Nov 2013 15:25:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 15 Nov 2013 15:24:57 -0800 (PST)
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Nov 2013 23:24:57 +0000
Message-ID: <CAJTo0LY4tWcawLzOcO4o3LSPoQqod8DKD-BWoMOrmsx5XndDkw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Improvements to pybootchartgui
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
X-List-Received-Date: Fri, 15 Nov 2013 23:25:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 15 November 2013 17:08, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> This corrects and improves pybootchartgui. It starts by importing the
> relevant parts for pybootchartgui from the latest version (0.14.5) of
> bootchart2 from "https://github.com/mmeeks/bootchart". It then corrects
> a couple of problems (e.g., X scaling, X offset of the chart, and header
> height), and finally adds a couple of improvements (e.g., disable
> irrelevant options, draw a lot less ticks, and use "Show more" to show
> all processes).

Excellent stuff, thanks for working on this.  Some time ago I spoke to
the bootchart2 maintainers and they were open to generalising their
code and merging our codebases - is this something you'd be
interesting in looking at?

Ross

