Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 658C560859
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:30:49 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o28so13510442qkj.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rp8dSj0OKC72k3sR/aNuw2WwnIsyXJf/Ryt7zMt9KxQ=;
	b=M9XCBPwwwaiKmnsfB+sRvf3wkVmdrlKRZm1xafTXHoDb9xUx4Rw+LCUiEoZHs3XgBA
	vbraPxFVrWZaPU+CBNXYXqYf7Zt9jNahFTqBwbZzSJ9vHggTnFCQ1sCFkGX5PGKMCD/j
	kzDJkIZZENx1L0HAcN3F4kiT2GBVSG88zW5LDt+g9B9KiDGnG4SzjPe1zk9naJ7NYVW2
	GmuMC5rJqWuOVDz2w76wrNWoRO/GLomF9OJMX9tVZatJ8bP9LXXju6QgfkUBtxn0A+BM
	nXrjZC570ROFzdtrzgfsNmkBp2EygseWFITork33rqEsQXlxPS1gTJcTN2QRxjHxtSy1
	+vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rp8dSj0OKC72k3sR/aNuw2WwnIsyXJf/Ryt7zMt9KxQ=;
	b=KzX2Z6WuwhII+MSQ2y+NJDUvxyw91RmveJBh0XzpC2FMmru+CI29LNnYANRbk+yB6u
	CD2vhrbJsSyXUb4i1E8EaC+HTLM3gSyc0ulWnaOXHkDihN/h/16wu0DSYjv4g8DIuX+c
	9S/8YIwUbWu1wByCf6GY2XH1cUH9xYgS+Hl1wgBkIoVHr8kS52tD+VVHsnDkK/JkD01x
	OGR52aKyYvdXOWPxnmYVL32oQFg9vsbXxFS69OWJKUSmgGGyxNtKJ7SmvW6zk+h1UvkY
	PxESrvLBeGCzJL9yZMlRQuOzsu+0WpkC+nDzJ4rmTgfQpKeAorAX4efczqgsCqQZeDoW
	wk6Q==
X-Gm-Message-State: APjAAAXSjEAmvmtE6lbobu8KMejGMUa3hrtqpPefuk9iPbeWyOcQF7H0
	4kdN0TBjX7GF4TNPW/JVgQZfTw5UAEzm89sKRj4=
X-Google-Smtp-Source: APXvYqxdx2cmrzADQJAOAz/7X8OPnnjSZtCdOiPPro1Ny/IiLGI9EbgdonzNLJjIUPNeUfoY8T/CMszo5XVSVWE80RU=
X-Received: by 2002:ae9:ef96:: with SMTP id
	d144mr12554873qkg.337.1581906650019; 
	Sun, 16 Feb 2020 18:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
In-Reply-To: <CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 18:30:21 -0800
Message-ID: <CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Mon, 17 Feb 2020 02:30:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 1:03 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 16 Feb 2020 at 21:10, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> qemuall, applies to other qemu machines for arm/aarch64/mips/ppc/riscv
>> as well, in recent past I knew
>> this change was needed for qemumips and qemuarm to boot
>> core-image-weston, I am not sure if
>> anything has changed since then. I think this change would need some
>> more testing.
>
>
> Sure, but the testing should be done by people who need those other machines to be able to boot weston; I would want to draw the line at what is currently covered by the autobuilder (which is just qemux86_64).
>

perhaps then make this chage such thst it only affects the
architecture you have tested.

> We can then use the fallback in a more targeted way, although the proper fix would be to look into why the default backend isn't working.
>
> Alex

