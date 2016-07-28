Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 877D96072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 17:01:55 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ez1so3817808pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4jHnioaSPoD07NiysZbmfbBGxgxD8a4QdxioyFuG2nM=;
	b=RrYsjgN+bKlfjomSM/XhK80LOy+nYoL+Y7lg0p58KHovLJysJQiNAcJngdDzxlY2Mh
	c0YH24nXWbYpkeyWPW6E4zbaNuq2ZEnE0lfy342mLHp1q+hf368RSpvesMb2KEf7IMq0
	0v9yzxJtnOG1JxEEz3Iy2sjtdtSuminXGMQQF0SZjplDhXe2vYmK+syYu2NWj/Sjhv/L
	KdSgiNCA90sGXMon/swXDRApFkaIGREM97B0OvtN18pQtvgaKDnd9VUgqIF9iA2MP86j
	OhHzP3budZytlJLnkpE3UcZFuteLvOP1AZgrM7o4dSKFsq7c86IfAu4R8cMGAqRW8LH+
	F2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4jHnioaSPoD07NiysZbmfbBGxgxD8a4QdxioyFuG2nM=;
	b=l2ZQHi6G2O4qTNoTPYi/JYQtnh+P3JAef/ehRAPak5yZvLiA36RHBtzO4lc7owZERg
	B4i1YBsE+x7yuAh0xJDZThoQU7CRUdIap9OXrF1tSwjjT8CvSC4QRbDkax2iDNv1PRdy
	9y6jHSmTtGMUV7kwSDCQDuHn2BRK/U8WZYvk3kgVWaJ9ntumWaANfGgWQWni+i3xKlzO
	wfQbQ1EQPToO/8i9TzqE/8CjoM1NHwwG26cJMvdnBgvxIvHdmtTQnIrRdREAH63bw+xN
	tyBKtu0x8lDaIEYs/6JhBaAHJcai+FYlhOQRu9wkv+DygSDsfioUqW5mvIb1DWkQv+QI
	ESWg==
X-Gm-Message-State: AEkoouvcnf1P2mV4tsJK5jya55E+Pp0MqipThO1Vh9LDIm75uB8KRzL//j2h8cT4hWzjog==
X-Received: by 10.66.65.109 with SMTP id w13mr61779417pas.142.1469725316240;
	Thu, 28 Jul 2016 10:01:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:2dbd:b1bd:9311:9c96?
	([2601:646:8882:b8c:2dbd:b1bd:9311:9c96])
	by smtp.gmail.com with ESMTPSA id
	vt10sm18366150pab.43.2016.07.28.10.01.55
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jul 2016 10:01:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>
Date: Thu, 28 Jul 2016 10:01:50 -0700
Message-Id: <94382486-A163-4AD9-88CD-D79109B796E9@gmail.com>
References: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>
To: Awais Belal <awais_belal@mentor.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Thu, 28 Jul 2016 17:01:57 -0000
X-Groupsio-MsgNum: 85076
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6F0D4667-4780-4E8B-AFC9-5282FA7287D1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6F0D4667-4780-4E8B-AFC9-5282FA7287D1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 28, 2016, at 1:49 AM, Awais Belal <awais_belal@mentor.com> =
wrote:
>=20
> Using a copy would only make management of devices erroneous
> and makes the system unstable in some scenarios as tools will
> have to manipulate both files separately. A link ensures that
> both files /proc/mounts and /etc/mtab will have the same
> information at all times and this is how it is handled
> on newer systems where there is such a need. Same is
> suggested by busybox.
>=20
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
> meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
> meta/recipes-core/initrdscripts/files/init-install.sh     | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh =
b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f564f4e..53f6508 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -123,7 +123,7 @@ mkdir -p /tmp
>=20
> # Create /etc/mtab if not present
> if [ ! -e /etc/mtab ]; then
> -    cat /proc/mounts > /etc/mtab
> +    ln -sf /etc/mtab /proc/mounts
> fi

I think this does not consider the case where procfs may be disabled in =
kernel. Is there such a possibility ?

>=20
> disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | =
cut -d" " -f 3 | sed -e "s/MB//")
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh =
b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 72ce92b..21ae0a6 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -119,7 +119,7 @@ fi
>=20
> mkdir -p /tmp
> if [ ! -L /etc/mtab ]; then
> -    cat /proc/mounts > /etc/mtab
> +    ln -sf /etc/mtab /proc/mounts
> fi
>=20
> disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | =
cut -d" " -f 3 | sed -e "s/MB//")
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_6F0D4667-4780-4E8B-AFC9-5282FA7287D1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleaOoIACgkQuwUzVZGdMxShoACeOMiDyV45r1hibrZS9TBPsCRU
ThgAnjqaVDR9cm77ChBVFz2jg+vwQ7vz
=1Vdj
-----END PGP SIGNATURE-----

--Apple-Mail=_6F0D4667-4780-4E8B-AFC9-5282FA7287D1--
