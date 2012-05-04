Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQJS6-0000H4-6g
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 16:25:46 +0200
Received: by wgbdr1 with SMTP id dr1so2413692wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 07:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7/EeLk/OrGRcMbGkUdJbCsP3IH0iMjoY03MWLg8hvN0=;
	b=Gcu9Op8Nia+JD6yg5K8Zz/of40nKezwhi937dTsdJH/yUXyB+hjqngbS0taCKXFZnD
	5KVKBUPwFmSycnncO+RLowZRyiqllDXs4+A7OwSUbMGNhu8RDOFME0NLpsmasjaqAKsq
	lZ5tl3vYVqOaSr9TJZZaH8BgbzLxY5T3sxu+t8X8Uhul8Xf/zNqRELjjH9pkTPkCTOFn
	glXUiofsMUgL52/UIgQnCepCELmhV+dsZy1JrUJP13dm9w6UkZFHOtD19AZTdjsY3Ada
	fTNCtxVy9zdPqPLbujZEst3ADQ30tbaN2jTg/5EP0GDPmpN+4spootkn61hHWbgfaIB4
	5CRg==
Received: by 10.180.81.37 with SMTP id w5mr13355103wix.16.1336140959632;
	Fri, 04 May 2012 07:15:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h5sm9489729wiy.3.2012.05.04.07.15.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 07:15:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336140272.23777.5.camel@ted>
Date: Fri, 4 May 2012 16:15:57 +0200
Message-Id: <40D28335-BD42-43A4-9414-3E760205A0C7@dominion.thruhere.net>
References: <1336140272.23777.5.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlje5yUCHa9aQR8laIBYm5nmJemr8cq1NZWKhYFzHHegAHojYGvtEUcidaM1ISIQtBlqJDi
Subject: Re: sed: Explicitly disable acl for deterministic builds
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
X-List-Received-Date: Fri, 04 May 2012 14:25:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2012, om 16:04 heeft Richard Purdie het volgende geschreven:

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-extended/sed/sed_4.2.1.bb =
b/meta/recipes-extended/sed/sed_4.2.1.bb
> index 9fbb6e7..92f59e4 100644
> --- a/meta/recipes-extended/sed/sed_4.2.1.bb
> +++ b/meta/recipes-extended/sed/sed_4.2.1.bb
> @@ -13,6 +13,8 @@ SRC_URI[sha256sum] =3D =
"8773541ce097fdc4c5b9e7da12a82dffbb30cd91f7bc169f52f05f93b7
>=20
> inherit autotools update-alternatives gettext
>=20
> +EXTRA_OECONF =3D "--disable-acl"

Missing PR bump=


