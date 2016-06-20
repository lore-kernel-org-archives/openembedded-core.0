Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64D8B60745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 07:04:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r201so11580174wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X+Ioslx8tssJuRvNP+IjgJ7YLO115UHJ47xbugQ2/nE=;
	b=Ro9HghKwYSDiHEKTKB5xLYRK5khIEatSns5jL5ICphozBKLKG6tFXTD79mlYT3yFN+
	dLLB/3nRTExcn4C1hPgOuXw3MSzteQBghGvxLgVfnBhPjxaw+eqP0RKGPWZ1JI9xgh6P
	hzkfSy5XhNeH0mHeC6nrDFXqkoDVPMm69sNWP+HmYpY+wTiz+LjHpoTNswtFL0sFkqWP
	/fkAojkbpytBPk2k0/3j5cYNORJeU+ruVaHqh6Mi2pOwqrKSY/JrwGiwYQeMXge7RtUt
	pL1Ha2KrlIK7yZGUQclB9iHJfPZcdu/5dIsBJBifxMR/yp+/dwHVQmPojY2KZn/yRxew
	MXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X+Ioslx8tssJuRvNP+IjgJ7YLO115UHJ47xbugQ2/nE=;
	b=Bxww+HcKXBCXCtDJMoc8PYvvSpLsY+WNj7mGWI77hcXDfiWapVX8PLk2HRDivfY0xP
	0lXAY1s1kpJoXz7QtOT+GNz44P8PuRi88KQSLdSrzQxFDP4GAoArgldWX3TfUz6W0ndA
	gJF2lpksvJlZ3ySCMJhGehSkcFwQDl3bvAJ6zRYqtw+YvMrTMNilS8mUekrSYUnJEdHd
	cIlpSCTkrl1hNNcIVRJHh/rZvl4N9HyyFtVsMsTgfV9+xywkJteTztiQbf6OK4Yr7hIG
	Fu17IH/ysr3nERW+OZd7SmLNzo7tsEHmil9o6JcCK/sWBOLIAtsq7ub5+hj41cDUiyL5
	4nig==
X-Gm-Message-State: ALyK8tK76kLXyZXNht4DXOQynzZ2ffr3n4eF+rZYGGFdsKuX8lzfhqkO8mUi0bguvQfAjw==
X-Received: by 10.28.167.136 with SMTP id q130mr10092979wme.62.1466406244638; 
	Mon, 20 Jun 2016 00:04:04 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id s67sm1277945wmf.3.2016.06.20.00.04.03
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 00:04:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
Date: Mon, 20 Jun 2016 09:04:02 +0200
Message-Id: <F31E8FA8-4286-4FEB-9CD7-FE323E3C6C8B@dominion.thruhere.net>
References: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
To: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] The CMake recipes contain a mismatch between the environmental variable which defines where the Modules are installed and the location where they actually are. This patch fixes the environmental variable to point to the proper folder defined according to the cmake version.
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
X-List-Received-Date: Mon, 20 Jun 2016 07:04:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 16 jun. 2016, om 16:27 heeft Jose Pardeiro =
<jpardeiro@rapyuta-robotics.com> het volgende geschreven:
>=20
> Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
> ---
> meta/classes/cmake.patch | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
> create mode 100644 meta/classes/cmake.patch
>=20
> diff --git a/meta/classes/cmake.patch b/meta/classes/cmake.patch
> new file mode 100644
> index 0000000..c9cc9f2
> --- /dev/null
> +++ b/meta/classes/cmake.patch
> @@ -0,0 +1,20 @@
> +The CMake recipes contain a mismatch between the environmental =
variable
> +which defines where the Modules are installed and the location where =
they
> +actually are. This patch fixes the environmental variable to point to =
the
> +proper folder defined according to the cmake version.
> +
> +Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
> +
> +diff --git a/cmake.bbclass b/cmake.bbclass
> +index 995ddf1..6de4247 100644
> +--- a/meta/classes/cmake.bbclass
> ++++ b/meta/classes/cmake.bbclass
> +@@ -60,7 +60,7 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
> + set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
> +
> + # Use native cmake modules
> +-set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
> ++set( CMAKE_MODULE_PATH =
${STAGING_DATADIR}/cmake-\${CMAKE_MAJOR_VERSION}.\${CMAKE_MINOR_VERSION}/M=
odules/ )

CMAKE_MINOR_VERSION doesn=E2=80=99t exist in OE, and the escaping is =
wrong, leading to:

|   Syntax error in cmake code at
|
|     =
/build/linaro/build/build/tmp-glibc/work/aarch64-oe-linux/cmake/3.5.2-r0/t=
oolchain.cmake:34
|
|   when parsing string
|
|     =
/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr/share/cmake-=
\3.5.${CMAKE_MINOR_VERSION}/Modules/
|
|   Invalid character escape '\3'.
| Call Stack (most recent call first):
|   =
/build/linaro/build/build/tmp-glibc/sysroots/x86_64-linux/usr/share/cmake-=
3.5/Modules/CMakeDetermineSystem.cmake:98 (include)
|   CMakeLists.txt:19 (project)

And I can=E2=80=99t find the patch that was committed in the mailinglist =
folder locally, otherwise I would have responded to that.=

