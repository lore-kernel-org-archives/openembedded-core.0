Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYxjP-0006LG-Rb
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:58:51 +0200
Received: by wyb34 with SMTP id 34so2132426wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 02:55:19 -0700 (PDT)
Received: by 10.216.231.198 with SMTP id l48mr6618308weq.54.1308650118982;
	Tue, 21 Jun 2011 02:55:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z66sm3369806weq.0.2011.06.21.02.55.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 02:55:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1308639329.git.edwin.zhai@intel.com>
Date: Tue, 21 Jun 2011 11:55:17 +0200
Message-Id: <DE2EAFBC-F416-444A-B5C8-D8F669756790@dominion.thruhere.net>
References: <cover.1308639329.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1] Remove obsolete gnome-vfs
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
X-List-Received-Date: Tue, 21 Jun 2011 09:58:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 09:12 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> This patch removed obsolete gnome-vfs in favor of GIO/GVFS.

Thanks for the patch! I've gone through meta-oe and only libgnome =
requires gnome-vfs at this point, but virtually nothing depends on =
libgnome itself anymore.

regards,

Koen=


