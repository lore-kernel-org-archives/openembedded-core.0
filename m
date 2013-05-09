Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaIt3-0007Jx-I6
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 06:55:25 +0200
Received: by mail-da0-f44.google.com with SMTP id z8so1386745daj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 21:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=HGfE9aPXXvC5/akotTviz4YZ6bO87Ft9e/k+pztMy1g=;
	b=dZlcXkCU7zU1rB1Mm0tZLCbp6arw+XFT+/h2k/Ygd7q1MG9vvkPsGmLSWGpqqeHlmy
	8xieRc/d1O6EziN1kBQrjAeJhWVPuEfLJaFs6aswNG8oIp7j3CME/8YEEGjHZpUgYHXI
	7tUZvMAfvgjYsUOMwXAL1hdyWrkh70cNuu8grM4nFfs3iZRqna6hf0IlCzfCNcFD9gKp
	MHG/Dmq7IRbKbKQKkAZOT6zkgQgxm9j55+/hAIFCeDR7TFuObtuaANTDjauvk7RogCt+
	2pTpkwPEo6aSsb68EU79ujK/Uk11YE8hbFKSimd0qilIXRRhRCVwWeQxV3fD35yNW/nf
	RlqA==
X-Received: by 10.68.248.100 with SMTP id yl4mr10621558pbc.125.1368074241670; 
	Wed, 08 May 2013 21:37:21 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id gc5sm1390698pbb.19.2013.05.08.21.37.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 21:37:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368013438-15107-4-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Wed, 8 May 2013 21:37:21 -0700
Message-Id: <0BCC1071-45CF-43E8-8270-F50084A3777B@gmail.com>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1368013438-15107-4-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gdb: tabs -> spaces
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
X-List-Received-Date: Thu, 09 May 2013 04:55:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: Khem Raj <raj.khem@gmail.com>

On May 8, 2013, at 4:43 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-devtools/gdb/gdb.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb.inc =
b/meta/recipes-devtools/gdb/gdb.inc
> index a620eca..3321a24 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -4,7 +4,7 @@ inherit gettext
>=20
> SRC_URI +=3D "file://kill_arm_map_symbols.patch \
>             file://gdbserver-cflags-last.diff;striplevel=3D0 \
> -	    file://renesas-sh-native-support.patch \
> +            file://renesas-sh-native-support.patch \
>            "
> #LDFLAGS_append =3D " -s"
> #export CFLAGS_append=3D" -L${STAGING_LIBDIR}"
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



