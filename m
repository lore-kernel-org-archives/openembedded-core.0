Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 795BD7D16A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 06:58:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r4so10437555wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zVhz76nLduc7bAGYQ0Ufc8gEwr+1i9FMUlry8I2j+8U=;
	b=ddfPzwnQ1c8UPWpudk1x5aRS/AZq5Iu0kzAiEAWwWqsh5dcw477kWBzlCo3yMqI19D
	l9aP3UoRWDjPfSYAp4/mAkfRIQjYvCbVmgcsJ+PiBj8GM7UQgpwQ73E9BSF49cxkXowp
	KQ31reA0qZcd3s+5t+CZYMnMnzL4BCDhbEA1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zVhz76nLduc7bAGYQ0Ufc8gEwr+1i9FMUlry8I2j+8U=;
	b=glhzGoMCAR0hJ7zxjiZnRbN9ywE0AS8U9WzwPK2UPiKHw83mcTfjmV2eQOLEj+Fjws
	dKOKZ4iLQlX6RutoZqwJEgS10tXNlAgHoy/x2woMlHSjgaJQIXcMdtbcvSU6dAjGcV8Y
	b0Bzjka+Jy3NP3su4Xi9p8GeAGGLyypPHfhg+lk9ebHvYbN8uc5cefoS8vOIgV8RC4yE
	H0asl6Ar1sEEmPDFAskpZ+irBmxBE4SY16dWijEY+9V6ZUEUOYNMTSRdiqu1SlV3Y/9e
	YznEBWZ1pcci1bN96SNIRWRHZ9sdXRLHzUyvodPPnscXOUrjP4g1SWJ8UqegLOBhY3Zf
	Vu7g==
X-Gm-Message-State: APjAAAUdDYRPEfy3xW/Fpn/knhmOpLTa82PaNA645D9FumlqjdEG2or7
	tEZ+SZ1hCAXEJeO4FbXDhsCxsQ==
X-Google-Smtp-Source: APXvYqxpnb2byDZf+mqSlKyfgoD/xoMmrXS78lntlhZZhzVSWPPONvANzXQHuaOmlQki/Us5gRvuSw==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr15135794wrj.16.1555052329198; 
	Thu, 11 Apr 2019 23:58:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h18sm49599777wrt.97.2019.04.11.23.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 23:58:48 -0700 (PDT)
Message-ID: <fa644fb73df839e7d0785effc16d9c4caba25dcc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Apr 2019 07:58:46 +0100
In-Reply-To: <CAMKF1sqTi8azcTi06msrQ9fhtwAgfduOU_20wQtCR4vbTP2nQw@mail.gmail.com>
References: <20190411160037.21952-1-alex.kanavin@gmail.com>
	<CAMKF1sqTi8azcTi06msrQ9fhtwAgfduOU_20wQtCR4vbTP2nQw@mail.gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3: add a tr-tr locale for test_locale ptest
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
X-List-Received-Date: Fri, 12 Apr 2019 06:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 19:12 -0700, Khem Raj wrote:
> On Thu, Apr 11, 2019 at 9:00 AM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > With this change, the ptests do not fail anymore,
> > except for the three failures caused by the 5.0 kernel regression:
> > 
> > - test_ssl and test_httplib lock up, and are skipped
> > (there is a separate patch for it)
> > 
> > - test_asyncio fails but does not lock up
> > 
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python3_3.7.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb
> > b/meta/recipes-devtools/python/python3_3.7.2.bb
> > index 28f128d488b..71a6c103166 100644
> > --- a/meta/recipes-devtools/python/python3_3.7.2.bb
> > +++ b/meta/recipes-devtools/python/python3_3.7.2.bb
> > @@ -284,7 +284,7 @@ FILES_${PN}-misc =
> > "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
> >  PACKAGES += "${PN}-man"
> >  FILES_${PN}-man = "${datadir}/man"
> > 
> > -RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2
> > libgcc tzdata-europe coreutils sed"
> > +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2
> > libgcc tzdata-europe coreutils sed locale-base-tr-tr.iso-8859-9"
> 
> While this is a test package i must mention that locale packaged are
> specific to Glibc so it would be better to append it with libc
> override 

We had build failures and I queued a fixup in warrior-next to do just
that!

Cheers,

Richard


