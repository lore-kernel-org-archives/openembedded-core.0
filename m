Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7A96103A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 11:09:19 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id f10so15470421ils.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 03:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=mKiWfw35TRBcNC5ah0+e4ESx/3gHIgWIINi6hAJbztM=;
	b=RxObIr6ZKQS4LEYyn00FpQ22gfj03kRb1wogcKKLhyGtdQViDnzYdVCQi92alvkwKl
	8U+9tPAC+O7hgbR2bv2ukjsxhomFMuIUkDe3wa99Yo/cPVfX/aliAYav8x8ISMxElfY/
	ag+vS5MUPAjy/1AlKHIwAL9X42DgW320RotkjRisn60GlDjZxl7Ucyd2dTaIYF5SRa9L
	WKyFLULsW34ZEAiyEgQr9O9tb3/gKl7BHsBBMDbzlwyMZVyaF06MHHlYs2+WOkYh71G4
	/zQlf2K9N5JA/tjdiEIDfp38ntiVpsIqwR+S3kVxZc8VbJQRr7X6a0Tbxh7SUn2CpC9t
	uJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=mKiWfw35TRBcNC5ah0+e4ESx/3gHIgWIINi6hAJbztM=;
	b=A3m7L2c7jlQAXJB4yOZxEPD2QdV7O4AzaDbCIKd5sz7qLdAO40zd/9NtEi0hpGmmH7
	bfYIXsJcLw+ubxpmJRg65lsaqi7zGHGEM/zWLXSYGCLt9cCkGUYgLVQzTRc/lXJq3lfa
	DHgLm8KXK8iEYK8tRe6ukRVcplVn+mwizJNoLe4pk+zbF3xMShKVqzraSJodJI3HIaLC
	D6aoN4/kDUPWvQcc6hMB+dxAEQ+ooS5IW1UMjqmbnFFe/JxrNhSCqLURP7DHNoydJRMT
	WGvf+iXwjXihuKbbM/PrqAS+/FlXegAvx2+bfvvl+wEWgFM91e3mfbCZzAqPMNA8ZDJs
	BMpQ==
X-Gm-Message-State: APjAAAXVUxlCeO0SkCgFemMcdfMJ3ZyAeMX0vuEkEfTT2REopqZsCIyf
	rwaRNHrM4M0OQtDZEoguaOdK0hx9Ivar4GjZMfU=
X-Google-Smtp-Source: APXvYqyXS4Zv0+5IfAjQVkK2QCnDHOOUpsHMWdCyIqWEFQPvQtVzub8qpk6Uwe7ZR3oov54POb57GvHNqhlrbWqWFkQ=
X-Received: by 2002:a92:390d:: with SMTP id g13mr19826136ila.53.1580814560493; 
	Tue, 04 Feb 2020 03:09:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Tue, 4 Feb 2020 03:09:20 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 4 Feb 2020 22:09:20 +1100
Message-ID: <CAA=hcWQVh1JoDSL7f2yXbpWBkGZkwDU=dqPxRF8Ojq_YnRoOfw@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Which package for nandbiterrs?
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
X-List-Received-Date: Tue, 04 Feb 2020 11:09:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I built the image in thud to include following MTD receipts:

mtd-utils
mtd-utils-ubifs
mtd-utils-tests

But the nandbiterrs is still missing, which package for nandbiterrs?

Thank you.

Kind regards,

- jh

