Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSXLC-0000wG-R8 for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 18:07:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALH151h009502
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:01:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09153-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:01:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALH0wTB009496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:00:59 GMT
Message-ID: <1321894865.18926.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 17:01:05 +0000
In-Reply-To: <1321823363-3863-1-git-send-email-schnitzeltony@gmx.de>
References: <1321823363-3863-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pALH151h009502
Subject: Re: [PATCH] mime.bbclass: Add --disable-update-mimedb to EXTRA_OECONF
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
X-List-Received-Date: Mon, 21 Nov 2011 17:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-11-20 at 22:09 +0100, Andreas M=C3=BCller wrote:
> * ensure update-mime-database is not called during build time
> * this patch was included in meta-oe [1] about the same time when mime.=
bbclass
>   was migrated from meta-oe -> oe-core so it seems it got lost.
> * tests: build from scratch / run on overo / additional check: no unpac=
ked
>   files for gnome-control-center
>=20
> [1] http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/class=
es?id=3D6b765989a42ab314d1611f4dec78b07b562a9e7d
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
> ---
>  meta/classes/mime.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



