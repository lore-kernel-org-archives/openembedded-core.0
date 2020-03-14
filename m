Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EDE96601D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 11:20:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48fg8W2F0Cz3L;
	Sat, 14 Mar 2020 12:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584184811;
	bh=Mvtbrw1sbbpWxaJcSpnqzNNWiv8bhobA/kUZsob9B1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8mCV44WSo/m09XYi5r7m0dSCz7J17ockPbQHw+Zfzs56lvGNdTnFwWYtv9jxdUfX
	8Lvqd7lZms7Jl8qvrzNUsBWb5sYcchowyoBBXhXaGUYs6RrQ6GIJ1fJT+p6SCgtDVH
	P4qSASI21gJ3RMrM4lEe+h8dOApelZ96qsWRm+RAieKUGJ3V4YTtMvAxtA8TW+bZoB
	YQpU+pXTdHHnwhoXnTeN8vvK/8yr628NdYXCqryBNYblR5m/yagpQp8mHHFkQxGnH7
	DPYEVBGGr3TnqvJDGqHisfYntRetTdZCoLv0sNUf+WWU950U2EA8Bke+X8ErXeeiag
	UWb5vKUCTqZIqyv/MdqwoDj7deD5A/FzHDd0FIh5zjgA3siJ3flZ1KoE+rf8zhjjQ7
	T4xlkfQ99OXMgoiNjuRCKLKzmT+fQNdkMxMgm0UJpDr9JJNHbGIk+Wzm+tscyplpSx
	mAFiloge+Z4XBReMc7ZQ3O4++L6drJTCTiOcUtIUDiQBUintCp0dqRXqQYXhe3itTj
	wHy9KrNx7p4pBeJujuTOx8fNS9vN+MQ6OtwkRQTJfZTLyJVNh3T8AtUjJRPxfepfOm
	0JhuioWStOngn9DreScBi4Jh6fpFxGH9813dAFVK/BT5sWVXgbzJajoUiGDffE17rb
	ivTOfvzPOBmlbA24FZMjPMeY=
Date: Sat, 14 Mar 2020 13:20:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: yanfei.xu@windriver.com
Message-ID: <20200314112008.GA27595@localhost>
References: <20200314110403.17437-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200314110403.17437-1-yanfei.xu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix lttng-modules build failure on some versions of kernel
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
X-List-Received-Date: Sat, 14 Mar 2020 11:20:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Mar 14, 2020 at 07:04:03PM +0800, yanfei.xu@windriver.com wrote:
>...
>  ...-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch | 97 ++++++++++++++++++++++
>  meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb  |  1 +
>  2 files changed, 98 insertions(+)
>...
> +Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/175c0c3c2ee8aae7a1185f591988f02e0e3be103]
>...

Could you submit an update to 2.11.2 instead?
This is a bugfix-only update that also fixes a dozen other issues.

Thanks
Adrian

