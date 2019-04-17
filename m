Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0416D6D147
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:18:44 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id b74so14279671qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GkPQdPfPjQJTGcBpfMjRwaNp6XCmM/uhq50HzlkRvXM=;
	b=PFf1sUNzZHyDOrERTDOKr4VuFv8zlkyRGC3LYXq5bjbvPzu+qSQlKKPM8NJTJM5oEm
	gpbXYneA0Fec/c34mHj5CZzsSQ82t+vrNSXb6cKmM5ZgQQCRSdTmt7LE214vpxkeV2tJ
	G6giNfvK1thCWtPB7x5Fuwtf7gnz0tlbeDXlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GkPQdPfPjQJTGcBpfMjRwaNp6XCmM/uhq50HzlkRvXM=;
	b=jQCJLuX/2GYU0y/GhSXMTvUF1CUWTAFZxBcwh2G8YQIAwgvGk0COsO32OOjwpfo10F
	DwzII719ygD2RVwKMjfIb5sDZCA8qYjXBoqpuk6YJoCyYrq6EnO1rOuiMledm36fIayy
	gF7G5PXFRe3eyq58hcz7VOtpdjRy0eg8X/q5Av5P77yF6Vk5a3cjSjLgEdC6GU0nEZuv
	ggXvTuAGAqcL9YTnJm477ZBT23D4keAjlg47bb2+hw7YY4/Q0pbi8o/bSlU9r5bHFnVR
	0enx8UjUQ3bB4Z1cBeXRi4Qus8KoJVYUyi0OkCoEj50imuP/xbXT4c3W+rWepOYohAt+
	ZzYQ==
X-Gm-Message-State: APjAAAWvXO0bc2NUffb2TSSjvqyCxmJ7hd3ApaI04pHhRWAKBnjSloAl
	EfePvNe9J13/MrYxj/Amee93sw==
X-Google-Smtp-Source: APXvYqxxoKxMwFmOSuC+q0SU+JMNJZRZ/6z+FOkDUVFMdm0jcQJNsgns1YDIvt9x6sKE0qqPE92wJg==
X-Received: by 2002:a37:4bc1:: with SMTP id
	y184mr68003995qka.169.1555507125518; 
	Wed, 17 Apr 2019 06:18:45 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	n70sm38460050qkn.5.2019.04.17.06.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2019 06:18:44 -0700 (PDT)
Date: Wed, 17 Apr 2019 09:18:42 -0400
From: Tom Rini <trini@konsulko.com>
To: auh@auh.yoctoproject.org
Message-ID: <20190417131842.GA4664@bill-the-cat>
References: <20190417063944.65623440004@auh.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <20190417063944.65623440004@auh.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] vim: upgrading to 8.1.1174 FAILED
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
X-List-Received-Date: Wed, 17 Apr 2019 13:18:45 -0000
X-Groupsio-MsgNum: 123484
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2Q/1yeieXU6laMuW"
Content-Disposition: inline

--2Q/1yeieXU6laMuW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 11:39:44PM -0700, auh@auh.yoctoproject.org wrote:

> Hello,
>=20
> You are receiving this email because you are the maintainer
> of *vim* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *8.1.1174* has Failed (devtool error).
>=20
> Detailed error information:
>=20
> The following devtool command failed:  upgrade vim -V 8.1.1174 -S 8dc4c72=
92364d31cfb8afa8a67984b78b657b192
> NOTE: Starting bitbake server...
> NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacelaye=
r in its conf/layer.conf file to list the core layer names it is compatible=
 with.
> Loading cache...done.
> INFO: Extracting current version source...
> Loaded 1303 entries from dependency cache.
>=20
> Summary: There was 1 WARNING message shown.
> NOTE: Resolving any missing task queue dependencies
>=20
> Build Configuration:
> BB_VERSION           =3D "1.43.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "i586-poky-linux"
> MACHINE              =3D "qemux86"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "2.7+snapshot-20190417"
> TUNE_FEATURES        =3D "m32 i586"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "tmp-auh-upgrades:d8076ffc00fad478a50510b864fc59=
e77d95217b"
> workspace            =3D "<unknown>:<unknown>"
>=20
> Initialising tasks...done.
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun=
 and all succeeded.
> NOTE: Writing buildhistory
> Traceback (most recent call last):
>   File "/home/auh/poky/scripts/devtool", line 344, in <module>
>     ret =3D main()
>   File "/home/auh/poky/scripts/devtool", line 331, in main
>     ret =3D args.func(args, config, basepath, workspace)
>   File "/home/auh/poky/scripts/lib/devtool/upgrade.py", line 555, in upgr=
ade
>     old_licenses =3D _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKS=
UM'))
>   File "/home/auh/poky/scripts/lib/devtool/upgrade.py", line 470, in _ext=
ract_licenses
>     with open(os.path.join(srcpath, path), 'rb') as f:
> FileNotFoundError: [Errno 2] No such file or directory: '/home/auh/build/=
workspace/sources/vim/../runtime/doc/uganda.txt'
>=20
>=20
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler

If I want to trying to debug the AUH, are there any pointers?  It really
ought to be able to handle vim... Thanks!

--=20
Tom

--2Q/1yeieXU6laMuW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJctyeyAAoJEIf59jXTHXZSAFoP/jqK9PqkME2PLy2l1yY1nga7
hwf6YfLTnsdm3ncJEziUsxy65eujG9KQo6oU4nE4v5Z8TyQjtNGjDVzInabQGfCv
tH1rgPD7GHWwSPGG7Y3KeKwndVPOy7+McPgQYSD5Oo9W4aNtjC3gd7vksf7bEyuI
7xtrPzoCIn2VDPSTT+kgBAjEOngunXsZbzYOaE9h5C89TG5xDqg8Wt8qLP9HGMgU
UtkPttCXNh00iB6yJx8nLHFlVIBvgZgvQnhNMiOYewnABxD/mB/7XN66DPYJLQf8
kp4WZlxdIUTg0mtrhEgCJ/O+9TEDfR9EdWOMwXN71skjp2sS9EZSI+guW1MRelX4
EBqF7+FBgI3NI5nh0QnXeZNcVH6mzBAm/W4R6IAlPD12QhK7POSMfdHRzhtOidI/
S228UsACg3BaCQ0H7b3CmAZNEWxBV78ChoZtNDLVr9H7/Gqk8nrKOtF05kqP4PrY
VUSTckrUyr3uI8RbT5YD8FC1Tmh1nUcF0jTP+Knp1fAim91SzcKt4UcmYp3+hXRx
VbS5lCdo0e911rOWOZJBOM0a54gq3+611u/NmvaSO4/VhG4fnZp7hXzkoyNPccG6
ZLvn85Wfgvu6pyOdOm+knV28WU2eJc+rYzYj389tx8SDzAosCFEaLPfsXnkdSa02
vsoM1urzMGbt5Iz28AVS
=JVf+
-----END PGP SIGNATURE-----

--2Q/1yeieXU6laMuW--
