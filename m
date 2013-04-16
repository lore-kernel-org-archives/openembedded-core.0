Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1US8Tk-00026r-6E for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 18:11:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GFsKi6011089; Tue, 16 Apr 2013 16:54:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id njTdVpjFbNNH; Tue, 16 Apr 2013 16:54:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GFsGb5011081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 16:54:17 +0100
Message-ID: <1366127627.8670.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 16:53:47 +0100
In-Reply-To: <1366112971-3644-1-git-send-email-koen@dominion.thruhere.net>
References: <1366112971-3644-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] seperatebuilddir.inc: disable seperate build dir for consolekit
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
X-List-Received-Date: Tue, 16 Apr 2013 16:12:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-16 at 13:49 +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/distro/include/seperatebuilddir.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
> index a9ca240..f60dc5c 100644
> --- a/meta/conf/distro/include/seperatebuilddir.inc
> +++ b/meta/conf/distro/include/seperatebuilddir.inc
> @@ -78,7 +78,9 @@ B_pn-compositeproto = "${SEPB}"
>  B_pn-compositeproto-native = "${SEPB}"
>  #B_pn-connman = "${SEPB}"
>  #B_pn-connman-gnome = "${SEPB}"
> -B_pn-consolekit = "${SEPB}"
> +#B_pn-consolekit = "${SEPB}"
> +#| /build/setup-scripts/build/tmp-angstrom_next-eglibc/work/cortexa8hf-vfp-neon-angstrom-linux-gnueabi/consolekit/0.4.5-r10/ConsoleKit-0.4.5/pam-ck-connector/pam-ck-connector.c:64:26: fatal error: ck-connector.h: No such file or directory
> +#| compilation terminated.
>  B_pn-console-tools = "${SEPB}"
>  B_pn-coreutils = "${SEPB}"
>  B_pn-coreutils-native = "${SEPB}"

Neither my local builds or the autobuilder see this. Any idea why some
builds would fail and others would work?

Cheers,

Richard



