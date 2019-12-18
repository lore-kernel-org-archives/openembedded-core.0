Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF1977FAB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 09:56:47 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id p8so1140271iln.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6HzQiE4nk3C3ljCqZ/NtBL0ac+sUcnH1FG628oPU8x4=;
	b=CIw+lO4rhzZBsrlUP1zqna7rOW+xtGYUhUGGXSiCUw/q3uw+ik1sP1o45m1kTSmMWj
	hrCuVsbVJjWfaOnYFgmLnR5xnnHFZDUEaICJPkmOAXfIQ2Qy10b5onzNN92TQBoscRSJ
	v7qnAxq+KxvEtxw4j23yxvv7iURLOZGfA2kNZI4mwVc5cb628QZ37rB9wCg4v0l7foRs
	Exo8fdjHzBllFsrzaYTeZS58HzyJ7pHAmF4fuSbK3wlB4j6eU88+h8G6V1OPHm3uI4I+
	MWPOYq4Kxg7QrG1Ci2MfLX9pPIRjEsIlY5kXLEMH2P3xomwiJSX0ZhPX11bcmao+Qvrf
	gFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6HzQiE4nk3C3ljCqZ/NtBL0ac+sUcnH1FG628oPU8x4=;
	b=K5BuoBqsTDP1viO3EJLeQ2S6Pj6dIzzyioFZoV70apQVN8aKYZB7dXeVQriuFpso6Y
	vrQVxlJQkLzkl9iJBdq+6ThBlDM4BeAL7G9uLyrPdh5wOfi+BpLTH2I3J0OkSFSi4B4q
	u7HC7N1oHEzM2sEYomSWTR1LqGXamW/Pk/eJQSvfuY3xTV3xDdqXovNfKRxZ3/6ueZPj
	Xi2naWli5pe1G6wGq3CDvpwHxuCSm93HuoOOWIA4pClFtxlOrql7Zieb9exDsovTzU7D
	rfVohiZqYXFFsy02BPS3/v2fyv0aVwfA9/35DeTWWo8JNer7ywIUmnuqeCqHsG4IUqCf
	kWlg==
X-Gm-Message-State: APjAAAVFSPSpDr/sppwzwx+vk3fbZgw3ydcHOH+UCxXytUkJxHgNkkDu
	hJRnizDFBULuBEhB9/AzSJmivo7pOPfctzIH6vU=
X-Google-Smtp-Source: APXvYqxKNSLIJaBxN3cR2z8hrdEThcCgLOoVfPTSzihOHJy5PxtxmTHxvXrrqzLiNzdTtIidKrl9sMXSGrVEkoE6vTI=
X-Received: by 2002:a92:1a0a:: with SMTP id a10mr1006092ila.295.1576663008792; 
	Wed, 18 Dec 2019 01:56:48 -0800 (PST)
MIME-Version: 1.0
References: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
In-Reply-To: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Dec 2019 09:56:38 +0000
Message-ID: <CAO5Uq5Qh6qeb6-xeVF1L5rossans0zWVjGiBuwnS_Gb8mt_JUg@mail.gmail.com>
To: Daisuke Yamane <yamane07ynct@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] u-boot-fw-utils: Backport a patch for out-of-tree builds
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
X-List-Received-Date: Wed, 18 Dec 2019 09:56:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 18, 2019 at 8:43 AM Daisuke Yamane <yamane07ynct@gmail.com> wrote:
>
> This patch fixs the following error when ${S} != ${B}:
> | cp: cannot create regular file 'tools/version.h': No such file or directory
>
> Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>

I don't think backporting this makes sense as we'll only be dropping
it in January when 2020.01 gets released. I'd just move to the -rc5
tag which includes this upstream change and then apply your other out
of tree fixes on top of it.


--
Alex Kiernan

