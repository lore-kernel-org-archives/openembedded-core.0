Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDMyL-0001F6-Ul for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:33:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLOTGg005595
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:24:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05108-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:24:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLOKXo005589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:24:23 +0100
Message-ID: <1333056259.18082.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 22:24:19 +0100
In-Reply-To: <1333023749-31830-1-git-send-email-eric@eukrea.com>
References: <1333023749-31830-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2TLOTGg005595
Subject: Re: [PATCH] license.bbclass: remove existing license.manifest before appending new data
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
X-List-Received-Date: Thu, 29 Mar 2012 21:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-29 at 14:22 +0200, Eric B=C3=A9nard wrote:
> without this fix, we append license each time we build again the same i=
mage,
> ending with a large not up to date file.
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  meta/classes/license.bbclass |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



