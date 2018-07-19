Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02CD175260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:10:48 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id i12-v6so17321229oik.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SbG1zkmTjpsACVBrgcN5PnPskSpDS6PbM6eYHXhtGEw=;
	b=LR6KzYr92nNlbOjgjrQyZSGKO5BzZ+6ycn/nnijW6djEXxD7qYG9oJ5Iob2fRna5v6
	4mUYQjt2YHMJdjwGmSxsYlUo9KX8VtgE/CmcJosuRQ/bT0gc+eONp+ghc30C4eCIF6Lk
	KXvH0Hlw8RUIHcGHRrEsl/D6ZeMdLM5RGoRpzE2rPEfgjRzqSnJ17v5lBSvxZuS2Chz2
	p8udXglznvR0AlMuUGDk4LKz+JGDn01/PHA0AotDSU9IpNZeereJem9Dd80sQcujrUjE
	Cbdi3BJFuP1E3LgbzhIAm9TbzqH+m9RNTWz9ljkspCz4KtLfjlOmPkHXmPtHTstxXQjW
	aBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SbG1zkmTjpsACVBrgcN5PnPskSpDS6PbM6eYHXhtGEw=;
	b=t4VmTLptT6eMhDFBQ6kwnhrCIkhFqALEj1FzkPzglgUdlqcKOPT2i1k+aeABWPmYul
	hC1P7xnJK2L1IEs4GlpcgsBde3I+oYrIhXKMxhvdk84oXpexPmOHMa86tvTCPgqHDfyi
	tES95dzE16UXs+gABToFDMSQsbvP7TUQv2D7jwQUWozp1c51cfCZQ1+RvrbH5sFbac84
	jEU2h2v/RTEDr7nPQoLXv5ED2QRWcR9XWSTBhPlBNsew0hj3lSOSNFCz1fUcuTP1rtFX
	oWsZK+WUf5a/1PTlzqgxrGsOtS20eGChSg7B2ncG0qljHR/DQlhWvYztsOu5wkovKqbu
	T1LQ==
X-Gm-Message-State: AOUpUlEq+zZHVyUcJhE5IB+NDfHTXf9Khl6eMOfLjC5hj9THzLMLMJua
	4ggTO32iiop8WpQ7hq1A2Ql/ZKdCPq+X70g/BiEJQg==
X-Google-Smtp-Source: AAOMgpeT+20x60kzr9AYI7Y0PQkXDD46sPPc/N1vYQyLLmwGTEVXmtE+t0kOfT2z/5RPEgHkQ72hmiV+xb9xGjuRz6k=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr13205792oia.170.1532031050009; 
	Thu, 19 Jul 2018 13:10:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 13:10:29
	-0700 (PDT)
In-Reply-To: <20180719163102.15234-1-JPEWhacker@gmail.com>
References: <20180719163102.15234-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 21:10:29 +0100
Message-ID: <CAJTo0LaZRbRZgd9Usy7PPE4JDxaGUO0gO5kxrm5=K2LvE95hkw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Fix pylibfdt generation
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
X-List-Received-Date: Thu, 19 Jul 2018 20:10:49 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 July 2018 at 17:31, Joshua Watt <jpewhacker@gmail.com> wrote:
> +EXTRA_OEMAKE += 'PYTHON=nativepython STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> +DEPENDS += "bc-native dtc-native swig-native python-native"

Instead of setting PYTHON and DEPENDS, you can just inherit pythonnative.

Or ideally, if it can use Python 3, inherit python3native.

Ross

