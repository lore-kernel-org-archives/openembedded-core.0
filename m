Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E83C77F90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:53:22 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id f190so3259800ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 03:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6qtDVXyvHZtk8PbvwLtywvBoRLnSAvTbSUltXOOh+WQ=;
	b=GZxdx3Flp1Y38X423aXUGJQptzfGh/PpKLeqcThq4LKcZzyS4Ye4tGT6uWTB4f7MQT
	wS8LbppS+cpximq6g9LBBbAZ0ZaAKjFZd7pnW5tIeNPRqqKURsOLVGDTqz9XVha2nqu3
	1fFe23sHBhOVbnL1mFSrxsq9dQ9+m05DxqBizV2bOez2ST/wdACTcZCtX/JcKDlrMeQB
	A6IhnSdL43DrM2w+zUe0DQ4K1PXPosH/UuDQUZMr+bqd5NQ0u5Gax6gRLIsSSC6Tks5i
	I4IoTn9D2FRYc5rzCNsBp4IlOpyofoyBJMjW2wN1b9OMdalWwKrFWC5w3HquRnFB70C9
	TO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6qtDVXyvHZtk8PbvwLtywvBoRLnSAvTbSUltXOOh+WQ=;
	b=SGE28vFZf9MtwyOPQPy5Hr52MTn2C/wdAp+Khj44qoJk9THO5nk12OXjVL7LXzsdcr
	NQWE9sRE+yza5s2FY9qy7/DiGhbKTtex+FaG0fHx1hjfFZTJKIpGG2CGwbNyVt0eRTFH
	rsrYAdeIxSfiIyuEa8CYV/6dhm8rHB6iUAimlwVQARqdl+ZTNH4ePlXtOGIUTODucDSx
	Xu/YtlXR9eMwMAiuAsF+fnhzu8ZnDZGfbvlbzWeo3mT84Jfp+lkbezGXj2/C2Fn5pYo9
	um2T2RmlNB0ZsQITHNiTtP5f5isikRjplCAgUg3xfDQKoI6AAxeSCrdK6pS7xMsE5AnB
	ZoBg==
X-Gm-Message-State: AKGB3mIXumuLxiJq3SnP312RgGk1qKk5kODcIwiSev1TEUsVLwR9ZcTs
	9ULBfElmo//V+aqUoEwke+9J+yAtZXyOspGn/sSLQg==
X-Google-Smtp-Source: ACJfBosrRW9pwoNX5I2+yqZNlAEgVyChnr1uucLriv4yHemRRAHQFKpeGyXd2kuK/ULj903lIwHNuTZRgJd5YVVUBfE=
X-Received: by 10.36.93.5 with SMTP id w5mr2554159ita.124.1513166003907; Wed,
	13 Dec 2017 03:53:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 13 Dec 2017 03:53:03 -0800 (PST)
In-Reply-To: <CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
References: <20171212024917.14550-1-allenwild93@gmail.com>
	<1513068908.30397.2.camel@andred.net>
	<CAN33hf_0Y1=fCKmFYeCCZdVcEGyMjeUZHSkMzMiZP0z1VC5jmA@mail.gmail.com>
	<CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Dec 2017 11:53:03 +0000
Message-ID: <CAJTo0LaCuoNPtTeKGqcvCsCMHqvLNq3w0U-RvhSg-dM-dmitTg@mail.gmail.com>
To: Allen Wild <allenwild93@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: always use the BFD linker
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
X-List-Received-Date: Wed, 13 Dec 2017 11:53:23 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c265fe70560376aa1"

--001a1143f14c265fe70560376aa1
Content-Type: text/plain; charset="UTF-8"

On 13 December 2017 at 02:42, Allen Wild <allenwild93@gmail.com> wrote:

> Oops, forgot mail the list when sending my first reply.
>
> I tried appending LDFLAGS, but it doesn't work for syslinux. It's
> during do_install, not do_compile, that $(LD) is called directly to
> link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.
>

That's a terrible implementation of "install" and it should be using
LDFLAGS, so that's an upstreamable patch.  As Andre says, adding the flag
to LD directly should work.

Ross

--001a1143f14c265fe70560376aa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 December 2017 at 02:42, Allen Wild <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:allenwild93@gmail.com" target=3D"_blank">allenwild93=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Oops, forgot mail the list =
when sending my first reply.<br>
<br>
I tried appending LDFLAGS, but it doesn&#39;t work for syslinux. It&#39;s<b=
r>
during do_install, not do_compile, that $(LD) is called directly to<br>
link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.<br></blockquot=
e><div><br></div><div>That&#39;s a terrible implementation of &quot;install=
&quot; and it should be using LDFLAGS, so that&#39;s an upstreamable patch.=
=C2=A0 As Andre says, adding the flag to LD directly should work.</div><div=
><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1143f14c265fe70560376aa1--
