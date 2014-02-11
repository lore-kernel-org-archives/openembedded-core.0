Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 792376ED34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:07:45 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tp5so4579075ieb.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ndnncHelIXPBFfWckVX3uNwWTWHKjJzuFJPLC4M7ijU=;
	b=t0PLmA7c+laocSFS+btcSzADxGW7bQ3nzAf2WrpHhxE2S2dpWdeEAezcA9YMxmitWH
	aemW7K46V+j/21+1TrD84LQ51nA4H8jola/GmDIFwJ76YnpKWL5BqLgAAs93dOt+XLDi
	D7YEIkUqinQjOE/gdxQAJIOwieSi1ONmywzQzSJmKUfYHYZu5orrVheS+twGtgL0iByW
	zp8F/jmf3nmZVDtO1fyHldWJDcEGtiWNLXI5Nl35pNREmZDlcxwwsHc1tbYTrLo/H3HZ
	54Vd8I7Le0PnzeAEh+3r5PXkMMRx3QDfzmUIHxHWtPlnUGO2oxAO5QXVF0D1lmV7GT1k
	bUhg==
X-Received: by 10.42.85.140 with SMTP id q12mr1857536icl.51.1392131266333;
	Tue, 11 Feb 2014 07:07:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 11 Feb 2014 07:07:16 -0800 (PST)
In-Reply-To: <CAJTo0LaD4=NZTeLRKD=pOfi5sqGBVacKA-ObWmXkT0JbT2=Xwg@mail.gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
	<CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
	<CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
	<CAJTo0LaD4=NZTeLRKD=pOfi5sqGBVacKA-ObWmXkT0JbT2=Xwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2014 07:07:16 -0800
Message-ID: <CAMKF1so-_a8437RrW9FYbENVys5D6Qv8dxd1kNDF9TzZ0OKyng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 15:07:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 11, 2014 at 7:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> thats the default one can add --disable-microhttpd too
>
> Please add it for clarity.

Do you suggest to add it to configure cmdline or in comments

