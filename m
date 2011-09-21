Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6Lzg-0003RQ-5r
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 14:33:40 +0200
Received: by fxi1 with SMTP id 1so1597018fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 05:28:22 -0700 (PDT)
Received: by 10.223.99.65 with SMTP id t1mr964348fan.93.1316608101975;
	Wed, 21 Sep 2011 05:28:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c1sm4121414fab.15.2011.09.21.05.28.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 05:28:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316607552-20870-1-git-send-email-dima_ch@emcraft.com>
Date: Wed, 21 Sep 2011 14:28:15 +0200
Message-Id: <AEDF5974-B8CC-4B58-ACDA-2E2808B22C40@dominion.thruhere.net>
References: <f63c9c5991312f05bffee750086a0c7398770f8a>
	<1316607552-20870-1-git-send-email-dima_ch@emcraft.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
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
X-List-Received-Date: Wed, 21 Sep 2011 12:33:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 14:19 heeft Dmitry Cherukhin het volgende =
geschreven:

> Added two recipes:
> 1) qt-mobility-x11 builds the QtMobility 1.2 package
>   on the basis of qt4-x11-free;
> 2) qt-mobility-embedded builds the QtMobility 1.2 package
>   on the basis of qt4-embedded.
>=20
> Signed-off-by: Dmitry Cherukhin <dima_ch@emcraft.com>
> ---
> meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch |   19 ++++++++
> .../qt4/files/qtme_connectivity_pro.patch          |   12 +++++
> meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch |   11 +++++
> .../qt4/files/qtme_staticconfig_pri.patch          |   18 ++++++++
> .../qt4/files/qtmx_staticconfig_pri.patch          |   10 ++++

Could you please add patch headers to those patches describing what they =
intend to fix and what their upstream status is?=


