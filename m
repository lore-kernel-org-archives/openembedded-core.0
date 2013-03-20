Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIJuH-0003XJ-NZ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:22:28 +0100
Received: by mail-pd0-f176.google.com with SMTP id t12so622018pdi.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=IbvnoL88f0CYVcAPqUrSyZf8ChLOu4fUUYcdd+OgSPI=;
	b=bgcBuARRaZPW/zhRcCHgvN82z3VR2xahrDrFuY1X8KCj3FxKC8m8zwiHrCNeBZ/qcP
	qZuLUPEpadRUvwxr0vNqPS0tULYZp4KX5JAjDBfjh3QCiXm1XhRN7tlWWE1Nlq6RtDB1
	h8pvTGDz/KAGqY8Fptu6XP+I5ivE8k9g34mS8WTSf6EOoxk7FEvM4m6YX/Jw9yz9/oS5
	+RoSdq4SFaJ9yest0gqojjovcDXa1Amp9t9IA+LSiPQqVIYAuSjUP9XX9cVqUIGbJEkL
	vm3lGPcikkdAoX8NFOX/zCCc65f31U784/7l/+glTwsR/Q6Xaj/G6xAQprFTkE21igFn
	Vv4g==
X-Received: by 10.68.179.1 with SMTP id dc1mr9073722pbc.128.1363788330023;
	Wed, 20 Mar 2013 07:05:30 -0700 (PDT)
Received: from sa-nc-ipg-172-23-0-104.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id u9sm2376642paf.22.2013.03.20.07.05.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 07:05:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363772243-370-2-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Wed, 20 Mar 2013 07:05:27 -0700
Message-Id: <43E2DC7D-6495-408A-8653-7CFBBD6160FA@gmail.com>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1363772243-370-2-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] eglibc: disable RPC in favour of libtirpc
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
X-List-Received-Date: Wed, 20 Mar 2013 14:22:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

NACK. tirpc is not at a point where it can replace the glibc provided =
rpc. There is too much software that depends on it.
We have tried it in past 2.14 time frame and reverted back.

On Mar 20, 2013, at 2:37 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-core/eglibc/eglibc_2.17.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb =
b/meta/recipes-core/eglibc/eglibc_2.17.bb
> index 22129e6..0853c08 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.17.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
> @@ -85,7 +85,7 @@ EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} =
\
>                 --enable-add-ons \
>                 --with-headers=3D${STAGING_INCDIR} \
>                 --without-selinux \
> -                --enable-obsolete-rpc \
> +                --disable-obsolete-rpc \
>                 --with-kconfig=3D${STAGING_BINDIR_NATIVE} \
>                 ${GLIBC_EXTRA_OECONF}"
>=20
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



