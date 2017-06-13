Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB8C782B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:40:20 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id c10so163239829qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wH3Xq4uQ9gXRU61JDzkuib8pDUyWPf2XVDoncL2b5Dg=;
	b=erNxqqznQaTw4+ZtfwTVDiautyi4vZcdxyGElwhkdVaxiB+hXILCTPpvA6j2RuKNvj
	I6bFeKREwpGGfEiKFFGOt5mxIegs/TgKrdU2h4SG1GQnDbUH0pVh4O4Uag+Tf8meA+VF
	beMDZ/UTFqlyxT8f+vYin9rwkfOUcNN7E2Alrnl9bOpK1Yz5oYFwDSL8PL4+0aFv4YfE
	3dl3nUnaqrPF9uZX7GQVO1XG664L4DfLfeX7jRwNTdYbTs0TgnImZa8MXEDdMmGspYpE
	V6HZmMXwSg5XHq/7h6qijgYEXgncP5rU7M+aoJYEgMEUEqQSMvYPtRzkVc5g/TN3j6sf
	Xwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wH3Xq4uQ9gXRU61JDzkuib8pDUyWPf2XVDoncL2b5Dg=;
	b=McgGjYlt/00Ba02lvXH/2aLE82IPEV1bHE1B250gRiQGftSZBDSIyFysy+KKIU4Av1
	SdM6pN46ck+OhgCnM/aMtySbxBM5BOUJubtg70FglLeMM6veUcPD++IGkOaR0Xdk3HY+
	1sVJaHy5yskTHpoAnqhuesdw0KqTyIQX5yQFJPoicO0HIyadmIXs5BTWK05ZKF7VjdWa
	2K/yQY7QF9JrdoGMDpgziOR/vPDmPaYK8g4TVLVLIgO2BNbRO0rH8XwYD96PshdliPzf
	sva+iVbKMbBarmm+PYVIYPWJesXANnaVpXqzO7YPL3sblxbt09zwVOtYBv/GgPcRq2m0
	/ztg==
X-Gm-Message-State: AKS2vOwHI2URYFUQPV+HEH3crCnLic39zOsv8UxjXUU8TZvLM6RLuByG
	Ktv80QzF8A9QQZj/EpoJsstXbT/OE5D9
X-Received: by 10.55.120.1 with SMTP id t1mr2859473qkc.171.1497346821995; Tue,
	13 Jun 2017 02:40:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 02:40:01 -0700 (PDT)
In-Reply-To: <1497346604.30860.4.camel@andred.net>
References: <1497346604.30860.4.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 10:40:01 +0100
Message-ID: <CAJTo0LbzMmvp_xTk64Z4x7z1p7jJ_8Fg2jd2HeGFJK9Ccy4O_w@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox update?
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
X-List-Received-Date: Tue, 13 Jun 2017 09:40:21 -0000
Content-Type: multipart/alternative; boundary="94eb2c06686a6e867d0551d43937"

--94eb2c06686a6e867d0551d43937
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 13 June 2017 at 10:36, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Just wondering if there's any reason why the version of busybox is stuck =
at
> 1.24.1, from October 2015? Is it simply that nobody cares? Or other
> reasons?
>

The last upgrade that was sent ended up making /bin/sh suid root so that
was rejected.  Nothing else since.

Ross

--94eb2c06686a6e867d0551d43937
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2017 at 10:36, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":2do" class=3D"a3s aXjC=
H m15ca0d0b5324dad3">Just wondering if there&#39;s any reason why the versi=
on of busybox is stuck at<br>
1.24.1, from October 2015? Is it simply that nobody cares? Or other reasons=
?<br></div></blockquote></div><br>The last upgrade that was sent ended up m=
aking /bin/sh suid root so that was rejected.=C2=A0 Nothing else since.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--94eb2c06686a6e867d0551d43937--
