Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>)
	id 1SKAO0-0001vP-Dc; Tue, 17 Apr 2012 17:32:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 68085315B2F0;
	Tue, 17 Apr 2012 17:22:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FO9EXGPWVwmA; Tue, 17 Apr 2012 17:22:32 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0E000315B2D2;
	Tue, 17 Apr 2012 17:22:31 +0200 (CEST)
Message-ID: <4F8D8AB7.7000002@opendreambox.org>
Date: Tue, 17 Apr 2012 17:22:31 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
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
X-List-Received-Date: Tue, 17 Apr 2012 15:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

the following warnings keep appearing on every fresh invocation of
bitbake since a few months, I think:

WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
WARNING: .../meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

Is anybody working on fixing them? Is anybody else also seeing them,
or is this likely caused by some missing variable in my distro conf?
I am not using systemd.

Regards,
Andreas


