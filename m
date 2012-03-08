Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5jrT-0006zO-BY for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 21:22:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KEGQn030280;
	Thu, 8 Mar 2012 20:14:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29725-09; Thu,  8 Mar 2012 20:14:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KDxHk030274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Mar 2012 20:14:06 GMT
Message-ID: <1331237624.3006.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 12:13:44 -0800
In-Reply-To: <1331137465-24763-1-git-send-email-kergoth@gmail.com>
References: <1331137465-24763-1-git-send-email-kergoth@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] external-csl-toolchain: override PKGV, not PKGV_${PN}
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
X-List-Received-Date: Thu, 08 Mar 2012 20:22:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-07 at 10:24 -0600, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This is needed to ensure that the RDEPENDS_${PN}-dev,
> RDEPENDS_${PN}-staticdev, and RRECOMMENDS_${PN}-dbg are accurate with respect
> to the PKGV of the ${PN} package, and incidentally fixes an rpm packaging
> issue, as rpm dislikes the recipe PV as PKGV.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-core/meta/external-csl-toolchain.bb |   17 +----------------
>  1 files changed, 1 insertions(+), 16 deletions(-)

Merged to master, thanks.

Richard



