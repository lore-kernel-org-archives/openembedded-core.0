Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UZjr2-0007Au-TD
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 17:31:10 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4C93BF811DA; Tue,  7 May 2013 09:13:00 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9BCDDF81188;
	Tue,  7 May 2013 09:12:58 -0600 (MDT)
Message-ID: <518919FE.9000004@mlbassoc.com>
Date: Tue, 07 May 2013 09:13:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1367240260.14512.120.camel@phil-desktop.brightsign>
In-Reply-To: <1367240260.14512.120.camel@phil-desktop.brightsign>
Subject: Re: [PATCH] xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 07 May 2013 15:31:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-29 06:57, Phil Blundell wrote:
> Nothing in this package uses xkbcomp so depending on it here is not appropriate.
> Whatever package(s) is/are invoking that binary should be the ones to depend
> on it.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb |    1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> index ccb9f74..cf4da28 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> @@ -23,7 +23,6 @@ PR = "r0"
>
>   EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
>
> -RDEPENDS_${PN} += "xkbcomp"
>   FILES_${PN} += "${datadir}/X11/xkb"
>
>   inherit autotools pkgconfig
>

It looks like the package(s) you're referring to are the X server.
Too bad you didn't provide those patches as well as images which
use X are currently broken (at least mine are)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


