Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 750D87D15C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 09:45:27 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id f6so10358329iop.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GB2k80cXKLWM4NPNoJ84l8QDGR5vcgrADd/7ln/fJqQ=;
	b=f+XCpv0v5mh0Gd2ZDJWLx2d7usMtO8BGxDoLvUV+iGE++bGxCURtSSdLeo7w6xWC7J
	zTJ/zvEipxoQbepQoVFC1rmDw07seTZKGWyxiHWc82En66tfFtEdp+fP1bArbXIkn54C
	CbP+tMfytrnLklDABuu1Fn9mZvp/590TcjU9kpakocxSNfInfX37hakfEbGSEJ4eyd0d
	uXM4apECIMARUN0wPnIx8ADqRhu4Cj4VVl4DrskfK2xUD694AoMfmKdCNXyuHURvi1Tg
	luRWGxiAxozDxtSo2/Hs6s7UgBVCHCpED+gHbE0N3vRL+QD2ufj+n/J61BUZgd7Jleq5
	NpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GB2k80cXKLWM4NPNoJ84l8QDGR5vcgrADd/7ln/fJqQ=;
	b=AQrxne6eDpgDp4oIv8YNDayEvNdl6ikpA+DUDEVd+zvS/K+csUEoGdldPnpUwmbmMQ
	xHJL16bdQqb/GB6L/WSHIwOwsm6Sqj8/+OkViNU3zPIP5N//RxxlWGO12BHuwVxe7k42
	s11XPYuZx5GmF7aHjmY9mx7WcIPtuYHBmL9Tds2gjN/mqouulc3pzsghmgm47I9XYF14
	EGXZUVKL19kTgWdqw0TvKdmHZzZ05tWBsAAvQ9/pXDzsf8lzqz7KeTLoQFi71dZTGGcf
	8HPqXjTgTgMmEvHk7SU3410LVbCsVrc4C6VnzXt4A9bRu+ilLhkxNbBbFgbGzkBLXbLP
	h5zQ==
X-Gm-Message-State: APjAAAUp8ObhcXc3+c/xrrd4ys1KhO7cxifyQ9jDSKQUeieUhBfZXtuq
	nuBDOalhr/YVnWVgSYHrmit9vnKgiQMJ7HrSKijeZQ==
X-Google-Smtp-Source: APXvYqwntgYFD/QoEJUm1kq6jNeIkMPUHbPkkMlOJ8B6YobHbg7Y/LCHY1+R01jF6v6Q3Hji+erfH74ug6ApoeDSvIo=
X-Received: by 2002:a5d:9b15:: with SMTP id y21mr31849088ion.167.1554198328533;
	Tue, 02 Apr 2019 02:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190401222843.31010-1-schnitzeltony@gmail.com>
	<51102B42-911B-4DAD-AB62-7C56061ADCA6@gmail.com>
	<CALbNGRTGZupL36OYuxmhjQhB32cKZMLp4-qRnYPrzijC59ZLOA@mail.gmail.com>
In-Reply-To: <CALbNGRTGZupL36OYuxmhjQhB32cKZMLp4-qRnYPrzijC59ZLOA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 10:45:17 +0100
Message-ID: <CAJTo0LbVr+D5yWcukcsJOZhhKjXGm4Ljs58tj1wLsWXxVagraA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: remove PACKAGECONFIG for gnutls
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
X-List-Received-Date: Tue, 02 Apr 2019 09:45:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Apr 2019 at 10:44, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
> Since I don't see that meson configuration warnings make it into
> warrier: Wouldn't it be better to update the glib recipes to 2.60 on
> master to avoid back and forth?

Seems sensible.

Ross

