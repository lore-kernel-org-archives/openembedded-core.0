Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1841.1792435050433637828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=L4TwmJIN;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ZwcG9CsE;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 6481FEC00EB
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:37:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 19 Oct 2026 14:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792435049;
	 x=1792521449; bh=I6FHWVSjTKWZEH7KBHgdKwHFdYypuq8fyFMeTSw1w6c=; b=
	L4TwmJINeM861xc7vs8VVBHcH5OVpnXqmn5EKgHSUYHOmsGHIOpp5uo+vwgDYHLX
	4lrVlIBoGhIwllDT7f44pqMtvRw4nz5nNVrqu9bHdCtkjiEdbvmv3vXAs+XiMSvY
	b0tD+FX2yTn0H2FKpiYk+dNs1XgOPtlfw9k8OuTAjvsjGNH5RDvnT34Sn2w4ghB+
	oZq+96oAgZ926Sm87xgR4r2rSb9zT7YqFkVCy4rxXouFCGtPaTQ5MLg+Sg79jN+l
	gBoNiP4GrxTrHe1ig1WkbpzwiTj34Rg6wmSekrRomn61ku6w4szBDUqK3/rQHzVP
	EOTz0bbPigHTveCWN516pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792435049; x=
	1792521449; bh=I6FHWVSjTKWZEH7KBHgdKwHFdYypuq8fyFMeTSw1w6c=; b=Z
	wcG9CsEKmNNBgbqcYqz1mnmQ2NvKBTZW9hXr1hv3VC4JmZv1VPWxtmojmLNJ+tgi
	28YvaLr7uZC9x8irYEF+y83QkOVPbKjXUH9829PLONT5OwTzKTixGCYLcsaCZKdh
	g4HcpuBlxQCd7OSVV4ffMLFmXZj4AplLcGpi8iQY59X/WRKv1ew6HTUGeXQSl53a
	w9nEM81QbMFSM4Lh7d+JZlRjFLBJcl1vExIZilxJ55yY0eIv/IEpNnG0i2v6tGfU
	mHhlmw+7V3P3J0Ic7srnXaDrgoZoUrmdY8somywZLdRFCCcZYSPNaCYRLBaPsHP0
	1c1qUD9c5NTgnm0elC6fw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792435049; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:Kenyz31/o0nmLqqbm9qQZJx4MzvB0oQ0z98NxhKtwye0hJk
	4CdW9BvOnLVQhWgMnNVfH6kp4JSsryah5W4/U8IjgyrNWQkGu5rfOpFvV7dcyWew
	C95mFcbnrA22xUaNhSdfNRRdXkXYibQE2i91SkvL2dJmy/nbzUDK2a/voO4/s25A
	XFEFwqsAT0RUdvXCWUxnrY+yiAFU21tP2Fl2ixplJd+piEJx1MM5SKfJYLT16tjk
	yX6M+qcGV8CZz4eC8y/kkcasPcQtgIt++nFm16K6DAuh1acnUpn8eAn7v46NYxi9
	UAwzmQujQtBZ7Zamhu8/r5tEwAxUk8+uvbPMhgw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:peOMX8vj5SauaW3u6Kff+zF1cJhH6CL1f7C5b3JmTDM=:I6FHWVSjTKWZEH7KBHgdKwHFdYypuq8fyFMeTSw1w6c=;
X-ME-Sender: <xms:aWPWagrCA3SACwVxrAZTEH-XHy7IRrrHWOTa5G8Z2eN5dg_pLIPCvQ>
    <xme:aWPWatpaVbamR2JWFA8Lx1pCwlLW6fUIpH44tWPpagHTzYeJpWuE-vmk5J5KQXQx8
    L1tF8POB8MZ7gLRAN9Rq4bH8RjJC88MCnbyXqcso-xpMPR_AoTiXQ>
