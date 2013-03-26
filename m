Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKXuR-0000lb-4f
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:43:47 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so3750143dad.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=7olVlXf8GlC4XDoh6mhNsyE6d5S5ggD/rxiqM8MBQgw=;
	b=VA4I0z2n3kySiBDd24oIgPh6CT496OZwUHwDAIv2IXVaw/MS0mPIWRCLDFiZj/fJWq
	ad00HCwyvD8Q3lxrzjsOQuhKOAZ32RJXgc7+jfyHHUCoqJnu/U9fZiLQVEbCouNojfEP
	iK2EMvpmmd3u4pZ1mwUa9sIRe4tOfZwVKhmWRtHFMNlDxSjCy2DNrTrT6PSGuzTGESHC
	ZmA9itlSxWKA76MZCe4VeKgQW2QHuugoVaWMlIKfZyJIfnCjs/gREYfVUV9W7Jzepo3S
	Ub8/ley4P4ZTJS9n5kyfxj2zmTLLDA/bKLK63CRU6grtDkXekAzTCldMekfAX4gstqBP
	liYQ==
X-Received: by 10.66.72.105 with SMTP id c9mr24731378pav.177.1364318793220;
	Tue, 26 Mar 2013 10:26:33 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id lb8sm19908723pab.13.2013.03.26.10.26.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 10:26:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364314652-17317-1-git-send-email-giuseppe.condorelli@st.com>
Date: Tue, 26 Mar 2013 10:26:27 -0700
Message-Id: <215CBD66-C237-4B73-9F4D-D90CB207AE04@gmail.com>
References: <1364314652-17317-1-git-send-email-giuseppe.condorelli@st.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iproute2: add bash runtime dependence
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
X-List-Received-Date: Tue, 26 Mar 2013 17:43:53 -0000
X-List-Received-Date: Tue, 26 Mar 2013 17:43:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Giuseppe

On Mar 26, 2013, at 9:17 AM, Giuseppe CONDORELLI =
<giuseppe.condorelli@st.com> wrote:

> Add bash runtime dependence, required at package install time.

it would be nicer if you could find which scripts in the whole package =
needs bash
separate that out into a separate package and add RDEPENDS_<thatpackage> =
=3D "bash"

>=20
> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> ---
> meta/recipes-connectivity/iproute2/iproute2.inc    |    1 +
> .../iproute2/iproute2_3.8.0.bb                     |    2 +-
> 2 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc =
b/meta/recipes-connectivity/iproute2/iproute2.inc
> index fb233eb..e840605 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \
>                     =
file://ip/ip.c;beginline=3D3;endline=3D8;md5=3D689d691d0410a4b64d3899f8d6e=
31817"
>=20
> DEPENDS =3D "flex-native bison-native iptables"
> +RDEPENDS_${PN} +=3D "bash"
>=20
> inherit update-alternatives
>=20
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb =
b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
> index 65164cb..99c7ede 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
> @@ -1,6 +1,6 @@
> require iproute2.inc
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
>            file://configure-cross.patch \
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



