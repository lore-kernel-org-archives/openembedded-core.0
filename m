Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9AD47C763
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 20:43:58 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u12so1165727iop.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 12:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g+rUq/bd5fFyXD8NV3YH0GPPNMXCGsJbKr573OSHIyE=;
	b=orqLU7/DIbhaZ8Ipb9RFvgMExuILNOP8+4DLX88gR8J9cEMfi7rFNQr//Ms/R125OU
	D3CMYehcJ81ipLh2RmgMMG4LSDdMyKBSK9QoqpXfOVgE/BiKKcGVfVlHtvU678CTtCeV
	cSsUV8vTpaQlYoLIG3ACBu+9IXXZGYLt4shunSiRrkMi5dRmiJgIEb6WPiJOKlEmd1lb
	synVx/51OwJ8iVGy5U/16aAdbK+jF5dxZBMCoUS5NBrE8jgyVcyuUmOXXl5vqcSlfaWe
	T0A6R33O8WWVeNJd39XEmRpC9IpDedCYP7r4POwYUWAR7RFtw2+adOcKMBfObB5i2FfZ
	1XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g+rUq/bd5fFyXD8NV3YH0GPPNMXCGsJbKr573OSHIyE=;
	b=j1n1fbskRFPaaAeYvqgm02pBluwoqZgX77bWGVGO3V7yjAVHt9yLOHwCvBaoiVIVX4
	sYvA9KCI7gRsasR7pnSoz6NtKdIPREijQp7f/73qCeFe4Et/ebnvE+huZ8VCsCwG6T14
	tWajZbMPZTcMFhr1ED9Q1myzfmuxn09oUqkRZ96W1urMC9pFk5O5ahKale/nR19qA9yd
	acqyA/bwLSTPNwFCuyrjsw6/45eTotQS4AF2pbQ3HX4yQ1VJQSHO+3i9BIPRH+0E3o4T
	XKnM3/8LzgL52j5ef41glfE2k9KqDw80wShnv5AP64Txs8RytW4VTYd2gKu7GamQKEn0
	et2A==
X-Gm-Message-State: APjAAAV/+7pl32JPGfhhIIEsuDMMINFUjdp1SxyOGHAmsbIv+oIIt74F
	6uOeBHawdw1X4AAQlkA+8ngRhS6+82MLp4/HC8Tgaw==
X-Google-Smtp-Source: APXvYqzz96zMv7tjuoWou1l4E/8DxoRQrX6kbcGZlK2ebuD2bbHODQzTS7IGTgkgtB6M4ODvOjxd+Aj0nITynXhvlRs=
X-Received: by 2002:a6b:ee1a:: with SMTP id i26mr7308077ioh.201.1551991439571; 
	Thu, 07 Mar 2019 12:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20190306161348.24575-1-ross.burton@intel.com>
	<CAJ86T=UHWFbP4-=LzkXkRu3jew9OL5EdGCL5Qp2SYJD_aawuDw@mail.gmail.com>
In-Reply-To: <CAJ86T=UHWFbP4-=LzkXkRu3jew9OL5EdGCL5Qp2SYJD_aawuDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 20:43:48 +0000
Message-ID: <CAJTo0LYnsF3kC0aZUi27WZn4_9TVEgUKSEEXvh2uoYMZ=yg1WA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: add readlink to HOSTTOOLS
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
X-List-Received-Date: Thu, 07 Mar 2019 20:43:58 -0000
Content-Type: text/plain; charset="UTF-8"

Whoops!  v2 incoming.

Ross

On Thu, 7 Mar 2019 at 18:51, Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Mar 6, 2019 at 8:14 AM Ross Burton <ross.burton@intel.com> wrote:
> >
> > If systemd has EFI enabled it uses readlink.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index f1540a0acf7..3d1434931d1 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -485,7 +485,7 @@ HOSTTOOLS += " \
> >      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> >      head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
> >      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
> > -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed seq sh sha256sum \
> > +    python2.7 python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
>
> Comments mention "readlink" but patch adds "realpath" ?
>
> >      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> >      uniq wc wget which xargs \
> >  "
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

