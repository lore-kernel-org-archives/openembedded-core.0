Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDA67E60A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:54:51 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w79so8458073oif.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K+cd3qOQPtE+ctg5dbOdivxHVd03OcXIjt3a6o3C/7M=;
	b=WglFqC5mJlHo+fZzHyxM418338syfIj7pEY1DJkv7QQOHGhvP682lxUbSkwKrxlM2v
	0hVDk1pLYq17lIxr7mg7Ite8vpWVT2YjW5np8jiz5S9vSZ7+NiBTOIHaDjVTynWso1xL
	2bk429whyGHS+QS7o/wrK7P1OMiGTcgGzI1esuNo+fNTSgJxyrmvYsrp/tv0K6+OMvp1
	01pdUx8AJV5LMHbD8AJrM71fxFawmzSIEMJbJeMcleacmEPmGP7uq3h6phyO4CmCa84Q
	wL0B5M34ug1LNwPApJcG3TtLB7/k4iTD3IPSAiZJhxKEMiInGw15MGdP3Un1LNi5Siqz
	9/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K+cd3qOQPtE+ctg5dbOdivxHVd03OcXIjt3a6o3C/7M=;
	b=OeKopDwVEvf8ElYSSIqhLpVD3Zd+EjA2M3mv+yRAqmp6Y5DUeXnxpkr5ntvWcpnFdV
	3WsaMbfAL5oca/xmOn3SLjnXc+iVjpKHHjlXpnl6qHrwIRvRWMDNAUmzIJuqnd+Qwg4W
	AAGNdOe2qAYBW6v1VNqAMoSnU+Lr2ODdFnMhYBIiI03jzHvGGjQ0755XzeMgWlO1zdxj
	Khqau61t0I4y0D6N9j9o6I/MYAe2VTYwxBX1Nmf3I8aXf0yIVVzfQ4XLh03pVMfVoved
	Kx/cZ1xJ3u9oD5oECFXDIvkcQHgefKs9/zAwOUk3SA6cCNggm2nCj57B2Yz+fCu9S9oI
	54Og==
X-Gm-Message-State: APjAAAV7sKrdeXL+suMFZqVB1NBZ9ZYwX4LyZ8GBR8EosNbRrUekiPO6
	yEnFserE45Ik+XAPq8SCKTN2boYGV4n4Ki8OqfWVENrH
X-Google-Smtp-Source: APXvYqzfwMcZiSOdPyLVZ6d1i6adUmPUa4xx9c0RYRc9xyKN1o14N/ZtpjUharUPz9UYVQN4Ttmvqj//ZYn6ecXxGwA=
X-Received: by 2002:aca:c008:: with SMTP id q8mr7870990oif.135.1560246892878; 
	Tue, 11 Jun 2019 02:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190611015756.19184-1-douglas.royds@taitradio.com>
In-Reply-To: <20190611015756.19184-1-douglas.royds@taitradio.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jun 2019 11:54:41 +0200
Message-ID: <CANNYZj8pyKhQ5=iV0PYBJCVjcC1vt7GGY2BKqktPv8sNikm_Vw@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-c: update to current upstream head, with --disable-werror
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
X-List-Received-Date: Tue, 11 Jun 2019 09:54:52 -0000
Content-Type: multipart/alternative; boundary="000000000000cfe0a9058b094909"

--000000000000cfe0a9058b094909
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2019 at 03:58, Douglas Royds via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Upstream json-c haven't made a release since March 2018.
> Adopt the current HEAD revision, pulling it directly from git.
>

You should ask the upstream to make a new version then. Pulling a random
git commit is the wrong thing to do.

Alex

--000000000000cfe0a9058b094909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 11 Jun 2019 at 03:58, Douglas Roy=
ds via Openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.open=
embedded.org">openembedded-core@lists.openembedded.org</a>&gt; wrote:<br></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Upstream json-c haven&#39;t made a release since March 2018.<br>
Adopt the current HEAD revision, pulling it directly from git.<br></blockqu=
ote><div><br></div><div>You should ask the upstream to make a new version t=
hen. Pulling a random git commit is the wrong thing to do.</div><div><br></=
div><div>Alex<br></div></div></div>

--000000000000cfe0a9058b094909--
