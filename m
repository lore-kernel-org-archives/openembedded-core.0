Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QX8xY-0006aU-JI
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:33:56 +0200
Received: by wwb17 with SMTP id 17so1125367wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 02:30:29 -0700 (PDT)
Received: by 10.227.57.81 with SMTP id b17mr637993wbh.98.1308216628921;
	Thu, 16 Jun 2011 02:30:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o19sm36862wbh.21.2011.06.16.02.30.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 02:30:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c5f9a9413707c40c2839c4f72571d0440f8f59bf.1308215406.git.dongxiao.xu@intel.com>
Date: Thu, 16 Jun 2011 11:30:21 +0200
Message-Id: <FC24B0CA-5644-4123-9CE5-1BBBF64EB661@dominion.thruhere.net>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<c5f9a9413707c40c2839c4f72571d0440f8f59bf.1308215406.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 4/6] connman-gnome: Add 3G configuration support
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
X-List-Received-Date: Thu, 16 Jun 2011 09:33:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jun 2011, om 11:20 heeft Dongxiao Xu het volgende geschreven:

> Change connman-gnome to be git type recipe.

It already is a git recipe...

> --- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_git.bb

'git' is not a valid PV, '0.5' is. Please don't break versioning like =
this.

> +SRC_URI[md5sum] =3D "0e1c4c25d19cad9b08a216848a320716"
> +SRC_URI[sha256sum] =3D =
"4d5fe481b444fc3e64fd9caa149dbcd76de166a25733f18fd93da01d2abf5d1c"

What exactly is that checksumming?



