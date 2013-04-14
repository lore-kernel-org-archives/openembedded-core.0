Received: from mail-pd0-f171.google.com ([209.85.192.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URVog-0008Fb-Km
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 00:54:48 +0200
Received: by mail-pd0-f171.google.com with SMTP id z10so2197385pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=OkT6xRQV/5YggzhsBEqOZ9xob46wQz2Q9IGoNLJ1Yvc=;
	b=Crcg4eBzdxtgRc0mv1kKirDthDB+k1aiJ8g4JIfbm7zBc4zNY5v+6089wx7O6Fb2RE
	cgbLRDxlvcXPmA/4Y0n9mNFWKk0zll0+DrlVsHwrsOirkL8PAhAr8J1ROwOaQdzra5FH
	iQMlz1BDzvCXw4aspG8EQlQ9Xlms46q9JF2XQ4PevNkV6jq6tGTZktFexzt0vBAsNEdw
	vVa7gujZZRK7YyT6fWHjoGDn1VdO1Yvsf2rKVtfX8/o0TUt/nh6aeDWyyfbJeES9yF/j
	WLiadlviCzNYbkGf0evBBgrcn0XdmKWaz0xUtucb7gu9K88B02KYGbNLTLISzDnedlU0
	Uc4g==
X-Received: by 10.68.28.201 with SMTP id d9mr13410153pbh.113.1365979026007;
	Sun, 14 Apr 2013 15:37:06 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id br2sm17649669pbc.46.2013.04.14.15.37.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 15:37:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1365968582-10662-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Sun, 14 Apr 2013 15:37:02 -0700
Message-Id: <10D3E82C-690F-4F50-9682-E31CA64B28DB@gmail.com>
References: <1365968582-10662-1-git-send-email-paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm-postinsts: remove erroneous call to /etc/default/rcS
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
X-List-Received-Date: Sun, 14 Apr 2013 22:54:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Tested-By: Khem Raj <raj.khem@gmail.com>

Now I see that posinsts are running. But they are running forever =
probably thats a separate problem

On Apr 14, 2013, at 12:43 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> This doesn't work when the initscripts package is not installed (e.g.
> when using systemd only) and is not even needed.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/recipes-devtools/rpm/rpm-postinsts.bb |    1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb =
b/meta/recipes-devtools/rpm/rpm-postinsts.bb
> index a5310b5..3d2d05d 100644
> --- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
> +++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
> @@ -36,7 +36,6 @@ if [ "x$D" !=3D "x" ] && [ -f =
$D/var/lib/rpm/Packages ]; then
> 	install -d $D/${sysconfdir}/rcS.d
> 	cat > =
$D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
> #!/bin/sh
> -. /etc/default/rcS
>=20
> [ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
> 	i=3D/etc/rpm-postinsts/$i
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



