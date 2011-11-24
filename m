Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RThIM-0001KY-FH for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 22:57:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOLonDQ030849
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 21:50:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29743-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 21:50:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOLodtE030842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 21:50:40 GMT
Message-ID: <1322171446.10928.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 21:50:46 +0000
In-Reply-To: <1a0942490d103eab0a5041806613ae16b963ae1b.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
	<1a0942490d103eab0a5041806613ae16b963ae1b.1322128489.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/4] runqemu: look for *image* to be more flexible for image names
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
X-List-Received-Date: Thu, 24 Nov 2011 21:57:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 18:08 +0800, Dexuan Cui wrote:
> From: Saul Wold <sgw@linux.intel.com>
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  scripts/runqemu |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 31e9822..a9a362f 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -114,7 +114,7 @@ while [ $i -le $# ]; do
>                  usage
>              fi
>              ;;
> -        *-image-*)
> +        *image*)
>              if [ -z "$ROOTFS" ]; then
>                  if [ -f "$arg" ]; then
>                      process_filename $arg
As I mentioned to Saul, this is a bad idea since its very close to
matching things like bzImage. I seem to remember something with a
*image* name being in deploy before and having problems with that.

Cheers,

Richard





