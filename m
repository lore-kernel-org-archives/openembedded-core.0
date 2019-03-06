Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 706B57C72F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 21:16:47 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z39so14653627qtz.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 13:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=muRrb2iIRpdiDZxeYPOf7yDfUl/eXUh0Gy6+w/7I4Pk=;
	b=TCcfGU4V9FOhefUbIqc44Qr5sA/2/THUZ985wPJ2WT7wjGv3G0rY40Y8D2vU6dC/AH
	hmJoRJSJf7TAe1HsrzmxEcJ6YhcKZIC5Yzumti2/mV58cLgL6+JJQNkh+7Wig2VYY7Fm
	NFCN+D+d/XhykDQ22Bk0J8UDPL0EMGro8hBex8DlE+VSlLxpFtHeElllCa65fI7pRrT3
	v08immSXzFi2MUa+g7BJhd7hEfyxGfN5DfUYpkLieP2gqeD6VO9Dpa5nEwjModlTwM/U
	+HX+Us8HB4rbcJbchbIMdObvjlFKid6Ws97s87e2v8yIh90JEUkGlnmFxld4pt7eu5KD
	f41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=muRrb2iIRpdiDZxeYPOf7yDfUl/eXUh0Gy6+w/7I4Pk=;
	b=i1krflWg2k0rYFVmPPBdJOnMvXye7AD2L9HOPH5q+aBm2nfpZl4yt9YTmP77oICtj1
	zpAzQt81FPB3MIdCWjW4py76e5cP+L1iiqgrT3sjePm/eDGJJFQ+xFIi2ZqLL8I436w4
	d+/7qeY636ZAbVLITUJxVUU5E9wQkDufUcKsBvzem/wWVuOan0ZMM+uzSTB5Fbx01Doe
	Q9VBPh0GQ62CieUvT9LvkVsOAIt8UtCoKOQi0Eec/OE1k83jTPnmJnOfl90gHNSdu+1z
	YiKi3y3FRyvwTtCOgIF+sUnH/gewWkFeHYbh3hI5YP8V3Hkg0ViYx7J4i67g5bg/WWwD
	/PYA==
X-Gm-Message-State: APjAAAXfpYfeXkAtPUoD8Auv2pz9qEFFG2FcsU4+nqxyIENf/BnWD3NP
	81WdSRhQ2FpIyIz6nh/L/iI3h+Gr
X-Google-Smtp-Source: APXvYqwVPf2Yepr0k8Nfb5gUrt3ZdGkOBwZ9PtK+VsEp63LKRwFyBVNXADvRsXi+9Tdj1YuoW2sljA==
X-Received: by 2002:ac8:396b:: with SMTP id t40mr7315226qtb.159.1551907008108; 
	Wed, 06 Mar 2019 13:16:48 -0800 (PST)
Received: from jfdmac.sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	i141sm1409169qke.7.2019.03.06.13.16.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 13:16:47 -0800 (PST)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Wed, 6 Mar 2019 16:16:46 -0500
References: <20190306074610.11691-1-bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20190306074610.11691-1-bunk@stusta.de>
Message-Id: <2CC5E942-0433-400E-A2B9-765E82226B30@gmail.com>
X-Mailer: Apple Mail (2.3445.102.3)
Subject: Re: [PATCH] wpa-supplicant: Remove no longer required hack for libnl
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
X-List-Received-Date: Wed, 06 Mar 2019 21:16:47 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 6, 2019, at 02:46, Adrian Bunk <bunk@stusta.de> wrote:
>=20
> Upstream already fixed this properly by using pkg-config.
>=20
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
Reviewed-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> ---
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
> index 6fc5cf5db7..fe5fa2b82e 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
> @@ -42,8 +42,6 @@ CONFFILES_${PN} +=3D =
"${sysconfdir}/wpa_supplicant.conf"
> do_configure () {
> 	${MAKE} -C wpa_supplicant clean
> 	install -m 0755 ${WORKDIR}/defconfig wpa_supplicant/.config
> -	echo "CFLAGS +=3D\"-I${STAGING_INCDIR}/libnl3\"" >> =
wpa_supplicant/.config
> -	echo "DRV_CFLAGS +=3D\"-I${STAGING_INCDIR}/libnl3\"" >> =
wpa_supplicant/.config
> =09
> 	if echo "${PACKAGECONFIG}" | grep -qw "openssl"; then
>        	ssl=3Dopenssl
> --=20
> 2.17.1
>=20


