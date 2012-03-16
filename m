Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S8ZIi-0007b4-S4
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:42:44 +0100
Received: by wera1 with SMTP id a1so4076824wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 08:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=TdIv0t6IjRxJ7/RRKAscqNp/YIJzhFoSPA4pUWzIvrc=;
	b=OinTEGUlZa9LBjH+8VPTJGApyjDI1VksxQiFjk1eePskC3yt9m+SQTeYMQ2kyvuDZv
	uruXe3+Q0nEzWOOCtzqVZB3s2j8o3qjtBpKr3s2lkWtH7J16Sdsumm4u9aCuCpm5jjbv
	sNUFt48exJqpg6GEcqXpOSsMs3N7E0kFNvh2YNyZ1z84fEojRgApGLfpQWITYzX82qQP
	p6NT9txRTcAcAwOwPcIEGn7zUT4Ok61ZxEymXdGeidkRagbQqW09/Rhs2N6zcSJWq3Ae
	t4erro5AjgOag3x4JphSSXtgZIeJUG+cmssFUHTKrchyku6smM43h7WZ+5aYm1E9ivtm
	fLxw==
Received: by 10.216.132.30 with SMTP id n30mr1835552wei.52.1331912037080;
	Fri, 16 Mar 2012 08:33:57 -0700 (PDT)
Received: from [10.188.140.70] ([84.241.222.140])
	by mx.google.com with ESMTPS id be4sm23558328wib.8.2012.03.16.08.33.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 08:33:56 -0700 (PDT)
References: <1331911280.18586.191.camel@ted>
In-Reply-To: <1331911280.18586.191.camel@ted>
Mime-Version: 1.0 (1.0)
Message-Id: <642E47F4-FFF1-4F22-B529-BD3C84290E00@dominion.thruhere.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9B179)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Mar 2012 16:33:21 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQls2em6CgP9cJI1QIYDOxQ0cPv0WSTJh2U2nanQEiwKc5IbncWjorBVM0tl9kUAYLXsnB98
Subject: Re: [PATCH] foomatic-filters: Ensure cups and ppr files are packaged
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 15:42:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Missing PR bump?

Op 16 mrt. 2012 om 16:21 heeft Richard Purdie <richard.purdie@linuxfoundatio=
n.org> het volgende geschreven:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/me=
ta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> index e3bcf78..b8f0c7a 100644
> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> @@ -36,4 +36,4 @@ do_install_append_linuxstdbase() {
>     ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
> }
>=20
> -FILES_${PN}_append_linuxstdbase +=3D "${exec_prefix}/lib/cups/filter/foom=
atic-rip"
> +FILES_${PN} +=3D "${exec_prefix}/lib/cups/ ${exec_prefix}/lib/ppr/"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


