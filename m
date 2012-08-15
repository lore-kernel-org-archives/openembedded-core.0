Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1lAI-0000uo-HO
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:30:10 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 14:18:12 -0700
Received: by ggmi2 with SMTP id i2so2092596ggm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=eoD3oRnsRcGiZoL4NfnujcPXM3n9f4BNKZ0Qwq09Blo=;
	b=O+yMKiJotC19J7J+viIp8yqxJ1wUm+XKvN5MKqv7/CYaSVBp0YM+tUXm2u3rHxBq6U
	gfasw5v1YpipZ/rEkPOVwq7+lnQ2hx5X/crl2sbhm/SCza1MMewGKvhTxnVackbaGpel
	EOLDkL2rWT1e1F5PpX6GaQOhlczw/2GV56EhJHEId79cPbzKf79Z6bKtZScvSDLZw7X/
	syfyFoMuu9Y4tKe87gSDLL0yUxFMaP7kkIHE4XpYwq6q5EOzEg541gWvcsSBnsJxH9Sc
	Aqk+Gmx3QEVQPeZGrsz+uV8hbdgR3nVrwwhn2FzlIt3bPhCuv6h/6MdNI5hPwjkSiWd+
	qwbA==
Received: by 10.42.157.5 with SMTP id b5mr18026932icx.37.1345065491388; Wed,
	15 Aug 2012 14:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.146.103 with HTTP; Wed, 15 Aug 2012 14:17:50 -0700 (PDT)
In-Reply-To: <20120815211232.GC3108@jama.jama.net>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
	<20120815211232.GC3108@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2012 22:17:50 +0100
Message-ID: <CAJTo0LaKHbXJVAE3Y9jO1wDJYO5iyFAEMYM+U5cgGDhQ6xy+aQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkoDdeeLnMJ1dOjJk90S5kUZqPAD1sXTkuezQU0VFk+jQr+QeA/pAGlFlbc/aAlu71GfA7E
Subject: Re: [PATCH 1/2] make: add make-replacement-native 3.81
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 21:30:10 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2012 22:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> eglibc was failing to build with make-3.81
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2314
>
> so I guess once this is built (as webkit-gtk dependency), eglibc will maybe sometimes fail again..

Interesting, this is the first time I've encountered 3.81 having
problems.  So we can't use 3.81 and we can't use 3.82 either. :)

Ross


