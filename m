Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 91F416BBE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:45:46 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id e80so8712241ote.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 02:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nKrksMtLX3cRX2APBJ5kvRK9OPsa10mAQ2MLjbu1Nms=;
	b=R2zvG37pKiOXPSphTl8gdtyPUukZSPmxfoirKUIVJG2jN7JbeYV5gbW7qowHJGvGE6
	8MoFlRht2VagdUzcXCI6WB7Mpv4V3dKUUPWxoRsUUnFwbyqjyC5gOrPOj2wCPLg2Xb4O
	Ggx7kLqva837m0qqMasYXgX62wKi79SgwF8VbQ7R3Jf6tGwBt+kb4uMj6HKDAv/SwHoz
	xNAFCoXmOHgYFZBmM6xDJm85vUyRqpKaDPB6IRVZhJo9JYrqIbfj/zTpoPtlFqA+KcIs
	r31UwVH/NkQ7VP3Wf/7Krma3tAfZjV14V9cFS1QwC4HuS4Y4idUd0Cp2SbrXMUsHxgB2
	NP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nKrksMtLX3cRX2APBJ5kvRK9OPsa10mAQ2MLjbu1Nms=;
	b=MfpwrsFUKrSsXwxOAP6sHkdaHQTXoqPOI6PeRPTsKvtww4pEMO2SouCOSic8umWyVu
	nHbmYbfUslLZYc12YTy//PywjwwktSagna3dZ1JJaQJFFva6enDTV2SWbu30G36nzlIY
	G4QXhFmv23qUpSR0b4kFdmdxsTSYgcdpHPLiUrob6J9mTTGL4hLNb3cCcNyGMHwR4QnM
	jP+UEOcrTeVHX8SPKImXxWmlgqgXzBN6Ih22Mm0Qxw1Y56f8lW6XbZXwi1FEXY2BbJQS
	lBhcY0xdLmTBlJga9A5LeoUmrp8AvTw6KmeezuqY8O47nnSAdAAx5EV7pz5cmFrJo5Ua
	hwjg==
X-Gm-Message-State: APjAAAWwZMozhpgLAQhRfGiKchzcoedhMLp+Qlz8sV7JLcEzCLENpUsb
	r6rdp8jhXrfPr5J2oXY1CihHba2uwCVqT6BIfg0=
X-Google-Smtp-Source: APXvYqyb8yYbIaGZ7LfdbttxSccwnadFWaaBCGZ70/3JnDEpbQXevRTG+CchbsHP9Ql0yD0fZp2C57PpURdaIAKKPFo=
X-Received: by 2002:a9d:6c0b:: with SMTP id f11mr10604198otq.293.1552902347525;
	Mon, 18 Mar 2019 02:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <ec5b47cb57324ee89e4f18785264d97e@XBOX04.axis.com>
In-Reply-To: <ec5b47cb57324ee89e4f18785264d97e@XBOX04.axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2019 10:45:36 +0100
Message-ID: <CANNYZj8he2xQbDLksx-qqPJSie9mW3=ttvxAxpD_9ANLJtBO8A@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Where are the mails from patchwork (was: RE: [PATCH] [PATCH] openssl:upgrade to 1.1.1b)
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
X-List-Received-Date: Mon, 18 Mar 2019 09:45:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2019 at 10:37, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> Whatever happened to the mails from patchwork that used to
> automatically complain about things like this with:
>
> * Issue             LIC_FILES_CHKSUM changed on target openssl but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned]
>   Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
>   Current checksum file://LICENCE;md5=d57d511030c9d66ef5f5966bee5a7eff
>   New checksum     file://LICENCE;md5=d343e62fc9c833710bbbed25f27364c8

Anibal, can you check this please?

Alex

