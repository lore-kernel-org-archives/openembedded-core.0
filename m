Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id B21BC72FE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:57:04 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n127so100529596qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 06:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/PR2OtP5VCTRgxk+LD/e4NUfPoUgzu/6MUyvwCUDBmo=;
	b=dr8PdvxmVU5D0OjVDtnIuOil2xnhG0Y2pYoavVl3zgWRSjpaWnRhH+fkyHUdcwWaYv
	eHzumF93BteDEiuR+jGX2fXTXi2ctxE84/tv6jCp1XU5V+yqnneJGVaijIfHrIrZIsO1
	UHLPCnkrLPuTqVEGPS85LnjttKRnoM9GAY6XhzaS0X4jLMuEizSTQUoUJKw832ZLQnq+
	8HMAZM8a95J/sRpslS+p8SP3iynyn1jJdagyPj6xoatvJ1X162Nuh7pymI2FeQvBl8u7
	xecsYL5zs8T8/SjDSs8PLgNwS08UJdTFPMJvF+ngpSs2exmfh/y0E/mSHjo4j2tuprDr
	bMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/PR2OtP5VCTRgxk+LD/e4NUfPoUgzu/6MUyvwCUDBmo=;
	b=p7STDipXByUCTIdG+AWBg7Y+d3DzMdg70NUFQbsUM7pNrHguAkpfgT2VVsYpvpM8dO
	XTgrGpUF0FhlEChDI5CRzyAmyNMC1vAElfxZFZkr6kTtaP+Enaa6S04tpVhctPVxS+0U
	OKLIubQVP82GA2VXHJo7E9xEbWOC+okv+EWPN+VbJXjS0Fq1xg+3/St6U0ryaQZs6YSm
	JRpD7NLenM1vWk9xArotYi1GR9Zytg+udPaYic34A3vqdpJ5/Q7TeUcMD6FdpSETob8Q
	nEYqgd3VgwvudBo/BZIQpKJ9PbsImq0MU4NQioK7LsUZSQvW0hiwS9uTUnTGHP3VFSZE
	43CA==
X-Gm-Message-State: AMke39kEx9lok56I6Tj6lNQl8M1ZHUJWmOzU6P4/YkUwz+e+BOEb+Tmw4yTuACXk8WdIhLx1goTdk/jll2T/tBJr
X-Received: by 10.55.1.134 with SMTP id u6mr17878763qkg.36.1488207425465; Mon,
	27 Feb 2017 06:57:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 06:56:45 -0800 (PST)
In-Reply-To: <1f66cc6879051458f2ca8265d6861f701b232c0d.1487971654.git.humberto.ibarra.lopez@intel.com>
References: <cover.1487971654.git.humberto.ibarra.lopez@intel.com>
	<1f66cc6879051458f2ca8265d6861f701b232c0d.1487971654.git.humberto.ibarra.lopez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 14:56:45 +0000
Message-ID: <CAJTo0LYfd=Tbp4WxU4zgTs9xsUsO-CBYH4KAWQ05OHemUDA6sg@mail.gmail.com>
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oelib/buildhistory.py: Add unittest for buildhistory_analysis
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
X-List-Received-Date: Mon, 27 Feb 2017 14:57:05 -0000
Content-Type: multipart/alternative; boundary=001a114046c4f295fa0549844a54

--001a114046c4f295fa0549844a54
Content-Type: text/plain; charset=UTF-8

On 24 February 2017 at 21:57, Humberto Ibarra <
humberto.ibarra.lopez@intel.com> wrote:

> +        tmp_repo = "bhrepo_%s" % time.strftime("%Y%m%d%H%M%S")
> +        self.repo_path = os.path.join(get_bb_var('TOPDIR'), tmp_repo)
> +        os.mkdir(self.repo_path)
>

Instead of hoping for the best, can this just use
mktempd(prefix='selftest-buildhistory', dir=get_bb_bar(TOPDIR))

Ross

--001a114046c4f295fa0549844a54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2017 at 21:57, Humberto Ibarra <span dir=3D"ltr">&lt;<a href=
=3D"mailto:humberto.ibarra.lopez@intel.com" target=3D"_blank">humberto.ibar=
ra.lopez@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gma=
il-:6j1" class=3D"gmail-a3s gmail-aXjCH gmail-m15a721f70cfea666">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tmp_repo =3D &quot;bhrepo_%s&quot; % time.strftime(&qu=
ot;%Y%m%d%H%M%S&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.repo_path =3D os.path.join(get_bb_var(&#3=
9;<wbr>TOPDIR&#39;), tmp_repo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(self.repo_path)<br></div></blockquote=
></div><br>Instead of hoping for the best, can this just use mktempd(prefix=
=3D&#39;selftest-buildhistory&#39;, dir=3Dget_bb_bar(TOPDIR))</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114046c4f295fa0549844a54--