X-ME-Received: <xmr:aWPWaqOY2YyVBGiU3f-sMVNEkzbVrMg6a1GPh4NhUyXfY91hdy9tniq5OkqZ4BneMm4nFeXDlfRpEKipsJ1jWHvJEpbecrGg9FUB>
X-ME-Proxy-Cause: dmFkZTFzdjWw4gaCnuyersIt7HxFuwH18axWP14CJJIkWeQF6PsMonRMAsa0afoxAF6SzI
    nPhgsu0LPgfZMi6anN+L74+8hA3Uw+/IUNPcqmXHFSwZTr53Jz6LtINUlkCZmB251N7fjG
    w0Jqtwnp6gpoy3h+fZ567l3oZZF+NPLdkrWdT738TDwahgtcJjSJmKx187XeVm0LppFozg
    LXdqLzMsRGPw9aMLQKdK0nnMuNeSIK4BCA8G48kTGNbdeybJqiiNITP9nbzKX3qD+F74vp
    PBEhdH40B53wbyYxyIfDABKkxjmXG3ek/Xs8fPt8UNwoWyTnfDpXCqosK2fkB+2Gtw5GZu
    sqfzMl7+uMoGyHJ1TlyU/utyxxNn+OIZkSnjxUAe/hI8AVux5r3Kph2ASGa7n5tcwr/tCC
    SwKCf45YjKuaLbaR9j7TY1mdnsO7qRoG4vsllLd5qj3cj+YXQ1aIMFVLvKmkcVc/MCq0b4
    tPhTYplt4QmgDM8bTgU6e7FtyLFmkLnyRIBhF64o0iRhTN7VMpJ0NMm+zUKwL8Wl4lvNln
    KQ+bKNNLDjwKaZoWabXuftIToOLz1ZBdHwxikUwnQvOr6QGY8rsiJH93GsJuVEYyuftx7P
    tlFK8R3WdwMKjg1uMDltXXcGL+07nIt38WbqP7hdpy/zhEcpSyk3n7ZkdXog
X-ME-Proxy: <xmx:aWPWamx9LGHS8WgO4y82HwzzHu3UuPuGXg_wNsbhjvpFsNDZavG-0g>
    <xmx:aWPWarukcU14lAg7ImcYWUwRvItHZzHfdswsrWlzRqmqe3D5YaIo1w>
    <xmx:aWPWan5zXWhP_gcQVT9xYEhw6WLRNzQG2Fi4TOiC4rv4gQNtaK_epQ>
    <xmx:aWPWaiR0oKkZi9VCRe8VFsBGoj7KqQ0d8OQtGxQ5TM3K3PXtk39DUQ>
    <xmx:aWPWahS410PIg9L2tHgSssk_7zZHv0NXWD9SP8MAFlGrMIc5-4kEq7JU>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 14:37:28 -0400 (EDT)
Message-ID: <e994357b7e09f8c342802208dc6ffdd6cece7a0f.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap] [PATCH] boost: make ICU support
 configurable
From: Paul Barker <paul@pbarker.dev>
To: Shinu Chandran <shinucha@cisco.com>, 
	openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com
Date: Mon, 19 Oct 2026 19:37:27 +0100
In-Reply-To: <20260825045928.1998989-1-shinucha@cisco.com>
References: <20260825045928.1998989-1-shinucha@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 18:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248204

On Mon, 2026-08-24 at 21:59 -0700, Shinu Chandran wrote:
> Boost.Locale and Boost.Regex both have optional ICU support, but the reci=
pe depended on icu via
> PACKAGECONFIG[locale] while still passing --disable-icu to b2. That made =
the dependency
> relationship confusing and kept the Boost.Regex ICU toggle separate from =
the Boost.Locale one.
>=20
> Add an explicit icu PACKAGECONFIG, enabled by default, and use PACKAGECON=
FIG_CONFARGS to pass
> the generated b2 arguments. When icu is removed from PACKAGECONFIG the re=
cipe drops the icu
> dependency and passes boost.locale.icu=3Doff --disable-icu; when enabled =
it passes
> boost.locale.icu=3Don with ICU_PATH.
>=20
> This lets distros remove the ICU dependency consistently without disablin=
g the Boost.Locale
> library itself.
>=20
> Signed-off-by: Shinu Chandran <shinucha@cisco.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Hi,

Please review the policy for changes to the stable branches [1]. This
patch doesn't seem suitable for scarthgap.

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#su=
bmitting-changes-to-stable-release-branches

Best regards,

--=20
Paul Barker

