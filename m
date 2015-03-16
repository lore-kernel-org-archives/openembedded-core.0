Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id CBC3F6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 16:24:31 +0000 (UTC)
Received: by pacwe9 with SMTP id we9so69189726pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/OKABOt5Za/hAQ+ESQdY4NnBW4BQUxRpMi6Shij+DFQ=;
	b=blUuYeaFZmw4hXlCJHNjpbl3pdxQu9F94ydK9cKDw8K+T8NYbYXfYqLX45BUdmGKbM
	/cSomIdWY9ILPQGPt1GyfUOyQuVoeOtusAzEfJq5FGaJTUCA8lWhBpwOnz24VtiUlCkt
	Th++2SlG/PJzdm0KMGNaiMnpLvSDGQp8e4BJ9Ti6APZ5OhyUWUE7Te2BzsMKjHFp267U
	4DvHsKBFAdtMVFW4QpfcgsggXonAL3vtEjTJl0nOZXyonEIPXS3bgbiMo8xBG3V6h0mY
	YDlJrp5aStUFn3F4KZqcCFr55ozP96TMJe+eLZzBsZC525BFPHuj95XpWPMdHhAXS4kx
	RCxQ==
X-Received: by 10.66.248.132 with SMTP id ym4mr87367500pac.147.1426523072701; 
	Mon, 16 Mar 2015 09:24:32 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:1d43:cf03:319c:2e61?
	([2601:9:3580:84c:1d43:cf03:319c:2e61])
	by mx.google.com with ESMTPSA id
	oq4sm18060073pdb.73.2015.03.16.09.24.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 09:24:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
Date: Mon, 16 Mar 2015 09:24:30 -0700
Message-Id: <73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 16:24:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 16, 2015, at 1:53 AM, Bernhard Reutner-Fischer =
<rep.dot.nop@gmail.com> wrote:
>=20
> Due to libc-dependant conditional patching (which should be completely
> forbidden -- fix it properly instead) the last PV bump forgot to =
adjust
> patches so they failed to apply.

Patches are fine in this series, however I just want to set the =
expectations right here. While having that libc-independent goal is =
fine.
Sometimes we just can not do it, since uclibc or musl
does not have all the features that glibc has and an app might also be =
using it.
making glibc users not have those features is unfair
given that we have a strong mechanism of overrides in OE, it should be =
used to this advantage.=

