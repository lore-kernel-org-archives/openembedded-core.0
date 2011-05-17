Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMKeV-0001Gl-0g for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:49:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDkdsi016902;
	Tue, 17 May 2011 14:46:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16645-05; Tue, 17 May 2011 14:46:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDkVRD016896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2011 14:46:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305635487.2429.196.camel@phil-desktop>
References: <1305635487.2429.196.camel@phil-desktop>
Date: Tue, 17 May 2011 14:46:30 +0100
Message-ID: <1305639990.3424.232.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@www.linuxtogo.org
Subject: Re: [PATCH] image.bbclass: use soft assignment for LDCONFIGDEPEND
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2011 13:49:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 13:31 +0100, Phil Blundell wrote:
> This allows distros that don't want ldconfig to turn it off.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/image.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index b2325b3..346dd5e 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -23,7 +23,7 @@ PID = "${@os.getpid()}"
> 
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> -LDCONFIGDEPEND = "ldconfig-native:do_populate_sysroot"
> +LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
>  LDCONFIGDEPEND_linux-uclibc = ""
>  LDCONFIGDEPEND_linux-uclibceabi = ""
> 

Applied, thanks (when I can push to the repo).

Cheers,

Richard



