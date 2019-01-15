Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5B63A7C07F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:33:48 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id k98so2471420otk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XdedBrX00FALyPHQuObU0gNmA5XNZr08/ocjCfwJeN4=;
	b=nrJ6tJAWrDsNQEkvHVcDBUfyJ2bf40d+WkBnVQRSVV9CGmLEO/njH1+sG1RrHJU+JM
	zA02xXwGOum3DskqLIQCXuvts/LCAxA2+sQkwUjlM57LBeJ4JudD8hDuc9URkOv6rLtq
	N8UNvvvAGFOE+1ItKFMvee9tXcezIgA5UWZtokIlgGfhC6CilH1XeapooxBoe2ULTsCs
	1zPwnMYrhWaT/ViNJlvfGZLbDeaGYQkI2g7UL/KPZTdCRjeWcizd6ovXLVIS5ywgF/SI
	R5uWDS2pXyCb1XCWYjN7XDm2OnvvDlYLSb/ONx+bYo8w76VklzWW0oxbBuiJQULiLjj8
	4aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XdedBrX00FALyPHQuObU0gNmA5XNZr08/ocjCfwJeN4=;
	b=AKR2RdDLgK693cYPuSCoEa7eDw3DMfZdvTp5FtKp3HncJD6JXvOCXo9WPScq7aEvff
	FThPmMAVhlzSlx1Me4EBKeCEoau2YM64GArBiSttefaL0uHNM/x27yCi7dfI0UUEf3gb
	W9sxeR1vlZM3u5Pee/99ZwtGayYlVgc++1xHThfoQUlrpTbGrLN4NJxawBV1DWkbRkdl
	jGF+1Ajb9SHbEnKOJMzNgdpEF1qrxLCKCMI4hjR7K8LQMObYfEGV4JLEG+d5edYfxD17
	unrnEkajUyyoPajops4kiWgGcSBtfAUTZaMYqgIXc+bBSmFZnnpG1DG69sX7mG41Hhsa
	pw6Q==
X-Gm-Message-State: AJcUukdo6aeFTP9VO/C4zokUOcpuIEDKEP5iRGeJx3ZnCmQe+J0Mctgh
	9cpgiP0gT0LJpHZ9ExFM5dGp4IS/ItbakzcfSu3bsA==
X-Google-Smtp-Source: ALg8bN7a9CzVOq2r3/mvE5em+g7dXhQKhv3UDAFQNY3jg1pg7B942sXnHoYtguV2qfW2QOpYq/VvIrv+DJdLiSJVljI=
X-Received: by 2002:a9d:c06:: with SMTP id 6mr2484539otr.326.1547559229434;
	Tue, 15 Jan 2019 05:33:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<99e575ab7a408574f429e990a4296fec36f34b6e.1547477793.git.alex.kanavin@gmail.com>
	<CAJTo0Lbex1kRg1AOjizNB+n0dubLRyU1jB_2g1E2QxtjEfux8A@mail.gmail.com>
In-Reply-To: <CAJTo0Lbex1kRg1AOjizNB+n0dubLRyU1jB_2g1E2QxtjEfux8A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 14:33:38 +0100
Message-ID: <CANNYZj_A7xeZSazRuOJv=3ZYyRS5ELztyh2_3vHi1CcnhB_Hxw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/23] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Tue, 15 Jan 2019 13:33:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jan 2019 at 17:05, Burton, Ross <ross.burton@intel.com> wrote:
> Rationale please.

We do not support g-i for nativesdk, neverthless atk tries and fails.
I added this to the commit message.

Alex

Alex

