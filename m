Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8E52A77ECB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:50:32 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id v19so218462ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IMldsn0CgMtfBrZUUVqal+I3KXOmZOJ0BdYisRRkXX4=;
	b=WjAG9QxYEyRh2PkSicktxNspQnxWffROqcRPqrViLGkb6DHVxgFgmBS2YQWKY9W79O
	YYT2XQlXzrQ2mSPd3AXcrak92EWmkjTGBysxQ0DlHsYeHCmbOnWBe7zd+dZIOQrNzspU
	R9oHHb5ywbqdPGIJa3O0dzHVS4Acv1SH9VYya/cxziloZ/2K7uS6DsZV7aCbk543MPVf
	C8IG7FHejbeuWh3/UR/1AFIz2DqD4numzQP2Iv+6K4nQvrhmtXun/B7ji3ALUiLUHAOq
	Mq6fE4dt3QTu/yQrBUlr34sqB2hHT/wZGK4wz7lEE29AJBtfuFjvvOVq4EqeW5GUN18y
	WfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IMldsn0CgMtfBrZUUVqal+I3KXOmZOJ0BdYisRRkXX4=;
	b=Esa+BcpL8ZtBg00Ri4UC+gwzQgRL3Lq/BZUrW4dbeIK0AwPUhywb44Vm6GGP38Jb+v
	E6SU72lOCT2Z1OG6E4SYjjGEVJthA4trUPEjDPMnniFRvtY1u2VfDnHnuucl7kl4xvCw
	ih4dGmA++K0/vEYKyH969OqLs+C1fN6ivn/PiSS5G5t8flQ8A54KctcDKuY08yFgzC2I
	VNNiFbS4jwVGFT6sBLiOmHV4r0MPSRbl9j31OcexEAteY0TquvqJ+N/dVepEhYzkruRx
	3alxT32r81XU/jxuB7re2E7fGPDJH6tGV5GUsLvln4AH7FAZjkrS95HMQbk54olLTrkk
	NABA==
X-Gm-Message-State: AHPjjUjkMOx+bJ4gRA7WuXC/qvC3pcncaK8b1yw+lLnbHWqRRXZKYLm/
	EW1mnK9Q3F890+pxj8aoOcxbC5wR2bBtdc7bHwYJGw==
X-Google-Smtp-Source: AOwi7QAap2oTZHzB1T/bpIUGDoIV6fshx2XN1oUlButy4iIv5MCeOZkN15V20ZYTkDQMKPq+YtjidJKN6ezCbkjJmEA=
X-Received: by 10.36.26.129 with SMTP id 123mr2677206iti.38.1505839833651;
	Tue, 19 Sep 2017 09:50:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 09:50:13 -0700 (PDT)
In-Reply-To: <1504603652-262027-1-git-send-email-liwei.song@windriver.com>
References: <1504603652-262027-1-git-send-email-liwei.song@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 17:50:13 +0100
Message-ID: <CAJTo0LYXE=s8tphMTfS9avaM-4ttTpO1=mo-A+rsd46PKFgMRg@mail.gmail.com>
To: Liwei Song <liwei.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: package qat-firmware
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
X-List-Received-Date: Tue, 19 Sep 2017 16:50:32 -0000
Content-Type: multipart/alternative; boundary="001a114463ec5fcf0705598da87e"

--001a114463ec5fcf0705598da87e
Content-Type: text/plain; charset="UTF-8"

On 5 September 2017 at 10:27, Liwei Song <liwei.song@windriver.com> wrote:

> +             ${PN}-qat-license ${PN}-qat_895xcc ${PN}-qat_895xcc_mmp
> ${PN}-qat_c3xxx ${PN}-qat_c3xxx_mmp ${PN}-qat_c62x ${PN}-qat_c62x_mmp
> ${PN}-qat_mmp \
>

*** Error: Package name  contains illegal characters, (other than
[a-z0-9.+-])

You can't use _ in packages, please just use -.

Ross

--001a114463ec5fcf0705598da87e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 September 2017 at 10:27, Liwei Song <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:liwei.song@windriver.com" target=3D"_blank">liwei.so=
ng@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${PN}-qat-license ${PN}-qat_895xcc ${PN}-qat_895xcc_mmp ${PN}-=
qat_c3xxx ${PN}-qat_c3xxx_mmp ${PN}-qat_c62x ${PN}-qat_c62x_mmp ${PN}-qat_m=
mp \<br></blockquote><div><br></div><div>*** Error: Package name =C2=A0cont=
ains illegal characters, (other than [a-z0-9.+-])</div><div><br></div><div>=
You can&#39;t use _ in packages, please just use -.</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--001a114463ec5fcf0705598da87e--
