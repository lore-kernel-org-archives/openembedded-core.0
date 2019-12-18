Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2354D6B50B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 23:10:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47dW1w6jMLzLW;
	Thu, 19 Dec 2019 00:10:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576710613;
	bh=znohw30t7x7qIaUyW4K6Tt0kVbGbN6/Hj3+Rk8xZ190=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qke6tRHvBmzuSktsxCrQOaQ7lvR9WF16NL0TfGOqLrS6FF+pqXXKy+a1WN1FyAMA9
	pU+QNrdcGv9/QzBUKhV/Wwn+Dx7gL1rX48rOhYslZBphETdKIcB8U8U1L7jd5soVJm
	Zk+0qx7XUla1PhwfTY/SC+s9Qjad8JrJcrXa6WM4dyHNjPxigw7KbrmcKrquOw8VbI
	52CtpcPV0dQfQjYAFqEU47FlluBOaYcI3OeQ55pwXWRGgWjzmB6GOMMK4zmzTCq/DM
	PocF/oFLYyqLhLp/2navjh9nuJ4tW37JiCeFYrGEADj0f9YXmsXIyTvmdbsH71aAcQ
	UnMh/BfbttzZPAgibQi2t7TJ26eqFRi7ia58GQfvlV4dmsXlxaFhJB2SGQ7Nn+urbS
	RK3hzJV6KX8Gz2Ra9mCbRnZe4lgombbZVr1Nvqg8zcx7ny7Qml8rUeHXsIhxB72Ima
	0o3C/iWoBP4QO9HAUTk4Qv+AI5TASmPG48GFg5Z5dTNF/vMCJR2Z+Dgn4uuP+xEh/c
	Vn4lbHkomOcHvhUCBTh3neUjPRZe4rlpidDoj38Yvzphm4D/lCC92PPURCo0LE2FpZ
	FX+UF8AlRhodtCam4PuqPnqMdCzO0mpvRwClZ2YKeuwkd1XMcak/Gu3eotBgvXmgB6
	jt16v7rYI2JPKEjpTfhZ7ek0=
Date: Thu, 19 Dec 2019 01:10:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191218231010.GA11130@localhost>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-25-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191218143758.129308-25-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 25/25] sysprof: move recipe to meta-oe
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
X-List-Received-Date: Wed, 18 Dec 2019 23:10:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 18, 2019 at 03:37:58PM +0100, Alexander Kanavin wrote:
>...
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
> -PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
> +PROFILE_TOOLS_X = ""
>  # sysprof doesn't support aarch64 and nios2
>  PROFILE_TOOLS_X_aarch64 = ""
>  PROFILE_TOOLS_X_nios2 = ""
>...

PROFILE_TOOLS_X is now always empty and should be removed.

cu
Adrian

