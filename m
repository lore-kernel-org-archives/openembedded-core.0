Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2362F7F8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:02:13 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id y5so4839673ilb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8PqAO6lHAi00CRy2BpMj5adVZeHaWIxszDsvrWJseOA=;
	b=EMPTBqnS0XErx8BeH8dEHJBBuezXLXfzC/Eejxc0n2SchHMDmQUZIo9tIQ4440Nqeb
	Fza3kx7VZ8x5EQDLZrWXP83DEQqj5vF3/hM+YnyqMhB81b8eAFSWvU7wycB+72XUQuOg
	N8ztsIwGSNejPqgQ0xRgLzBq4nippHcjMlW7FmAhZYEtFCp6smmrSEi98hRiu77uEmLm
	tVcszZenzHsTlt3jAd6VuXNAVK+FtC2wiylp2Lk6OToTpwa7dU4fqxltJErwt6sFXiMb
	rjVJoWmCF574S/DH1ZqpG00oISJ+UZ672cAunhpg3ifkeHes6YCjqI3Ovm/eguEj2lzG
	/AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8PqAO6lHAi00CRy2BpMj5adVZeHaWIxszDsvrWJseOA=;
	b=hw8um9AE5FAuLRY15OUNhjvNPUznNt9XnriWAuh7VgStAyawLVtzuc4poecKq+rb4Q
	gmsY5Jq/nShyfXoCvuNqQlxQrv/xsk8S5Nt3sUcR4znSlEZKGRf42zyifwHCpGxdGra7
	N6FDo2cESkVTAK018NzZW0fgylHU9Y9cLy2Sii8lug31wONjHjRO4Q55eKxycw7AKH8T
	J9uCrNdqvliNFkhLdhQO2QdiSn40lsvQlcW+3+0+d7rAgfAmvynqz4F7QQsXESJYafPc
	AZfgdmzISZNm0TMathIMhw38A1n1ho47npcUYbHCARk5cKbd3b0rUf3g+jnswckHulI9
	tIZg==
X-Gm-Message-State: APjAAAVxk0Hi8HA48OpECTXYoKhiKJFXjl9k8vwmeXzvu3ndOnTtY1jz
	d3iLGDhDWgcEWDHCP7myvYLwbz2cgWMt4p9l/zA=
X-Google-Smtp-Source: APXvYqwvKkhMQ0mdaXeDI+S7rORSeotyX8IZGiLap8MzaCvj+sOWqekumVYrz5OqDkDCSWbwNMeyh+e29Ql6sNV+yAQ=
X-Received: by 2002:a92:1305:: with SMTP id 5mr5259026ilt.299.1572516134192;
	Thu, 31 Oct 2019 03:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-4-alex.kanavin@gmail.com>
	<CALbNGRTuGXc+fsXezqxBttBcz1LomdLyuNMotzJGFMgO6gBgaA@mail.gmail.com>
	<CANNYZj9KWK7bahZU4OLfOpLXpeBcwXuF0oERwAfka6H3WHr-+Q@mail.gmail.com>
In-Reply-To: <CANNYZj9KWK7bahZU4OLfOpLXpeBcwXuF0oERwAfka6H3WHr-+Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Oct 2019 11:02:02 +0100
Message-ID: <CALbNGRSXY9R2hO_DUjQrEBHkaBj9iWMD3dqugvrnDF44jgnqqA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] gcr: update to 3.34.0
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
X-List-Received-Date: Thu, 31 Oct 2019 10:02:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 10:58 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think Ross has a separate patch queued to address that.
>
> Alex
Yes - just thought is is a complete V2 -> everything fine :)

Andreas

