Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60C4A60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 02:07:53 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so5256926pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2016 18:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=CWTtQyoPGrvk4IG2n9x2d+jvU5TgIRTHsmIqtDCuEaM=;
	b=kBlIg3j/+wfCrxZ8kbVYHgtzWrBAS03+d8oeNEw0I+JDkYR7sDjq5qhyZ8et+V29HT
	+J4pLfxs0wWEyMkdv8Yd6cD+S5fg43376LnI/cjjJNR2HsqMGzz7G7ogHtXFcwa0S8qO
	AIjpKRD3QddgDeyQIrsQHHeGf0DjI/SWrv3daDliteseCSxpQXJOA2w4hs7Y+LCJu0sT
	jPQkfHEXb9NblElLjby/0bkcwj9MVpiyHous/INUdyfb3PJqio+ZdQenUFt2oN2fbJ+G
	HRlceM0wUi7ojTiDKZbDKgLhGHu3ulUrYxj++JCVcBWd5h3yYTyV8RbzdrbjNOtKB1Pg
	ZMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=CWTtQyoPGrvk4IG2n9x2d+jvU5TgIRTHsmIqtDCuEaM=;
	b=O4Q2VhakChYY6G+Saz22kYyW+QacP5W5iMnCEhbKIXUQNqD9RsikJ/haFUjsmw1L92
	u4ufD8aDUnZbs5lN4V76nPEproxGCQbuqTY/8NFk6ybaSlC9eeVRC08xnczaY4/cl6GR
	w77aYTuBjXJyWGqx19XuE5Bkp8tOTfGQztIMXp83UbR5C3NYvbVieHtBCCr5GGF84W+J
	6HyOSh0TJHtdCokShUUPG+rI2cu/bOG4JlnY+vn9kAWMj0LkJm4d4iUlz6yvC8QzWRST
	PbaJIfNV9kjauw1uIjk3chVzt9I07HG68DuEVjk+QKVIsfiUVGFxkf1m+EtxkOwAuamR
	30gA==
X-Gm-Message-State: ABUngvek/dpPKJiq8RktwpVRKIhW+HobOcKURQyESHaDPvYLHa2LiKEzs7da55D2dPoi/Q==
X-Received: by 10.99.172.26 with SMTP id v26mr24823064pge.164.1479089274992;
	Sun, 13 Nov 2016 18:07:54 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:7d70:121:3c74:ab01])
	by smtp.gmail.com with ESMTPSA id
	hv3sm30743868pad.30.2016.11.13.18.07.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Nov 2016 18:07:54 -0800 (PST)
To: Christopher Larson <clarson@kergoth.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<20161110003935.1858-2-raj.khem@gmail.com>
	<CABcZANmkhnCF0-p75sAC-p2fOrYmjSPo9==OqDjPDwnZd-uUzQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <24f641ad-b1da-4941-f882-60dfea11d72c@gmail.com>
Date: Sun, 13 Nov 2016 18:07:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmkhnCF0-p75sAC-p2fOrYmjSPo9==OqDjPDwnZd-uUzQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] go-examples: Add an example, helloworld written in go
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
X-List-Received-Date: Mon, 14 Nov 2016 02:07:54 -0000
X-Groupsio-MsgNum: 89310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="wIBQLB8pV1NUxLWrRqK6Bv76Brrk95F8a"

--wIBQLB8pV1NUxLWrRqK6Bv76Brrk95F8a
Content-Type: multipart/mixed; boundary="OnbSGk6dA4N6SnEfCFqhfBnJAE6jsoD7E";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <24f641ad-b1da-4941-f882-60dfea11d72c@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] go-examples: Add an example, helloworld
 written in go
References: <20161110003935.1858-1-raj.khem@gmail.com>
 <20161110003935.1858-2-raj.khem@gmail.com>
 <CABcZANmkhnCF0-p75sAC-p2fOrYmjSPo9==OqDjPDwnZd-uUzQ@mail.gmail.com>
In-Reply-To: <CABcZANmkhnCF0-p75sAC-p2fOrYmjSPo9==OqDjPDwnZd-uUzQ@mail.gmail.com>

--OnbSGk6dA4N6SnEfCFqhfBnJAE6jsoD7E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/10/16 6:59 PM, Christopher Larson wrote:
>=20
> On Wed, Nov 9, 2016 at 5:39 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     diff --git a/meta/recipes-extended/go-examples/go-examples.inc
>     b/meta/recipes-extended/go-examples/go-examples.inc
>     new file mode 100644
>     index 0000000..c632681
>     --- /dev/null
>     +++ b/meta/recipes-extended/go-examples/go-examples.inc
>     @@ -0,0 +1,10 @@
>     +DESCRIPTION =3D "This is a simple example recipe that cross-compil=
es a Go
>     program."
>     +SECTION =3D "examples"
>     +HOMEPAGE =3D "https://golang.org/"
>     +
>     +LICENSE =3D "MIT"
>     +LIC_FILES_CHKSUM =3D
>     "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b=
4f302"
>     +
>     +S =3D "${WORKDIR}"
>     +
>     +inherit go
>     diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb=

>     <http://go-helloworld_0.1.bb>
>     b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>     <http://go-helloworld_0.1.bb>
>     new file mode 100644
>     index 0000000..af9d3b7
>     --- /dev/null
>     +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>     <http://go-helloworld_0.1.bb>
>     @@ -0,0 +1,15 @@
>     +require go-examples.inc
>     +
>     +
>     +SRC_URI +=3D " \
>     +  file://helloworld.go \
>     +"
>     +
>     +do_compile() {
>     +  go build helloworld.go
>     +}
>=20
>=20
> Under what circumstances would one use the go_do_compile from go.bbclas=
s vs this?

I think this is a good point. It would be more appropriate to use
the primitives from go.bbclass in this example. I will try to rework it


--OnbSGk6dA4N6SnEfCFqhfBnJAE6jsoD7E--

--wIBQLB8pV1NUxLWrRqK6Bv76Brrk95F8a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgpHHkACgkQuwUzVZGdMxSa9gCfWIjRSbTabLFdIDvUY8xH0UYZ
zTUAn3FHXfpkEEBa2fgw9flZQyppC0s5
=EfaL
-----END PGP SIGNATURE-----

--wIBQLB8pV1NUxLWrRqK6Bv76Brrk95F8a--
