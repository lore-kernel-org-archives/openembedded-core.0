Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKdIB-000453-5p for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 00:28:36 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QNLPNk028497; Tue, 26 Mar 2013 23:21:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8qDyM-oGg4wd; Tue, 26 Mar 2013 23:21:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QNLHXU028481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Mar 2013 23:21:20 GMT
Message-ID: <1364339479.28471.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Tue, 26 Mar 2013 23:11:19 +0000
In-Reply-To: <6eeac889db624cc56bbf8c569e686e717f0ae9e6.1364281933.git.Qi.Chen@windriver.com>
References: <cover.1364281933.git.Qi.Chen@windriver.com>
	<6eeac889db624cc56bbf8c569e686e717f0ae9e6.1364281933.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xserver-nodm: change start runlevel from 2 5 to 2 3 4 5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 23:28:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-26 at 15:18 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This script is intended to start at runlevel 2 3 4 5, as specified
> in its HEAD INFO area.

Perhaps the header is wrong?

> The fact that it was not started at runlevel 3 caused splash screen
> not going away when booting into runlevel 3.

I thought psplash was meant to timeout and switch to the console, or
switch there at boot completion anyway. I suspect the bug is somewhere
else.

Cheers,

Richard

> [YOCTO #3904]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../x11-common/xserver-nodm-init.bb                |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> index eab76c5..9faeb99 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> @@ -26,7 +26,7 @@ do_install() {
>  inherit update-rc.d useradd
>  
>  INITSCRIPT_NAME = "xserver-nodm"
> -INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +INITSCRIPT_PARAMS = "start 9 2 3 4 5 . stop 20 0 1 6 ."
>  
>  # Use fixed Xusername of xuser for now, this will need to be
>  # fixed if the Xusername changes from xuser




