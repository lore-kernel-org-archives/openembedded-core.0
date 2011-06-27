Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qb8Yp-0004Uo-9Y
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 11:56:55 +0200
Received: by wyg30 with SMTP id 30so1129789wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 02:53:14 -0700 (PDT)
Received: by 10.227.197.205 with SMTP id el13mr3221137wbb.84.1309168394603;
	Mon, 27 Jun 2011 02:53:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm3958094wbh.8.2011.06.27.02.53.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 02:53:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <a9318aee537a684644da1b6c3349e1f339bdf269.1308973924.git.edwin.zhai@intel.com>
Date: Mon, 27 Jun 2011 11:53:07 +0200
Message-Id: <F8790096-AFE8-4CDA-B025-CE8359FC48BF@dominion.thruhere.net>
References: <cover.1308973924.git.edwin.zhai@intel.com>
	<a9318aee537a684644da1b6c3349e1f339bdf269.1308973924.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/2] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Mon, 27 Jun 2011 09:56:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jun 2011, om 05:54 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> glib-networking contains the implementations of certain GLib =
networking
> features that cannot be implemented directly in GLib itself because of =
their
> dependencies. TLS/SSL support is one of them, which is needed for =
accessing SSL
> web page.
>=20
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
> meta/recipes-sato/web/glib-networking_2.28.7.bb |   21 =
+++++++++++++++++++++

The recipe looks good, but it shouldn't be hidden in recipes-sato/web/=


