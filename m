Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TFTzx-0004Al-8y for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 20:00:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MHjq8h011253;
	Sat, 22 Sep 2012 18:45:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01554-09; Sat, 22 Sep 2012 18:45:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MHjjqn011234
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 22 Sep 2012 18:45:46 +0100
Message-ID: <1348335944.10108.211.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Sep 2012 18:45:44 +0100
In-Reply-To: <5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
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
X-List-Received-Date: Sat, 22 Sep 2012 18:00:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
> * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAULTTUNE
> * this way xscale or arm926ejs is not used by default when some machine
>   includes its tune*.inc, but it's easy for DISTRO to say it wants
>   OPTDEFAULTTUNE for some packages or always (if they don't want to
>   share built packages between xscale and arm926ejs).
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf                       | 1 +
>  meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
>  meta/conf/machine/include/tune-xscale.inc    | 3 ++-
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9b41749..e433fcb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -95,6 +95,7 @@ HOST_LD_ARCH = "${TARGET_LD_ARCH}"
>  HOST_AS_ARCH = "${TARGET_AS_ARCH}"
>  HOST_EXEEXT = ""
>  
> +OPTDEFAULTTUNE ??= "${DEFAULTTUNE}"
>  TUNE_ARCH ??= "INVALID"
>  TUNE_CCARGS ??= ""
>  TUNE_LDARGS ??= ""

As I've said previously, I do not think OPTDEFAULTTUNE is clear in usage
or in meaning and we need to find a better solution. I'm therefore not
keen on this change.

I also still think this is a distro packaging issue and should be solved
by the distro, even if that means more complexity there. That is the
right place for this particular complexity IMO. I'm happy to support
that from the core but not in something as user visible and confusing as
this variable.

Cheers,

Richard




