Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRNSU-0004mJ-HL for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 13:50:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VBksCU013145
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 12:46:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12651-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 12:46:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VBkknY013139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 12:46:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306841344.2525.484.camel@phil-desktop>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306405632.2525.306.camel@phil-desktop>
	<1306841344.2525.484.camel@phil-desktop>
Date: Tue, 31 May 2011 12:46:31 +0100
Message-ID: <1306842391.27470.352.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] prelink: remove dependency on transfig-native
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
X-List-Received-Date: Tue, 31 May 2011 11:50:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 12:29 +0100, Phil Blundell wrote:
> Per http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003179.html
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-devtools/prelink/prelink_git.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb
> b/meta/recipes-devtools/prelink/prelink_git.bb
> index 44aac2d..1eea30a 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -1,6 +1,7 @@
>  SECTION = "devel"
>  # Need binutils for libiberty.a
> -DEPENDS = "elfutils binutils transfig-native"
> +# Would need transfig-native for documentation if it wasn't disabled
> +DEPENDS = "elfutils binutils"
>  SUMMARY = "An ELF prelinking utility"
>  DESCRIPTION = "The prelink package contains a utility which modifies
> ELF shared libraries \
>  and executables, so that far fewer relocations need to be resolved at \

Applied to master, thanks.

Please don't send line wrapped patches though ;-)

Cheers,

Richard



