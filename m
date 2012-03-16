Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S8d8N-0005UP-Vn
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:48:20 +0100
Received: by wibhj13 with SMTP id hj13so1154974wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 12:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ENNf6HvgSf+9FCDGiVy0ALGWfNqEtJidCA8w0OVXIBc=;
	b=mPGGS2lEGQW+npya9ZKN8CSrJkUd8StP4cd+onHFP5DItCAiW4sgHaoWidTHPh+qPc
	i8yeHxithPQ9S85Zd26KqTHx1ZGztjroM+7AikedgHsgl/RBUx/bXdQHUoKfPG/b0rK8
	m/WENYDZLSTF4PxUmiRvgtaD7VKU64mpr1t36EDD86qoqwNMURxCl4O6dZZ0H1lPvomG
	FL6wl4xylvqw8WivMKjxv5242DOLVezD1LafwlCRa3odJP/ZgNg4hn/9LYnOXbGyfe+w
	XIGHd3B5HPeUIdFywypXTCoJ5+3Vm7p0uNKkBsBxgRh7kFHuUSZoyKyEs7wIrG373Krw
	ynwQ==
Received: by 10.180.19.37 with SMTP id b5mr1148545wie.9.1331926772054;
	Fri, 16 Mar 2012 12:39:32 -0700 (PDT)
Received: from [10.68.37.3] ([87.111.147.121])
	by mx.google.com with ESMTPS id w10sm1865359wiy.3.2012.03.16.12.39.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 12:39:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
Date: Fri, 16 Mar 2012 20:39:00 +0100
Message-Id: <BE489DAB-2E22-4B8F-A565-10C5DF842857@dominion.thruhere.net>
References: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkYm/SOFeRXu4r0V9/AMBhWbW3P/0DKLEBD9eoIHtLZwzvKKer3yrj+Tf201krehR5mFYwJ
Cc: Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Fri, 16 Mar 2012 19:48:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mrt. 2012, om 17:32 heeft Mike Crowe het volgende geschreven:

> The magic in rootfs_ipk.bbclass expects to generate debug package
> names by just appending '-dbg'. This breaks for eglibc because whilst
> the binary package has been renamed to libc6 the debug package is
> still called libc-dbg. This patch ensures that the debug package is
> renamed too.
> ---
> meta/classes/libc-common.bbclass |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/libc-common.bbclass =
b/meta/classes/libc-common.bbclass
> index 962f205..d0c1ab4 100644
> --- a/meta/classes/libc-common.bbclass
> +++ b/meta/classes/libc-common.bbclass
> @@ -27,4 +27,5 @@ python populate_packages_prepend () {
> 		bpn =3D d.getVar('BPN', True)
> 		d.setVar('PKG_'+bpn, 'libc6')
> 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
> +		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
> }

Missing PR bump and broken upgrade path.=


