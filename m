Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 37D3B72F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2RDQSmv007691; 
	Mon, 27 Mar 2017 14:26:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KUJ_61nanfVY; Mon, 27 Mar 2017 14:26:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2RDQME9007671
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Mar 2017 14:26:24 +0100
Message-ID: <1490621182.13980.260.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 14:26:22 +0100
In-Reply-To: <2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
References: <cover.1490610854.git.liezhi.yang@windriver.com>
	<2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] bitbake.conf: add sudo to HOSTTOOLS
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
X-List-Received-Date: Mon, 27 Mar 2017 13:26:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-03-27 at 03:34 -0700, Robert Yang wrote:
> Fixed:
> $ bitbake meta-ide-support
> $ . ./tmp/environment-setup-i586-poky-linux
> $ runqemu tmp/deploy/images/qemux86/core-image-sato-
> qemux86.qemuboot.conf
> 
> [snip]
> /bin/sh: sudo: command not found
> runqemu - ERROR - Failed to setup tap device. Run runqemu-gen-tapdevs 
> to manually create.
> [snip]
> 
> The qemu can start, but the IP was wrong, this patch fixes the
> problem.
> 
> [YOCTO #11232]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fa5445b65b..0b1d8d82e0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -468,6 +468,9 @@ HOSTTOOLS += " \
>  # Tools needed to run testimage runtime image testing
>  HOSTTOOLS += "ps stty ip ssh scp ping"
>  
> +# Tools needed by runqemu in meta-ide-support environment
> +HOSTTOOLS += "sudo"
> +
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc
> socat sudo"

sudo is already in HOSTTOOLS_NONFATAL?

Cheers,

Richard

