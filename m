Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id B4F2172F67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 14:53:24 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id s62so1179266ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Vi+qmu7j2HhJcfvDSUOuRd4a5IYN7fgDW/gs+kAA9uk=;
	b=K0OfS3O3qSAlg9m+9mAhAqbaK8PyMpPhnxxKCN5obqoFMivJuZdY++GDdh4YoeTi1y
	V5TsKAgy1pKw0J/vi6XKDXyZfh12gV5vkL1U4v4lv9t6O93A+2cQd8LXDr73vJm5rntY
	kcPvs8FsUbs4IFGFaZfU0o9gc5ZpXVXgqj9rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Vi+qmu7j2HhJcfvDSUOuRd4a5IYN7fgDW/gs+kAA9uk=;
	b=ds+ynal2j6T7b2P9Vl/LQXUE22Xci4L7rMTU6iIk1KzSfM1Nfj4lBa7HHhnzcp+SwO
	y+R8MKV0Z+XWLP5g1TS/9OEKU9lRYy7hGf/LCLxl9noLrTvHTFpUAKNLnuZNyLyTL8KR
	gn2grFGZIc5nGzjI6uXYdV4P0qPZVmzz8kAnOW3b7aidVNOZxvHiS1FelpfQ78K8+aKC
	L61PtNzKVOgNqK/u107XKLSq0ZKksKa6yLNjGDassrYTILD7+QcUa3GScHNQrjEyMFmK
	ysccDgZphkqEarB9BuHtKY5xr+lquB2AW4o7AANMjwR3CF08Y2JBlSDHB6geRQuJv2Sg
	zOMg==
X-Gm-Message-State: AHPjjUhaNZ4pqnqczHuziEpQxrRcu+oq971RRWw1DnEy4KHFiIiCFQX/
	coGScO5I9tklhIR1UIuqESC/Lg==
X-Google-Smtp-Source: AOwi7QDVd8giVx3RakYUEErJj4jiDDhYfcM+bJFXMk9N9k5H8+EWkQ1r0dbnv+Se69fdDLJKVYQZkw==
X-Received: by 10.129.158.131 with SMTP id v125mr3762014ywg.201.1506610405642; 
	Thu, 28 Sep 2017 07:53:25 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:706c:f3a8:eab4:3cc8])
	by smtp.gmail.com with ESMTPSA id
	i206sm648888ywg.27.2017.09.28.07.53.24
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 07:53:24 -0700 (PDT)
Date: Thu, 28 Sep 2017 10:53:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170928145328.GN3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<20170928141303.a6gdp3fqsyqe3t5n@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170928141303.a6gdp3fqsyqe3t5n@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Thu, 28 Sep 2017 14:53:24 -0000
X-Groupsio-MsgNum: 103458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AO40I52Xc3kOyr3I"
Content-Disposition: inline

--AO40I52Xc3kOyr3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 05:13:03PM +0300, Ed Bartosh wrote:
> On Wed, Sep 27, 2017 at 01:00:09PM -0400, Tom Rini wrote:
> > With RSS we need to ensure that when making a bmap image that the
> > python3 that we created is found via /usr/bin/env rather than the host
> > python3.  Otherwise we're relying on the build host to have bmaptool
> > support installed.
> >=20
>=20
> Can you suggest how to reproduce the issue you're trying to fix with
> this patch?
>=20
> Here is what I did:
>=20
> 1. Checked if bmaptools are available for host python3:
>=20
> $ python3 -c 'import bmaptools'
> Traceback (most recent call last):
>   File "<string>", line 1, in <module>
> ImportError: No module named 'bmaptools'
>=20
> 2. Added cpio.bmap to my build configuration:
>=20
> $ grep ^IMAGE_FSTYPES ./conf/local.conf=20
> IMAGE_FSTYPES =3D "cpio.bmap"
>=20
> 3. Built core-image-minimal:
> [build (master)]$ rm -rf tmp/
> [build (master)]$ bitbake core-image-minimal
> ...
> NOTE: Tasks Summary: Attempted 2395 tasks of which 2186 didn't need to
> be rerun and all succeeded.
>=20
> 4. Checked if bmap file has been generated:
> [build (master)]$ ls ./tmp/deploy/images/qemux86-64/ |grep cpio
> core-image-minimal-qemux86-64-20170928135949.rootfs.cpio.bmap
> core-image-minimal-qemux86-64.cpio.bmap
>=20
> Hm, cpio image got removed for some reason. Looks like a bug, but not
> related to bmaptool. (I remember you're fixing that code some time ago).
>=20
> Should I use another MACHINE or anything else that can trigger build
> failure?
>=20
> PS. I used latest poky master. commit id: fcdfe09d9cc4e2977bd602dfd18f729=
cd9f6d73d

I'm on oe-core only, abf2e9526a11bcb51b71b90a7b76bd33af656494 and just
replicated the problem again.  I'm doing ext4.bmap, but that shouldn't
matter.

--=20
Tom

--AO40I52Xc3kOyr3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzQznAAoJEIf59jXTHXZShpYP/AuRBU5aUIOkjI2P9mQB4vhN
RNPnUTDasZ4BVOJRLE2sDTf8cnnzN0UxiCcE1YIUvg7O6Ze0HD9HUWfldDloDGmQ
sepwpsuO7uKr0TVZWwBE7qQ/7xw1EoBfQU03eXRIxFQaA2Cc3Y/qLk3EoEIOiD8N
93E1Uzlx4t1Su7+hJSaW2w2Y86Hzlu2FZZS+mzApILU0BLl8jmhYJPFwCuMe0hGb
PNsMxqaVm9SE5bj25KZ0jSPcGGgF+76Ye2H6Jyv/MaaMkous8l4kqanbZGDdt/G/
FObsB4PTwLfpg9DbVF7EVA43kvK9L9RJ+FLINvmRJLvSI4vhaeiN66r1qJcpYzKJ
MXob3ERaDqJsUuzHtz1VuXrRZ03Rp0mx73GrKeCIws9jvi4yohaF52dar3e2sEtP
IKUzmixxXvwv5MJEAvuLBcKEJWOa++K2O/V4Hbvh+zLkIdRZa50tT9K7NDafP4cs
KAQ4Q6TMNwO4yVe4lkfDZdxgcgrk9GpjnjVrTlq3ghegAGZfsDkNfsWFng1VZpWN
n5ZDuRIJ7Zrm4LthzIcS3gIv7p5DJEIZTZejhWrAyqEPyBLduyQmaHvLlDiFCrQO
BwsWfigqn8mqotA9Wxpx3IQGr5+DQ2WpVM7BE82UJbMXHHM99zuSaoNnrTI2iEeI
A4AjVw/oNVWL1IznzbvN
=vCOs
-----END PGP SIGNATURE-----

--AO40I52Xc3kOyr3I--
