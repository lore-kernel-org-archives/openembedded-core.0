Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKSu6-0007lc-1Q for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 13:18:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IB93lh000696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:09:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32694-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:08:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IB8ukN000689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:08:57 +0100
Message-ID: <1334747339.24091.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 12:08:59 +0100
In-Reply-To: <C5C354B5-E296-435A-AF64-2E23D3BBCF15@dominion.thruhere.net>
References: <cover.1334699033.git.sgw@linux.intel.com>
	<cad24a8ebe31104e0521b419a32b06b4cec3f93f.1334699033.git.sgw@linux.intel.com>
	<C5C354B5-E296-435A-AF64-2E23D3BBCF15@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] lsb: Add DISTRO Info to the lsb-release
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
X-List-Received-Date: Wed, 18 Apr 2012 11:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 08:45 +0200, Koen Kooi wrote:
> Op 17 apr. 2012, om 23:46 heeft Saul Wold het volgende geschreven:
> 
> > This is needed for distro checking code in the self-hosted-image
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-extended/lsb/lsb_1.4.bb |    5 +++++
> > 1 files changed, 5 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
> > index f2f25ba..e414d93 100644
> > --- a/meta/recipes-extended/lsb/lsb_1.4.bb
> > +++ b/meta/recipes-extended/lsb/lsb_1.4.bb
> > @@ -4,6 +4,8 @@ HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
> > LICENSE = "GPLv2+"
> > PR = "r2"
> > 
> > +DEPENDS="util-linux"
> > +
> > LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
> > 
> > SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar.gz \
> > @@ -31,6 +33,9 @@ do_install(){
> > 		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}/etc/lsb-release
> > 	fi
> > 	echo "\"" >> ${D}/etc/lsb-release
> > +	echo "DISTRIB_ID=${DISTRO}" >> ${D}/etc/lsb-release
> > +	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}/etc/lsb-release
> > +	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}/etc/lsb-release
> 
> MIssing PR bump

I've added one and fixes some other problems I noticed whilst testing
it :(.

Cheers,

Richard



