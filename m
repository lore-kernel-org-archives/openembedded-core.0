Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6806107E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 12:25:45 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t23so3012685wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=PpyEkoyi49zDw3V25jn0AEHWUfBLZsp/frEybTbkb5Q=;
	b=XWuqGoCr/qLP67nOgVhMBwGhUy+nynlQoewwo9PVy9dHsCQyWyfbfla4EifZa0cshx
	5/KbR2eGCsKnmqIQOeGqpmjF6YgUeZ5IpoV1ryLXebinyOv1b99N7cOmYIUzuKCbBXYQ
	qgapLQrTDoblUD6RY4G/nSjABTX2ANvB0U1uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PpyEkoyi49zDw3V25jn0AEHWUfBLZsp/frEybTbkb5Q=;
	b=k5yUfmifiXsRUpELTrB4d+Zw1M5HOA4Q3JkQ30YKDUykx8+oqSkx3x+Xnk2oOJr8uY
	QAkN3UVC4S90/wmXGWH160X5qf1NIr/zpZesZYZyRkuwVjuykPumu5sXUDHqbI4YKhzB
	Z3HLkf+WWj54WBIh6p2PGo7MpJX09kispwY/A9lKE3I8daFKI4S6cYlKE0cQ8OC7k6bD
	4qc2t5yUx4oqCy3AYY14FM10IDHUzwtjomgG5ugJrZ5UQ4bMviwcMVgCqvRjgUmTCy6p
	mltTvhdXVuLpM/XEwoySnQMeFfIh6rLvTeYZrZjuVwUrm8m90Wtkj/pCRVzw73NqZwBw
	n/GA==
X-Gm-Message-State: APjAAAWn0Hi5UZBevj8iDljivWqDZFpJVAbkoFlIXSVNIm8kXCU1o0Ne
	jQM42SDA6V6dS2irL5rl2tBwYw==
X-Google-Smtp-Source: APXvYqysuZvBh0vgGjL+plJVuejrnkjXxhP9jkOgM2o3i6K1ax9Og4/I9wz11Lwog/qfGD2ygdX2/Q==
X-Received: by 2002:a1c:e206:: with SMTP id z6mr4357108wmg.141.1582892746062; 
	Fri, 28 Feb 2020 04:25:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i7sm2231315wma.32.2020.02.28.04.25.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 04:25:45 -0800 (PST)
Message-ID: <d9217f0a0dbeb949494675e766ea95412363211c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pierre-Jean Texier <pjtexier@koncepto.io>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 12:25:44 +0000
In-Reply-To: <1582738506-3389-1-git-send-email-pjtexier@koncepto.io>
References: <1582738506-3389-1-git-send-email-pjtexier@koncepto.io>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v2] util-linux: upgrade 2.34 -> 2.35.1
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
X-List-Received-Date: Fri, 28 Feb 2020 12:25:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-26 at 18:35 +0100, Pierre-Jean Texier via Openembedded-core wrote:
> License-Update: add GPLv3 text in README.licensing
> 
> Also:
>  - Drop upstreamed patch
>  - Use 'disable-hwclock-gplv3' explicitly.
> 
> Since commit 7a3000f7ba548cf7d74ac77cc63fe8de228a669e ("hwclock: use parse_date function") hwclock is linked
> with parse_date.y from gnullib. This gnulib code is distributed with GPLv3.
> So, we have to use '--disable-hwclock-gplv3' to exclude this code.
> 
> See full changelog https://lore.kernel.org/util-linux/20200131095846.ogjtqrs7ai774tka@ws.net.home/T/#u
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
> Changes v1 -> v2
>  - bump to 2.35.1 instead of 2.35
>  - use disable-hwclock-gplv3 option to not use datetime parsing GPLv3 code
>  
> FYI, hwclock will be made GPLv2-only again in v2.36, see:
> 
>  - https://lore.kernel.org/util-linux/20200127202152.4jh2w4chch37wgee@ws.net.home/T/#e0c176440ca3f7b10693ff8f0afaf114b4b94405d
> 
>  meta/recipes-core/util-linux/util-linux.inc        |  3 +-
>  ...lsblk-force-to-print-PKNAME-for-partition.patch | 36 ----------------------
>  meta/recipes-core/util-linux/util-linux_2.34.bb    | 14 ---------
>  meta/recipes-core/util-linux/util-linux_2.35.1.bb  | 13 ++++++++
>  4 files changed, 15 insertions(+), 51 deletions(-)
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
>  delete mode 100644 meta/recipes-core/util-linux/util-linux_2.34.bb
>  create mode 100644 meta/recipes-core/util-linux/util-linux_2.35.1.bb

Unfortately this does seem to expose a problem with wic, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/732

which can be reproduced with:

oe-selftest -r wic.Wic2.test_expand_mbr_image

Cheers,

Richard


