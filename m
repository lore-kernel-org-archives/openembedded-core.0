Return-Path: <marek.belisko@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 556EC61049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 11:13:15 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r21so19453208edq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 03:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ataw+ErBILSPd1VMqW1unUde9B9FmPfyIN3X7cnD46M=;
	b=Zg1TOlzmooovud2PyMR9wzmbKsfyMfnv+sNbD5cvVwABNKgULscYEhnrqF8HuVYkvN
	m7giXsirWJWHPgAsCdsI43C24TLu2weRoFR6RTcPExTZmnYnU2gRqv91+hluw1T6Du9q
	goV1nqO4ZnssUQdEF8dkuvS04MkBs142c5ffIK3B8xXGdrIe9//+qckLmKty8Qw0YqCC
	n2Nt1w/UfGEDH1SMXm3ywwwEeYCNKQfzUiFCkZCbrH+HOGsj9xd4u1wECr8Tu71G4eOr
	FbR+dwf8Rwf6z8EalM68Nn9ZOsyZpDJIUPGpR2cHKQs89bxGBNDO7vBlgxxhX7iq5KdV
	vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ataw+ErBILSPd1VMqW1unUde9B9FmPfyIN3X7cnD46M=;
	b=W1gIJjexmJVCqIxspBIjILlnysPij9tQFbyJcw3unTUg3JIOp3r1+0uR8vUsvK9znh
	7rBF7t3UPWKhk+ZGm1bZhOFxWgzqljICM7hD4Hv9DsnRGem3cnolm+6UCVlokD0y6Rp+
	nyZ81i29KBSxJ1X+sevCWycywIWh3K1TIVZnsrVN1h+wAdap8c8V748lMb/C2QExx5Zo
	lDHOfBdaNWd8DE9rHrHR8uqseLNm4BA/MJbmtLakN1hqVxhTS0cZIrv2MfMijRWJ/5+P
	roo2h9Zv3kthGKhOJtdCVZzZLwyMsOcuiViHABZk0XSMN9Kk8rjwX01Rsw8ssTnX3N26
	A8mw==
X-Gm-Message-State: APjAAAXYbbyNIxST3eBvdzs+/cApPjPIpzvjen2mkGcEC4allOv/QUs7
	+sJi39/SYRocC23+3cgBh8LC6/DnhvpL5FepcmCEz1qgAXc=
X-Google-Smtp-Source: APXvYqx/qnsDqF1dg71yCyGbdl0PQGeaGOrUZVJILNh67siPY3E1+IiSqJa4z0RRsPpusdB2OFXoTYoUZfc2Dov2ee8=
X-Received: by 2002:a17:906:34d7:: with SMTP id
	h23mr25433431ejb.90.1580814795994; 
	Tue, 04 Feb 2020 03:13:15 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWQVh1JoDSL7f2yXbpWBkGZkwDU=dqPxRF8Ojq_YnRoOfw@mail.gmail.com>
In-Reply-To: <CAA=hcWQVh1JoDSL7f2yXbpWBkGZkwDU=dqPxRF8Ojq_YnRoOfw@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 4 Feb 2020 12:13:05 +0100
Message-ID: <CAAfyv36q3v0jLJU7yi-9Jjnx_hfNkH-+z9X+B9ebN87rYcqEzA@mail.gmail.com>
To: JH <jupiter.hce@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Which package for nandbiterrs?
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
X-List-Received-Date: Tue, 04 Feb 2020 11:13:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 12:09 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> I built the image in thud to include following MTD receipts:
>
> mtd-utils
> mtd-utils-ubifs
> mtd-utils-tests
>
> But the nandbiterrs is still missing, which package for nandbiterrs?
Are you referring to this one:
https://elixir.bootlin.com/linux/latest/source/drivers/mtd/tests/nandbiterrs.c
Then it's in kernel (not sure if tests are build though).
>
> Thank you.
>
> Kind regards,
>
> - jh
> 

BR,

marek

