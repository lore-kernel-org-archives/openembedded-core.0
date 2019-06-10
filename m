Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B46FC7D5BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 11:47:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f9so8826979wre.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z4L1koOSZ2wNg3mbXMkwc4GBbbm0fCI3gY/6zIIj4SA=;
	b=iho324U108r9boWdtCFBe0NQ121m0g1zOC4G5eqToFh+ddM0L57OrLq4XxmBRdKHZi
	HqcakitoNxSEOoP2r2nbbQYCkSyqO/QNPJHX9MYT4tgkICVSQCh+MXbrDRKisTWghugo
	c1kjuq7gWKLECr/OVbn7hyDDHvy0F6MGn7ji8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z4L1koOSZ2wNg3mbXMkwc4GBbbm0fCI3gY/6zIIj4SA=;
	b=Ous0qIKloYJKOhwI2El7FvIyGrubey+/ef/5yiTW7p6/TPFg0Iufd2izBbnwd7M7Jf
	jidEJ24IaeX6vQ1+S2ypZ8paW+sGddVUwTdP6D4xRkBX8oeRQMrH6vZqL8XjYAVQOnTO
	kny+mKQ9t6hCzlkkVMjP3Dvtkxm8NdaPahXoy5ekwblRCAUApR/OPucGsMW1adW0N/qb
	ZkBzz4e4pb5rerGGGcOGNTmKurCoBs12/5CQ507xVMCLMax3um7V8CKeIraHxV6yX0pi
	+AYCmL0XqMu6IFgqtOSSqmbJ2prd1dXduwWmUnzSX2CapWd7lfe4bMhXuyzgvZZK3JCb
	MWKQ==
X-Gm-Message-State: APjAAAWii71MYccZ+EkhO8c+qYPj5lzcgLHOylcCTk04AXz0QqToqoVT
	NfOU3xvFFf0FgyKPqBBoRmsPmA==
X-Google-Smtp-Source: APXvYqw+JuxrH3zaVLA/L3ZoOwvFp335uHAyW7QZFBc4TwHLqGEhRZx3LXeQdevkn4PnhK7utAMYwQ==
X-Received: by 2002:a5d:514d:: with SMTP id u13mr28108156wrt.77.1560167232450; 
	Mon, 10 Jun 2019 04:47:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm12995375wrw.42.2019.06.10.04.47.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 10 Jun 2019 04:47:11 -0700 (PDT)
Message-ID: <2c3427c3986a8fe363e6a99f3d78a136c79efd61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2019 12:47:10 +0100
In-Reply-To: <2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<20190607121954.116898-3-alex.kanavin@gmail.com>
	<2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gtk+3: update 3.24.5 -> 3.24.8
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
X-List-Received-Date: Mon, 10 Jun 2019 11:47:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-06-08 at 10:05 +0100, Richard Purdie wrote:
> On Fri, 2019-06-07 at 14:19 +0200, Alexander Kanavin wrote:
> > Rebase 0003-Add-disable-opengl-configure-option.patch
> > 
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...-Add-disable-opengl-configure-option.patch | 41 ++++++++++-----
> > --
> > --
> >  .../gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} |  4 +-
> >  2 files changed, 23 insertions(+), 22 deletions(-)
> >  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.5.bb =>
> > gtk+3_3.24.8.bb}
> > (84%)
> 
> I retested with the date/time on the workers fixed and this series
> present. We saw:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/693
> 
> so I think there might be something not quite right with opengl
> disabled (the main difference to nodistro I can think of?)

Its now in master:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/687

so I think there is some kind of parallel make race in the new gtk+?

The autobuilder is proving very tricky to read at the moment and
intermittent bugs are making it into master :(

Cheers,

Richard


