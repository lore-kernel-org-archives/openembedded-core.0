Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id F0BC37E294
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:08:53 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 2ACF11E529D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:08:55 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 2liYTRG75riJ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:08:54 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id D74CF1E529A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:08:54 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com D74CF1E529A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558562934;
	bh=mj6k8KctX+i6naAk5n5vih6gr/xVbVCejVvwcEeyKsQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=h/q0m2S5xxYTYQ24MtPNuLpoyCPLjR8HXPSx8rSFwb0jcWnSogMkqOjDtRSACemUp
	y7cBYaKUWdZryEkFMGhoKxm9WnFYGTFh+nxCkccnxpTtHDVGrSFh03CqxIxBl9+7Te
	le2W7EyeNa3W0XfKkgDhAqvLQxHOpwISwU5nXQLkEkX8slVKd6fb1vVsnizOrcpu2P
	yJm810xWducbcDMGQzOtqj5xGyiYTZWOhYYDJjvJlrj+qBCdVJyxe3o21WwkX33YJb
	jSYxV9bFhhSCLEskcXT29TKYNXL1nfB0HVT2j4KJvyo5aFgT1+aHSog3RHzWwop3tj
	RMRhgvvs4+xrg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 2B9TKQIWbnJw
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:08:54 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id B80A81E5295
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:08:54 -0400 (EDT)
Date: Wed, 22 May 2019 18:08:54 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190522220854.GB4732@joraj-alpa>
References: <20190522220645.4412-1-jonathan.rajotte-julien@efficios.com>
MIME-Version: 1.0
In-Reply-To: <20190522220645.4412-1-jonathan.rajotte-julien@efficios.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Subject: Re: [PATCH 1/2] lttng-tools: prevent test timeout when lttng-modules is not present
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
X-List-Received-Date: Wed, 22 May 2019 22:08:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Clearly the actual patch is missing, sending v2 shortly.


On Wed, May 22, 2019 at 10:06:44PM +0000, Jonathan Rajotte wrote:
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> ---
>  meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> index a3fabb20ec..f1bb7224f3 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> @@ -39,6 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://0005-Tests-use-modprobe-to-test-for-the-presence-of-lttng.patch \
>             file://0006-Tests-check-for-lttng-modules-presence.patch \
>             file://0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch \
> +           file://0008-Fix-check-for-lttng-modules-presence-before-testing.patch \
>             "
>  
>  SRC_URI[md5sum] = "e88c521b5da6bb48a8187af633336ecc"
> -- 
> 2.17.1
> 

-- 
Jonathan Rajotte-Julien
EfficiOS

