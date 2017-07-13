Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id E36AA7197A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 09:45:26 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v202so33954764itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vOnpBvJtp/jCkXI5tImIhaamylwVMhQ96BL08rrTdpw=;
	b=SCff2XBFuTm1eyRXiNBusskMXkssjXg/xVhv8eoxz5u0LG7DePqU7Axc10HPEB8tkK
	HVLIimwJy3T4LxO8b2WCYWUa26KN8oInW52M/Ah5cNhcklHn1a8uzkgUDEa22vrg0jIf
	hkp9PdbeCjLEfn3NqqVbbBMJ7at463Xm5e/5XyAoa02D25Hgdy+qV5tu4TpGYdrXARXp
	gmL/3j/rBpFb7F76llft1nJ/tuxL6UmvKqyS8i/Tb8xhswS22SIw+WJztfJ8HCvlsZYJ
	iWqq0lC9xdDF2kN+/65QP1BOaoB2fhhlBQwYVf5//HS8ylJVy9//8m5KKilUsBCyx72k
	qeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vOnpBvJtp/jCkXI5tImIhaamylwVMhQ96BL08rrTdpw=;
	b=B1Po9d5a2ASzHVuj9ybWfkDH6ql8zJ+ZV6bep3URPynXw6ozSeyFgWeDOiXja1EqCt
	mr0AdUUfdm7VpfwqhRbY/DKOBSrWoklfmN081OiMO+gcW3DbPC/+I3qp8vqe8q0QUEX0
	jBLcPJKF9/58EuLKJKv+40Nlt+C2GOwTV1Z/vNWwB+L12AjO18ZHPUrVeSWlz0LgfLU3
	npRr81QitENbxLoZXLM+4dyDlvqQ/kpx/xnd6ozkTPd7Z51qFgqakgVOTBJqlrcrx/3H
	+AtdbIPYnzIa+nFZvMZc5HiNxVH/+qEh4M4GOYLucoxNhQIVo6gUhRmpkgqqwEqSmkeV
	Y08Q==
X-Gm-Message-State: AIVw1111ERA2XCrdjtB6Q++opJYUdsEQETS5JhSBYj4zJjl/N3m7Txek
	ieNS+vt6BzWzxfgkhSFu9ZRD2LYJlbzg
X-Received: by 10.36.25.8 with SMTP id b8mr25973707itb.29.1499939128041; Thu,
	13 Jul 2017 02:45:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Thu, 13 Jul 2017 02:45:07 -0700 (PDT)
In-Reply-To: <CAJTo0LZ75z8kjoBKLGKhF6dOpSDQFmRx=pepc_uPZ87QCVSwoQ@mail.gmail.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<96d138921edb8356aa7b683803e4facc4e0ade4e.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LZ75z8kjoBKLGKhF6dOpSDQFmRx=pepc_uPZ87QCVSwoQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jul 2017 10:45:07 +0100
Message-ID: <CAJTo0LZJ89-Zdp6=YkRXwtvFvNx25MbGxBHir-GcdTnWHx5EaQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libbsd: 0.8.3 -> 0.8.5
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
X-List-Received-Date: Thu, 13 Jul 2017 09:45:27 -0000
Content-Type: multipart/alternative; boundary="001a1144a5e8e97f6705542fcabe"

--001a1144a5e8e97f6705542fcabe
Content-Type: text/plain; charset="UTF-8"

On 13 July 2017 at 10:40, Burton, Ross <ross.burton@intel.com> wrote:

> Determining if any of those can be applied always would be good.
>

FWIW it looks like the __BEGIN_DECLS patch still isn't upstream, but the
other two may have been resolved.

Ross

--001a1144a5e8e97f6705542fcabe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2017 at 10:40, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
Determining if any of those can be applied always would be good.</div></blo=
ckquote><div><br></div><div>FWIW it looks like the __BEGIN_DECLS patch stil=
l isn&#39;t upstream, but the other two may have been resolved.</div><div><=
br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a1144a5e8e97f6705542fcabe--
