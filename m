Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 159CA6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:40:58 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id fl4so163958297pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=tmCoA0OO/jqjo+2QRrSf2N2Wdz/k9O4lGaxyH0ZGV1g=;
	b=0BipmUsTJFNIy/opeV8EMXCfLMbsin4o4XGv/FDo0Js3NyH1VTU2E/uOLvHEX5wXxT
	VKsqv00j5as3/p8n7epK1UEWWMwKnLNeroe9HCnojIgftAfZIXTYupnOf5vxyvlwZr33
	PeGPgWpWKuFZwS28Fw6GD123eKlX6TH7d8rGwmkLvs2S5rO/pZ7kmLWaACXqKWkl8566
	cJ6zJKvu8GbA5AeYEF6doy6NeVkIAKXpizIEPqey6a80O8pzFOPjlIcB2o638Qc5nZfP
	lpy6uwal6IcDKGBC6g6h6m665/AhD0hAEOV+NcN+dMEqBXttVtuREPA+kPexDaI6M6Bp
	zOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=tmCoA0OO/jqjo+2QRrSf2N2Wdz/k9O4lGaxyH0ZGV1g=;
	b=McYLNKS3vZCFc18/wfPYazh1E2j/f7B4chUbXZWb2yt/Cxpc1w/RDI3TD2iS5Bdu56
	we1pNBM9mKBmW4tztmSRsZaeZ4gEHWH6fFEsHU27YWNj1iwBHRSuwJVNCF28oNTvVm+N
	DTs6cjPnl5oKAD0fPSFTk3FhELQecfOAufd8FG/vbWoIXX4YWRX3r9KZuw8OTKr5Xvd6
	cSvKvikAvLsmI36ybF5RbtZ7563s7kQRlHTk7laqgG/l6HsGcKZQ5hE/4mnlLtWE1zhn
	m+f5b/fPp2yNng6y3vLVYG8DB7iYCEVIbM4QxV8/w9HMijlo0SpQmRW6pbVqR0Je8NZM
	HmHw==
X-Gm-Message-State: AD7BkJIfjABRQba40gZQN2SlDUokQtUrzwC9EWnEEVvDMvnRGE3HG19jA5LuCGq+qOgE2A==
X-Received: by 10.66.132.37 with SMTP id or5mr40976205pab.144.1457988059645;
	Mon, 14 Mar 2016 13:40:59 -0700 (PDT)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	q2sm34167825pfq.88.2016.03.14.13.40.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 13:40:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f50.google.com with SMTP id fl4so163957833pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:40:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.176.10 with SMTP id ce10mr40184470pac.68.1457988058045;
	Mon, 14 Mar 2016 13:40:58 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 13:40:57 -0700 (PDT)
In-Reply-To: <1457987735-23523-1-git-send-email-ross.burton@intel.com>
References: <1457987735-23523-1-git-send-email-ross.burton@intel.com>
Date: Mon, 14 Mar 2016 17:40:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrV517jdeiow4pAvz_ewNvbEe7mz7qbEvufoG4mRu-j0A@mail.gmail.com>
Message-ID: <CAP9ODKrV517jdeiow4pAvz_ewNvbEe7mz7qbEvufoG4mRu-j0A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] xorg-lib: allow native building without x11 DISTRO_FEATURES
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
X-List-Received-Date: Mon, 14 Mar 2016 20:40:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 5:35 PM, Ross Burton <ross.burton@intel.com> wrote:
> The Xorg libraries use REQUIRED_DISTRO_FEATURES to stop building on
> distributions without the x11 feature but this stops people building native
> tooling that uses libX11, such as libsdl-native.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

To be honest, even though this syncs the Jethro and master on this
regard (and thus is a good change) I think this needs to be considered
that doing this way libsdl-native will differ. Native and Native SDK
binaries will provide different set of features, which is bad in my
point of view.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

