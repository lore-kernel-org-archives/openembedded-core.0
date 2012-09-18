Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDvQg-00072Q-1n
	for Openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 12:53:22 +0200
Received: by weyr6 with SMTP id r6so4586824wey.6
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 03:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=h+rKX6jqWw5U71NvA+Ax7gP8wN3heP2SbOFQroUp5ds=;
	b=e1iWVMdcg4XabEkpWpADq4CQCcjwI8u4KbI20y2r43udxS+1LTGNbYOqmGpepjR/Ad
	Hy3V4/rU3RD/9DCkxAWm0ucG0yM2symF7+4qkj+/n/nwvl5CiseMJH26zHKXdON75UO5
	hwecVvP3IGBRS4wg3KfMNUIqTSafu6jecJQ3J8fD7exlTC5CY1hUNMuT6QrhVdM+utcm
	A96yikrgQpqULXffHqZ4m/PBgh0bTLcMttEePknF+8pKfzgc5tfwWbT5crcnXWZkgaaa
	CQ69kRNyTIEcTgJmozc1FOpB2exf6rw/oKEOMGX+E+rKwjPpHiaCiq4RTobPLtyU2Rnc
	Bm+Q==
Received: by 10.216.3.85 with SMTP id 63mr7140762weg.134.1347964842339;
	Tue, 18 Sep 2012 03:40:42 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k2sm31213835wiz.7.2012.09.18.03.40.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 03:40:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Tue, 18 Sep 2012 12:40:39 +0200
Message-Id: <D02B9EB5-5B6A-4418-A625-DF29275C8703@dominion.thruhere.net>
References: <505837BA.2040305@linaro.org>
	<1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmNxaFOXvwl9QQ8xwyqpwxQ0NCWKLrMd1RixypxjS2M7GsCyulVVX3ulpyDVGGRJivcsqq2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ncurses: Update gnu-config files to version used by OE-Core
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
X-List-Received-Date: Tue, 18 Sep 2012 10:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 sep. 2012, om 11:00 heeft Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> het volgende geschreven:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-core/ncurses/ncurses.inc |    5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-core/ncurses/ncurses.inc =
b/meta/recipes-core/ncurses/ncurses.inc
> index 91b1f34..3ff0914 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -59,6 +59,11 @@ ncurses_configure() {
> 	cd ..
> }
>=20
> +# Update gnu-config files to version used by OE-Core
> +do_configure_prepend() {
> +	install -m 0755 =
${STAGING_DATADIR_NATIVE}/gnu-config/config.{guess,sub} ${S}
> +}
> +

Apart from the missing PR bumps, isn't autotools.bbclass supposed to =
handle this?=


