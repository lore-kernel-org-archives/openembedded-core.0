Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Srr9c-0005lq-KZ
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 15:52:32 +0200
Received: by weyr6 with SMTP id r6so1718204wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 06:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ursuABfj5g7pJXhh59aVkiG568tztD8Gf/DtxZih+Xc=;
	b=HX2xVTg3WdYx518TZjMBShuH9B663Zz5VruTDlYEuPEIO4Tzib8sZxMuD+LG47vokJ
	A7DGavyQD24UprGiIMmjlS/W2B0gVA3wMS2m+KLJmsTyQyFvDF5r3CdJgFkLqFGuxPsh
	WmCHmftbPpvtE5x7EDwegln1O0Ap4KctSt9umYlYWD3WkB0o260Rl8bcewQfPehFSkps
	H8PpcRtVdIkGtzUNM2wy3oZJ71IhjI1kJKKS6EbE8a/vB/ZwiV7M+IneA+Vvt4CurdyD
	JJGEh27zwJwskVNRYmC8JsE6Eh8BgwLRm6hrysIGBLZOl/5GCqZWIf74viNZIxFhahPt
	1wSA==
Received: by 10.217.7.6 with SMTP id z6mr1394644wes.5.1342705270767;
	Thu, 19 Jul 2012 06:41:10 -0700 (PDT)
Received: from [10.47.217.41] ([92.69.204.68])
	by mx.google.com with ESMTPS id ep14sm39429878wid.0.2012.07.19.06.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 06:41:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1342704262.7940.11.camel@ted>
Date: Thu, 19 Jul 2012 15:41:07 +0200
Message-Id: <FA061505-81A3-4B54-9439-51A7C1711415@dominion.thruhere.net>
References: <1342704262.7940.11.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQll25xPbkSsl/5Uv6K/Wnff/+PSIT8bl2f/UeDlT7lXKmDyLLZGpz1gE20u7lb3C8K+nLop
Subject: Re: [PATCH] avahi-ui: Remove the locale files and rely on the main avahi package for these
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
X-List-Received-Date: Thu, 19 Jul 2012 13:52:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 jul. 2012, om 15:24 heeft Richard Purdie het volgende geschreven:

> Both avahi and avahi-ui were installing locale files. This is =
pointless duplication
> and they are identical between the two packages. This changes things =
so they're only
> handled by the main package.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb =
b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> index 2c12053..7d56dad 100644
> --- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> +++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> @@ -54,6 +54,7 @@ do_install_append () {
> 	rm ${D}${sbindir} -rf
> 	rm ${D}${datadir}/avahi/a*
> 	rm ${D}${datadir}/avahi/s*
> +	rm ${D}${datadir}/locale/ -rf
> 	rm ${D}${datadir}/dbus* -rf
> 	rm ${D}${mandir}/man1/a*
> 	rm ${D}${mandir}/man5 -rf

MIssing PR bump=


