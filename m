Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C16D174D16
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 15:59:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53FxXiQ020025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 16:59:35 +0100
Message-ID: <cb6ee940d4d8f2b93174e3a5b9ca71701b3488e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 16:59:33 +0100
In-Reply-To: <3441eac59a1e61336e04e0bf1a50b484803c9dc7.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<3441eac59a1e61336e04e0bf1a50b484803c9dc7.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 05/16] xinetd: add Init Script Actions to xinetd script
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
X-List-Received-Date: Sun, 03 Jun 2018 15:59:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
> From: Shan Hai <shan.hai@windriver.com>
> 
> The chkconfig fails to list the xinetd service because the xinetd
> lacks Init Script Actions in it, add the actions to fix it.
> 
> Signed-off-by: Shan Hai <shan.hai@windriver.com>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-extended/xinetd/xinetd/xinetd.init | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.init
> b/meta/recipes-extended/xinetd/xinetd/xinetd.init
> index 777c2c8..a021410 100644
> --- a/meta/recipes-extended/xinetd/xinetd/xinetd.init
> +++ b/meta/recipes-extended/xinetd/xinetd/xinetd.init
> @@ -1,5 +1,15 @@
>  #!/bin/sh
> -#
> +### BEGIN INIT INFO
> +# Provides:          inetd
> +# Required-Start:    $local_fs $remote_fs
> +# Required-Stop:     $local_fs $remote_fs
> +# Should-Start:      $syslog
> +# Should-Stop:       $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: Start or stop the xinetd daemon.
> +### END INIT INFO
> +

Have we some kind of policy which says all init scripts have to have a
header like this? I'm wondering why this is just getting applied for
xinetd when there are probably other init scripts which don't have
this. Are we planning to add this everywhere?

Cheers,

Richard



