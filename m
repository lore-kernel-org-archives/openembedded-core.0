Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UF3XA-0005ai-97
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:17:16 +0100
Received: by mail-ee0-f50.google.com with SMTP id e51so2260021eek.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 07:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eVKcPAMtCdm+u5uOOldfXRvLTaLe+/UDzDf9VvDQAt0=;
	b=YkGO3gxVxUXA7Weru94MLgRX5YoI8BQgXBCdm5reGdcSRox3/mqX3kCWLqYmxkSItT
	ig2Dwal0R39IWM57zRV4ldLQF+XGUw6dHjqWXmDyMqM5tJEbzCH5LlzIPlzDrmXeqnY+
	06h0PkKn4XK5UiAebrcNgn6d8A/pmO4ERJSAf95T4PWfLd6h8nT+df8tWsOVK5aOu+bt
	8MYG49R3NlUHC81hefu0fuR8tRxyzhuL7CFK7MqSUpKkETm7ILDzoSURm8KAGnND7T/g
	gNsqTw36vQq6Zvd6DI7KHphAxjN2QZfzWu5NRnMwkWB3DpFa+xQWBA5N0XchrWqAkcUv
	WpsQ==
X-Received: by 10.14.205.68 with SMTP id i44mr36592093eeo.25.1363010415127;
	Mon, 11 Mar 2013 07:00:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c126:330a:62c2:b7af?
	([2001:610:612:0:c126:330a:62c2:b7af])
	by mx.google.com with ESMTPS id m46sm23726249eeo.16.2013.03.11.07.00.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 07:00:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
Date: Mon, 11 Mar 2013 15:00:12 +0100
Message-Id: <1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQldU1rRv5B5xoldRBoHghajnJ+v0mefeZlzbw3vb/FH5OIB5XyflYJBV/1RHju+hYPB+XCc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: Package hwdb data
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
X-List-Received-Date: Mon, 11 Mar 2013 14:17:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mrt. 2013, om 00:54 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> Create a new package to hold the hwdb.d
> Fixes the packaging warning as well.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-core/systemd/systemd_198.bb |    4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_198.bb =
b/meta/recipes-core/systemd/systemd_198.bb
> index 381a67b..9fc4704 100644
> --- a/meta/recipes-core/systemd/systemd_198.bb
> +++ b/meta/recipes-core/systemd/systemd_198.bb
> @@ -105,7 +105,7 @@ python populate_packages_prepend (){
> }
> PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
>=20
> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze"
> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze ${PN}-hwdb"
>=20
> USERADD_PACKAGES =3D "${PN}"
> GROUPADD_PARAM_${PN} =3D "-r lock"
> @@ -168,6 +168,8 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                 /lib/udev/rules.d/99-systemd.rules \
>                "
>=20
> +FILES_${PN}-hwdb =3D "/lib/udev/hwdb.d"
> +

It's a udev hwdb, so calling it systemd-hwdb would be very misleading. =
And aren't you missing a RRECOMMENDS?=


