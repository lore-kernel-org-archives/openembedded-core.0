Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFTht-0004GN-15
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 19:13:49 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so107113pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Hfg6AIk76qyfUVvwCk3svPjFNNBgiqM3QKI+nZ8Appo=;
	b=sG+3bfM2PIAc3VouUoAcuMTqln0yz7UXLEs8R2YkXWl0JQo774wmx/uPn6OiiWfq9e
	V1IvgQh5M7ozpgMrPmorZ2miI4PhjpUt4eCAMr6hXeUzC/+GZDtsbl9NTcfl+39kdJwj
	bcBrH9lL3EBM+Uiyf8UOUMkrzRgDG7ZUTTpGnxspbgdXPQxZ2HcIXkOYrxm9RorWrVeU
	GKUB1P0e3cWTjnAAvtFhbRTe3/2hwl0/m0zoWwpQYji3k6b9nON9BVot177Zs5KVvu53
	JIQOQKbih/eTZempM+PpPGs/AACkw3KS0stos6fNHXrc4FPVwO0T75Ju75rGzVTx6MHB
	LRFw==
X-Received: by 10.68.39.129 with SMTP id p1mr39747484pbk.19.1363111028372;
	Tue, 12 Mar 2013 10:57:08 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	rr14sm25929770pbb.34.2013.03.12.10.57.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 10:57:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
Date: Tue, 12 Mar 2013 10:57:07 -0700
Message-Id: <196712EC-5C47-410B-AF25-605049A35CF3@gmail.com>
References: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Patch V3] Coreutils 6.9 depends on libattr
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
X-List-Received-Date: Tue, 12 Mar 2013 18:13:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 12, 2013, at 2:56 AM, Alex DAMIAN <alexandru.damian@intel.com> =
wrote:

> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>=20
> We have a build dependency, so list it out.
>=20
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
> meta/recipes-core/coreutils/coreutils_6.9.bb |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb =
b/meta/recipes-core/coreutils/coreutils_6.9.bb
> index c0778ba..f712692 100644
> --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> @@ -9,6 +9,7 @@ LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
>                     =
file://src/ls.c;beginline=3D4;endline=3D16;md5=3D15ed60f67b1db5fedd5dbc37c=
f8a9543"
> PR =3D "r5"
> +DEPENDS =3D "attr"

isn't it needed on native recipe too ?

> DEPENDS_class-native =3D "gettext-native"
>=20
> inherit autotools gettext
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



