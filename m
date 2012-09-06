Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9WLP-0000Nu-OT
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 09:17:43 +0200
Received: by wgbdr1 with SMTP id dr1so1099579wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 00:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1t3jp7UNgiXkc6UQOZJvxKzqhsLOjTxqdkU2Ap2Uaz8=;
	b=aQbohHZTWnrUW/zM+YrloTHNlsdcPRdHo9mTEf6f/lczp/1eG64DVyYcZZbzY7YDfo
	F329FX2PIP+FFq2zsI0wTjWyWq1n6LXX0sJ7/5EYGH+DpDwpaPU/TMLo3bitAsn4qkB5
	bPfLDM02lYNoxvT++j8awgkvEOGhPlWfKtbdqzlyItb26HPHA02EcBYS/5T4Tvh6yqLa
	msiktXD4QAaH2TQagkGtTFND0RtfLr+OYDrmHruY8NQ7ozYGxf75/dRxVdNID9TwDHXN
	vbwFlg2IOiQu5m8n+eDXk3HYu0kbZf2ASUCgL+TX/ZwQcjp5OvI2WiQ7uj3SCpn7EnMu
	Fiew==
Received: by 10.180.86.133 with SMTP id p5mr2686974wiz.17.1346915119990;
	Thu, 06 Sep 2012 00:05:19 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id dw6sm2766256wib.5.2012.09.06.00.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 00:05:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
Date: Thu, 6 Sep 2012 09:05:19 +0200
Message-Id: <FA55162B-DE1F-4EC7-87CD-3C7A08F55706@dominion.thruhere.net>
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkMz43kRWuxSLiqvlC2eTZB8fChqBjjDGkNqEoAbRn5T70ggVdmbzGJ8V7/HHD1sy1pPkpw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Thu, 06 Sep 2012 07:17:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 06:35 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> svn tar balls are 96M as compared to 1.3G git tars
> its unnessary to suck in that much of data.
>=20
> Fixes [YOCTO #2908]
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.7.inc |    8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc =
b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 84c230c..affbd54 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -11,7 +11,7 @@ PR =3D "r11"
> # using 4.7.1.0 for upgrade path when we move past 4.7.2 release
> # then we should drop the last 0 as well.
>=20
> -PV =3D "4.7.1.0+git${SRCPV}"
> +PV =3D "4.7.1.0+svn${SRCPV}"

Note that we can't switch back without either bumping PE or moving to =
4.7.x. where x > 1=


