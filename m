Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QV2bQ-0006NW-2M
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:22:24 +0200
Received: by wwb17 with SMTP id 17so2366349wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 07:19:03 -0700 (PDT)
Received: by 10.227.205.144 with SMTP id fq16mr2189794wbb.6.1307715543434;
	Fri, 10 Jun 2011 07:19:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p21sm2063185wbh.23.2011.06.10.07.19.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 07:19:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e894a1bec293052c213e828c8071d833a5631131.1307623890.git.paul.eggleton@linux.intel.com>
Date: Fri, 10 Jun 2011 16:19:00 +0200
Message-Id: <24914D5A-4024-4F09-BC83-E99C443D90E9@dominion.thruhere.net>
References: <cover.1307623890.git.paul.eggleton@linux.intel.com>
	<e894a1bec293052c213e828c8071d833a5631131.1307623890.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] iproute2: update to 2.6.38
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
X-List-Received-Date: Fri, 10 Jun 2011 14:22:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jun 2011, om 14:53 heeft Paul Eggleton het volgende geschreven:

> Fixes "ip route get" not producing any output (a regression in =
2.6.35).
> See http://marc.info/?l=3Dlinux-netdev&m=3D129442470405398&w=3D2 and
> http://marc.info/?l=3Dlinux-netdev&m=3D130038222321440&w=3D2 for a =
list of
> other changes since 2.6.35.
>=20
> Fixes [YOCTO #1006] (reopened)
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

When building I get this:

WARNING: the following files were installed but not shipped in any =
package:
WARNING:   /lib/tc/m_xt.so
WARNING:   /lib/tc/m_ipt.so

I don't know anything about iproute2, so I can't say if it's bad or good =
to leave these out :)=


