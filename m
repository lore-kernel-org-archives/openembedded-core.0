Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TjZ5y-0005bY-Rm
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:31:03 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D8E8DF81228; Fri, 14 Dec 2012 10:16:11 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id E39B8F8120B;
	Fri, 14 Dec 2012 10:16:09 -0700 (MST)
Message-ID: <50CB5EF2.4070807@mlbassoc.com>
Date: Fri, 14 Dec 2012 10:16:34 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1355503215-8637-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1355503215-8637-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] libsoup: RRECOMMEND glib-networking
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
X-List-Received-Date: Fri, 14 Dec 2012 17:31:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-12-14 09:40, Ross Burton wrote:
> Without glib-networking, libsoup can't do SSL, proxies, and probably more.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Gary Thomas <gary@mlbassoc.com>

> ---
>   meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
> index 486c38b..4a4d59a 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
> @@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
>   LICENSE = "LGPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>
> -PR = "r1"
> +PR = "r2"
>
>   SECTION = "x11/gnome/libs"
>
> @@ -21,3 +21,5 @@ S = "${WORKDIR}/libsoup-${PV}"
>
>   inherit autotools pkgconfig
>
> +# glib-networking is needed for SSL, proxies, etc.
> +RRECOMMENDS_${PN} = "glib-networking"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


