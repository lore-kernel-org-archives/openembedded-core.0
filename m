Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 470C660720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 14:53:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id e24so840502pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tn/SDyZdt5o9X1+n3oZec1+C38y236NlUWs3nPuT86w=;
	b=mJFJCiA8QhkvCNnOZfwQUPJFkbdxTZbSIf42EC31QTjwItj0bpqJaYEQEaYhsP6ZIB
	Gcf2JFIa2iY3BJT9lvSwedVdNg8ONDlOtcj1M9AML3gU9P5iI1lw5OP6/Q83Wkc/u42W
	qYhhchlNKIUOHzX2cN2RbT5ZzJGk1CBbf/tqEH2wWLKMZ7hS2UTbkzgyVTn9pejJpMRD
	YEdihrDnbViMAtIORRLJL+Tmg42FEiATBbIjd+/WU8tT1/2bymrNaB134nfa110UBrYo
	boWjC35ClL+QB4OspSqpxofZsuII/BWt+bRoWrbOGeLvW3/GGJixNVXlvd+OWpMyeJ+G
	Wr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tn/SDyZdt5o9X1+n3oZec1+C38y236NlUWs3nPuT86w=;
	b=dRQcYHPxTz+c8xqDCNsR9rC3qZwd/PVHZPBMM7OmbQwO6PmtwyPyZe6cl98i9hdYaj
	5WEeXvgCiT/srkf22cSWVUahq98I/UGoK4gDpDu6wnF1ElrU3T4LvYnlAO65CYMe8Xo/
	WqbJr1cHCuBWLex8PpT9kjfFNPIcH/15fNZY3tqclWio7J6S9ZdFBlzGmRnQpC8ki45k
	7XPvohJDaqLrQ2wWUot+FVZwJuFFyMl4T6XbxYR+3CVKI+eDzFal1mbGiQcLQmmtofh/
	o0l2PY1+vFRrCwtCyBsdW6pzEd1YCNxnEEds1hh4ri6U9POUFv96HvPmw1QoN6prArHA
	TS1g==
X-Gm-Message-State: APjAAAVMZQUWonWkCjB4/cw75U29svp0HvaEmwcR8TK6mceL9Jg8B4ES
	cOtP16DDggEJpSeVPjzFouU=
X-Google-Smtp-Source: APXvYqyWHls4s2esB8IrjyG0NYKMa7dyrJU8ni0VcSqJKi3EPfbHNsCeec78wL878WbrxwbrB6v+Pw==
X-Received: by 2002:a17:902:2865:: with SMTP id
	e92mr10132612plb.312.1553266385301; 
	Fri, 22 Mar 2019 07:53:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:45a8:35fd:6c1a:9e02?
	([2601:202:4180:c33:45a8:35fd:6c1a:9e02])
	by smtp.gmail.com with ESMTPSA id
	t10sm16537638pgo.27.2019.03.22.07.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Mar 2019 07:53:04 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4ac23adb-9be1-c09b-7794-54c2dbd04a24@gmail.com>
Date: Fri, 22 Mar 2019 07:53:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
Subject: Re: musl thoughts
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
X-List-Received-Date: Fri, 22 Mar 2019 14:53:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/21/19 6:11 PM, Andreas Müller wrote:
> Just prepared meta-networking/networkmanager update and spent hours to
> get musl patches applied. Have no idea if musl will build and
> currently all my machines are building.
>
> For me - not using musl and looking forward to have a beer with Khem
> explaining me why I should want musl [1] - it is just useless effort
> and patches are rejected often due to failures on musl build.
>
> So on my way home I though about the options I see to handle musl specifics:
>
> 1. Continue as we do - patch recipe-wise: This is lots of efforts and
> requires resources we don't have. Most patches are created by Khem and
> it would be better for all of us to save his time for other tasks.
> 2. Sending musl related patches upstream: Surely the cleanest approach
> but even more effort because upstream maintainers all have different
> thoughts. Some of them might hear of musl for the first time and are
> possibly not keen on patches they do not see a need for.
> 3. Change our musl slightly: Many patches we currently have are
> trivial. Missing headers or #defines for missing functions... So if we
> add few headers
>   * Empty chunks for e.g <net/ethernet.h>
>   * Add defines as #define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
>   * ...
>
> As you might guess I'd prefer 3 because:
> + Many patches can go and don't need maintenance on upstream refactoring anymore
> + Burden for people sending patches would be reduced
> + Recipes not building with musl currently might work without further
> modification
> + Just in case musl stops (we have seen this before with others e.g
> ulibc) the cleanup would be reduced

Didn't we do something like this with glibc? We carried several patches
that where rejected and just recently got removed so there is a
precedent for carrying OE specific changes  so it seems like a
reasonable approach.

- armin
>
> Of course there are disadvantages:
> - We turn musl into glibc direction. Posix-purists do not like that.
> - Configuration scripts already aware of musl and deciding upon the
> existence of headers missing in musl might do the wrong thing
> - ?
>
> Some other ideas?
>
> Andreas
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2018-March/193521.html


