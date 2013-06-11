Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob11.myregisteredsite.com
	(atl4mhob11.myregisteredsite.com [209.17.115.49])
	by mail.openembedded.org (Postfix) with ESMTP id 836866A9C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:12:19 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by atl4mhob11.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r5B9CKEe024107 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:12:20 -0400
Received: (qmail 5795 invoked by uid 0); 11 Jun 2013 09:12:20 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 11 Jun 2013 09:12:19 -0000
Message-ID: <51B6E9F2.5000608@topic.nl>
Date: Tue, 11 Jun 2013 11:12:18 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGDS+nkQ1u=bzhgDGJjMw+U99eazLb_Na51qmVSa2AGUrZM_QQ@mail.gmail.com>
In-Reply-To: <CAGDS+nkQ1u=bzhgDGJjMw+U99eazLb_Na51qmVSa2AGUrZM_QQ@mail.gmail.com>
Subject: Re: Sample recipe for qt4e app?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 09:12:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 12:45 AM, Steve Sakoman wrote:
> The qt-apps folder in oe-core only seems to have recipes for qt4-x11-free apps.
>
> Does anyone have a recipe for a simple qt4e app that they would be
> willing to share?
>
> I'm looking to get an idea of just how small a qt4e image can be
> without climbing the learning curve of writing a qt app and recipe :-)

Here's my favorite:


DESCRIPTION = "QBall is a simple open source breakout style game"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = 
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"

inherit qt4e

SRCREV = "${AUTOREV}"
PV = "0.1+${SRCPV}"
PR = "r1"
S = "${WORKDIR}/git"

SRC_URI = "git://git.code.sf.net/p/q-ball/code"

FILES_${PN} += "/opt/QBall"
FILES_${PN}-dbg += "/opt/QBall/bin/.debug"

do_install() {
	export INSTALL_ROOT=${D}
	make install
}


