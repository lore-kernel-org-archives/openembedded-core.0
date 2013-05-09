Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaIsL-0007Ak-0v
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 06:54:41 +0200
Received: by mail-da0-f42.google.com with SMTP id r6so1375254dad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=b8icJLTA/jSmHpzITYTREJlbt6ZPJsecLOjYVOxpcYk=;
	b=Z7Has2JLnBS8baKGPbWoTrSU4A8pupYlTdUfZGxaJGxzgj9MI+3HCcsPWPCQnwh7XV
	8BsvsDopZ9UKUsGncPSlcoD8gpioY+Om6FoSYp+QveRfqbT0sOC1XmHdqwAFjKM2sZAV
	KupF3uSxP05qOXR3/wZFIyCSBXAb5M0xNUL4KkNUv0NNL7wFpGX3d0U84pTjCohjb5nG
	b1048xUBvnHiYOO2qPhJPvemQi/RMxCklfi8cTJjd3JbMAxDQlfUxBMSLwVZj+4w9Dn3
	lnGNCt6QqDzaMtS0Gv/XLYT1C3Q9D+SHd8UbkRhN6vS56g3HEvEUrqI2ujhZaL8Naqgi
	u4nA==
X-Received: by 10.66.145.134 with SMTP id su6mr10979326pab.198.1368074197114; 
	Wed, 08 May 2013 21:36:37 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id gc5sm1390698pbb.19.2013.05.08.21.36.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 21:36:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Wed, 8 May 2013 21:36:36 -0700
Message-Id: <8671690E-5831-4BD7-B20A-277610BC3923@gmail.com>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gdb: AArch64 lacks lttng support
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
X-List-Received-Date: Thu, 09 May 2013 04:54:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

looks good.

Acked-by: Khem Raj <raj.khem@gmail.com>

On May 8, 2013, at 4:43 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-devtools/gdb/gdb-common.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc =
b/meta/recipes-devtools/gdb/gdb-common.inc
> index f574d5c..6f42dff 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -5,6 +5,7 @@ SECTION =3D "devel"
> DEPENDS =3D "expat ncurses readline ${LTTNGUST}"
>=20
> LTTNGUST =3D "lttng-ust"
> +LTTNGUST_aarch64 =3D ""
> LTTNGUST_libc-uclibc =3D ""
> LTTNGUST_mips =3D ""
> LTTNGUST_mipsel =3D ""
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



