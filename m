Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVfJX-0000rN-Qn
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 11:51:40 +0200
Message-ID: <517A49FE.5020702@communistcode.co.uk>
Date: Fri, 26 Apr 2013 10:33:50 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1366963623-13626-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1366963623-13626-1-git-send-email-B40290@freescale.com>
Subject: Re: [PATCH] connman: tist of connman do not support powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 09:51:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/04/13 09:07, Chunrong Guo wrote:
>      connman build for powerpc 64bit boards were producing errors like this:
>      | make[1]: *** [plugins/plugins_tist_la-tist.lo] Error 1
>      | make[1]: *** Waiting for unfinished jobs....
>      | make: *** [all] Error 2
>      | ERROR: oe_runmake failed
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 589ece8..5389f3a 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,10 +20,11 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>               ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>               "
>   
> -INC_PR = "r19"
> +INC_PR = "r20"
>   
>   TIST = "--enable-tist"
>   TIST_powerpc = ""
> +TIST_powerpc64 = ""
>   
>   EXTRA_OECONF += "\
>       ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \

Is there a reason that we need to specifically enable TIST at all? This 
is quoted from one of the developers on the ConnMan list:

> it is special hardware where we need this plugin for. As I said, I was considering to remove the plugin actually. So it is safe to > disable this plugin.

> By default this plugin is actually disabled. And we do not even build test it for the releases.

I think if anyone needs it, shout up; otherwise we should go with the default and disable it.

Cheers,
Jack.
-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



