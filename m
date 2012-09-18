Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDxID-0004y8-2Y
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 14:52:45 +0200
Received: by wibhq4 with SMTP id hq4so3302918wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 05:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=qPmWXzD8Zp0dZyqNXo04N8/xUFCRyZqNY8Ewtey9mqM=;
	b=NnRjh3A9Gxu3otyq8oOgwEzW64j00+IRw6jtsiKOsf7oPkAfzvCQS5BIfhqavXO5gC
	AAqZKLvwYbY5gxwqfnU4i3u7XThOSCQDYtDHQFK9fRjjEz2zUKDFWATfJjaqPaooskCt
	O/ijzMQmi1mJnE/mU2rqXBNgZ3PwQtJU/LaGv3st79ousLnMQtPZx1LXSJPamFbcmZDi
	ypmNer3p59STCcdOCuITpdDPWbg07rg8jmjNOuZW58J5qbmNd8MgVaQwV3E+hQtR5P5k
	I0BILvnMoEetb+n4Ry2ypgSMaHhubm5wLBfQZcrYwpsedd/V+GUMCUkQuqWuB0+7cTVa
	iVqg==
Received: by 10.216.145.227 with SMTP id p77mr19002wej.58.1347972005129;
	Tue, 18 Sep 2012 05:40:05 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id do5sm31723731wib.10.2012.09.18.05.40.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 05:40:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347962498-756-1-git-send-email-constantinx.musca@intel.com>
Date: Tue, 18 Sep 2012 14:40:04 +0200
Message-Id: <4D914278-5082-4B59-9162-CE561159AAF7@dominion.thruhere.net>
References: <1347962498-756-1-git-send-email-constantinx.musca@intel.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmm00ICPMZxZUNgyHs6Zjb1hKxo1x797GwDEOkMeSPmDSKZ9cxCNfmS/4ctY3CYD4CuOMK6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Tue, 18 Sep 2012 12:52:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 sep. 2012, om 12:01 heeft Constantin Musca =
<constantinx.musca@intel.com> het volgende geschreven:

> - netbase should only include etc-rpc, etc-protocols, etc-services
> and the hosts file
> - the init script/configuration files should be in another package
> (init-ifupdown)
>=20
> [YOCTO #2486]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>=20
> --- /dev/null
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "Basic TCP/IP networking init scripts and configuration =
files"
> +DESCRIPTION =3D "This package provides high level tools to configure =
network interfaces"
> +HOMEPAGE =3D "http://packages.debian.org/ifupdown"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://${WORKDIR}/copyright;md5=3D3dd6192d306f582dee7687da3d8748ab"
> +RDEPENDS_${PN} =3D "netbase"
> +RCONFLICTS_${PN} =3D "netbase (< 5.0-r1)"

Since R* is for packaging they should live below do_install to mimic the =
order of task execution in the recipe=


