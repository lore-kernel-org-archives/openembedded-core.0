Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5516F71A19;
	Wed, 23 Nov 2016 17:12:16 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id jb2so1488311wjb.3;
	Wed, 23 Nov 2016 09:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/92JtvPjBNiDNDHJ6TswxFZEJdo4oINtWoY+y0NH0xA=;
	b=dJBUS+4uBff6lhcr5UQOqdi6pe3bOgme66jcxfHTqf/AvuadxnpEjJIf+o6QESmwzn
	TxDjCBLDEeGE1QzX4Yk9tW4YNT0mVn2Js13vFDHU+MRtJmN5l+Xc8bbiF0pS+i5r2Mjb
	KDW2dDn4QFnpCIp7SyGeqx7Br0I0fsNoxJJdSTvwewuOWerj/vAryGp6GqTP8n+E2U+9
	6T6u9w5zJel1o4566G5vEo+0LnZdY59V9aUMy88bMqhlBtgbiY+9/gBcmWSqGZCPUdG3
	/FjTStc9hMNXzJiAElBNTAnlAAojnZgRR99NV4ybkVLDO110EGnptKbiHGxSGh0tX5Yc
	fFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/92JtvPjBNiDNDHJ6TswxFZEJdo4oINtWoY+y0NH0xA=;
	b=S7frvMswIJOq8z+h0t3T/sCn3fHuZp8l/vJnOnrqjCSKcJ0yN2xr/4yc42hrsPqL5k
	ljwbohdayuFIvWfqNf5Q+/upjBSGjR4AadxyTL2pC8D/QXrNsGPAhyHQ09M7RBhcRjy6
	6TD9P30Q9AfJ0H7AqI3RU5kWxnxhBC26iq+cp+QH1wPKqPSUBs+yOvJCcNEMfl13ojr2
	8nOBQ6zGL/VXSm/wB0lfWz3JlvYQELc1xpyz2jjd6ZLXV+oMm2170cXZ6BCW3sTINhH9
	u1YhchQhpx+4OQplNuUg+YWsHuDBIFIBCri9Pqvd+LrDcHPzYBvF7Yw5COEBy9iWD5qj
	RidQ==
X-Gm-Message-State: AKaTC031ppXqJThDHqFmSQu/xsNLYPLkXvi+hUosRLS9XgTUM3JVMhmRFi9tQ6j8xZUlfg==
X-Received: by 10.194.69.230 with SMTP id h6mr4676690wju.63.1479921137855;
	Wed, 23 Nov 2016 09:12:17 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g17sm37395564wjs.38.2016.11.23.09.12.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 09:12:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 18:12:18 +0100
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20161123171218.GE3265@jama>
References: <20161103133345.6936.13797@opal.openembedded.org>
	<20161103133346.EC39750212@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20161103133346.EC39750212@opal.openembedded.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/05: linux-yocto/4.8: update to 4.8.6
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
X-List-Received-Date: Wed, 23 Nov 2016 17:12:18 -0000
X-Groupsio-MsgNum: 89767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline

--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 01:33:47PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>=20
> commit 2a7d3173c7a05cd09bbcf5fe465403b2d4b2b589
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> AuthorDate: Thu Nov 3 09:25:14 2016 -0400
>=20
>     linux-yocto/4.8: update to 4.8.6
>    =20
>     Integrating the korg -stable release.

Not sure if it's caused by this upgrade or one of kernel tooling
improvements, but now it fails to build for me in default qemux86
config:

