Return-Path: <Lauren.Post@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe001.messaging.microsoft.com [213.199.154.204])
	by mail.openembedded.org (Postfix) with ESMTP id 823486FA43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:15 +0000 (UTC)
Received: from mail20-am1-R.bigfish.com (10.3.201.247) by
	AM1EHSOBE022.bigfish.com (10.3.207.144) with Microsoft SMTP Server id
	14.1.225.22; Wed, 26 Mar 2014 14:40:15 +0000
Received: from mail20-am1 (localhost [127.0.0.1])	by mail20-am1-R.bigfish.com
	(Postfix) with ESMTP id 9005B2E021B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail20-am1 (localhost.localdomain [127.0.0.1]) by mail20-am1
	(MessageSwitch) id 1395844813504479_19662;
	Wed, 26 Mar 2014 14:40:13 +0000 (UTC)
Received: from AM1EHSMHS005.bigfish.com (unknown [10.3.201.239])	by
	mail20-am1.bigfish.com (Postfix) with ESMTP id 75051A0152;
	Wed, 26 Mar 2014 14:40:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS005.bigfish.com
	(10.3.207.105) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 26 Mar 2014 14:40:09 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 26 Mar 2014 14:40:08 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s2QEe74O001694;
	Wed, 26 Mar 2014 07:40:08 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 09:27:54 -0500
Message-ID: <1395844085-9929-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 14:40:17 -0000
Content-Type: text/plain

This group of patches support the change of hardcoded bluez4 to
virtual/bluez so that the upgrade to bluez5 is easier.

This group of patches must be applied together.  Bluez4 is still
default provider but it will be easier to override and provide bluez5
support in future.

Note there is one related patch for openobex in meta-oe.

Lauren Post (11):
  bluez4:  Add virtual/bluez as provider
  conman:  Change RDEPENDS on bluez4 to virtual/bluez
  libpcap:  Change PACKAGECONFIG from bluez4 to virutal/bluez
  neard:  Change RRECOMMENDS from bluez4 to virtual/bluez
  ofono:  Change DEPENDS from bluez4 to virtual/bluez
  pulseaudio:  Change PACKAGECONFIG from bluez4 to virtual/bluez
  gst-plugin-bluetooth:  Change DEPENDS from bluez4 to virtual/bluez
  gstreamer1.0-plugins-bad:  Change PACKAGECONFIG from bluez4 to
    virtual/bluez
  bluez-hcidump:  Change depends from bluez4 to virtual/bluez
  default-providers:  Add virtual/bluez PROVIDER support to bluez4
  package-group:  Change bluez4 to virtual/bluez

 meta/conf/distro/include/default-providers.inc     |    2 +-
 .../bluez/bluez-hcidump_2.5.bb                     |    2 +-
 meta/recipes-connectivity/bluez/bluez4.inc         |    4 ++++
 .../bluez/gst-plugin-bluetooth_4.101.bb            |    2 +-
 meta/recipes-connectivity/connman/connman.inc      |    4 ++--
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 meta/recipes-connectivity/neard/neard.inc          |    2 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
 .../packagegroups/packagegroup-base.bb             |    2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 +++-
 12 files changed, 18 insertions(+), 12 deletions(-)

-- 
1.7.9.5



