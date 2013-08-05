Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5E33E6B2FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 11:45:22 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so2954848vea.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 04:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=vqo+0nbBTcZVwyBSB8BX5ndN20Lx7qzMkKIN8doTqe0=;
	b=orJWJkBj+o4StF2z2v4pJrzUHLMHDyqeIGo4Rion+xXIFXfuz160kK/bRKYUAfv8yU
	inScmCnyNMmlG0YJMEYBGYA63nTOCRBRYnD8RChYDye7KAEEdroCtiepiBUUfFoA+YYQ
	HXpHuGt0NkwN2RSJo6Q0ALf6/M97ZdzHcG+a6RUDtdQjGiz40wuDdtSv9FxM74dYc+P9
	P1+3bz7KJkvnzIuDnJk9xPmDQJy+AHyBGnOkqqYURqG3v0Kc2Es9Ll7rxN00NdYFMFwN
	q955aj1eJ1F7LKd2bWjVmkJb51qIC4g+yxHW4wa4oS192Kvc79kJacU0PUCQaNpizkRm
	a+oA==
X-Received: by 10.58.181.225 with SMTP id dz1mr5665299vec.95.1375703122744;
	Mon, 05 Aug 2013 04:45:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 5 Aug 2013 04:45:02 -0700 (PDT)
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Aug 2013 12:45:02 +0100
Message-ID: <CAJTo0LYTjnD32wbx2HUEQuXNiJGnjhZWYmQ3PGvfEaYjACr1fQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQkyXoN03H0uggUOgbtiXqvJc0cK6g/mU1M0VqSSrBta3WzYwlR7VUWafZ8pZXpz83rDykhO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] PUs for telepathy and gstreamer1.0
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
X-List-Received-Date: Mon, 05 Aug 2013 11:45:22 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2013 16:39, Cristian Iorga <cristian.iorga@intel.com> wrote:
> Cristian Iorga (7):
>   telepathy-mission-control: upgrade to v5.15.0
>   telepathy-idle: upgrade to v0.1.16
>   gstreamer1.0: upgrade to v1.0.9
>   gstreamer1.0-plugins-base: upgrade to v1.0.9
>   gstreamer1.0-plugins-good: upgrade to v1.0.9
>   gstreamer1.0-libav: upgrade to v1.0.9
>   gstreamer1.0-plugins-bad: upgrade to v1.0.9

Build tested and verified buildhistory.

In another commit can you add an INSANE_SKIP for the text-rel warnings
in gstreamer1.0-libav?  That's a known issue with libav afaik.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

