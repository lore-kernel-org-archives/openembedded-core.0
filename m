Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qzv1C-0004Wt-R6
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 20:32:38 +0200
Received: by wyf19 with SMTP id 19so3050966wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:27:40 -0700 (PDT)
Received: by 10.227.156.139 with SMTP id x11mr2320422wbw.66.1315074454888;
	Sat, 03 Sep 2011 11:27:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm2749426wbp.5.2011.09.03.11.27.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:27:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <93299d9dce4bdc3acf75026edf0356b287b0c6f9.1315069299.git.sgw@linux.intel.com>
Date: Sat, 3 Sep 2011 20:27:31 +0200
Message-Id: <7B379123-8667-42B3-B2F7-96CBBB02D2C7@dominion.thruhere.net>
References: <cover.1315069299.git.sgw@linux.intel.com>
	<93299d9dce4bdc3acf75026edf0356b287b0c6f9.1315069299.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/1] gettext: use included libxml and libcroco
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
X-List-Received-Date: Sat, 03 Sep 2011 18:32:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2011, om 19:04 heeft Saul Wold het volgende geschreven:

> [YOCTO #1400]
>=20
> By using the included libxml and libcroco, we do not create additional
> on this core library. There was an ordering issue that when one =
library
> was not built, but gettext detected the other library a compliation =
would
> fail, this will force it to always use the included libraries.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 ++
> 1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb =
b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 9ec851e..0bcd90b 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -36,6 +36,8 @@ EXTRA_OECONF +=3D "--without-lispdir \
>                  --without-emacs \
>                  --without-cvs \
>                  --without-git \
> +                 --with-included-libxml \
> +                 --with-included-libcroco \
>                 "

That's missing a PR bump=


