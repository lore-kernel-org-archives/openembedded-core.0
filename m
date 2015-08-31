Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id F016376EA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:15:23 +0000 (UTC)
Received: by igui7 with SMTP id i7so62957246igu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CRBBWwwjYkNdDFaFsBAwuC8IhxjTEQz7dCqEKKEMa5o=;
	b=IaXWPKgyY4uRyPeWllKZP5RYV2yj1USk2dBv5u/VQimvLCPFJFGj9Sxz657fnpafRZ
	gqZtN/o3pDAgneJw/bYhlSEw4DQzDm4tfokFxGULeR+maDPRotcphsBJtC7CA+3AXzYN
	c8e1pMqgBaqguDFayCZY0P/BSUSiAN5ieECwBHI8JvmS7Io58u+LywP4YEinz4xAOcOx
	JwO1XBCAV2eR/tu9KQiuFj4j9TBN7eveW7Mq9VhXN7Yj4KzELRsw2113wv3EQ0FLRb0+
	RZeFc2BMiefEpZSRhNd34cvkLkU27QmXPI+JmzSpOqCEkIWDgPDTlNPSrPnxj1KcjwvO
	E78w==
X-Received: by 10.50.17.66 with SMTP id m2mr114019igd.77.1441048523876; Mon,
	31 Aug 2015 12:15:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Mon, 31 Aug 2015 12:14:54 -0700 (PDT)
In-Reply-To: <CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Aug 2015 12:14:54 -0700
Message-ID: <CAMKF1sr25DziqwxD=cFx6TpwpQArewbx3aZAsFJ8Givw7cVmYw@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 19:15:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:35 AM, Christopher Larson
<clarson@kergoth.com> wrote:
> I think we need a way to indicate the license of the source in addition to
> the license of what we ship, to cover the case where the license affects the
> ability to redistribute sources. I'd thought that the base LICENSE was
> essentially that. If that's not the case, then we should give some careful
> thought to how to cover both.

thats my understanding as well, as we can enable archiver and
distribute sources. and thats what the exception is about too.

