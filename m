Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7A87EEB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 01:12:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d23so40356040qto.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BOi5ff1ah82EU67Vh0X6zZduY6fUkpjyPQO5v2M0kEI=;
	b=tf9oQa+6I3T3ZFVzmwWqZIl1KmIYLnXFf7v0Ao/rAMqx36RYQco7ixQlgedRLS4BJo
	+T2fG/xlAwqtwMcvXPFXaixtrec9B6aPMD+f2MUwsaEGwutfTkJ7DPUsx6RqijXbjMl6
	S8OA6qOQw9Q69BLagcEGSf56TOeVaxzrtJKu7wicpNIbfAQAohPg5/awQL9ukLRXDCGq
	EGQn30z9obaTFTAIUVgYISxOXBQSA/IRW3ooWJSibNFARB3Tnmj91DIBuJK7jHASEsKj
	XMhjsu6x4cjGi0UUvPalrmSMyrYl+iPmVexGfw2QTZJG49B3iU7NUkYfMThqxaSTanJ8
	8vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BOi5ff1ah82EU67Vh0X6zZduY6fUkpjyPQO5v2M0kEI=;
	b=C33kvL/CFmC+M+PmVWZ4pYvCuKe+Q+Q4VuqLCDVQuwumFZ4WlKV0F2KQ5GzxhfJUEy
	5rtGfNuVk4MZvlmO6MQ6X0t+v9o9cUpXFO0hsRODheXO62iiKY9hfXZcBihJEilKgHKB
	xHfKLnUjvfv32PKvy4eX0Pec+CYpPe1KeNgJ7dpXqiw3E74wWyNVFcVE4sJKa49rqw8M
	KnQ4Jcur0Sm2XTFjIiluwi3htYcsw6NHC8lwKJtBz8weWiu6pfik+k7KTxhfwFs6+m0D
	0nDvuk7oXFkIA8gQ8fxcqQ891Bsbnd4jKo4vXFcLwhLV1VycU0hGlAwMnASKCpOAaID9
	7mgg==
X-Gm-Message-State: APjAAAVQlN+8hdcsA6vhnm7RYHsgUbmMW96vn8CDQJIdNNmdLI31X8zh
	LP5n7eEWGdFqO9LDP6QRdaJSpmiObYIRUpwlEFE=
X-Google-Smtp-Source: APXvYqx26Im/L9LtwHbhHvf1BaIInMiREjF+IHhCh9Bs8ryFV9WGxjL/GwgXx93P28F+EN0RGKEq2O/nL6KBA7eussg=
X-Received: by 2002:a0c:d2da:: with SMTP id x26mr53659515qvh.51.1563844379760; 
	Mon, 22 Jul 2019 18:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190722144809.14972-1-ross.burton@intel.com>
	<f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
	<CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
	<393734e9ff3b6095b159744b01405a0b0616269d.camel@intel.com>
In-Reply-To: <393734e9ff3b6095b159744b01405a0b0616269d.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2019 18:12:43 -0700
Message-ID: <CAMKF1sqQ2SSdfj7BYnTnzHuScw8Fucxhhd7kwuragxF+y7nufg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: upgrade to 3.0.5
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
X-List-Received-Date: Tue, 23 Jul 2019 01:12:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 22, 2019 at 6:05 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Mon, 2019-07-22 at 17:59 -0700, Khem Raj wrote:
> > On Mon, Jul 22, 2019 at 4:17 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > On Mon, 2019-07-22 at 15:48 +0100, Ross Burton wrote:
> > > > -LICENSE = "LGPLv2.1 | MPL-1.0"
> >
> > this should be MPL-2.0 | LGPL-2.1
> >
> > > > -LIC_FILES_CHKSUM =
> > > > "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> > > > -
> > > > file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
> > > > +LICENSE = "LGPLv2.1 | MPL-2"
> > > > +LIC_FILES_CHKSUM =
> > > > "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
> > > > +
> > > > file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
> > > > +
> > > > file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
> > >
> > > Should this be MPL-2.0 instead? This is causing warnings:
> >
> > the license is MPL-2.0 but the license file name is MPL2.txt so this
> > seems fine.
>
> I meant the field in LICENSE. Quoted the wrong text.

reply quote confused me. yes it is wrong. It should be MPL-2.0

>
> Thanks.

