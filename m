Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 39C017D597
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 21:04:00 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x22so38370202qtp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L99QzyhTPYuLLO45X62rytkVMty8VgJ12fjCr6+j+B8=;
	b=jelusm1/7zoIA2zRV6oCqNMzYMQ79AhVrLlQUe8Ok12opI99QYfPW+X43Ta/UmBSR4
	HfYryi5B62Eu2Ajv133Go19zlXWWfJqz5PTyryVJFHY//HrEXKLo2Z5rHRSWUkMkJ5Xl
	RrS8mDC4k91FejjEY8B1r4OlKafLGcUe3oC8uiokivBZ7zrrqQaC7i/Y5vXBk6re48xA
	oOpBnDhRHnpn0Ubj6Ex25Pb/qo+krRXi7Z2A9aFWyWmdHLjoihU7uRTUlAz5SSIDubtP
	+UcX1O3kz5ZMLegOffoDsQSLE4j1FEhm2LqGIbObtpPIgUu6qy8GwiG5H1q9fzSbfJBA
	KQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L99QzyhTPYuLLO45X62rytkVMty8VgJ12fjCr6+j+B8=;
	b=s8py8nWQxHen1/OwbrxqigoUynopjh3pU/W8o/ChECt9KRKd5NiCRr3bPUL7xYyYuh
	CKBDMN/l5Nvsz7gM1npno60zQbJswgko80pjVAiVbG9VxQfTyjS8o4plmwvmJL8S4fln
	8SvZ5oaMhJ8nGZA+tA8FbALEiCH7QdaU7wLVQ+Ak4hyHo767Jot+oG5y5VMwleGse0mI
	8QPIMnu+4lg+nzOIrS9OkE1eY0knPbgl7bEVA+ltiJLJPIksZzcMHlqAkqzq8P3nLQ7/
	HZFNsh0YZjf9eH+oUKI/qz6YX7YfUqcZxtKtQW6e1t0j7iqmu+F7OQYZKo/lLzdlPC8h
	DsOQ==
X-Gm-Message-State: APjAAAX22ae3570BHg0XWGug71tNJ8nrIigVcYptboFfOM7gLJYKJm7/
	oZl+dwMVFQS+Rz5k0oP+NCbRunr6IIWL/0G/oYI=
X-Google-Smtp-Source: APXvYqyr5jriYjJ+XJ0CIpgbWQwlFHmKCNG1hQA632f6jwaZEC2ayHXenBZadADRmfxI086QBPdfl4xGZ3cGiR2v6x8=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr57011200qvg.181.1563915835812;
	Tue, 23 Jul 2019 14:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190722144809.14972-1-ross.burton@intel.com>
	<f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
	<CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
	<393734e9ff3b6095b159744b01405a0b0616269d.camel@intel.com>
	<CAMKF1sqQ2SSdfj7BYnTnzHuScw8Fucxhhd7kwuragxF+y7nufg@mail.gmail.com>
In-Reply-To: <CAMKF1sqQ2SSdfj7BYnTnzHuScw8Fucxhhd7kwuragxF+y7nufg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 14:03:39 -0700
Message-ID: <CAMKF1srgRYSK9DXBVet23Re8fpwxbrh38q4sKYG2eE-jF-vz1w@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Jul 2019 21:04:00 -0000
Content-Type: text/plain; charset="UTF-8"

this is causing a failure in meta-xfce

https://errors.yoctoproject.org/Errors/Details/253910/

On Mon, Jul 22, 2019 at 6:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 6:05 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> >
> > On Mon, 2019-07-22 at 17:59 -0700, Khem Raj wrote:
> > > On Mon, Jul 22, 2019 at 4:17 PM Mittal, Anuj <anuj.mittal@intel.com>
> > > wrote:
> > > > On Mon, 2019-07-22 at 15:48 +0100, Ross Burton wrote:
> > > > > -LICENSE = "LGPLv2.1 | MPL-1.0"
> > >
> > > this should be MPL-2.0 | LGPL-2.1
> > >
> > > > > -LIC_FILES_CHKSUM =
> > > > > "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> > > > > -
> > > > > file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
> > > > > +LICENSE = "LGPLv2.1 | MPL-2"
> > > > > +LIC_FILES_CHKSUM =
> > > > > "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
> > > > > +
> > > > > file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
> > > > > +
> > > > > file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
> > > >
> > > > Should this be MPL-2.0 instead? This is causing warnings:
> > >
> > > the license is MPL-2.0 but the license file name is MPL2.txt so this
> > > seems fine.
> >
> > I meant the field in LICENSE. Quoted the wrong text.
>
> reply quote confused me. yes it is wrong. It should be MPL-2.0
>
> >
> > Thanks.

