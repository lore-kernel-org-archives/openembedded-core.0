Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 51E0D77968
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:09:18 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id i34so107658011qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9BOrGenEKu7TDxz/niCktLpAeVqG/iOZfrt0DgA/DlU=;
	b=GL2ySPHUJLdMLCQs2G+GIDqjJf6pL/Aa2OcGm98nuQbniF+D5v3eRUgIcsxmU54yuE
	pTGHXAY89tS+8ReJ55QUCD84lNupEfp4oCxoryFgJqRCuBwtwxpFrituDjeEtNCFoih1
	BYmU5CUBcpxtbNt54uTXtPXcTypGXtQwRuzXrV28SbjJGDhu5CVwEV2g7sP/K7Iid4tI
	6RQXXk2Fzcz2rY+/n5zvkFE1pSCnQQoDmw+m56kpuuR2sqBfGhzYe+tgoBLpA0QQGYsy
	O0o2bA3DXzkRGwhsaVh2YZt3gCTz5eIN54TREmHehOGzfhRFeKldofBL9y1XQ+5a9SpA
	aN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9BOrGenEKu7TDxz/niCktLpAeVqG/iOZfrt0DgA/DlU=;
	b=jeEdDO6Je+XP6+iG4c63ROaRcVa+SopAdn6kW37Rwd1o1YUePM88AV8G0BHxqRuLQf
	xJo0F0dFlnQznJCNSRWXQz+WbW0AnO375bUcg7Px2YUzcqBCUPjVwHO66y3qo/h98pvL
	uGyEQF2+DdxGZIx+SM2tj7ymBhh5M6yBM+sR8/uV3uXp005PK22d/mc/s9our/Cq1/gF
	4uNa+uSrCbV3x27RHyj9mlczZyuc/CB6LZLEjpc/amRsAVpFj88zoYbfgXq/gTRr3Abp
	F71JAssKxhw+rmwaXYgzKrL4TJ6I3u4sB78uhDZZHldPOaSmvGRhWQ9xtLzD4y0PkxE9
	1nZg==
X-Gm-Message-State: AFeK/H0L7KDJH+1TAkn+axSm/knQUXa2NWDf5wJaXJYzVcPRUN75AG26pwsZusAw/7mULONtOb1ygBILJg/JYLcz
X-Received: by 10.200.2.150 with SMTP id p22mr28747495qtg.197.1490018959172;
	Mon, 20 Mar 2017 07:09:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 20 Mar 2017 07:08:58 -0700 (PDT)
In-Reply-To: <20170320140612.GX15664@denix.org>
References: <1489793040-52384-1-git-send-email-denis@denix.org>
	<20170320140612.GX15664@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Mar 2017 14:08:58 +0000
Message-ID: <CAJTo0LZwQERtMJFG4pYfkVjCBo31VD0TXPTvBM7AKudEjjOjfQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>, Christos Zoulas <christos@zoulas.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] file: update SRCREV for 5.28 to fix fetch fail on missing commit
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
X-List-Received-Date: Mon, 20 Mar 2017 14:09:18 -0000
Content-Type: multipart/alternative; boundary=f4030435c234c55e4f054b2a12d9

--f4030435c234c55e4f054b2a12d9
Content-Type: text/plain; charset=UTF-8

On 20 March 2017 at 14:06, Denys Dmytriyenko <denis@denix.org> wrote:

> This is getting quickly escalated by my teams and customers. Can we merge
> this
> to morty right away? Thanks!
>

Morty and Krogoth have been patched now.

Ross

--f4030435c234c55e4f054b2a12d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 March 2017 at 14:06, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":8z" class=3D"a3s aXj=
CH m15aec0b66665eeb6">This is getting quickly escalated by my teams and cus=
tomers. Can we merge this<br>
to morty right away? Thanks!<br></div></blockquote></div><br></div><div cla=
ss=3D"gmail_extra">Morty and Krogoth have been patched now.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f4030435c234c55e4f054b2a12d9--
