Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 335ED6C5B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:49:06 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id k98so8687184otk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=ZLI4UQh2NG4dvbmDM7j5FRI8bxwRrd01PusHgS1dNpM=;
	b=vlxtJc8hZGjqFO1PtrIJj8k8/JaoKI8lT/B5VYmgoK3EowsRq8X9AjvGyCaIpJp5PL
	Udosz+GuCPjoYnujGCmfG/84Gxbsph7cR+HnQJXRqi+Q4u2OXWttGUq1nGG4ToRUjg7l
	lxabfciDZErDoVI2jHQlb2usOC7wjdmyF6D3NBavGfe/xw2FqtmgKmBsL/aOXAAvR0Hm
	TC2XZdPk+3q0gKF1PXREDIDQ/E3qrL1ILflWFL+oMqCdJbIWumV3Y88jtphT2zskIJqS
	aXjat++fs+be4U22yNKRCpryhCJCKlBdrsbHkRinA72nQcTjlU09Ery1HhGPaL05sRnA
	fE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=ZLI4UQh2NG4dvbmDM7j5FRI8bxwRrd01PusHgS1dNpM=;
	b=JTyS+X2AOYCuzG0hpov2oIcNqr0iciOY1UUAj0ysuYDgWyJWS7lJwEX4T7PsMshotj
	CTsVBBc905foy6TRuv/d0FpNokPOFj5vZfSZV7Sik9UF10fpqtnpoX/uABd4TS2tsrI4
	IGarquJ9pzHbPH//FFPrVTAO/iaL2nCsvK+yIpK/Jeg6Eh/MIefA1vn26dr1EByjxTM7
	WGIIQEJft4QFiHHf4P5igbilPlZ3Vw60EosR+trOQ+sgOj7S9e7mk/L8Uon+gb2+FvO4
	SSqLV6oeSozYBwgE16ntn7lp4wkQWL7SpwvgwNfBEfPJC9gb4W+hnuuzpqithCWXj2/e
	alLw==
X-Gm-Message-State: AA+aEWZJpOu51ohDdD5Ab2flOG0MvAkliRNjWt9xEwJZhQLJVB+v9Zdx
	jArFkwYEjrZP9QwckclPUTK0OL8E0XorJA==
X-Google-Smtp-Source: AFSGD/XWj5AbTGa8d2+8uymONa0H+MG4i5GjxXn/+PprODkmRd2j+1W3Jw/ayX8dUoDfAH9VELaS4g==
X-Received: by 2002:a9d:d23:: with SMTP id 32mr6572805oti.328.1542908947301;
	Thu, 22 Nov 2018 09:49:07 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
	[209.85.167.172]) by smtp.gmail.com with ESMTPSA id
	k189-v6sm16928417oif.28.2018.11.22.09.49.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 09:49:05 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f172.google.com with SMTP id u18so8031035oie.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:49:04 -0800 (PST)
X-Received: by 2002:aca:ad14:: with SMTP id w20mr5775137oie.3.1542908944233;
	Thu, 22 Nov 2018 09:49:04 -0800 (PST)
MIME-Version: 1.0
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
	<CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
	<CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
	<CAJTo0LZX253PH2xBQOANZ5rJ35wvDGKO7We2s-XBJjZy594GPA@mail.gmail.com>
	<1510838076.3952.166.camel@linuxfoundation.org>
	<CAP9ODKr1vkw06=21Y=_+kU5jVk5HUa9h7PYp9ysxKht8WkKeCA@mail.gmail.com>
	<CA+chaQeD-7iKVrt9Ko=2Qx5ee0PEu_8CJCPtsvK3OhoK2mv6yg@mail.gmail.com>
In-Reply-To: <CA+chaQeD-7iKVrt9Ko=2Qx5ee0PEu_8CJCPtsvK3OhoK2mv6yg@mail.gmail.com>
Date: Thu, 22 Nov 2018 15:48:51 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr0RZzWzWH_3h-=a7aKUQtWh0pdbWDggP=qy-RTky8kZg@mail.gmail.com>
Message-ID: <CAP9ODKr0RZzWzWH_3h-=a7aKUQtWh0pdbWDggP=qy-RTky8kZg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Thu, 22 Nov 2018 17:49:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 22, 2018 at 3:40 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> I was just hit by this issue as well, we're using VirtualBox instead of QEmu, so of course we were missing "-device virtio-rng-pci" and I haven't found some equivalent of this for VirtualBox.
>
> Adding rng-tools back to our images allows to use ssh again (without rng-tools sshd never started because ssh-keygen got stuck trying to read /dev/random).
>
> I don't know how many people are using VirtualBox or docker to run qemu images built with OE, but it's probably worth mentioning in 2.6 release notes.

Agreed :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

