Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UVNNW-0003yT-QR
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:42:33 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id C96B820CC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 10:24:48 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 25 Apr 2013 10:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version:content-transfer-encoding; s=smtpout;
	bh=eaDhKiMl9z2eouljdD08HRPlrAQ=; b=uKTWX7tpym5cMmv6FNnWR810QX2s
	WP3sRbnofikF3M36rmgix3JOWWXvsC7yZwL3XesKCAT6k0HbO8bZ2Gy9K+xsdKmy
	NO11lvnC2zhlfVRWH9u5K7mTuiOUPV5cY7EF7CGwyJSaEOlnqQx0Goi8a25Tzuc6
	d3AgDOU7G47aiHE=
X-Sasl-enc: wn3gsS8NJub+dQlvamfyB71KPh+250xbvYVRTnluUVKM 1366899888
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 85147C80014
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 10:24:48 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 10:24:47 -0400
Message-ID: <1366899887.24313.13.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Subject: GnomeGoals/InstalledTests
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
X-List-Received-Date: Thu, 25 Apr 2013 14:42:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I wanted to drop a reference here to a project I'm trying to push inside
GNOME:

https://live.gnome.org/GnomeGoals/InstalledTests

Hopefully this could replace the ptest stuff that requires you guys to
hack up Makefiles.  Comments welcome, please follow up to
desktop-devel-list@gnome.org.




