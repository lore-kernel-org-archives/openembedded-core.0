Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1F497C786
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:46:45 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u13so7346iop.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PQMTUKF9G2N34+5HR3mm5D/oxZBTtrBmVygEQV9WxrY=;
	b=v37rhHlcgPyh+mzH5vToCPd7DRhsgigHpC0x+vUv/MEdKKlxuNV37FORekhuAJEH/C
	jQadTWrea+rJoA9wJ2QTqzOhr/fJgnkHE75S6UEdoUlbAE8lNH86MC7pHGVS/SoEzQbf
	vuSP3whnNjhIPFn11zk0JMz2Js3CJ3SQsC/c1weDniQsSOBo0GCnE9ekz469lyWKBl5G
	D7bN12o4/fbfNPI64T/AC0zYYfU7UMaEo/iwFBJs4iFrh7xKoOI0JrVCx7e5GgDqqyaE
	TPzNIryZ4HsPObsA7fk89qSaeA0NwiggNn5wnY28HIgwXkPDb7xAeRbDekbLP34URUUm
	KAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PQMTUKF9G2N34+5HR3mm5D/oxZBTtrBmVygEQV9WxrY=;
	b=rhoCE6/bfAGc39EiDTVUBtCCMb7+gdUyXphClpvCRywvcvotszyvEe5me6VlI1Tdpc
	fdPlzDWwKtdUjiulKKC9cNCDQ/ZhIgZNiE/aAdaXVPPD6eMM/FSwcBfQFDX9UkdCsNQs
	ngcGQejB1njzuZq7m+WIV7rsXWxPqdxltAhakntuEilZ9xA2RccESxYzdR09oTXiQuqd
	miOFed0w6lj+mZ6IiSBWevKvU2Tb0DeB9Xh30zIm+RWO9Ox8x2iGiaYWJ7d5d4G3hUuY
	lcr8BMlq3Gq1kjy4/qPuZj7TaAjEAZyT+cqQSXC+2EeMxElY25SyRLsSZ8ABemJe4TUV
	83Qw==
X-Gm-Message-State: APjAAAWkfDpmR/XYmPiR4/2mOYTD+Q4LSBen8Ea2zAH25Xeq1qPIfOIM
	8FN+9KO6bg6Da5Fge9FtKYN8R+T0QXwmANYRdnz2e0Nq
X-Google-Smtp-Source: APXvYqxutJr0gJynaqUPw8Qm1gv4vnpcawfb5p9H2QFMZ3j+BYpaz5iyd2+OuEKQLSUdgZQe9QSv2rm7pBoQCRo4uTA=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr225210iot.200.1561369606661; 
	Mon, 24 Jun 2019 02:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
	<CAEz4NHqwLd1kSnKhANnvgC3JuUTQst0gcGdjZzC+NQDebTj_2g@mail.gmail.com>
In-Reply-To: <CAEz4NHqwLd1kSnKhANnvgC3JuUTQst0gcGdjZzC+NQDebTj_2g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 10:46:35 +0100
Message-ID: <CAJTo0Lb5+uBSC6+1Hd6Xku2ncHB6wsKwL=RmhN=Y+GC+rYkndw@mail.gmail.com>
To: Pierre Le Magourou <lemagoup@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Mon, 24 Jun 2019 09:46:45 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks! :)

Ross

On Mon, 24 Jun 2019 at 09:33, Pierre Le Magourou <lemagoup@gmail.com> wrote:
>
> Hi,
>
> > > This adds python3 urllib3 (python3-urllib3 in Debian) to build environment
> > > dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
> > > documentation could be updated too, e.g.
> > > https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#brief-build-system-packages
> >
> > Somehow I didn't notice it, thanks.
> >
> > Pierre, can you rewrite this to use standard library instead of urllib3?
>
> Yes of course,
> I only need urrlib to fetch the NVD json feeds, so I don't need
> urllib3, I can use standard library.
>
> Pierre

