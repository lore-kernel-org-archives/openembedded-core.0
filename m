Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 96D897C6F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 21:13:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o17so11559014wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 13:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=e0G3+938WKGKrAKjuwTafUr/+FKlPf6+1wHbZlkw7ZI=;
	b=GSH31osWd3o4x8B6w+agNN3xB99cAWehr4dBIDq/j85E0SvOTYOx6mODdkBvGfA62r
	jlGm3ZK+3SY1pEbF8NKzmRD1mhAMAiPPOCjEJw0MNpc5DUj3Un6JaKh00RAmJqlfT/E4
	7jbvn4OLYXm1cka2C3qbBZDzGhMLow2kvaQa2M8Q+DUkHiIvP3hnuDQF2z+/73oApBiV
	qpFD6nYln2GIvkVLPg0uDqeYvHXBTpo4ec++VnZpJgcIgoDL45nJiRwBYj1wTkUkzJvm
	YTdppAgB83D66H6vn6MAp4TH1qRwlwXTcgOWRxvHEjoEEJDLSfLy4DHzrkle/mDOO5co
	Horg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=e0G3+938WKGKrAKjuwTafUr/+FKlPf6+1wHbZlkw7ZI=;
	b=HEazreDuERmfRMiWwwedc1VHOP8EMy8DkwtOZvJ21fxwOMmmYyYp8EZidaAbpW7UKR
	1pS96kh0MH7cdowVILeNfA3iz1GJA55t30Xt+zN25kgpd37D8FzTVWctwJvkFjg5lY+X
	GX8bD85w32rN43Lb1Pf0u2HTBs67iVaI438ZMdpHrKUShMxMUPfJt8PfFCcT62Vj/t2i
	owwLRW3lkYHixpO0ebUsysNWPV7pXHZEeTFw7i8bJU4XLK4dVnlaq1Xvb3uVts3lMghv
	+zW3NC9HVVFhv9Jq9jkN19XeBzrIApjKZtIuxLZs3v9BQnZ0sAOeuKfG52piU9hraxFs
	k9qQ==
X-Gm-Message-State: AHQUAuZ/63U4uRdByHH7SNW2AHHPiwLIFbIW+qSw5JioLXf0/r+tURN+
	Wph6UJG1Jfd0X/nGLJTH8Hc=
X-Google-Smtp-Source: AHgI3IYvHZ6N0Ei0MNSQEh2YIq/UbZZPjU6MCT0XA/txUXg3EILyFTpF07H+fRgcpC6/IICkvrLQEg==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr14425882wrq.188.1551129216314;
	Mon, 25 Feb 2019 13:13:36 -0800 (PST)
Received: from x230 ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id b8sm8920450wmj.35.2019.02.25.13.13.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Feb 2019 13:13:35 -0800 (PST)
Date: Mon, 25 Feb 2019 22:13:33 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190225211331.GF30805@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190115230612.18947-1-petr.vorel@gmail.com>
	<f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
	<CAMKF1spaQmVW_=5bgus7nkw5Q9vU+DQH+qTzMj27i8omxg1DwA@mail.gmail.com>
	<20190116152809.GA407@x230>
	<c2b3d2ad4287960a5805627ef550dad30e2b82d3.camel@linuxfoundation.org>
	<CAMKF1sqWVxZwT93wT0=habRrZW6M1FAAcvVcaXnc_ZSRfY147A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqWVxZwT93wT0=habRrZW6M1FAAcvVcaXnc_ZSRfY147A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Mon, 25 Feb 2019 21:13:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard, Khem,

> > security_flags.inc:SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
> > security_flags.inc:SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"

> > so the reproducer should be to add "-Wformat -Wformat-security
> > -Werror=format-security" to CFLAGS when building ltp.


> I think this must be new, we are carrying patches to fix similar
> issues in other parts of ltp. Probably something to consider for
> upstreaming
> e.g.
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch

I was testing it, but this one was ok. Found problems with setregid01.c,
to realize that it was already posted to LTP mailing list, so pushed it.

Kind regards,
Petr

