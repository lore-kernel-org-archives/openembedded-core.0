Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TlNSk-0007Se-AS
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 18:29:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2012 09:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; 
	d="scan'208,217";a="267144990"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2012 09:15:01 -0800
Message-ID: <50D1F76D.4070000@intel.com>
Date: Wed, 19 Dec 2012 19:20:45 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC: systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 17:29:52 -0000
Content-Type: multipart/alternative;
	boundary="------------000701060900080608030908"

--------------000701060900080608030908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,
     I have prepared a branch on poky-contrib (rmoisan/systemd) where I 
pulled systemd from meta-openembedded. The goal is to merge this into 
oe-core, so please take a look and give me your feedback on stuff that 
needs work or things that I might have done wrong, so that I can prepare 
it for merge.
     At this point core-image-minimal and core-image-sato both boot fine 
with systemd. There still are a few warnings but not critical(at 
runtime), at least in my opinion, you may want to take a look at those too.
     You can activate systemd by *DISTRO_FEATURES_INITMAN = "systemd"*

Radu

--------------000701060900080608030908
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi guys,<br>
    &nbsp;&nbsp;&nbsp; I have prepared a branch on poky-contrib (rmoisan/systemd) where
    I pulled systemd from meta-openembedded. The goal is to merge this
    into oe-core, so please take a look and give me your feedback on
    stuff that needs work or things that I might have done wrong, so
    that I can prepare it for merge.<br>
    &nbsp;&nbsp;&nbsp; At this point core-image-minimal and core-image-sato both boot
    fine with systemd. There still are a few warnings but not
    critical(at runtime), at least in my opinion, you may want to take a
    look at those too.<br>
    &nbsp;&nbsp;&nbsp; You can activate systemd by&nbsp; <b><small>DISTRO_FEATURES_INITMAN
        = "systemd"</small></b><br>
    <br>
    Radu<br>
  </body>
</html>

--------------000701060900080608030908--
