Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 97131605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:48:34 +0000 (UTC)
Received: by iouu10 with SMTP id u10so40731857iou.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fnZITQB0n9ldlpXHHC94o8e7StmBbJqHcvr84O3/VZc=;
	b=uTBUMUq6yrut6ySuFfdl0MBJEHaKKyQuVTm08g5ZfT4RG0D+1f6UwloxzVvrgKYZUR
	MUhLZMbQRpZ/tzNVIdcLuezBem77RSD4F5Q70BLK5DLgtrruS+6mLRco8MNUYwhfMTk2
	jPr84FHPnjUWiigP97hxJGf4NxO5mvpDmijEHsk3uF/wO5DsVq8Xj2SIlc6y6soivG6s
	+oUhU31eAyhnTOazi56GVCKfgCALnHwJwPrk9xPtRg6fCWmvab/4Gqx0S0YL1HqKyTQn
	W0xXIT+G4dLsDmA3Q4wAwBGD0D5NjtIhM4fdViO0uM6B1w0sCqD1HvZ3Jtz9BWr3flBc
	vvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fnZITQB0n9ldlpXHHC94o8e7StmBbJqHcvr84O3/VZc=;
	b=FNyugv2W2SrZgl57PVw+D6FeEZTdbX01ESZGGR62LPcTcgQQ2hvpWAQLcGlCJ45xfT
	KKA5GqYGzdR0L7BpZE42N5er9e0Y32NHlHoMUiTdQlIbZwQb86ZK4VmN4tZLLI59zc9x
	mRgP4v+oVnyb7lmSlMdZPJ/wJTzxY9kYLHZLufQyxyhTvdBIPaCqmIixVYe5JSyM/z/Y
	IHTyihmEhQODJo5KtW/ggK8mS6h24ENN1Rm0CPKQ4fpwAb9Az7qpX+abYvIIvWIvPHBS
	OOb2PohPl81ekYQAzc/kZAm+daLEkCYvCh5OWQZG/wxidf0Rcr7QXgJ35toNc+BQ3/hv
	XTaQ==
X-Gm-Message-State: ALoCoQlrpFHlIqlaJJgqHtnsQ+mYR83V/sZ8hOnYSlOsJ7ArfXeUsUQS/31UKUpkpusbV6s3xGNU
X-Received: by 10.107.135.30 with SMTP id j30mr2484689iod.148.1449049715422;
	Wed, 02 Dec 2015 01:48:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 01:48:16 -0800 (PST)
In-Reply-To: <1449031718-3786-1-git-send-email-vz@mleia.com>
References: <1449031718-3786-1-git-send-email-vz@mleia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 09:48:16 +0000
Message-ID: <CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk: allow to specify OPKG_ARGS in local.conf
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
X-List-Received-Date: Wed, 02 Dec 2015 09:48:37 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a8ccf610525e72d08

--001a113ec64a8ccf610525e72d08
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 04:48, Vladimir Zapolskiy <vz@mleia.com> wrote:

>   sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad
> interpreter: Permission denied
>

Whilst the patch is fine, this is worrying as noexec /tmp shouldn't break
opkg.  Maybe opkg should be changed to use something in /var for the
scripts?

Ross

--001a113ec64a8ccf610525e72d08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 04:48, Vladimir Zapolskiy <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:vz@mleia.com" target=3D"_blank">vz@mleia.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div class=3D"">=C2=A0 sh: /tmp/opkg=
-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad interpreter: Permission =
denied<br></div></blockquote></div><br>Whilst the patch is fine, this is wo=
rrying as noexec /tmp shouldn&#39;t break opkg.=C2=A0 Maybe opkg should be =
changed to use something in /var for the scripts?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec64a8ccf610525e72d08--
