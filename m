Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 01A4E7C2F6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 16:43:21 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n8so11014868otl.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yli4xoLJ6teg9Si2VMcwT0cnn85/vJqHwMyo0RXaVLM=;
	b=qr5zyQhQ7N8RLdNUt6z5Uun+tKzbQJJmBJDmEEcK6w8dfRT8nePa6sdBVDKKrBl1iQ
	jRSHK+Nd4J2RKZcGnUY7r4ZE77yb8YNiMVEYfMgQL6a5E5ArC7EyXRFq3tE/w2GNatx3
	sENGJZOHbI70XGJVGA1szZOvqMNrPtfASK10f10S3YI3alDY6MlI2+THWjh6oQomPf6B
	4Fog/g3EIOMq12i4J30PaLzIacwnPZ6DDeVQTI5+ciZvWjjqznmEbTo/Lvn1KNpFlAH2
	h7rF2fKngqkLoDMSgzveStWplqHJR8KULtczy5AlQg3VGBn159B3RbEAPhbKpLe7HuMg
	UnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yli4xoLJ6teg9Si2VMcwT0cnn85/vJqHwMyo0RXaVLM=;
	b=sLWoR2bVq1n43v2MsdpOBO/8jK4CgnqFbZ3LnBJP+qoxu0TVsgbWqjZXlbQL2T2IQm
	EimCICWNqeEClU+mvo/NpGanuO4Py76dHvhRiRGTWI9V96KI2Sm1maQhFMytwoXBEtfT
	ocdzSJMznWhJLIIXnPj2F7/9Ij9H3a3okH4RT/7fTzS2wMJEjvMFbhnIwz6tWIuQLw1D
	HQDpxWWsNLKcOk2SPhV2BnkcJ5kEn3JbhYU/DNFT6j0InUq9T2FAUEiDCzUltApb7wJe
	U5dhfimsmoUl9AmFajj8S69xIZDn5nEbPMUhefp4VFV24bmKrOCchMFuO66HgAex+3Qi
	0TOw==
X-Gm-Message-State: AHQUAuYuOO2rsWR7w5UrgwkYZ/PsHA9V2MoUEsE0pOaW7DxZgsfhzS4Z
	bpEdYNutDLVC1qG8k1kYrnE7zw3KWTE245Z0TUqpWXshkY8=
X-Google-Smtp-Source: AHgI3Ib/yCD4FDsbxRKvD8MJUwFzdTMm0YprG+NgQ8JQH1HI/KQXH5MMOJU4dv9F4qHOAdwNftL0cpMfpSJ36eD5KPg=
X-Received: by 2002:a9d:6a91:: with SMTP id l17mr9145024otq.354.1549730602732; 
	Sat, 09 Feb 2019 08:43:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
	<20190209131942.GD2258@jama>
In-Reply-To: <20190209131942.GD2258@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Feb 2019 17:43:05 +0100
Message-ID: <CANNYZj96zNL+=JFny8cb5i9P2+WesPVrE0O+UbxLVQt8+5ysXQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 Feb 2019 16:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Feb 2019 at 14:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> The fix from
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/qemu&id=c29d4ccfe0a5f53c49883e55c2c2bb444997b1cf
> is still applicable and fixes this.

Somehow the issue does not show up in plain poky, but the fix seems
right. Can you send it upstream via
https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests
please?

Alex

