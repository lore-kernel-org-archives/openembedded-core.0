Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6863.1794234037675593809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=MaKNvn4M;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=LgGlu0/w;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B09191400131
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2026 09:20:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 09 Nov 2026 09:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794234036;
	 x=1794320436; bh=Cs19B5iDKSjTq5tjS/GvTQMkdroVo6FOl9hiM1nKI2M=; b=
	MaKNvn4MVEChZqQ2pJ2P2UmFEfdfWJ54+jpnPmLa+DPfNgNpFPFxw4gSo/Z22QUB
	xmkyZJ1Nfdby8uu9J63TruDkUWj0Vn4yaryACPCz5Wvpn4eBHfhzsJASyFFZAsX6
	VH4E+YmRHQoj058/+mXM9Swi91ysIE0nWSxfK9n93FgS+zH0cbk8PR6W5ZG6dAdC
	OZHO24z1CRCTBDaiGlzuVjaE/Rp68D0xCWv52IdJQ+3MFqF833MOohrzyahToS7W
	kL7pBjBhW3GQiEz25lNspGNxj4MUHBUairv136qRBzZyTGgSTQOlzAREAZDhGJJD
	kNvhK9z8OA+5qvUfg2MpYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794234036; x=1794320436; bh=C
	s19B5iDKSjTq5tjS/GvTQMkdroVo6FOl9hiM1nKI2M=; b=LgGlu0/w+lP1jNfLA
	XrolWRgzrUt40b9IHmD99Lg26/tQq7Q5NPi9nPx1DcOdSejXMWBRpQRHgA8HffAV
	0gWFsV3wfEzjtY/WYmeNRY7BcxDJnYqeL2Fh0orCsid0X1G8NR0KEg8Qr8xt6Xrb
	R+Tj6e43W7MQh+/xGHySFIfLDq9Pr27uTyjmMR68d6BngtrrCZToBL7IcSU5tJOe
	l+BBXo3EggGLA/RQ0GT8ZQ6pAzyb1uVULExxF1kPiLfGW/Th+1a3oJnyIHTim+Zl
	avSHhsawZ1j4nNiaw5KpH8jwaoLHdoUGrX4avUUQ/FNYxjA0EdXK6TIjFtiaJZKT
	2Eb+Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794234036; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:j3RX8+5S0/oBrS8z3ZEtJLsUJM+g8MYs9NYhZwCKK7j2RPJ
	Auts1onzQZcSZ8vezcs1g6IWmpomegbLmv3t8AbcSlTpTGJoR2971zBg7BX/ANo0
	gSxoK1PKQMLiDqya8XhvXY8ERDJEKUEap88lM/U604T9c/y0lJeA0pOG5aObR7lv
	K8u/QXUFYPuiKtsZXF3jKAxcBUEOIhUC23gW3sQtJQsXifqjp6yNrknkoHfylLqi
	qX30hQsbUiJlDGZ5DYamU86yz4y5so9cXukihEERcNpCiwZNdQtlIlbGfRwxh+zI
	agvtQzNjlBH7v99Z/U/4j8cMx6D6KRKpFuX2HAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8ZBugF/4CuinyndLCbYSx9gIIKcoqpZDn44S1/fNR7I=:BKL8Bo/fa5bPal1V27LpMTDHXE4PXKj5kzHYlopQySU=;
X-ME-Sender: <xms:tNbxamSFg5F4OTiiBvJ63uoislqBiSVx3sYcCn96zI--PikC20P99g>
    <xme:tNbxahxDm6cEfg2rPrL03QZV-nO-Pl079DQqs0tyi5NfWp1Zsc-9JNYWvztFVYCbD
    gwIzbDP-87UYiS0nJP18CDtcEX0ZrvAHoh1eZcPseQoEzoQjzYsFS4>
