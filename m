Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id AAE536025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:57:24 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u18so2286673wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CEVNYsr0cfyAOlBlOwCsyQFfNivf2p8ukNStOpYLKq8=;
	b=glZdyVJXag5Z0aDH6pJNg6InJ3kOT+rnAPXZegrBkre4y3YKJxwIOLCjEufhI/CbsD
	Im6B0Zdsr3vuks5PkH3aEj8gtxiG/GqiQdefA0C4WARSeTZlRKtPRTUJbkJBcin3EkD7
	sOUGDzJIdG6sDO/udxPnQVXXr6du8Bwd42B534lRNaTNb0v706lPtM4tdGJ4gYuZQDPP
	nJisQmQCF/isJXbJkYVyWgY4E9C3zW+vKP8ZCAW/xFntOhwTz2Do0TxmguLbU9fHjMeK
	HXABAcg3zv68Jd5yXHkGTMwNLL1TXfeFGa5rjXPY6zevvqInvi1uX/k8cJjGCgzlo7Uh
	kANg==
X-Gm-Message-State: AN3rC/7V/farZrOog0t7lFoBhyC1og6kFpvP3reiEsnCbr4VyGJmtPlV
	ps6rpjVzquvXe6wjpO4=
X-Received: by 10.223.133.252 with SMTP id 57mr1729456wru.94.1492592245003;
	Wed, 19 Apr 2017 01:57:25 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u66sm2870081wmd.24.2017.04.19.01.57.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Apr 2017 01:57:24 -0700 (PDT)
Message-ID: <1492592243.15070.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 09:57:23 +0100
In-Reply-To: <20170419015839.1294-3-raj.khem@gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-3-raj.khem@gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] libtirpc: Enable des APIs for musl
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
X-List-Received-Date: Wed, 19 Apr 2017 08:57:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-18 at 18:58 -0700, Khem Raj wrote:
> Use memset() API instead of __bzero()
> Drop the patch removing des_* functions for musl
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-replace-__bzero-with-memset-API.patch     |  28 +++++
>  .../libtirpc/remove-des-functionality.patch        | 139 ----------------
> -----
>  meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |   5 +-
>  3 files changed, 31 insertions(+), 141 deletions(-)
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-replace-
> __bzero-with-memset-API.patch
>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/remove-des-
> functionality.patch
> 
> [...]
> 
>  
>  SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \

This patch is being removed with this change, and so uclibc builds will
fail. Is it time to remove all remaining references to uclibc?

Cheers,
Andre'


