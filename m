Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id A96A8784FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:53:39 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id v72so29044938ywa.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=KHMELRl78KPoWgSvPjQIkAX22fiBqEvbNy2eo18yFdc=;
	b=p67yfPLtrhCkTeS+lx3GUrO4jOwAIRT/3Wu5mHyIIBXfTHCD19ISsnUPre9QsaV4bE
	tac7n/XdnnD7gChIZz3DaDWwa3LKhqVtKCMkJzgfi4q5RmTIh5ds8tq6LRxhNa+Ynb5/
	HNp0Fs59R8k5oAMzbYhekSXicBDBC5H5JeuFIf2ISB2QmSkazFruGh23rSIiKWpXR+YV
	aMRlBG1pZJQXvXDM39yRBBs+1ZZUZyu/7FEVNhMsHUcZevAP0bk2gicCwJNlrm5va1f5
	T8M49XWncBXRPCgZKHOdUEW1PDb8OhhcWix1UUFkaWWHdxr1dhx5eosr2CZW4CoXYDeT
	cUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=KHMELRl78KPoWgSvPjQIkAX22fiBqEvbNy2eo18yFdc=;
	b=OB6gxOlZYnTIaIadMd1EtqhDRXEXgEdyRnR9aJaINt9ln+K/x9/rRJ7AR5UUKuJ7k1
	iiU5Ok66I28eL3zWstC4hIkUiy2DnUeDF5DjVx/7m0mCVI5VBC/xtV9Nx3mdnS6TXyq+
	Z5bEObstHHJ+jBi9Y9aC/b5yy63qdc7+rJ0IQZJpeqg7XTxW6wvKoWTSmYA+Oy9ZmFlO
	UVX47I3uhEI/sSOVkATqameljAiLXS5vr6lpSksqrn8sTiHMJPFMVqbJYTEIpikpOM8m
	A5xKP4BK9GPJyFSHR90XP390wzmgzmFIU7O/NyaVtkGEafRKPwFoIKGH0KZImMM9Bduk
	yJsA==
X-Gm-Message-State: AHPjjUgwBjCqcMZk3rMTRQc12Nh/HicTvpI8Xh5qwmoO6M/HIDYa2keB
	r7BmmmawIpN7DeS46Uo=
X-Received: by 10.129.82.73 with SMTP id g70mr14552644ywb.218.1505253220289;
	Tue, 12 Sep 2017 14:53:40 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id w4sm4206605ywc.1.2017.09.12.14.53.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 14:53:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id r20so35887640oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:53:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDQPYJvK3OvARvXYOn0n8JyF9LbFiQpsgllhkuk9kUheuDQWK9n7WvVcNr92nLOiweT9f+tTHphwAMMB8ZTVhc=
X-Received: by 10.202.186.7 with SMTP id k7mr1108968oif.25.1505253218534; Tue,
	12 Sep 2017 14:53:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 14:53:37 -0700 (PDT)
In-Reply-To: <CADkTA4NmzVka45pmP8Ts4hCR2piHXemWLfvex2=Ti0dYTxCr8A@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<CADkTA4NmzVka45pmP8Ts4hCR2piHXemWLfvex2=Ti0dYTxCr8A@mail.gmail.com>
Date: Tue, 12 Sep 2017 18:53:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKppZhEhcLiXnf_+vLv+DURBwcLCH57EXC0NiaMfjkFmEQ@mail.gmail.com>
Message-ID: <CAP9ODKppZhEhcLiXnf_+vLv+DURBwcLCH57EXC0NiaMfjkFmEQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 00/13] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 21:53:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 6:41 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Sep 12, 2017 at 8:50 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> This improves the Go support on OE-Core.
>>
>> We are trying to port as much as possible work done by Matt on
>> meta-golang back to OE-Core and also to avoid carrying old releases as
>> there is no need to support more versions of Go toolchain.
>>
>> This fixes issues in existing support as well as add support for SDK
>> generation which supports Go.
>
>
> Testing against what has merged, and what are in these series is showing
> that large
> parts of the go applications that are used in meta-virt no longer work. Was
> it the
> intention of the re-work to not be compatible with existing users of the
> language support ?
>
> Just curious, since I haven't seen this flagged in this context
> (compatibility), but now we
> have to fixup the layers before I branch to match the release .. and that
> was unexpected.

It does change things which can potentially break old recipes. That
said, it is straightforward to fix for most recipes as they end being
simpler.

I volunteer to help if there is the need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

