Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qoyng-0002sY-1c for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:21:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74EH4iZ002585
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 15:17:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01749-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2011 15:17:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74EGugN002579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 15:16:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312442907-21017-1-git-send-email-galak@kernel.crashing.org>
References: <1312442907-21017-1-git-send-email-galak@kernel.crashing.org>
Date: Thu, 04 Aug 2011 15:16:36 +0100
Message-ID: <1312467396.2344.746.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] bitbake: Allow seting of baselib
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
X-List-Received-Date: Thu, 04 Aug 2011 14:21:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 02:28 -0500, Kumar Gala wrote:
> Allow for baselib to be set to something other than 'lib'.  This is useful
> for the 64-bit arch cases in which we want baselib set to 'lib64'.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6f0b42c..c50ffb9 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -7,7 +7,7 @@
>  #
>  
>  # Used by multilib code to change the library paths
> -baselib = "lib"
> +baselib = "${@d.getVar('BASE_LIB', True) or 'lib'}"
>  
>  # Path prefixes
>  export base_prefix = ""

Can you not do:

baselib_powerpc64 = "lib64"

here?

Cheers,

Richard