ERROR: linux-yocto-4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0 do_kernel_meta=
data: Function failed: do_kernel_metadata (log file is located at /OE/build=
/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87e5f=
c8b7c_9d5f74f941-r0/temp/log.do_kernel_metadata.441)
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/qemux=
86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0/temp/log.=
do_kernel_metadata.441
Log data follows:
| DEBUG: Executing shell function do_kernel_metadata
| ERROR. input file "features/nfsd/nfsd-enable.scc" does not exist
| ERROR: could not process input files: features/nfsd/nfsd-enable.scc featu=
res/debug/printk.scc features/netfilter/netfilter.scc cfg/virtio.scc cfg/so=
und.scc cfg/paravirt_kvm.scc
|        See /tmp/tmp.tLkBgIybCS for details
| ERROR. input file "features/nfsd/nfsd-enable.scc" does not exist
| ERROR: could not process input files: features/nfsd/nfsd-enable.scc featu=
res/debug/printk.scc features/netfilter/netfilter.scc cfg/virtio.scc cfg/so=
und.scc cfg/paravirt_kvm.scc
|        See /tmp/tmp.T7cBZctbo1 for details
| ERROR: Function failed: do_kernel_metadata (log file is located at /OE/bu=
ild/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87=
e5fc8b7c_9d5f74f941-r0/temp/log.do_kernel_metadata.441)
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/linux/=
linux-yocto_4.8.bb:do_kernel_metadata) failed with exit code '1'



>    =20
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++-------=
---
>  3 files changed, 16 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_4.8.bb
> index e51c9cd..26b309d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "4057556c041f6aac0d29aa3425587d414c9a0090"
> -SRCREV_meta ?=3D "83110d94edeb856a3667b62903ed4ae91c24117d"

> +SRCREV_machine ?=3D "b99b6fac437104e206d30540a5cb12103049af1e"
> +SRCREV_meta ?=3D "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=3D${K=
BRANCH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.8;destsuffix=3D${KMETA}"
> =20
> -LINUX_VERSION ?=3D "4.8.3"
> +LINUX_VERSION ?=3D "4.8.6"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_4.8.bb
> index c8ddbd9..63dd11b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> @@ -4,13 +4,13 @@ KCONFIG_MODE =3D "--allnoconfig"
> =20
>  require recipes-kernel/linux/linux-yocto.inc
> =20
> -LINUX_VERSION ?=3D "4.8.3"
> +LINUX_VERSION ?=3D "4.8.6"
> =20
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
> -SRCREV_machine ?=3D "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_meta ?=3D "83110d94edeb856a3667b62903ed4ae91c24117d"
> +SRCREV_machine ?=3D "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_meta ?=3D "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-=
kernel/linux/linux-yocto_4.8.bb
> index 13778b9..0369198 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?=3D "standard/base"
>  KBRANCH_qemux86-64 ?=3D "standard/base"
>  KBRANCH_qemumips64 ?=3D "standard/mti-malta64"
> =20
> -SRCREV_machine_qemuarm ?=3D "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
> -SRCREV_machine_qemuarm64 ?=3D "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemumips ?=3D "c285969d4f9376a671167ecf397578c8ad3e6a75"
> -SRCREV_machine_qemuppc ?=3D "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemux86 ?=3D "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemux86-64 ?=3D "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemumips64 ?=3D "64f96ba530e58456070f26b0f3fcce3f64988b72"
> -SRCREV_machine ?=3D "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_meta ?=3D "83110d94edeb856a3667b62903ed4ae91c24117d"
> +SRCREV_machine_qemuarm ?=3D "94d3e8675e2fcb09f29814a33ccf79df06149104"
> +SRCREV_machine_qemuarm64 ?=3D "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemumips ?=3D "046ff6344eee25dcc0eea1214e0ad8771ddfabfb"
> +SRCREV_machine_qemuppc ?=3D "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemux86 ?=3D "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemux86-64 ?=3D "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemumips64 ?=3D "edcb167f91abc071cc98cbd762418ff7ab9d839b"
> +SRCREV_machine ?=3D "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_meta ?=3D "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.8.git;name=3Dmachi=
ne;branch=3D${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.8;destsuffix=3D${KMETA}"
> =20
> -LINUX_VERSION ?=3D "4.8.3"
> +LINUX_VERSION ?=3D "4.8.6"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDXN8gAKCRA3VSO3ZXaA
HMuwAJ9fiKfmkXlKKQTtjjTlebJmr0cWKgCfScqDlHxqRvCLc/9IUvFvSWcsz0w=
=1iRm
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
