Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNoeq-0003JH-So for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 17:36:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8GU5MM002121;
	Tue, 8 Nov 2011 16:30:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01962-02; Tue,  8 Nov 2011 16:30:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8GTxbo002108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Nov 2011 16:29:59 GMT
Message-ID: <1320769800.10843.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 16:30:00 +0000
In-Reply-To: <1320767198-15262-1-git-send-email-eric@eukrea.com>
References: <1320761482.10843.38.camel@ted>
	<1320767198-15262-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pA8GU5MM002121
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH] useradd.bbclass: handle nativesdk case
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
X-List-Received-Date: Tue, 08 Nov 2011 16:36:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-08 at 16:46 +0100, Eric B=C3=A9nard wrote:
> * without this patch, building dbus-nativesdk leads to a missing
> dependency on 'base-passwd-nativesdk'
> This was added by commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
> * this patch handle the nativesdk case in the class useradd
> * close bug 1702 http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1702
> * v2 from Scott Garman with Richard Purdie's tricks
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/classes/useradd.bbclass |   12 +++++++++---
>  1 files changed, 9 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



