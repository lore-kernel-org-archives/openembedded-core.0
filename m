Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 120ED7EC5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:39:01 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m10so1957348qkk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BCfOHqAZWAu0kF3yZeScOW3Pv085NUr3eiQDovF4m+A=;
	b=b7iJLejjtBfylt5eutgqavp+qw7F4BSVGRZfZOy5/PVkFIm5wdwRWjnXhGeAdcto1K
	7Eo7fpbgBCU7NlCbzXAjot86qfWt/InQe4BBqP2vCzCGmCvPpoTrR8Kgl6JTAfnUcRL0
	1Id62gqmRCC22f9DbfoLPWWqDRn7Fz6080g3vBqBoEhM5n/wKkqvpvONKbR+CMaRAGi+
	b+Z+Q9TRWQMsirbeXJdA1a1g3O6IjPxk9zvGK3luo8daPXlosAUfE1bkagZx01wo49q/
	l1HxL4aC7pTSmNyHdb4Y80GzK7VSlUtAkodqWmBKD9w9ZfDQCLzSLefbb3aE2jNqa8Vz
	bXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BCfOHqAZWAu0kF3yZeScOW3Pv085NUr3eiQDovF4m+A=;
	b=UoSQhg/hSU4tuMdZyFsJN5LKbT1ja7m89XXL7y9u1utDj72u3jyoY7ieilzUM8Dg5k
	+ZBxqp6CaWkzU8HovOlbcpwMC0E3t7Amye0qjMnT6AVtnGqoaIGYanBO1OULjd1z3kKi
	WSLo6I+0RCh4x1DEXrxaH0Emcp2qePaaYzr4fj+4YuP6n4e/eMhRtlNBbLdZPDpbDvyO
	M9APyx25N+I3M9ccyxb06Gho/hsH5IY5DRspAmenasJYdrJYzyLEtq4lkko2Ek6bCtCF
	Fuc3JC8dFSYd7305rVTR2D2t86AzB5Se/ZVvBYeMTUuB7y6sG0sBxajqbnTkru9Lbohh
	7ymw==
X-Gm-Message-State: APjAAAVy0MLFEEZPwJ8LwGwI0MKDmfNFGVui/mQRSih30wYieoG3v9Va
	0fKTiQehFUaZFMLMPY+o+x77tQDFlFCSgU/3s3c=
X-Google-Smtp-Source: APXvYqyaiQ42t0K0SctGDcVS7L7iBQL3SKNxp3IOzDo2bg2ngJJFkOx8DcI3R0xYnYcUQsuaSUuUbxj2x18wrtx3ZFI=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr2699268qkk.474.1566232742487; 
	Mon, 19 Aug 2019 09:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190814222921.34551-1-raj.khem@gmail.com>
	<b3f880cd-422a-a0ef-db42-6e44364ab06e@gmail.com>
	<CAMKF1sqQLs_Rey6XCoH5AGMx5=-n-XrspEgrh=zrmF-eDtB2Eg@mail.gmail.com>
	<3bf454c4-0ab2-8020-76cf-74e77f4a0ab6@intel.com>
	<CAMKF1spqt7YX6o=C+shdQyyrkGx0WcwSCqG4F91X9_6mkgc4_g@mail.gmail.com>
	<dca2b8bf-32df-3cad-14f2-624aa5eb7d3d@intel.com>
In-Reply-To: <dca2b8bf-32df-3cad-14f2-624aa5eb7d3d@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2019 09:38:36 -0700
Message-ID: <CAMKF1soZifHQwFM5t7OfSDVs-bmn6CPrD3g4cr-QVvViVt1KoA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Mon, 19 Aug 2019 16:39:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 9:20 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 19/08/2019 16:09, Khem Raj wrote:
> >     Set the PV to 3.3~rc0 and 3.3 will sort after it.
> >
> >
> > I thinking using + terminology is familiar in OE world let=E2=80=99s st=
ick to it
>
> I worked on adding ~ explicitly for this exact problem (as used by
> Fedora, Debian, etc), so please let's use ~ instead of messing around
> with fake PV numbers.
>
> ~ is basically - but it sorts before alphanumerics, so 3.2 < 3.3~beta < 3=
.3.
>

if you insist will send a v3

> Ross

