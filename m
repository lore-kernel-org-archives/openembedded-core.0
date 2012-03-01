Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S38PU-0001fR-7A for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 16:59:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21Folkm018635
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 15:50:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18368-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 15:50:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21Foami018628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 15:50:37 GMT
Message-ID: <1330617040.31767.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 15:50:40 +0000
In-Reply-To: <1330547595-11631-1-git-send-email-ynezz@true.cz>
References: <1330547595-11631-1-git-send-email-ynezz@true.cz>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q21Folkm018635
Subject: Re: [PATCH] image_types.bbclass: fix link creation failure if the target already exists
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
X-List-Received-Date: Thu, 01 Mar 2012 15:59:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-29 at 21:33 +0100, Petr =C5=A0tetiar wrote:
> | ln: failed to create symbolic link `beagleboard/systemd-image-beagleb=
oard.tar.bz2': File exists
> NOTE: package systemd-image-1.0-r0: task do_rootfs: Failed
>=20
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Is this still necessary after the recent image_types.bbclass fixes?

Cheers,

Richard



