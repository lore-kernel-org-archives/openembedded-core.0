Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A9B87736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 18:07:59 +0000 (UTC)
Received: by pddn5 with SMTP id n5so62458578pdd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 11:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=zrArflMNb76yagOuzChkHen8wmaN0CMXQ03U4HGNF1Q=;
	b=JpcELlnI6aRpnydCNzb+sPpH9IXjhIENOCoD2xQFY2Xjxe1iMu6of5fsCB6mIo+FNO
	J7Ba69R0gZzk/i3EuXpSJwwcGv9qlyKRlHCWn988q3V+JMvpsUTtnTyzt4+dunty/ajM
	Ml/SU6SGLE+o4vUAvAvFfsMqmiabTqOjJjYBjQJCFxhTleZ8D6UbhISSLqUFcAn9DZwq
	kavooN3RjuG4IpafgOgwUzDlQBX2MJ0Ijf9WV9SUOD8FpSks3BrxDR8uaggNM+M4r+OM
	OgzT9UZJrW6BB/l70jTiZKnDCYLnIZpsxrO92OKa4uEHuYzAceJTujxt3FdI2QnP/WWH
	mj0A==
X-Received: by 10.70.46.137 with SMTP id v9mr81150466pdm.116.1427911681388;
	Wed, 01 Apr 2015 11:08:01 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:94fe:f453:43d6:a40f?
	([2601:9:500:ece:94fe:f453:43d6:a40f])
	by mx.google.com with ESMTPSA id xj1sm2754683pbb.92.2015.04.01.11.07.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 Apr 2015 11:08:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1427891938-17616-1-git-send-email-gshastri@juniper.net>
Date: Wed, 1 Apr 2015 11:07:59 -0700
Message-Id: <78A1EDDC-309F-4E74-8339-D10C1FD5EC3B@gmail.com>
References: <1427891938-17616-1-git-send-email-gshastri@juniper.net>
To: Gaurang Shastri <gshastri@juniper.net>
X-Mailer: Apple Mail (2.2070.6)
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [Add xorriso recipe] Add xorriso tool support
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
X-List-Received-Date: Wed, 01 Apr 2015 18:08:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 1, 2015, at 5:38 AM, Gaurang Shastri <gshastri@juniper.net> =
wrote:
>=20
> xorriso copies file objects from POSIX compliant filesystems into
> Rock Ridge enhanced ISO 9660 filesystems and allows session-wise
> manipulation of such filesystems.
>=20

we have meta-filesystems in meta-openembedded repo, this belongs there =
for now

> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> ---
> meta/recipes-support/xorriso/xorriso_1.3.8.bb |   17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta/recipes-support/xorriso/xorriso_1.3.8.bb
>=20
> diff --git a/meta/recipes-support/xorriso/xorriso_1.3.8.bb =
b/meta/recipes-support/xorriso/xorriso_1.3.8.bb
> new file mode 100644
> index 0000000..93914b4
> --- /dev/null
> +++ b/meta/recipes-support/xorriso/xorriso_1.3.8.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTIONS =3D "xorriso copies file objects from POSIX compliant =
filesystems into Rock Ridge enhanced ISO 9660 filesystems and allows =
session-wise manipulation of such filesystems"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "attr zlib"
> +
> +SRC_URI =3D "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "a0fc534ef8f9589282a189f0e6cdf952"
> +SRC_URI[sha256sum] =3D =
"901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> +LICENSE =3D "GPLv3"
> +
> +EXTRA_OECONF =3D "--disable-libacl"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


