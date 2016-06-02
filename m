Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 2F09577410
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 14:41:59 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1b8Tos-0007Cd-O1; Thu, 02 Jun 2016 16:41:58 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <1456177012-8588-1-git-send-email-raj.khem@gmail.com>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <575045B6.2010200@pengutronix.de>
Date: Thu, 2 Jun 2016 16:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1456177012-8588-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/4] Upgrade systemd to 229
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
X-List-Received-Date: Thu, 02 Jun 2016 14:42:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 02/22/2016 10:36 PM, Khem Raj wrote:
> diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_229.bb
> similarity index 93%
> rename from meta/recipes-core/systemd/systemd_228.bb
> rename to meta/recipes-core/systemd/systemd_229.bb
> index b160816..16af0ac 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_229.bb
> @@ -24,35 +24,40 @@ SECTION = "base/shell"
>
>   inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion
>
> -SRCREV = "dd050decb6ad131ebdeabb71c4f9ecb4733269c0"
> +SRCREV = "714c62b46379abb7558c544665522aca91691e10"
>
> -PV = "228+git${SRCPV}"
> +PV = "229+git${SRCPV}"

While checking systemd version for trying to update to 230 here, I 
discovered that your SRCREV does not match the v229 tag! It is a bunch 
of commits past v229 (unlike, for example the 228 SRCREV which did 
exactly match the v228 tag.).

Was that done on purpose?


Regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


