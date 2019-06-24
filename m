Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6277E067
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 21:03:08 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id e3so267992ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 14:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M5EmKZET2MOXEiSrnBvyPF+EDgRaSaspGlPF0zYemAw=;
	b=y89d72Axos3QgehuA92oqH982OIDZegC5MkdspGvxPejWnXrsUPLpZhUARwYgILc/1
	rxQcLv8WRPdEx70Yo/wM71RNmB47IssPxDcPuggyv5FEtOjtaCp2vOo3OHvPQvYviijE
	NHzLhBo9XD1ClMgf8BdwYTTA0tAlRV+ffAvaytAkC54yUsXANzrfjWHsroVEbS6JpqJV
	xx9uyaGYXPe5VaiQfaFrHwO13FRiyRK60nRUxkkCLVJFi8s1U1Kl2ascujpNe3Rr3Ucn
	qcuuIlaq+SqdoaiFf4gTpkq4rm9rGMbZgVtJb/uIvkE5XmGizR2gcFkQuN06iLSAGr/C
	hZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M5EmKZET2MOXEiSrnBvyPF+EDgRaSaspGlPF0zYemAw=;
	b=FuiIt/uXCllYYvz+u2zKVsuFRnZWCm0apiTAurlIV0obm0ZBQNk2lxaLjv2/1a4OxQ
	8W7qqIhBRCSFsnHt7BxeJfIFCNG4FMM9VTFjR/sNIreJZuB7CNlTe+fNpzzp/Yh3yOef
	MOZrraC8bRNdcY31mIwvHC5IsspR40o65Ov8TgHa22v6pJ/k0o2fQk6ZvJSs0C+2EhVM
	gPXBi/4Rlu9JTazy6z/71Y86osNCeB9iOGByxbjyRQfgrjIiD/nczghREb+H/nWIKJwM
	LHkbJORZ5xQqYGV/4dboS0nnjPBriCSQkfh+lre0QVrRbtt0fhHxLNYsh2+xfkQlIsD1
	hHpw==
X-Gm-Message-State: APjAAAV4ETcFzcD5dN3oAdkkGpBquFsfkYIkr2m/eB7lj4VSP+3oZ7ZU
	OHnfXcxMHqIfO1eTfuiRbxE3phukMrMcm7tsPWje/w==
X-Google-Smtp-Source: APXvYqySPmVPF7XRIOeFIBm0A09A5VXjtDw6yjIw3dKnrLoXM1p8lkUT+Wo9/1zCGNsBCn4CrvubCMIkmJVrwiVfYmc=
X-Received: by 2002:a02:b395:: with SMTP id p21mr43499750jan.31.1561410189943; 
	Mon, 24 Jun 2019 14:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190620145325.8654-1-ross.burton@intel.com>
	<84a8dcf8-3491-bf07-2e68-46aac1b38162@xilinx.com>
In-Reply-To: <84a8dcf8-3491-bf07-2e68-46aac1b38162@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 22:02:58 +0100
Message-ID: <CAJTo0LYS30bBju53ETudRtiv6OMjnFZxoAFfJvSbu6QdfyWuHA@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: make 'python' install everything instead of just the interpretter
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
X-List-Received-Date: Mon, 24 Jun 2019 21:03:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2019 at 21:20, Alejandro Enedino Hernandez Samaniego
<alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
 > >   # manual dependency additions
> > -RPROVIDES_${PN}-core = "${PN}"
> > +RPROVIDES_${PN}-modules = "${PN}"
>
> Is it just me or we already had this?, maybe we had this only for python3

It was only for Py3!  Swore I already fixed this too...

Ross

