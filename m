Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0127869B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 18:41:23 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id y10so18641102otg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 10:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=CzhiDXJepa2LH69oReOU5L3ZK17einWtVrEQb3VNW+Q=;
	b=jzMHtC9SYjn3kTXZvX0PjkqwdyWC5PV3AAlXPKb3Cr724U2t8RLkY0L56fkj2ZCJPv
	OjdsHRQl3BZZ/Xti7jOJuuoYitGJuxjUWIWLijuIGuxPJowcLbnFrD+rfsB+c8AMxMGM
	Uys1Qv21ReXZEBXzxm4pDYU2eMTgFxrYZlN0w7lz6JEFha1npP3ZtPi1tXkkclLjqZdG
	CP28rAaa9ZbO+j7zx3LbqloYp61iyvXN5pGwK7VQiUESY2glTYiQKP1YlUajLF7ZrVfX
	r84+9t/5aOaa/ClORHZjFSRvrrqdqL18I1c803GtIlKUPRXR8i6CRlCcxi/lCnMJgU8y
	WSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=CzhiDXJepa2LH69oReOU5L3ZK17einWtVrEQb3VNW+Q=;
	b=BcGByuuUs+1GhjmEEw0jggvP3eOZKQAqPadmT179q08aw8RrpPexSBrAiEwybEFSLA
	jG4+EgC5nWDkGggkFEQyLNLusF75iryilDSCmhZBbKf+a7+eOMWIb3Mv2oj9vZZJVSrg
	QQDafWcT7Rp71XoB49MuPTGF87TxnA+jxsnGJYjtzpJ5659Y9qYXoWmJLTSOOeE3Fwa+
	PMPeobcD8dsJSO3S92DEoPhcvDvHzPpx33YXZWJRJxb/OCBlFIIe2lR+AZaqWh8af2bV
	osBATODQIM1wskYqvIgipPZ1YFyh6UpzZj4wGBevVqkHu+sIXHWqlp17JYes0pi1DC6+
	nnlA==
X-Gm-Message-State: AKGB3mJBYT2HiLEz8ckdxr69UVr7y/x+pab9rbHYbozlgThr1iL95aiH
	1R6t+srjf4fiqwjaeu9U/JDNJUgK
X-Google-Smtp-Source: ACJfBotXwOrYKDPSIuORoDDoGBgv4f0H3z+6c7os/h/8FBXgBJLpk3NAkJHyO2obn5+mD7gGhLs82g==
X-Received: by 10.157.17.137 with SMTP id v9mr3903749otf.36.1513104084838;
	Tue, 12 Dec 2017 10:41:24 -0800 (PST)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	e25sm8245197oth.35.2017.12.12.10.41.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 10:41:23 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id j17so14694985oih.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 10:41:23 -0800 (PST)
X-Received: by 10.202.5.2 with SMTP id 2mr3857874oif.140.1513104083209; Tue,
	12 Dec 2017 10:41:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 12 Dec 2017 10:41:22 -0800 (PST)
In-Reply-To: <1513101288.9676.31.camel@gmail.com>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
	<abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
	<CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
	<370cbd8d94d10bbb85e12e08b742f060@agner.ch>
	<CAP9ODKrZ+5JKO-KkF88LcL8aE+DY5svJ5to8_XfDyeA7hxY-ig@mail.gmail.com>
	<773c1d79355fe916a4b41cb79ff89b72@agner.ch>
	<1513101288.9676.31.camel@gmail.com>
Date: Tue, 12 Dec 2017 16:41:22 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo7O7_hj4hZP4XvYEOj0BErtxK0-P-MH5BSNxoZ6cd_2A@mail.gmail.com>
Message-ID: <CAP9ODKo7O7_hj4hZP4XvYEOj0BErtxK0-P-MH5BSNxoZ6cd_2A@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 18:41:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 12, 2017 at 3:54 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
...
> Using a "packaged waf" is against one of the philosophies of waf.
> Consequently, this is one of the reasons software built with waf has
> trouble getting into things like Debian packages.

The more I learn about waf, the more I enjoy not being a waf user ...

You raised quite good points. I believe Stefan latest patch does take
care the most common cases.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

