Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 431E06FEF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:37:35 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 184so45945895pff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=b9B/mNJL/bX04nHE/Kzfd5PBNb76SIBaXGtkVi/ueHY=;
	b=TfsqC38jJzqIv1nBJDuYaQ4/zENeA5zCZv2h2pMhgbiGTAs0zKFV0j5yTEQRx33Psq
	HxlWGqFfKnNp1JiRzfIjk2XOoU3Vo4nLRNgkxmrXpyZrIksCPof4d5KttXjoxvoroRHt
	zfJdNozFw8TsxYtJ6muBAOXQRAwjrlH6kz9sUoZolbYWmSdBEAVZtJf/tq2+RjMdKdeM
	e7NvBXZgQNOqsmW64EctiKnQKVWT8C2MzQtXeWuN0hmvuLkEGGLG0QWUNeX5mKGlCEfR
	sdlxKWHS1o4DWpHslBqCz9pywDDKpoPBEu2pSZloPSYSfblBXsXOjJ2lPcSSiEEaK4bZ
	MvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=b9B/mNJL/bX04nHE/Kzfd5PBNb76SIBaXGtkVi/ueHY=;
	b=EcLy+MVB07mR3X0qPn7IToTEfRCrfgqzauBD1jZ4hqnLblmncX9D0Xj5qg7bD2absc
	jwU1KJUjip90P9EjfbkQV+Nyv6bOIve7jlYeZb3FivvM2evj32hOtAJlKsyw1/3q2PtE
	HFnN6wnZtBiYXCxBdU6wV3S8WDWUucc4n1QjLsPZwnevYVM2gXmIU/l+J7CJRXFozExQ
	zp6nl6DWNf1t5UjP5Xj+VG8vRRwTOarA7sZ+ATGgPj9V9ZsYxIyZVbSm+HbaDJvHUPy5
	AF0GG3tphXcoAQY2GVHlUahQiFwZ5bJe7EPnStTSO+QemjQbQoC/v/eT6sybqaK4m2hR
	EPwQ==
X-Gm-Message-State: AOPr4FXvNFAjAZlj/djF0OewK8bFtZBhczyVc0ZyYZm467W5Cc4S6SbV52GWz9Zf2W7EIA==
X-Received: by 10.98.19.2 with SMTP id b2mr20796168pfj.93.1460637456342;
	Thu, 14 Apr 2016 05:37:36 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	f66sm57790917pff.8.2016.04.14.05.37.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Apr 2016 05:37:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f51.google.com with SMTP id zm5so44728265pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 05:37:34 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.65.169 with SMTP id y9mr20852386pas.102.1460637454315;
	Thu, 14 Apr 2016 05:37:34 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 14 Apr 2016 05:37:34 -0700 (PDT)
In-Reply-To: <1460626004-27458-1-git-send-email-zhenhua.luo@nxp.com>
References: <1460626004-27458-1-git-send-email-zhenhua.luo@nxp.com>
Date: Thu, 14 Apr 2016 09:37:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq+xMa7fRK52NZWLfxYkOHovsdN91QTQuWCQqH9Ygomkg@mail.gmail.com>
Message-ID: <CAP9ODKq+xMa7fRK52NZWLfxYkOHovsdN91QTQuWCQqH9Ygomkg@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master/krogoth][oe-core PATCH] meta/classes/qemu.bbclass: set -cpu of ppce5500/ppce6500 to e500mc
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
X-List-Received-Date: Thu, 14 Apr 2016 12:37:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 6:26 AM, Zhenhua Luo <zhenhua.luo@nxp.com> wrote:
> The e5500 and e6500 cpu types are not supported by native qemu, set the value
> of -cpu to e500mc. Without this change, build will fail for packages which use
> qemuwrapper in compile phase due to the following error.
> | Unable to find CPU definition
>
> e.g. gobject-introspection
>
> Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