X-ME-Received: <xmr:tNbxahexfzVFq9GfyyUhgXHq7lylPib48ipGJ6GLAoFeWEwBE-qqleP5gNcSrgPN8fSeL6oBjP_Ri732fxFO8eekHLOJ>
X-ME-Proxy-Cause: dmFkZTGvaIaF6DQy6IO9uwE1GkKpCBithGQW5MMPoEFrUEgCh3QtJtNmmSRELs+MYdxkkD
    tcbu2CW1x+82PagXKUQ1RSlVCd4vhyR+/xF4SWVfdN/u7rSoallYUlQr+IJ0nfpoFb4iYI
    RqaMycO7aTY7Vb5lTIM6FaFlOz7SN/YtbdJSOeDawBOouBQww6z6J8XHZKAWfhI+qvWPIb
    i27PeEM8JSjpNP1IUTNBSXv0Jvp4q54vzIYeQP93SuEyLrCDsWRslX6R5/CnSWBLK5vP8W
    ZtNVWfszFcUiCy9i2oWU7EpYTTES6C9oFL6SJ3gUYOWRbCHd+rrJl5EY9lvRrvown5ITQ9
    YjJ+J4GJBXl8zdP3JVfY7JZhnJhq8iqGQfAAtCz6UcXgDmI648Ymof6a190AUSzrg4ZEAS
    xk7NjqmyGRNklQQaGN3Zmoaw0DEpMzRsD/7moou9HRalieKmEHS6W+YeNyGzF1ulNVf3t+
    r9BjhGYD3RwLRAzAy+Vtxwe0GV5ZvQKJfsfohZrYhnaTmZSkYTxkPD5jnyorBbj7WxPNHo
    vzfCmtjYdawtOm0nCxoapzFSn/2vXHZUNdJmzqioR7luieRzmW3GTUH8bCQ2eOjLZJbLpP
    GWKeugO5CboWi1r08hM5n0OzGlg/Lp1oghVJ217i0yGEkMewo1aCwfCoPxXA
X-ME-Proxy: <xmx:tNbxatJZh9uM7bCjckw89i5yAwP7KiTeemq3QWLbmICCx05yYXdd-g>
    <xmx:tNbxaiFosubVWDDiHt0JwPHN1pYJczfVE9TgacWiASwCF0B0uXE3WQ>
    <xmx:tNbxanrnh71Ltge-ClE9mDxv-OGVNj69MTeTmouNQ0rFyb5iU9E-oA>
    <xmx:tNbxarTd4dgrnCQv8VwrCvvYi8McpbjZQxKBa7C3MMOJeDqKANCx7w>
    <xmx:tNbxaljjLKX28o0izhw40DoKhJvJNZWhxYwVS8AXqKKrGoZ4CcFuCPGj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 09:20:36 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:20:35 +0000
Message-Id: <DMQQVSTB0X1G.UN5EOW5V25PS@pbarker.dev>
To: "Alex Kiernan" <alex.kiernan@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] fontcache: make the caches built into an image
 valid
From: "Paul Barker" <paul@pbarker.dev>
X-Mailer: aerc 0.22.0
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
In-Reply-To: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249848

On Tue Oct 13, 2026 at 11:49 AM BST, Alex Kiernan wrote:
> The fontconfig caches update_font_cache builds into an image are never
> used on the target. fontconfig accepts a cache only while the directory
> mtime it recorded matches the directory, and three things disagree about
> that mtime:
>
> - fc-cache records min(directory mtime, SOURCE_DATE_EPOCH). When the
>   intercept runs, the font directories still carry their packages'
>   mtimes and SOURCE_DATE_EPOCH is the image's fallback value.
> - reproducible_final_image_task then sets every mtime in the rootfs to
>   REPRODUCIBLE_TIMESTAMP_ROOTFS.
> - mke2fs clamps every inode time to the SOURCE_DATE_EPOCH in its
>   environment, so an ext image ends up with a different time again from
>   a tar or squashfs image of the same rootfs.
>
> So every process using fonts rescans and writes a cache of its own, or
> fails to on a read-only rootfs. fc-cache also deletes a cache it has
> just written for a directory newer than SOURCE_DATE_EPOCH, so with the
> default values some caches are missing from the image entirely.
>
> Patches 1-2 run fc-cache under REPRODUCIBLE_TIMESTAMP_ROOTFS, with the
> font directories' mtimes already set to it. Patch 3 keeps that time in ex=
t
> images, as oe_mksquashfs already does for squashfs. That moves every
> inode and superblock time in an ext image from
> SOURCE_DATE_EPOCH_FALLBACK to REPRODUCIBLE_TIMESTAMP_ROOTFS, which with
> the bitbake.conf defaults is from 2011-04-05 to 2018-03-09. Patch 4
> adds a selftest that boots an image carrying a font and checks that
> fontconfig accepts every cache and writes none. On qemuarm64 it fails
> without patches 1-3 and passes with them.

Hi Alex,

If the selftest case in patch 4 is ran without the other changes in this
series, does it fail? I'd like to confirm that this test case would
catch the failure case.

Thanks,

--=20
Paul Barker

