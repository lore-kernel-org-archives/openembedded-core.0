Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 957A26B06D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 17:17:00 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id w25so11027806otm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 09:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h5PTRZG4sC7bgDUWyrFSffypRdXfraAMWNoi55CZEBI=;
	b=uYis8YRKRSCMXE8YRyUb57SCINe9I1M4BkcCMGajxGzrw55xfFMzYF29J5mIyDAZds
	DNAH3HFMcCP8zauSuk27Zi990CdrIJ1zK9Bgu8d+fiXQbJEoxPjFcP0474hEY993UtOw
	9xZWsfVEpH4UKTlebv0N0PeawqlWFwXi25SGzzjkwloLlvt1EfHVmT1B/zkRg1xDTb8l
	jQ8cCGBsy2fnumCdWAh0afaFPpD6YBd9ZTlJmybSYY1MIvmliAi6yS9Q6CgvU2QASNrN
	ifYnJbPD+LALnSguq3GPNdbnPKbGWJxdQ6HflJ+955zglUynQGEHZ2qtIu+NGmmNIvLq
	WJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h5PTRZG4sC7bgDUWyrFSffypRdXfraAMWNoi55CZEBI=;
	b=phVJlqXEXxVEZYrtNrsiTbl0T0A9f+PBoIf6js3QP0uUjlO0V3+3/C8gws2DX5IJMw
	jAnuw8sV/N3cJodDtS7a4E350Fe6u8nf5QEpHsiU7Hf1IvvLZr+TDs490w4iYEozBUNU
	IQPLSa/naKs9LTKJXjRlqgmzY9vzyl9FC4pvNeH88XbmAgjJjbG2G3K7Vv1WLpPmX5Y2
	miYn2c9g7m3vj9XyezqkpbWWI97Wp/BHlqYAZWbsC1p4+hOk0Sl6dJU7jY+uevbZt3ub
	WAJvqydcJZ5uGVeXNsaYwm54h3NE1Aj5gjUDLi0qVZRaPmXJ1UskBgmtWusLBng6rCx1
	HrWg==
X-Gm-Message-State: AHQUAubUJy5SEjcvBvIwWhFkD+08xR6L1j/2+mVcSofz5uhzXXIp/OMv
	bVsXegXGV5/rfOlwztzpFJo2A4h50KndLGvk4hs=
X-Google-Smtp-Source: AHgI3IYOJzVTl4zRMOURCcMYxAp02BM832gfq7xxc/CCw+41M7X7jorhz1WbM5hBu2JEYD7HBckv/Qg9PH/GyOqekx8=
X-Received: by 2002:a9d:7409:: with SMTP id n9mr10558075otk.326.1549732621549; 
	Sat, 09 Feb 2019 09:17:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
	<20190209131942.GD2258@jama>
	<CANNYZj96zNL+=JFny8cb5i9P2+WesPVrE0O+UbxLVQt8+5ysXQ@mail.gmail.com>
	<CA+chaQfa59P4GF8prxAcu5vbnw6NirHumYhbEWPxtFPopTJQeA@mail.gmail.com>
In-Reply-To: <CA+chaQfa59P4GF8prxAcu5vbnw6NirHumYhbEWPxtFPopTJQeA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Feb 2019 18:16:50 +0100
Message-ID: <CANNYZj_Y09VJCcxfCRo14=DiRwCd1mb-R9ymdbv1bXaKS_eGzw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 09 Feb 2019 17:17:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Feb 2019 at 18:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> It was sent to upstream (somewhere) by the original author, I haven't found it on gitlab, so I've asked original author in:
> https://bugs.gentoo.org/571124#c5

Maybe a new merge request is the quickest way to sort this. The patch
was probably sent to the virgl mailing list or privately to airlied
years ago and fell through.

Alex

