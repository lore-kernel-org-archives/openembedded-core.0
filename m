Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF7C61A34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 18:40:09 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c84so6836555wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=Wkrc1gLPQ4Z96S5EHSvmIwKqqiBwQpFVFmvRGpTLaqk=;
	b=fRVns3Z85+SXTPH58xJMNdzaGUzqab0z8ZnuQWr4+1+3neTB9/Bqxw11alCeG9C4uy
	oCg1ak2YYeoXxCjAm07Yubnt1PHywWJ+klwLMdd7yDHb0gZRpF13TSrW3RzD+F91myhM
	KQaygNCI0v3Y59wGTOC2iBBtS/3GmJ9+Jw07mAmLmw7PE75AGHFTnQolLQb3zAA51oRJ
	Q32aYMvdaKd9h6Z2GW/Vtt85zgyzgKiK5tVQEXVifppNd9aChe5+9f+J/Q3B7yaxJy6y
	KdvBiBRC0Eh2+jbkBVdhd8ZtOAY++Ny6u9vYBhSVWV4mB1du80SRxg/FdHmYyBTg2x7u
	6ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=Wkrc1gLPQ4Z96S5EHSvmIwKqqiBwQpFVFmvRGpTLaqk=;
	b=HxxlMjF3ImMpBl/LBdT091MofntRCX/cMMn1CrleOaXuH7TYwx3Kwn9J0PxGCSb26N
	GY6u8HSQbMC/GF3JjljpU8VktQeAQ0VGZvNJeK3QJXsU+MVQaJ7VtgYFbV8dHLRVdsGx
	N4dH8/a1yEJDvalLFy76AbQ5B+V6ca086UoDx/KtCdgAcQHQ9S1NKZoerx8aI8AhSI5f
	2/1ngOCiNUXX+NNKTVPSSk2ctzSDP3r/hs3Ym9IW/pmfMTfrDnt3WgZ4UEhVJfcHXprs
	bw3PfKMaO4Ki6jpGAQ3xUiqPht+HnkAZCGI6QkKEjmVRbumndkAlXPul19l5IFSq/rV1
	E36Q==
X-Gm-Message-State: APjAAAWFa9v064FlX7ASRiEkgI8SVndYFSTXe2+r8jgLCo3Qp+Vpnx61
	2k0v0m0/ekg1lcmi3esYSt0=
X-Google-Smtp-Source: APXvYqx3ExVkqzecnS4bFeCP0yNKu4ThDTtLm6QtfZ8gekqBNm6zimmClthWPMMe2ygyw6oGLsWlug==
X-Received: by 2002:a05:600c:214b:: with SMTP id
	v11mr11199494wml.13.1583001609992; 
	Sat, 29 Feb 2020 10:40:09 -0800 (PST)
Received: from dell5510 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	c64sm3387665wmf.33.2020.02.29.10.40.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 10:40:09 -0800 (PST)
Date: Sat, 29 Feb 2020 19:40:06 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200229184006.GB13422@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
	<4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
	<da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 18:40:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard, Khem,

> I was able to confirm that fts is in the recipe sysroot and that the
> compile step is running "make -j 88 LIBC=musl LIBS=-lfts", i.e. its
> being passed in to ltp. Beyond that I'm a little out my depth to know
> how/why its not ending up where it should unfortunately. At least the
> issue does appear to reproduce though...
Is there a way to compile only LTP and the necessary build dependencies?

if I run this:
. oe-init-build-env
MACHINE=qemuarm TCLIBC=musl bitbake ltp

It takes ages and compiles many things (gnutls, iptables, expat, procps, tar, ...).

Kind regards,
Petr

