Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id E014873081
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 04:56:55 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id g10so66097410wrg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 20:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=7hodtaKIcbd1vajnbszOdeMCj0MIby/kKcoR5q47JWw=;
	b=csq2Z/oL13u8xysaJMfYvFe1g6tTUPtBJnGu9WjJ24fisBvs2t9beUersH5ZE5R2jF
	899aHYxNKcYR4h99HHV83XQp79n90Tu7T/V76oDGpH4zd9HsbCsOixCFuMSu1yZdH95J
	zupIxX6fVV6sdFFnU+OFegRvf3CjhpNKkTyglzp18KpDme/WvTGPb7FEZW2IM1X0wNrE
	hY7C0F7xR4X0n3VHmjHiB99mEynG8vF21qwTqhIYzcNodgmmp4SKwGuLQX5KwAwMCdb/
	Q77TyXrEXgr6wBKxaYpJpjNH1BsxF5Sv/zNDf6Xh6jpbpA/vIY27q2gwgB1wzi0JVZVv
	rr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7hodtaKIcbd1vajnbszOdeMCj0MIby/kKcoR5q47JWw=;
	b=XCRus+Zhw0d18U3vh5DtUVUaUW/XK1GEZxLWiKYoPjMJ4PEScWQOisHNVgCo2ONWh0
	MzdpzghyyuXdGbS8F1JEW33Y+pMUeAJYydlNuOUxRhzL7s8k67tJgxNMA1rV22LaTwru
	MfxoSfZKEfwLxpFva4/0KopX6zp8uzKozrpilz3T7KO3+PDko8dkbfRGqn6KW761+eM5
	VS39EqvBbogRbSAOduYR1Gt+qN3v5Y1cOPPJ0I9vLfccHmSU1Ta1lDNCWWtLcUT5De1e
	1cWNAd25tv3tV0LnprFxtgjs7yAt+gpOmi1m2KLNIUKiFF3VjdX4bVkx7odCWG/UAHKU
	BMCw==
X-Gm-Message-State: AMke39kkKnPa52osK5pMFoNroOHLjJboVxUGKomGaD1zkd1BbKqaP0Ezsp/8pw91M2hHApF/jlhEJRHKB4QdVQ==
X-Received: by 10.223.182.133 with SMTP id j5mr722685wre.19.1488517015931;
	Thu, 02 Mar 2017 20:56:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Thu, 2 Mar 2017 20:56:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Mar 2017 20:56:55 -0800
Message-ID: <CAJ86T=UD2PqLpdR9=0dkoQNSqjjoK34F3WuOMuwG7fEmKk8yCQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Creating cpio images with support for xattrs
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
X-List-Received-Date: Fri, 03 Mar 2017 04:56:57 -0000
Content-Type: text/plain; charset=UTF-8

Currently we create cpio rootfs images using the standard cpio tool.
However that doesn't support the extensions added to the cpio format
by the kernel in order to support initramfs images with xattrs:

  https://lwn.net/Articles/629134/

It looks like the only tool which does support these cpio extensions
is the one in the kernel source tree ( usr/gen_init_cpio.c ). Assuming
that's true, has anyone already tried to update the cpio image type to
use the kernel cpio tools?

