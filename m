Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 71883617B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QQMN549cz2J;
	Sun, 23 Feb 2020 14:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582462928;
	bh=5kHo4w33cV7+Q8yq1x2a9zzmk42ky6PwIuL40nSaHa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMO/5OedzAcye/4QYc7UMfgaYedo15f+JsIekxEN6EKTsf4LyICjl/ukv1juVncpl
	9QCSiWt0ZtoSPiP7A1UQR7jXhTckEf/0xhnmQpX91gUAFioLYfmz03SVZEc4uyXDwC
	yTkjKnZlL/D6f/+8CNYDnZOb82D4i44C/vrfh+Sfhv4SqXCH5TbDqPYj0SFcDcZwhR
	bSYN2Ita+mryQagu9ED7RLSp7LMbGBsa6LVE9IbgHDKlSjul7naxebsMa0q7InDfLy
	jf53NAtqBiCdaS57iB8wX9AKFf/CgHNvguIoiWM5H6xh0Z72UvJb77rRCnwua+e/5Z
	oj1mniU+abSkSxCHGVqtA1i04sNuMwcGFCp7MHBrewo9qbkbENfsCPYh0rDLypVCZT
	HDuiFt0DlfKEfO7ku5Q7UlHfoAwc8ZRGYSd6VKgBg+QrvagxoHKeL0NW/wzSnm5gqH
	Wbh8lW5rmLbzl+hkys+0O5J2uJQur/EaED8glixABIahIjk23xwsTCwkrXZr/r9KA1
	OeMOAq3RIus0gwJTlkDNpkqeSG/LOry/cl7+z9Bw3AEPosMV9zLkrVPjBBcWQcfpMA
	fmInIhA/mQ3kY5e4ZMTzkHwzHuw1mc+XV9YXzC1kMFWRLS100KjzGNwZU+gCvbm/i9
	GlIJcR4O0iOfeC6EMGzBx6QA=
Date: Sun, 23 Feb 2020 15:02:06 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200223130206.GE9628@localhost>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-2-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200219194752.7967-2-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/13] webkitgtk: x11 and wayland are not mutually exclusive
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
X-List-Received-Date: Sun, 23 Feb 2020 13:02:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 19, 2020 at 08:47:41PM +0100, Alexander Kanavin wrote:
> Also enabling wayland if x11 is not enabled is not necessarily
> the correct decision.
>...
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
>...

Not a new issue, but I guess something should change regarding the
  REQUIRED_DISTRO_FEATURES = "x11 opengl"

cu
Adrian

