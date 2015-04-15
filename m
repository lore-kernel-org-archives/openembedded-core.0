Return-Path: <ross.burton@intel.com>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFC265C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 15:05:50 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so16179734vnb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Q3p5g2PZWFLyFlnCFuBpoXnyjlItyRx9oecDtUUPehQ=;
	b=P+TOem/bqcwmzrY7rQgGFowZdovxnlvZaxaS8P3IfQvo3cj+25y3gh6WY1wLeqdePh
	xSIANHqL9lprgFnZL/pp49NdVsXG+oiz3hkcoToCFAIJwBhczlT5hEmkKHJtuo/CcRKH
	ttpLza3gPnHOvArOrvrGiH3U3rDq5DRCwRF0SzrOqlPWegFHn8dwMQOAq/BtO1/M/tpb
	DxmlQYCfIcZ6bj4JJ7seLbSrxvqiBoVZhN9/rJmFjkYiEQORLypCRLczgAMDrR5sB7kp
	dApBMRJJA0mwbvO1rGMfrBpeRkLvg+ANOMYVWNPA67WhH0KuUtoTSyRkVVq8Sb8kLnHF
	L2NA==
X-Gm-Message-State: ALoCoQnZaH8qA+Qr7sqQqoJkit7hbSdkSJ9UrNNusqFwW3g10xo3vDNKnKvM6VYLWq5x+5HE78bc
X-Received: by 10.140.88.80 with SMTP id s74mr31285396qgd.59.1429110351646;
	Wed, 15 Apr 2015 08:05:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 08:05:31 -0700 (PDT)
In-Reply-To: <CABcZAN=05BhabBn_oS2JVp2NbDKJGje=8VE7qWv1WNgZ3k8VEQ@mail.gmail.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
	<5522F8D7.3050007@pabigot.com>
	<CABcZANmh-o58Z5iHW++S30_JP6r3q-8+3-g5hegiwV1_2_OP1Q@mail.gmail.com>
	<552319BE.3020308@pabigot.com>
	<CAJTo0LbnN-HPjeuG-_80DmB89APM7DUpNibvA7L-X8wo8SNrSw@mail.gmail.com>
	<CABcZAN=05BhabBn_oS2JVp2NbDKJGje=8VE7qWv1WNgZ3k8VEQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 16:05:31 +0100
Message-ID: <CAJTo0LbxeLBkd5pbhptRFJSyv=V1N3Wr4mcX4qiFkv40qf=KnA@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Wed, 15 Apr 2015 15:05:52 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4daece60513c4aeb5

--001a11c114c4daece60513c4aeb5
Content-Type: text/plain; charset=UTF-8

On 14 April 2015 at 16:38, Christopher Larson <clarson@kergoth.com> wrote:

> For what it's worth, I'd agree with that. There's no need to change the
> logic.
>

Where do you stand on backfilling verses just setting
DEFAULT_DISTRO_FEATURES?

Ross

--001a11c114c4daece60513c4aeb5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 April 2015 at 16:38, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">For what it&#39;s worth, I&#39;d agree with that. There&#39;s no need to=
 change the logic.</div></blockquote><div><br></div><div>Where do you stand=
 on backfilling verses just setting DEFAULT_DISTRO_FEATURES?</div><div><br>=
Ross</div></div></div></div>

--001a11c114c4daece60513c4aeb5--
