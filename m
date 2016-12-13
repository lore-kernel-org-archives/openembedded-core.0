Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id AFE3F71E13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 18:42:08 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id n6so115672050qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 10:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fDpjYmglRHa/6O5P8o4CxcfvU1IAfZo5nnSUOrjxAJU=;
	b=zIIxFF1jtXU6ESJuMgyNpJWZn+HR7WUpVaCWF53oe1DHS5Bu331gbsgXfiLB0NAmyS
	bnKoyA6XvMVo/dj+RDCT83sxOM3phtFfFMWeLn+0voVYN+/GcBceQdK+EibRtj39XIwf
	YgfUS3EmuxF9BtiZrWa7n2kkM97FQstCUjvblONrLYi1CImwpAjpSpQf1ffXfEgV3iQn
	VOwYH3c93E+63Y5tahuPHCY7WRdm0hDQ7Rjs74vLdfJwmXPURUl/yFseWwVXW7pt8CXf
	JdMTRn1B6TILcrmTxU2guubRDTs2HqvFPy9QFOJtcVgzNxp5pnZmKy/hTELb+3Es8ydr
	LaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fDpjYmglRHa/6O5P8o4CxcfvU1IAfZo5nnSUOrjxAJU=;
	b=M2vlWAeEsuBF5IDe/dEOXIG1RggNPzQ3yO/1m58i1IqkCk5qBoevL6P9mUd1bWt43J
	C+f6tPffsTudsRlR40FB4h7yvbZ11gZkjBzbvbzpjTkjgPELo4ubb602qV71rY//GWoQ
	h63v3cI+pHM9TPPitZC6jSOw5KR8NJ90FDk07YRlQg7V+1wYFNu6bMMpkicpPuiSa6Lv
	5wpOWUOVfASN88wIV4SNgW/TrBGjTGP/8kWVbU+L2f07GqB03fKlMgEaVFUA6OqiXNRA
	bV3Iy/45S3RycqJq75CoKTscxnnxOFlmU+hxhmQ8inNkRWY7m7cFb9d282TZwVFERgc7
	VB9A==
X-Gm-Message-State: AKaTC00B0BgzUlB3tIWPadkBgZML3WNdbrCKbrC82FTbMny223KoZ9HsDC0KuJlupQX+rWB+jHaC/60OXFstTUKR
X-Received: by 10.237.61.42 with SMTP id g39mr93910938qtf.65.1481654529994;
	Tue, 13 Dec 2016 10:42:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 10:41:49 -0800 (PST)
In-Reply-To: <CALbNGRRaAi4Y7MhfgPY9X8c3+pOgrBnxK0jeeLG+=EWSReR+Yg@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
	<CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
	<CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
	<CALbNGRSCR4bNEwKmH_cjEdoQqUUyarOJ+zp-0EP2bvFp5LXByA@mail.gmail.com>
	<CAJTo0LazOcewXGiXoqrtxVTt=3994exQPwaf=DnqLkJRYP39qg@mail.gmail.com>
	<CALbNGRRaAi4Y7MhfgPY9X8c3+pOgrBnxK0jeeLG+=EWSReR+Yg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 18:41:49 +0000
Message-ID: <CAJTo0La=LhxNWRBXJybAxjsZ_kKRWLJO7XwHqnGZ4=NVngSx2Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 18:42:10 -0000
Content-Type: multipart/alternative; boundary=001a1142a3eaf0c7b205438e932e

--001a1142a3eaf0c7b205438e932e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 December 2016 at 17:51, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> P.S. This is a good example why recipe specific sysroot is a good
> thing - correct?
>

Yeah :)

Ross

--001a1142a3eaf0c7b205438e932e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 17:51, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":4mz" class=3D"a3s aXjCH m158f94fe154b868d">P.S. This is a good ex=
ample why recipe specific sysroot is a good<br>
thing - correct?<br></div></blockquote></div><br>Yeah :)</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142a3eaf0c7b205438e932e--
