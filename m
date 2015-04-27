Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id EF034735FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:03:07 +0000 (UTC)
Received: by wgin8 with SMTP id n8so111611295wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=mmNRcjx56KfdZxHm/7smNCDSDOXuQp2E8pSMjxP57b4=;
	b=mh7E3bBlmluTL4tb9elhtgUtHfnKdgBXf4W7F1ItqG9eU8p5kNMoFG3KNayBFegzf9
	TOHj3APUG6AGezLVWo7VtKL51xaC8EUehAP0UChaIwdXsnaIgx/LCa/zr21Yqi5+DDrj
	GGdIORr8fjWGO+GOI2omaRU483Pn6FHbB3pKIkButTm5dDRkeJQJep2bYByGM77DM05L
	y3tQjtUNvYbB89Zsa+7lXQ7dF5aMEHWjKBDwFEho/JrqmHxoQftZWlBcnqP9qYL4BGCk
	23rqJ6Ode3KRv6fv1+vK5wB7ZV6un0WfJVwY0E1VkJDyxdrqnwXrqECyo0+gMP7NtX2l
	3aKw==
X-Received: by 10.194.236.66 with SMTP id us2mr21858121wjc.54.1430132588654;
	Mon, 27 Apr 2015 04:03:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	jq3sm28904213wjc.22.2015.04.27.04.03.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 04:03:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 13:04:04 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150427110404.GD2379@jama>
References: <1429613583-15734-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1429613583-15734-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH 1/3] pulseaudio: use stricter PACKAGES_DYNAMIC
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
X-List-Received-Date: Mon, 27 Apr 2015 11:03:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2015 at 12:53:01PM +0200, Martin Jansa wrote:
> * I don't see any usage for libpulse-* packages
> * adding '-' resolves the issue when we have separate recipe for
>   pulseaudio-modules-droid which isn't built to satisfy RDEPENDS
>   with the same name, because generic pulseaudio recipe seems to
>   RPROVIDE it through PACKAGES_DYNAMIC

ping for all 3 changes

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index db144a9..99cad76 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -79,7 +79,7 @@ PACKAGES =3D+ "libpulsecore libpulsecommon libpulse lib=
pulse-simple libpulse-mainl
>  #upgrade path:
>  RREPLACES_pulseaudio-server =3D "libpulse-bin libpulse-conf"
> =20
> -PACKAGES_DYNAMIC +=3D "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-=
lib.* ^libpulse-module.* "
> +PACKAGES_DYNAMIC +=3D "^pulseaudio-lib-.* ^pulseaudio-module-.*"
> =20
>  FILES_libpulsecore =3D "${libdir}/libpulsecore*.so"
>  FILES_libpulsecommon =3D "${libdir}/pulseaudio/libpulsecommon*.so"
> --=20
> 2.3.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

