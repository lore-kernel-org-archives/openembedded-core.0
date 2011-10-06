Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBpJL-0006gw-Pv
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:52:35 +0200
Received: by ggnq1 with SMTP id q1so1793685ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 07:46:56 -0700 (PDT)
Received: by 10.223.15.10 with SMTP id i10mr3984820faa.17.1317912415976;
	Thu, 06 Oct 2011 07:46:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b10sm7435486fam.1.2011.10.06.07.46.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 07:46:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1317910715.6398.84.camel@ted>
Date: Thu, 6 Oct 2011 16:46:46 +0200
Message-Id: <96E549F9-7694-4C64-B055-6F9C45065886@dominion.thruhere.net>
References: <1317910715.6398.84.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: base.bbclass: Implement PACKAGECONFIG
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
X-List-Received-Date: Thu, 06 Oct 2011 14:52:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 okt. 2011, om 16:18 heeft Richard Purdie het volgende geschreven:

> These enabled options to be specified in the form:
>=20
> PACKAGECONFIG ?? =3D "<default options>"
> PACKAGECONFIG[foo] =3D =
"--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
>=20
> So that DEPENDS, RDEPENDS_${PN} and EXTRA_OECONF can be automatically
> built from specific options. Those options can easily be customised
> by the distro config or the user.

What if I want it in RDEPENDS_some-other-subpackage?=


