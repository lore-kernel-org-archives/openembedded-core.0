Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D59B66C149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 16:09:17 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id s16so4402821ita.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qk8RbAQTMPp6JqtOFMBcTxLntibVlgHzLMagLAgJFZM=;
	b=IpfbMRJoX+GVZwoqar6PtbE/sHkpq8aZ2c2cFmW+C9MNHbeJKIOoFUV4QEpx/rDU2Q
	5u9d/KQSy8xyagdPMElWi1yf6hA5qBHt1yJ0mgRYeS/hU4dFRq8miaWZ+YDbCNkKybzx
	lWacbTNqyUnn4RobXhabKaYi8GFl51l/M+gM67D6MX/f9FZAZVQOeSX/p7/lLRdPAPRL
	41sd+B6dK/PpQDcyccFiQNVPeQ5yw+2BXV6pO6VQxQ2ztTWLn6xnnKnu741G07R8LC02
	yDSOqkE58Ej6JxIag4P9tUkok2ky1DrMnEOqqd99/RRl2tZi25OTbPDiqeWfT6SGeKKC
	0ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qk8RbAQTMPp6JqtOFMBcTxLntibVlgHzLMagLAgJFZM=;
	b=H7k9ulFdQJUJrwaBej5up/RMGRO9AJRI7pvq1lF5M2QsqEUPRunBWNT1C37wCDkg8S
	HLjDdflYSEBAMNiAnbZkqPnZMWqnTM6WJjqzdLtsb01u2yHApkSAYBkYSp99mxxIk8HZ
	OsZ8+rMrIzB+J0zYH9p1Q3RCY4Y1MVJfDYZkpP8li+ePFKaxvt4UpIo1fWobfn4t2BWU
	7nf8SK4jc1QQYgfc5qff3eKgC/sTTzVNkmokwM47+07V1MVzzzIVEgS7W68gcENKZEth
	VzJzNB3d1RBLKmJeQatdmVcP0LihW3DzW+zei5zEB24fNsIjjxvyfo88YI58bfFlJGqC
	Si8w==
X-Gm-Message-State: APjAAAVhceCKDmDHUrYmq5JUlnhW7Y4X2qHfIwMpaHvEsjig+QEMgZ0H
	JIyneP7VhasQ1DVpW3fBE+PNu9ln0UZl0Uhs/iV1Itj3
X-Google-Smtp-Source: APXvYqxBVEno6OI2zM4IZ72vy7kIRE0TSIzCJ1cVPtsHm9Cj0XfPRb8LexHiKxNCatrNaXakrLT2VEVaUE44iUy/HHA=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr28112347itb.74.1559750958890;
	Wed, 05 Jun 2019 09:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190530134703.16094-1-philn@igalia.com>
	<20190530134703.16094-2-philn@igalia.com>
In-Reply-To: <20190530134703.16094-2-philn@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Jun 2019 17:09:03 +0100
Message-ID: <CAJTo0LaLyjSxmXU8p4UOHgVf+QrHDgGsU7A=TcqCJBEctsqMsA@mail.gmail.com>
To: Philippe Normand <philn@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] p11-kit: Enable nativesdk and trust-paths option
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
X-List-Received-Date: Wed, 05 Jun 2019 16:09:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2019 at 14:48, Philippe Normand <philn@igalia.com> wrote:
> +PACKAGECONFIG ??= "trust-paths"
>  PACKAGECONFIG[trust-paths] = "--with-trust-paths=/etc/ssl/certs/ca-certificates.crt,--without-trust-paths,,ca-certificates"

Should that be /etc?  Or $(sysconfdir)?  Especially in native and
nativesdk builds.

Ross

