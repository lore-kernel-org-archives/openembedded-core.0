Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>)
	id 1SuOqY-000256-91; Thu, 26 Jul 2012 16:15:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=580; q=dns/txt;
	s=iport; t=1343311433; x=1344521033;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=5jCBJ4QTwzpwmd5eheb34NxrNIV7E5vkXkZmErp0VpE=;
	b=K6+AmP7D2l0jd/LhhslTk788ieTUqc4afbL9SSWMGe425jR0IGOlUpSY
	1vxi73TrC8TwNF2f2zH7ONeZPFNpKE0KyRS3uOFpwlkSAL/8DV+vjGAq0
	a2hcdaONvviA9P2u1Ntx6ErCO9Zbmd/zBYd/4wIPolu+WT84bS8rcGUND o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgsFAI9NEVCQ/khN/2dsb2JhbABFhS20DoEHgjkBZT0WGAMCAQIBSw0IAQEeh2uaNoEooEOSQwOVSIEUhEeITIFmgmE
X-IronPort-AV: E=Sophos;i="4.77,659,1336348800"; d="scan'208";a="141639983"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-1.cisco.com with ESMTP; 26 Jul 2012 14:02:47 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q6QE2j3R003631;
	Thu, 26 Jul 2012 14:02:46 GMT
Message-ID: <50114E06.2050305@cisco.com>
Date: Thu, 26 Jul 2012 16:02:46 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120628 Thunderbird/10.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: meta-qt5 available
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
X-List-Received-Date: Thu, 26 Jul 2012 14:15:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

I have just made a new layer, for qt5 recipes. This contains work in
progress recipes, but should be working. In the (not so) long run, qt5
recipes will hopefully be added to oe-core, but in the meantime these
are available.

The recipes are based on the qt4 recipes in oe-core from 4-5 months ago,
and some of them might be a bit messy. If anyone feels the urge to help
out with this layer, and make these recipes as good as humanly possible,
feel free to do so.

The project is located at git://github.com/martiert/meta-qt5.git

Best Regards
Martin Ertsaas


