Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3386023B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:25:06 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id e14so7485019iej.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DeY0hVXhERakXKHlJxFMGbkcNyyMUZZndOMWgsElXMM=;
	b=TpTZdd9saD2sUzHizOMQbXYAJi6AJr5ps0RG6n51Z+u5TOeYwFjKSlqMx0MnC9ijSY
	6JQB4V8pOkNBoZWLDbqlAda/64f5rz2hQC9x11jzGCkkGTNurRe+FoXW/3HQBDWSBqrr
	/WovyT2rxnVQ0KV6Hr+o5k6JEqo8ukXor6ju1x+OtZRN7hz9rlLl9ZgOTZeuzyQrSstS
	cSvosed9XgwfoBMF+wpXnmBxRJqEjKx/pMQ9yl90YFHthgMdBEn9Of214qPiqDrbcDBb
	ZU0R84Xd+w9Mt7oLoRaKmnIGmoPQR/enPFnXOVlr1WEcgP9cj3m2lzTXz0YBD3xCIKVV
	tBeg==
X-Received: by 10.50.26.36 with SMTP id i4mr6540664igg.33.1379348707733; Mon,
	16 Sep 2013 09:25:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Mon, 16 Sep 2013 09:24:31 -0700 (PDT)
In-Reply-To: <1379143167.4071.100.camel@x121e.pbcl.net>
References: <1379071094.3484.245.camel@ted>
	<CAMKF1so0f+8uJnqTxK0b+gkhhQAcjsAsVYZp8E_V5pEiL1heuQ@mail.gmail.com>
	<1379143167.4071.100.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2013 09:24:31 -0700
Message-ID: <CAMKF1srExVG5j4t+LdSnD3cJNJftNmykhUCRBz9wXQrv6-qH9w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 16:25:06 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 14, 2013 at 12:19 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2013-09-13 at 21:24 -0700, Khem Raj wrote:
>> There are cases where we have bsps with 2.6.3x kernels and libc
>> compiled against 3.10 assumes syscalls
>
> That is a bug in glibc.  It should not be doing that unless configured
> --enable-kernel=3.10.x (and this is the whole point of the
> --enable-kernel option).  If it's assuming 3.10.x syscalls under
> --enable-kernel=2.6.x then it is broken and should be fixed.
>

we have OLDEST_KERNEL = "2.6.16" and thats not a problem. However one
case where it showed up was when building udev > 164 with kernels
where accept4 call was not wired for arm e.g. since udev looked up
definition of SOCK_CLOEXEC which it found but that 2.6.32 kernel
really did not support it.

> p.
>
>
>

